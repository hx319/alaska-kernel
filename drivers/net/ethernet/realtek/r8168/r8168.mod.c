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
	{ 0xd4cb24c5, "pci_write_config_dword" },
	{ 0x6cbbfc54, "__arch_copy_to_user" },
	{ 0x8b9f70c7, "cpu_hwcaps" },
	{ 0x12a4e128, "__arch_copy_from_user" },
	{ 0xb788fb30, "gic_pmr_sync" },
	{ 0x4b0a3f52, "gic_nonsecure_priorities" },
	{ 0x79b6c0ef, "single_release" },
	{ 0x4d048aca, "seq_lseek" },
	{ 0x344bbc8c, "seq_read" },
	{ 0x963839b4, "ethtool_op_get_ts_info" },
	{ 0x51e176c8, "param_ops_ulong" },
	{ 0x870e35ea, "param_ops_int" },
	{ 0x5e9536da, "param_ops_uint" },
	{ 0x55e31703, "ethtool_convert_link_mode_to_legacy_u32" },
	{ 0x85670f1d, "rtnl_is_locked" },
	{ 0xeb233a45, "__kmalloc" },
	{ 0x5792f848, "strlcpy" },
	{ 0xdd64e639, "strscpy" },
	{ 0x6091797f, "synchronize_rcu" },
	{ 0x60a16afa, "netif_carrier_on" },
	{ 0x69dd3b5b, "crc32_le" },
	{ 0x655a3303, "napi_gro_receive" },
	{ 0x595a9d30, "eth_type_trans" },
	{ 0x97194f2c, "napi_disable" },
	{ 0xe523ad75, "synchronize_irq" },
	{ 0x93799941, "__napi_alloc_skb" },
	{ 0xeaa9189f, "single_open" },
	{ 0x3619073f, "PDE_DATA" },
	{ 0xf2617adb, "proc_get_parent_data" },
	{ 0x76ff1142, "pci_read_config_dword" },
	{ 0x5f6200b7, "seq_putc" },
	{ 0xa0d06dc7, "seq_printf" },
	{ 0xf1d9d39c, "seq_puts" },
	{ 0xebdf323, "dma_sync_single_for_device" },
	{ 0xad405d6c, "dma_sync_single_for_cpu" },
	{ 0x8fb93fe2, "skb_put" },
	{ 0xe70ea5bc, "__netdev_alloc_skb" },
	{ 0xca2dfdc1, "pci_write_config_byte" },
	{ 0x91a30320, "__napi_schedule" },
	{ 0xef3bf84f, "napi_schedule_prep" },
	{ 0xfec0899, "consume_skb" },
	{ 0xdcb764ad, "memset" },
	{ 0x44598a03, "netdev_update_features" },
	{ 0xc6cbbc89, "capable" },
	{ 0x5cdc8edb, "skb_tstamp_tx" },
	{ 0xb4f4d65c, "dma_map_page_attrs" },
	{ 0x56470118, "__warn_printk" },
	{ 0xd7d0fb01, "dev_driver_string" },
	{ 0xc31db0ce, "is_vmalloc_addr" },
	{ 0x63fac908, "skb_checksum_help" },
	{ 0x43ae08b0, "__skb_pad" },
	{ 0x4d65cbd5, "csum_ipv6_magic" },
	{ 0x5939a99d, "__skb_gso_segment" },
	{ 0x242fe01d, "pskb_expand_head" },
	{ 0xf6ebc03b, "net_ratelimit" },
	{ 0x5b0dde5f, "skb_copy_bits" },
	{ 0xc1514a3b, "free_irq" },
	{ 0x92d5838e, "request_threaded_irq" },
	{ 0x2394f0a5, "proc_create_data" },
	{ 0x1165285d, "proc_mkdir_data" },
	{ 0xedc03953, "iounmap" },
	{ 0x1504100e, "pci_write_config_word" },
	{ 0xfaf6294a, "napi_complete_done" },
	{ 0x8546a42f, "netif_tx_wake_queue" },
	{ 0x43c0506e, "__dev_kfree_skb_any" },
	{ 0x7d77e013, "dma_unmap_page_attrs" },
	{ 0x8f996a30, "ethtool_convert_legacy_u32_to_link_mode" },
	{ 0x477bd958, "pci_wake_from_d3" },
	{ 0x15af7f4, "system_state" },
	{ 0x72cd0f7f, "mod_timer" },
	{ 0x15ba50a6, "jiffies" },
	{ 0xc0ac4d88, "netif_device_attach" },
	{ 0xbf57e89e, "queue_delayed_work_on" },
	{ 0x2d3385d3, "system_wq" },
	{ 0x79cf5987, "init_timer_key" },
	{ 0x253af43d, "delayed_work_timer_fn" },
	{ 0x8fdb27f0, "pci_set_master" },
	{ 0x912e2ebe, "pci_restore_state" },
	{ 0x51147fcd, "pci_set_power_state" },
	{ 0x97a596a5, "pci_enable_wake" },
	{ 0xd53c5d54, "pci_choose_state" },
	{ 0xa8be1b21, "pci_save_state" },
	{ 0xc2d4f3cb, "pci_clear_master" },
	{ 0xd94f02f8, "netif_device_detach" },
	{ 0xec2fc692, "cpu_hwcap_keys" },
	{ 0x14b89635, "arm64_const_caps_ready" },
	{ 0xf15e728e, "del_timer_sync" },
	{ 0xf8beca97, "cancel_delayed_work_sync" },
	{ 0xa60b0559, "unregister_netdev" },
	{ 0x98a9d10c, "__stack_chk_fail" },
	{ 0x381d5851, "netif_carrier_off" },
	{ 0x5ff773ef, "device_set_wakeup_enable" },
	{ 0xd4579b8c, "netdev_info" },
	{ 0xc03aceb, "netdev_err" },
	{ 0xa38fe7e1, "pci_disable_msi" },
	{ 0x609f1c7e, "synchronize_net" },
	{ 0x4c89f7ea, "__netif_napi_del" },
	{ 0x5c0dc5f5, "dma_free_attrs" },
	{ 0x6071e6a2, "register_netdev" },
	{ 0xe8dece70, "dma_alloc_attrs" },
	{ 0x4829a47e, "memcpy" },
	{ 0x79aa04a2, "get_random_bytes" },
	{ 0xd35cce70, "_raw_spin_unlock_irqrestore" },
	{ 0x34db050b, "_raw_spin_lock_irqsave" },
	{ 0x2e196a06, "pci_read_config_byte" },
	{ 0x324338f6, "dev_printk" },
	{ 0x857c0983, "pci_get_slot" },
	{ 0x776b66a, "netif_napi_add" },
	{ 0x1e983035, "pci_enable_msi" },
	{ 0xbfd9c2de, "pci_release_regions" },
	{ 0x88a9ec02, "_dev_info" },
	{ 0x6b4b2933, "__ioremap" },
	{ 0xaf56600a, "arm64_use_ng_mappings" },
	{ 0x71bc17ba, "dma_set_coherent_mask" },
	{ 0x1f4118b, "dma_set_mask" },
	{ 0x678f7bec, "pci_request_regions" },
	{ 0xc5850110, "printk" },
	{ 0x37a0cba, "kfree" },
	{ 0xa8dbac5a, "pci_disable_device" },
	{ 0x768aa918, "pci_clear_mwi" },
	{ 0x3007f3e4, "_dev_err" },
	{ 0xfa66bc39, "pci_read_config_word" },
	{ 0x19c44af, "pci_find_capability" },
	{ 0xf1bcb036, "pci_set_mwi" },
	{ 0xd9644d69, "pci_enable_device" },
	{ 0x950c8a44, "pci_disable_link_state" },
	{ 0x70edd5aa, "alloc_etherdev_mqs" },
	{ 0x2994a463, "remove_proc_subtree" },
	{ 0x8553ba58, "pci_unregister_driver" },
	{ 0xc51b9319, "__pci_register_driver" },
	{ 0xef391509, "proc_mkdir" },
	{ 0x37ea9593, "init_net" },
	{ 0xeae3dfd6, "__const_udelay" },
};

MODULE_INFO(depends, "");

MODULE_ALIAS("pci:v000010ECd00008168sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000010ECd00008161sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000010ECd00002502sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000010ECd00002600sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v00001186d00004300sv00001186sd00004B10bc*sc*i*");

MODULE_INFO(srcversion, "17BCF7A3B9B2AF984D91D03");
