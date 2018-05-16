# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# 

define Profile/APU5
	NAME:=PC Engines APU5
	PACKAGES:=flashrom \
					kmod-ath9k kmod-ath10k \
					kmod-gpio-nct5140d \
					kmod-hwmon-core kmod-hwmon-k10temp \
					kmod-leds-gpio \
					kmod-pcspkr kmod-sound-core \
					kmod-sp5100_tco \
					usbutils kmod-usb-core kmod-usb-ohci kmod-usb-serial kmod-usb2 kmod-usb3 \
					kmod-e1000e kmod-e1000 kmod-r8169
endef

define Profile/APU5/Description
	PC Engines APU2 Embedded Board
endef

$(eval $(call Profile,APU5))
