#!/bin/bash

Link="https://bigota.d.miui.com/V12.5.1.0.RJOMIXM/miui_MERLINGlobal_V12.5.1.0.RJOMIXM_84b071b256_11.0.zip"
FileName="$(pwd)/dump.zip"
export DEBIAN_FRONTEND=noninteractive
apt-get -y update && apt-get -y upgrade && apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python3 python3-pip brotli liblz4-tool axel gawk aria2 detox wget
pip3 install backports.lzma protobuf pycrypto docopt

CurrentFolder=$(pwd)

if [ ! -z "$Link" ];then
    wget "$Link" -O "$FileName"
    bash dumpyara.sh "$FileName" "$GIT_SECRET" "$TG_TOKEN"
fi

cd "$CurrentFolder" && rm -rf "$CurrentFolder/*"
