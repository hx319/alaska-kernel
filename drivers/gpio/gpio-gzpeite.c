#include <linux/platform_device.h>
#include <linux/slab.h>
#include <linux/miscdevice.h>
#include <linux/gpio.h>
#include <linux/uaccess.h>
#include <linux/atomic.h>
#include <linux/delay.h>
#include <linux/input.h>
#include <linux/freezer.h>
#include <linux/of_gpio.h>
#include <linux/string.h>
#include <linux/syscalls.h>
#include <linux/pinctrl/pinctrl.h>
#include <linux/pinctrl/pinconf.h>
#include <linux/pinctrl/pinconf-generic.h>

int gpio_arr[64][3];
int gpio_num;
static int gpio_gzpeite_probe(struct platform_device *pdev)
{
  int ret;
  int i=0;
  const char *strings;
  enum of_gpio_flags flag;
  char gpio_name[64];
  gpio_num = 0;

  for(i=0; i<64; i++)
  {
    sprintf(gpio_name, "gpio%d-name", i);
    ret = of_property_read_string(pdev->dev.of_node, gpio_name, &strings);
    if(ret == 0)
    {
      sprintf(gpio_name, "gpio%d", i);
      ret = of_get_named_gpio_flags(pdev->dev.of_node, gpio_name, 0, &flag); 
      if(gpio_is_valid(ret))
      {
       	gpio_request(ret, strings);
      	gpio_export(ret, 1);
      	gpio_arr[gpio_num][0] = ret;
      	gpio_arr[gpio_num][1] = flag;
      	printk("%s = %d suspend_level=%d\n", strings, ret, flag);
      	gpio_num++;
      }
    }
  }
  printk("%s ok\n", __func__);
	return 0;
}

static int gpio_gzpeite_remove(struct platform_device *pdev)
{
  int i = 0;
  for(i=0; i<gpio_num; i++)
  {
    gpio_free(gpio_arr[i][0]);
  }
	return 0;
}

static int gpio_gzpeite_suspend(struct platform_device *pdev, pm_message_t state)
{
  int i = 0;
  for(i=0; i<gpio_num; i++)
  {
    gpio_arr[i][2] = gpio_get_value(gpio_arr[i][0]);
    gpio_set_value(gpio_arr[i][0], gpio_arr[i][1]);
  }
  return 0;
}

static int gpio_gzpeite_resume(struct platform_device *pdev)
{
  int i=0;
  for(i=0; i<gpio_num; i++)
    gpio_set_value(gpio_arr[i][0], gpio_arr[i][2]);
  return 0;
}

static const struct of_device_id gpio_gzpeite_match[] = {
	{ .compatible = "gpio_gzpeite" },
};

static struct platform_driver gpio_gzpeite_driver = {
	.probe    = gpio_gzpeite_probe,
	.remove   = gpio_gzpeite_remove,
	.suspend  = gpio_gzpeite_suspend,
	.resume   = gpio_gzpeite_resume,
	.driver = {
		.name = "gpio_gzpeite",
		.owner = THIS_MODULE,
		.of_match_table	= gpio_gzpeite_match,
	},
};

static int __init gpio_gzpeite_init(void)
{
  return platform_driver_register(&gpio_gzpeite_driver);
}
static void __exit gpio_gzpeite_exit(void)
{
  return platform_driver_unregister(&gpio_gzpeite_driver);
}

late_initcall(gpio_gzpeite_init);
module_exit(gpio_gzpeite_exit);

MODULE_ALIAS("platform:gpio_gzpeite");
MODULE_AUTHOR("www.gzpeite.net");
MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("gzpeite gpio driver");
