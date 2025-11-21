#include "include/include.h"


struct _lt9211c  *lt9211c;
static struct task_struct *kthread_obj;
atomic_t thread_should_stop = ATOMIC_INIT(0); 
char *ChipName = "lt9211c";                    //Define Lontium Chip Name
static int major = 0;
static struct cdev chip_cdev;
static struct class *chip_class;



static int chip_open(struct inode *inode, struct file *filp)
{
    printk("chip open\n"); 
    return 0;
}


static int chip_close (struct inode *node, struct file *file)
{
    printk("chip close\n");
	return 0;
}


static ssize_t chip_read(struct file *filp, char __user *buf, size_t cnt, loff_t *offt)
{
	Chip_Control_Args parameter;
		
	if (copy_from_user(&parameter, buf, sizeof(parameter))) {
		return -EFAULT;
	}
		
	parameter.value = HDMI_ReadI2C_Byte(parameter.address);
	
	if (copy_to_user(buf, &parameter, sizeof(parameter))) {
		return -EFAULT;
	}
	
	return sizeof(parameter);

}

static ssize_t chip_write(struct file *filp, const char __user *buf, size_t cnt, loff_t *offt)
{
    Chip_Control_Args parameter;
	
    if (copy_from_user(&parameter, buf, sizeof(parameter))) {
         return -EFAULT;
     }

	HDMI_WriteI2C_Byte(parameter.address, parameter.value);
	
	return sizeof(parameter);
	
}




static struct file_operations chip_drv = {
	.owner	 = THIS_MODULE,
	.open    = chip_open,
	.release = chip_close,
	.read    = chip_read,
	.write   = chip_write,
};



static int  chip_dev_init(void)
{
	int ret;
	dev_t devid;
	
	ret = alloc_chrdev_region(&devid, 0, 1, ChipName);
	if (ret < 0) {
	    return ret;
	}
	
	major = MAJOR(devid);
	cdev_init(&chip_cdev, &chip_drv);
	cdev_add(&chip_cdev, devid, 1);
	chip_class = class_create(THIS_MODULE, "chip_class");
	if (IS_ERR(chip_class)) {
		unregister_chrdev(major, ChipName);
		return -1;
	}
	
	device_create(chip_class, NULL, MKDEV(major, 0), NULL, ChipName); /* /dev/ChipName */
	
	return 0;
}


static void  chip_dev_exit(void)
{
	device_destroy(chip_class, MKDEV(major, 0));
	class_destroy(chip_class);
	cdev_del(&chip_cdev);
	unregister_chrdev_region(MKDEV(major,0), 1);	
}



static const struct regmap_range chip_ranges[] = {
	{ .range_min = 0, .range_max = 0xffff },
};

static const struct regmap_access_table chip_table = {
	.yes_ranges = chip_ranges,
	.n_yes_ranges = ARRAY_SIZE(chip_ranges),
};

static const struct regmap_config chip_regmap_config = {
	.reg_bits = 8,
	.val_bits = 8,
	.volatile_table = &chip_table,
	.cache_type = REGCACHE_NONE,
};



static int chip_parse_dts(struct device *dev)
{

    /*
     * devm_gpiod_get_optional  - If this fails, NULL is returned and no error pointer.
     *
	 * devm_gpiod_get  -  If this fails, an error pointer is returned, usually ERR_PTR(-ENOENT).
	 *
	 * The devm_gpiod_get function is recommended for practical use.
     */

	printk("wade enter %s lt9211c parse dts\n", __func__);
	//Gets the handle to power gpio in dts 
	 
    lt9211c->power_gpio=devm_gpiod_get_optional(dev, "power", GPIOD_OUT_HIGH);
	if (IS_ERR(lt9211c->power_gpio)) {
	  printk("Failed to get power GPIO\n");
      return PTR_ERR(lt9211c->power_gpio);
	}


    //Gets the handle to reset gpio in dts
	  
	lt9211c->reset_gpio=devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
	if (IS_ERR(lt9211c->reset_gpio)) {
		printk("Failed to get reset GPIO\n");
		return PTR_ERR(lt9211c->reset_gpio);
	}


	// Additional GPIO pins can be added here if needed

	return 0;
}


static int chip_probe(struct i2c_client *client, const struct i2c_device_id *id)
{
	int ret;
	
	printk("wade enter %s lt9211c probe\n", __func__);
	chip_dev_init();

	lt9211c = devm_kzalloc(&client->dev, sizeof(*lt9211c), GFP_KERNEL);
	if (lt9211c == NULL)
		return -ENOMEM;
	
	lt9211c->trans_i2c = client;
	
	lt9211c->dev = &client->dev;
	
	lt9211c->chip_regmap = devm_regmap_init_i2c(client, &chip_regmap_config);
	if (IS_ERR(lt9211c->chip_regmap)) {
        dev_err(&client->dev, "Failed to initialize regmap\n");
        return PTR_ERR(lt9211c->chip_regmap);
    }			
	
	ret = chip_parse_dts(lt9211c->dev);				
	if (ret<0){
		dev_err(&client->dev, "Failed to parse device tree\n");
		return ret;
	}
	
	i2c_set_clientdata(client, lt9211c);
	
	mutex_init(&lt9211c->ocm_lock);
	
	kthread_obj = kthread_run(LT9211C_Main, NULL, "LT9211C_kthread");
	if (IS_ERR(kthread_obj)) {
        dev_err(&client->dev, "Failed to create kernel thread\n");
        return PTR_ERR(kthread_obj);
    }
	
	return 0;
	
}

static int chip_remove(struct i2c_client *client)
{  
   
	atomic_set(&thread_should_stop, 1);
    msleep(100);
	mutex_destroy(&lt9211c->ocm_lock);
	chip_dev_exit();
	
    printk("driver removed\n");
    return 0;
}


static int chip_suspend(struct device *dev)
{
    //gpiod_set_value(lt9211c->power_gpio,0); 
    gpiod_set_value(lt9211c->reset_gpio,0);
	msleep(5);
	
	atomic_set(&thread_should_stop, 1);
	printk(KERN_INFO "lt9211c Suspend");
    return 0;
}



static int chip_resume(struct device *dev)
{

    gpiod_set_value(lt9211c->reset_gpio,1);
    msleep(5);
	
    atomic_set(&thread_should_stop, 0);
	
    kthread_obj = kthread_run(LT9211C_Main, NULL, "LT9211C_kthread"); 
	printk(KERN_INFO "lt9211c Resume");
    return 0;
}


static const struct dev_pm_ops chip_pm_ops = {
    .suspend = chip_suspend,
    .resume =  chip_resume,
};




static const struct i2c_device_id chip_ids[] = {
	{"lt9211c", 0},
	{ }
};
MODULE_DEVICE_TABLE(i2c, chip_ids);


static const struct of_device_id chip_id_table[] = {
	{.compatible = "lontium,lt9211c"},
	{ }
};
MODULE_DEVICE_TABLE(of, chip_id_table);


static struct i2c_driver chip_driver = {
	.driver = {
		.owner = THIS_MODULE,
		.name = "lt9211c",
		.pm = &chip_pm_ops,
		.of_match_table = chip_id_table,

	},
	.probe    = chip_probe,
	.remove   = chip_remove,
	.id_table = chip_ids,
};


module_i2c_driver(chip_driver);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("LT9211C driver");
MODULE_AUTHOR("Tony Yang<syyang@lontium.com>");
