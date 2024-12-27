#!/bin/bash
#
# https://github.com/skycreat/K3-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

echo '添加kenzok8 openwrt-package'
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
echo '========= kenzok8 添加完成 OK!========='

echo '移除bcm53xx中的其他机型'
sed -i '421,453d' target/linux/bcm53xx/image/Makefile
sed -i '140,412d' target/linux/bcm53xx/image/Makefile
sed -i 's/$(USB3_PACKAGES) k3screenctrl/luci-app-k3screenctrl/g' target/linux/bcm53xx/image/Makefile
echo '=========移除bcm53xx中的其他机型完成!========='

firmware='69027'
echo '替换无线驱动'
wget -nv https://github.com/JE668/Phicomm-k3-Wireless-Firmware/raw/master/brcmfmac4366c-pcie.bin.${firmware} -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
echo '=========无线驱动替换完成!========='
