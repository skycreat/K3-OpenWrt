#!/bin/bash
#
# https://github.com/skycreat/K3-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

echo '添加SSR-Plus软件源'
sed -i "/helloworld/d" "feeds.conf.default"
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
echo '=========Add SSR-Plus source OK!========='

echo '添加passwall软件源'
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git passwallpackages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
echo '=========Add passwall source OK!========='

echo '添加AdguardHome'
git clone https://github.com/kongfl888/luci-app-adguardhome package/lean/luci-app-adguardhome 
echo '=========Add AdguardHome OK!========='

echo '添加lwz322的K3屏幕插件'
git clone https://github.com/JE668/luci-app-k3screenctrl.git package/lean/luci-app-k3screenctrl
echo '=========Add k3screen plug OK!========='

echo '替换lwz322的K3屏幕驱动插件'
rm -rf package/lean/k3screenctrl
git clone https://github.com/JE668/k3screenctrl_build.git package/lean/k3screenctrl/
echo '=========Replace k3screen drive plug OK!========='

echo '移除bcm53xx中的其他机型'
sed -i '421,453d' target/linux/bcm53xx/image/Makefile
sed -i '140,412d' target/linux/bcm53xx/image/Makefile
sed -i 's/$(USB3_PACKAGES) k3screenctrl/luci-app-k3screenctrl/g' target/linux/bcm53xx/image/Makefile
echo '=========Remove other devices of bcm53xx OK!========='

firmware='69027'
echo '替换无线驱动'
wget -nv https://github.com/JE668/Phicomm-k3-Wireless-Firmware/raw/master/brcmfmac4366c-pcie.bin.${firmware} -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
echo '=========Replace k3 wireless firmware OK!========='
