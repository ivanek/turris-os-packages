#
## Copyright (C) 2018-2020 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=sentinel-proxy
PKG_VERSION:=1.3
PKG_RELEASE:=1

PKG_SOURCE:=proxy-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://gitlab.labs.nic.cz/turris/sentinel/proxy/-/archive/v$(PKG_VERSION)/
PKG_HASH:=c32347768573b764a961628b5a109e0a140ad5869666c56ccfab90dbb6d2260c

PKG_MAINTAINER:=CZ.NIC <packaging@turris.cz>
PKG_LICENSE:=GPL-3.0-or-later

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/sentinel-proxy
  SECTION:=collect
  CATEGORY:=Network
  SUBMENU:=Sentinel
  TITLE:=Proxy
  URL:=https://gitlab.labs.nic.cz/turris/sentinel/proxy
  DEPENDS:= \
  +czmq \
  +libpaho-mqtt-c \
  +zlib \
  +libopenssl \
  +libconfig \
  +sentinel-certgen
endef

define Package/sentinel-proxy/description
  Central daemon proxying all Sentinel trafic on router to Turris servers.
endef

define Package/sentinel-proxy/install
	$(INSTALL_DIR) $(1)/etc/sentinel
	$(INSTALL_BIN) ./files/ca.pem $(1)/etc/sentinel/ca.pem

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sentinel-proxy $(1)/usr/bin/sentinel-proxy

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sentinel-device-token $(1)/usr/bin/sentinel-device-token

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/init $(1)/etc/init.d/sentinel-proxy

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) files/uci $(1)/etc/config/sentinel

	$(INSTALL_DIR) $(1)/etc/sentinel-certgen_hooks.d
	$(INSTALL_BIN) files/restart-proxy-hook.sh $(1)/etc/sentinel-certgen_hooks.d/restart-proxy

	$(INSTALL_DIR) $(1)/etc/cron.d
	$(INSTALL_DATA) files/renew.cron $(1)/etc/cron.d/certgen-certs-renew
endef

define Package/sentinel-proxy/conffiles
/etc/config/sentinel
endef

$(eval $(call BuildPackage,sentinel-proxy))
