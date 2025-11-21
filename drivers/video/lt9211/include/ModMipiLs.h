#ifndef		_MODMIPILS_H
#define		_MODMIPILS_H

#if (LT9211C_MODE_SEL == MIPI_LEVEL_SHIFT)

#define     MIPILS_MODE                 RX_LS      //RX_LS/TX_LS

#if MIPILS_MODE == RX_LS
    #define     MIPILS_INPUT_PORT           DOU_PORT            //DOU_PORT
    #define     MIPILS_OUTPUT_PORT          DOU_PORT            //PORTA/PORTB/DOU_PORT
    #define     MIPILS_LANE_NUM             MIPILS_4LANE        //MIPILS_4LANE/MIPILS_1LANE/MIPILS_2LANE/MIPILS_3LANE
    #define     MIPILS_SHIFT_MODE           LP_PORTA_HS_PORTB   //HS_PORTA_LP_PORTB/LP_PORTA_HS_PORTB
#endif

#if MIPILS_MODE == TX_LS
    #define     MIPILS_INPUT_PORT           PORTA               //PORTA/PORTB
    #define     MIPILS_OUTPUT_PORT          DOU_PORT            //DOU_PORT
    #define     MIPILS_LANE_NUM             MIPILS_2LANE        //MIPILS_4LANE/MIPILS_1LANE/MIPILS_2LANE/MIPILS_3LANE
    #define     MIPILS_SHIFT_MODE           HS_PORTA_LP_PORTB   //HS_PORTA_LP_PORTB/LP_PORTA_HS_PORTB
#endif

extern void Mod_MipiLs_Handler(void);

#endif

#endif

