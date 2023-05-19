#!/bin/bash
# 更新 sourcemod 和 metamod 的二进制文件，只覆盖对应的 so, mmdb 和 smx 文件。
# 需要操作系统上安装了 wget 程序以下载安装包。
# 两个包的下载发布页分别为：
# https://www.sourcemod.net/downloads.php?branch=stable
# http://www.sourcemm.net/downloads.php?branch=stable
# 在里面找到最新的下载链接填入以下两个参数

# Source Mod
SM_URL="https://sm.alliedmods.net/smdrop/1.11/sourcemod-1.11.0-git6934-linux.tar.gz"
# Meta Mod
META_URL="https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1148-linux.tar.gz"

SM_TAR=sourcemod-latest.tar.gz
META_TAR=metamod-latest.tar.gz
BINARY_EXT='\.(so|mmdb|smx)$'

wget -v -O ${SM_TAR} ${SM_URL}
echo "Downloaded ${SM_URL}"
wget -v -O ${META_TAR} ${META_URL}
echo "Downloaded ${META_URL}"

SRC_BINS=$( tar tf ${SM_TAR} | grep -E ${BINARY_EXT} )
META_BINS=$( tar tf ${META_TAR} | grep -E ${BINARY_EXT} )

tar xvf ${SM_TAR} ${SRC_BINS} && rm ${SM_TAR}
tar xvf ${META_TAR} ${META_BINS} && rm ${META_TAR}

echo "Update Sourcemod & Metamod successfully!"

