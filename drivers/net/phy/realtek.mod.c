#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

MODULE_INFO(intree, "Y");

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0xe582894, "module_layout" },
	{ 0x7a7546b6, "genphy_write_mmd_unsupported" },
	{ 0x7c6c119f, "genphy_read_mmd_unsupported" },
	{ 0xe797b58e, "genphy_read_abilities" },
	{ 0x84a731b4, "genphy_read_status" },
	{ 0x940c5433, "phy_read_paged" },
	{ 0xf9a482f9, "msleep" },
	{ 0x3007f3e4, "_dev_err" },
	{ 0x8fee839d, "phy_modify_paged_changed" },
	{ 0xdf8eef87, "phy_restore_page" },
	{ 0x72af1753, "__phy_modify" },
	{ 0xbcb5a3cf, "phy_select_page" },
	{ 0x9117385a, "phy_modify" },
	{ 0x71b789f1, "genphy_resume" },
	{ 0xfa7227fc, "genphy_suspend" },
	{ 0x4eb3711c, "mdiobus_write" },
	{ 0xee6dc3f9, "__genphy_config_aneg" },
	{ 0x5a13ce58, "phy_write_paged" },
	{ 0xf4268f2c, "mdiobus_read" },
	{ 0x7f9d92ed, "__mdiobus_write" },
	{ 0xf7769ddf, "__mdiobus_read" },
	{ 0x2562872a, "phy_drivers_unregister" },
	{ 0x474403a7, "phy_drivers_register" },
};

MODULE_INFO(depends, "");

MODULE_ALIAS("mdio:0000000000011100110010??????????");
MODULE_ALIAS("mdio:0000000000011100110010??????????");
