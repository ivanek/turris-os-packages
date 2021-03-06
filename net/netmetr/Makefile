#
## Copyright (C) 2016-2020 CZ.NIC z.s.p.o. (https://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=netmetr
PKG_VERSION:=1.5.4
PKG_RELEASE:=1

PKG_SOURCE:=netmetr-client-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://gitlab.labs.nic.cz/turris/netmetr-client/-/archive/v$(PKG_VERSION)/
PKG_HASH:=0d9e86df19480007662400edb75f9c464e3eb52c3f8eb51290e3f034d2007caa

PKG_MAINTAINER:=CZ.NIC <packaging@turris.cz>
PKG_LICENSE:=GPL-3.0-or-later

PKG_BUILD_DIR:=$(BUILD_DIR)/netmetr-client-v$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/$(PKG_NAME)
  TITLE:=Speed measurement application
  URL:=https://gitlab.labs.nic.cz/turris/netmetr-client
  DEPENDS:= \
  +python3-light \
  +python3-setuptools \
  +python3-pyserial \
  +rmbt-client \
  +cronie \
  +xz
  VARIANT:=python3
endef

define Package/$(PKG_NAME)/description
  Python wrapper for RMBT C application that
  provides download and upload speed measurements.
endef

define Py3Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/

	$(INSTALL_DIR)  $(1)/etc/config
	$(INSTALL_CONF)	./files/netmetr.config		$(1)/etc/config/netmetr

	$(INSTALL_DIR)  $(1)/etc/cron.d
	$(INSTALL_DATA) ./files/netmetr.cron 		$(1)/etc/cron.d/netmetr
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/netmetr
endef

$(eval $(call Py3Package,$(PKG_NAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
$(eval $(call BuildPackage,$(PKG_NAME)-src))
