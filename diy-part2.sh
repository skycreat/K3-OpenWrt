#!/bin/bash
#
# https://github.com/skycreat/K3-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

echo 'Modify default IP'
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

echo 'Modify hostname'
#sed -i 's/OpenWrt/Router/g' package/base-files/files/bin/config_generate
