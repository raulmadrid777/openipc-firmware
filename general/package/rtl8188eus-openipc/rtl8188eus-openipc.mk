################################################################################
#
# rtl8188eu
#
################################################################################

RTL8188EUS_OPENIPC_SITE_METHOD = git
RTL8188EUS_OPENIPC_SITE = https://github.com/raulmadrid777/rtl8188eus
RTL8188EUS_OPENIPC_VERSION = b3f528925f0575176bf4fd263fe5afd1b1e55fc1

RTL8188EUS_OPENIPC_LICENSE = GPL-2.0, proprietary (rtl8188fufw.bin firmware blob)
RTL8188EUS_OPENIPC_LICENSE_FILES = COPYING
RTL8188EUS_OPENIPC_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m CONFIG_CALIBRATE_TX_POWER_TO_MAX=y

define RTL8188EUS_OPENIPC_INSTALL_FIRMWARE
	$(INSTALL) -D -m 644 $(RTL8188EUS_OPENIPC_PKGDIR)/rtl8188fufw.bin \
		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8188fufw.bin
endef
RTL8188EUS_OPENIPC_POST_INSTALL_TARGET_HOOKS += RTL8188EUS_OPENIPC_INSTALL_FIRMWARE

$(eval $(kernel-module))
$(eval $(generic-package))
