#include "include/include.h"


void Mod_LT9211C_Power_On(void)
{
	gpiod_set_value(lt9211c->power_gpio,1);
	msleep(10);
	printk("set power High level ");

}

//init power gpio level and reset chip 
void Mod_LT9211C_Reset(void)
{
	//complete chip reset logic
	gpiod_set_value(lt9211c->reset_gpio,1);
	msleep(10);	
	gpiod_set_value(lt9211c->reset_gpio,0);
	msleep(10);	
	gpiod_set_value(lt9211c->reset_gpio,1);
	msleep(100);	
	printk("reset chip");	
}



int LT9211C_Main(void *data)
{
	Mod_LT9211C_Power_On();
	Mod_LT9211C_Reset();
	Mod_ChipID_Read();

       #if (LT9211C_MODE_SEL != PATTERN_OUT)
	Mod_SystemRx_PowerOnInit();
	Mod_SystemTx_PowerOnInit();
       #endif
  
	while(!atomic_read(&thread_should_stop))
	{
        #if (LT9211C_MODE_SEL == PATTERN_OUT)
	Mod_ChipTx_PtnOut();
	break;
        #endif

        #if (LT9211C_MODE_SEL == MIPI_REPEATER)
        Mod_MipiRpt_Handler();
        #endif
        #if (LT9211C_MODE_SEL == MIPI_LEVEL_SHIFT)
        Mod_MipiLs_Handler();
        #endif
        #if (LT9211C_MODE_SEL == LVDS_IN_LVDS_OUT)
        Mod_LvdsRx_Handler();
        Mod_LvdsTx_Handler();
        #endif
        #if (LT9211C_MODE_SEL == LVDS_IN_MIPI_OUT)
        Mod_LvdsRx_Handler();
        Mod_MipiTx_Handler();
        #endif
        #if (LT9211C_MODE_SEL == LVDS_IN_TTL_OUT)
        Mod_LvdsRx_Handler();
        Mod_TtlTx_Handler();
        #endif
        #if (LT9211C_MODE_SEL == MIPI_IN_LVDS_OUT)
        Mod_MipiRx_Handler();
        Mod_LvdsTx_Handler();
        #endif
        #if (LT9211C_MODE_SEL == MIPI_IN_MIPI_OUT)
        Mod_MipiRx_Handler();
        Mod_MipiTx_Handler();
        #endif
        #if (LT9211C_MODE_SEL == MIPI_IN_TTL_OUT)
        Mod_MipiRx_Handler();
        Mod_TtlTx_Handler();
        #endif
        #if (LT9211C_MODE_SEL == TTL_IN_LVDS_OUT)
        Mod_TtlRx_Handler();
        Mod_LvdsTx_Handler();
        #endif
        #if (LT9211C_MODE_SEL == TTL_IN_MIPI_OUT)
        Mod_TtlRx_Handler();
        Mod_MipiTx_Handler();
        #endif
        #if (LT9211C_MODE_SEL == TTL_IN_TTL_OUT)
        Mod_TtlRx_Handler();
        Mod_TtlTx_Handler();
        #endif
	}
	
	return 0;
	
}
