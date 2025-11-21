#ifndef		_LVDSRX_H
#define		_LVDSRX_H


extern void Drv_LvdsRx_PhySet(void);
extern void Drv_LvdsRx_ClkSel(void);
extern void Drv_LvdsRx_DataPathSel(void);
extern void Drv_LvdsRxPort_Set(void);
extern void Drv_LvdsRxLaneNum_Set(void);
extern void Drv_LvdsRxPort_Swap(void);
extern u8 Drv_LvdsRxVidFmt_Set(void);
extern void Drv_LvdsRx_SelfTimingSet(void);
extern u8 Drv_LvdsRxPll_Cali(void);
extern void Drv_LvdsRx_VidChkDebug(void);
extern void Drv_LvdsRx_DesscPll_Set(void);
extern void Drv_LvdsRx_DesscDig_Set(void);

#endif
