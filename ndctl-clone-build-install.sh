#!/bin/bash -x

# Thu, Sep 14, 2023 10:26:34 AM
# Roger C. Pao <roger.pao@smartm.com>

ndctl_info() {
  NDCTLBIN=$(which ndctl)
  if [ $? -eq 0 ]; then
    ${NDCTLBIN} -v
    ls -l ${NDCTLBIN}
    ldd ${NDCTLBIN}
    ls -l /lib/libndctl.so*
  fi
}


uname -a
cat /etc/os-release

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


# $ cxl list -vvv
# cxl: /lib/libdaxctl.so.1: version `LIBDAXCTL_10' not found (required by cxl)
# $ ls -al /lib
# lrwxrwxrwx   1 root root      14 May 10 11:51 libdaxctl.so -> libdaxctl.so.1
# lrwxrwxrwx   1 root root      18 May 10 11:51 libdaxctl.so.1 -> libdaxctl.so.1.2.5
# -rwxr-xr-x   1 root root  108560 May 10 11:51 libdaxctl.so.1.0.6
# -rwxr-xr-x   1 root root  108488 Sep 14  2023 libdaxctl.so.1.2.5
# Even though libdaxctl.so.1.2.5 is older than libdaxctl.so.1.0.6, it has a
# higher version number, so 'sudo meson install -C build' incorrectly symlinks 
# the older libdaxctl.so.1.2.5.  You can remove libdaxctl.so.1.2.5 and symlink
# libdaxctl.so.1 to libdaxctl.so.1.0.6.
