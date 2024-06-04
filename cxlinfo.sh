#!/bin/bash -x

# script cxlinfo-$(/usr/bin/date +%Y%m%d-%H%M%S).txt

cat /etc/os-release
uname -a
uname -r
cat /proc/cpuinfo
sudo dmidecode
lspci
lspci | grep -i cxl
sudo lspci -vvv
sudo lspci -xxxx
numactl -H
lsmem
ls -l /dev/dax*
daxctl list
ls -l /dev/cxl/mem*
sudo cxl list -vvv
sudo cxl list -HMui
# echo 4000 | sudo tee /proc/sys/vm/nr_hugepages
# ./mlc

# exit
