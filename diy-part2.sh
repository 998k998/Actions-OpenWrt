#!/bin/bash
#
# DIY script part 2 (Target: OpenWrt 25.12)
#

# 1. 克隆 RE-CS-03 适配仓库
git clone --depth 1 https://github.com/pmyy-wt/jdc_re-cs-03.git temp_re_cs_03

# 2. 注入针对 qualcommax/ipq50xx 6.6 内核的设备补丁与 DTS
mkdir -p target/linux/qualcommax/patches-6.6
mkdir -p target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/

cp -rf temp_re_cs_03/patches/* target/linux/qualcommax/patches-6.6/ 2>/dev/null || true
cp -rf temp_re_cs_03/dts/* target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ 2>/dev/null || true

# 3. 清理临时下载文件
rm -rf temp_re_cs_03
