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
	{ 0x7c1661e9, "__v4l2_ctrl_s_ctrl" },
	{ 0x8ea9116b, "v4l2_ctrl_g_ctrl" },
	{ 0x2bac271f, "v4l2_event_unsubscribe" },
	{ 0x1ee74573, "v4l2_ctrl_subscribe_event" },
	{ 0x2ab5980c, "vb2_ioctl_streamoff" },
	{ 0x45268c8e, "vb2_ioctl_streamon" },
	{ 0x43ef5c1a, "vb2_ioctl_create_bufs" },
	{ 0x6701ec76, "vb2_ioctl_dqbuf" },
	{ 0x2a554fb6, "vb2_ioctl_expbuf" },
	{ 0x4f7bb86d, "vb2_ioctl_qbuf" },
	{ 0x427ff7c0, "vb2_ioctl_querybuf" },
	{ 0x9f2c4376, "vb2_ioctl_reqbufs" },
	{ 0xa6da2b60, "vb2_fop_release" },
	{ 0x535cacb1, "v4l2_fh_open" },
	{ 0xd760cf43, "vb2_fop_mmap" },
	{ 0xe692b0a0, "video_ioctl2" },
	{ 0xab4acc3e, "vb2_fop_poll" },
	{ 0x791573d1, "vb2_fop_read" },
	{ 0x870e35ea, "param_ops_int" },
	{ 0xb0bb83f6, "vb2_ops_wait_finish" },
	{ 0xef623e7a, "vb2_ops_wait_prepare" },
	{ 0x62060fa2, "video_device_release_empty" },
	{ 0x68f31cbd, "__list_add_valid" },
	{ 0xdd64e639, "strscpy" },
	{ 0xf2fdd58e, "video_devdata" },
	{ 0x98a9d10c, "__stack_chk_fail" },
	{ 0xf9a482f9, "msleep" },
	{ 0xbcb0fd52, "usb_clear_halt" },
	{ 0xbf4a9826, "usb_set_interface" },
	{ 0xb65f5f7f, "v4l2_device_put" },
	{ 0xe8b268ae, "mutex_unlock" },
	{ 0x2c6c6158, "video_unregister_device" },
	{ 0xd119c8d8, "v4l2_device_disconnect" },
	{ 0x171ffcd, "vb2_queue_error" },
	{ 0x8b9b4f10, "usb_kill_urb" },
	{ 0xeb9065d9, "mutex_lock" },
	{ 0x13e5b06a, "usb_free_urb" },
	{ 0xceec51f3, "usb_free_coherent" },
	{ 0xf9543cc9, "usb_submit_urb" },
	{ 0x64017b3f, "usb_alloc_coherent" },
	{ 0xc2b9a849, "usb_alloc_urb" },
	{ 0x4ba80c5, "usb_ifnum_to_if" },
	{ 0x6bf21473, "input_free_device" },
	{ 0x37a0cba, "kfree" },
	{ 0x9b5830a7, "v4l2_device_unregister" },
	{ 0x310c26e0, "v4l2_ctrl_handler_free" },
	{ 0x4e39fd41, "input_unregister_device" },
	{ 0xf490a376, "__video_register_device" },
	{ 0xec2fc692, "cpu_hwcap_keys" },
	{ 0x14b89635, "arm64_const_caps_ready" },
	{ 0x34aa5e2a, "input_register_device" },
	{ 0xf9c0b663, "strlcat" },
	{ 0x656e4a6e, "snprintf" },
	{ 0x685d9813, "input_allocate_device" },
	{ 0xeb922cd4, "v4l2_ctrl_handler_setup" },
	{ 0x564dfc6f, "vb2_queue_init" },
	{ 0x86506c6a, "vb2_vmalloc_memops" },
	{ 0xd9a5ea54, "__init_waitqueue_head" },
	{ 0x574add77, "__mutex_init" },
	{ 0x3d0da9e0, "v4l2_device_register" },
	{ 0x1f5c0362, "kmem_cache_alloc_trace" },
	{ 0xd8692ef7, "kmalloc_caches" },
	{ 0xeb233a45, "__kmalloc" },
	{ 0xc5850110, "printk" },
	{ 0xcef24630, "vb2_buffer_done" },
	{ 0xb43f9365, "ktime_get" },
	{ 0xe1537255, "__list_del_entry_valid" },
	{ 0x4829a47e, "memcpy" },
	{ 0x7fe2ce75, "vb2_plane_vaddr" },
	{ 0xd35cce70, "_raw_spin_unlock_irqrestore" },
	{ 0x34db050b, "_raw_spin_lock_irqsave" },
};

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "143F432372A05CDEB2F420B");
