#ifndef _INCLUDE_H_
#define _INCLUDE_H_

#include <linux/module.h>
#include <linux/i2c.h>
#include <linux/regmap.h>
#include <linux/gpio.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/printk.h>

#include <linux/miscdevice.h>
#include <linux/kernel.h>
#include <linux/major.h>
#include <linux/mutex.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/stat.h>
#include <linux/init.h>
#include <linux/device.h>
#include <linux/tty.h>
#include <linux/kmod.h>
#include <linux/gfp.h>
#include <linux/module.h>

#include <linux/kthread.h>
#include <linux/atomic.h>





#include "type.h"
#include "LontiumDrv.h"

#include "LT9211C_Main.h"

#include "OcmI2cMaster.h"


//Driver
#include "DrvCsc.h"
#include "DrvMipiRx.h"
#include "DrvMipiTx.h"
#include "DrvLvdsRx.h"
#include "DrvLvdsTx.h"
#include "DrvTtlRx.h"
#include "DrvTtlTx.h"
#include "DrvDcsCmd.h"
#include "DrvSystem.h"
#include "DrvMipiRpt.h"
#include "DrvMipiLs.h"



//Module
#include "ModTtlRx.h"
#include "ModTtlTx.h"
#include "ModLvdsTx.h"
#include "ModLvdsRx.h"
#include "ModMipiTx.h"
#include "ModMipiRx.h"
#include "ModSystem.h"
#include "ModPattern.h"
#include "ModMipiRpt.h"
#include "ModMipiLs.h"


#endif
