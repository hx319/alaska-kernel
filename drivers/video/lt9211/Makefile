
# 1. ʹ�ò�ͬ�Ŀ������ں�ʱ, һ��Ҫ�޸�KERN_DIR
# 2. KERN_DIR�е��ں�Ҫ�������á�����, Ϊ���ܱ����ں�, Ҫ���������л�������:
# 2.1 ARCH,          ����: export ARCH=arm64
# 2.2 CROSS_COMPILE, ����: export CROSS_COMPILE=aarch64-linux-gnu-
# 2.3 PATH,          ����: export PATH=$PATH:/home/book/100ask_roc-rk3399-pc/ToolChain-6.3.1/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin 
# ע��: ��ͬ�Ŀ����岻ͬ�ı���������3������������һ����ͬ,
#       ��ο���������ĸ߼��û�ʹ���ֲ�

# 参考内核源码drivers/char/ipmi/Makefile
# 要想把a.c, b.c编译成ab.ko, 可以这样指定:
# ab-y := a.o b.o
# obj-m += ab.o


lt9211c-y := LontiumDrv.o       LT9211C_Main.o  OcmI2cMaster.o  DrvDcsCmd.o \
             DrvCsc.o           ModSystem.o     DrvSystem.o     ModPattern.o \
	     ModMipiRpt.o 	DrvMipiRpt.o 	ModMipiLs.o 	DrvMipiLs.o  \
             ModMipiRx.o 	DrvMipiRx.o  	ModMipiTx.o 	DrvMipiTx.o   \
	     ModLvdsRx.o 	DrvLvdsRx.o     ModLvdsTx.o 	DrvLvdsTx.o \
	     ModTtlRx.o  	DrvTtlRx.o	ModTtlTx.o  	DrvTtlTx.o
			 


obj-y += lt9211c.o

