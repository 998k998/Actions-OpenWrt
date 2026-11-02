#!/bin/bash
#
# DIY script part 2 (After Feeds update/install)
#

# 1. 拉取针对 RE-CS-03 的适配参考源码
git clone --depth 1 https://github.com/pmyy-wt/jdc_re-cs-03.git temp_re_cs_03

# 2. 将设备树 (DTS) 与内核补丁注入到 Official qualcommax 目标平台中
mkdir -p target/linux/qualcommax/patches-6.6
mkdir -p target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/

# 复制 DTS 设备树文件与 Patches
cp -rf temp_re_cs_03/patches/* target/linux/qualcommax/patches-6.6/ 2>/dev/null || true
cp -rf temp_re_cs_03/dts/* target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ 2>/dev/null || true

# 3. 清理临时下载目录
rm -rf temp_re_cs_03
