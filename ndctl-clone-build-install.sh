#!/bin/bash -x

# Thu, Sep 14, 2023 10:26:34 AM
# Roger C. Pao <roger.pao@smartm.com>

ndctl_info() {
  ndctl -v
  ls -l `which ndctl`
  ldd `which ndctl`
  ls -l /lib/libndctl.so*
}


uname -a
head -n 1 /etc/os-release

echo "Prior to ndctl clone, compile, and install."
ndctl_info

echo "Begin ndctl clone, compile, and install."
[ ! -d ndctl ] && git clone https://github.com/pmem/ndctl.git
pushd ndctl
  git pull
  meson setup build;
  meson compile -C build;
  sudo meson install -C build
popd

echo "After to ndctl clone, compile, and install."
ndctl_info
