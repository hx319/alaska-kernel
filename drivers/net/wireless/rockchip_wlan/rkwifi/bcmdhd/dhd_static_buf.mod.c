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
	{ 0xfec0899, "consume_skb" },
	{ 0x37a0cba, "kfree" },
	{ 0x1f5c0362, "kmem_cache_alloc_trace" },
	{ 0xd8692ef7, "kmalloc_caches" },
	{ 0xb8b9f817, "kmalloc_order_trace" },
	{ 0xe70ea5bc, "__netdev_alloc_skb" },
	{ 0xdcb764ad, "memset" },
	{ 0xc5850110, "printk" },
};

MODULE_INFO(depends, "");

