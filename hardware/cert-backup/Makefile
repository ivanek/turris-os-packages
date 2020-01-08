#
## Copyright (C) 2013-2020 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=cert-backup
PKG_VERSION:=14
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

PKG_MAINTAINER:=CZ.NIC <packaging@turris.cz>
PKG_LICENSE:=BSD-3-Clause

include $(INCLUDE_DIR)/package.mk

define Package/cert-backup
  TITLE:=cert-backup
  DEPENDS:=+mount-utils
endef

ifneq ($(CONFIG_TARGET_mpc85xx_p2020_TURRIS),y)
BACKEND:=turris1x
else
BACKEND:=btrfs
endif

define Package/cert-backup/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/cert-backup $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/share/cert-backup
	$(INSTALL_FILE) ./files/$(BACKEND)_backend.sh $(1)/usr/share/cert-backup/backend.sh
endef

Build/Compile:=:

$(eval $(call BuildPackage,cert-backup))
