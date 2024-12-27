#!/bin/bash
#
# https://github.com/skycreat/K3-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

echo '修改 IP'
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
echo '========= IP修改完成!========='

#echo '修改 主题'
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#echo '========= 主题修改完成!========='

echo '修改 主机名称'
sed -i 's/OpenWrt/Router/g' package/base-files/files/bin/config_generate
echo '========= 主机名称修改完成!========='

echo '移除主页跑分信息显示'
sed -i 's/ <%=luci.sys.exec("cat \/etc\/bench.log") or ""%>//g' package/lean/autocore/files/arm/index.htm
echo '=========移除完成!========='

echo '移除主页日志打印'
sed -i '/console.log(mainNodeName);/d' package/lean/luci-theme-argon/htdocs/luci-static/argon/js/script.js
echo '=========移除完成!========='

echo '添加主页的CPU温度显示'
sed -i "/<tr><td width=\"33%\"><%:Load Average%>/a \ \t\t<tr><td width=\"33%\"><%:CPU Temperature%></td><td><%=luci.sys.exec(\"sed 's/../&./g' /sys/class/thermal/thermal_zone0/temp|cut -c1-4\")%></td></tr>" feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
cat feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm |grep Temperature
echo '=========功能添加完成!========='
