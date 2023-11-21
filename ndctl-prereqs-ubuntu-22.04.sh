#!/bin/bash -x

# Thu, Sep 14, 2023 10:25:47 AM
# Roger C. Pao <roger.pao@smartm.com>


# https://askubuntu.com/a/1431746
# ${APTGETENV} 
APTGETENV="NEEDRESTART_MODE=a"
sudo ${APTGETENV} apt-get -y update
sudo ${APTGETENV} apt-get -y upgrade
# sudo ${APTGETENV} apt-get -y dist-upgrade


# PRETTY_NAME="Ubuntu 22.04.3 LTS"
# NAME="Ubuntu"
# VERSION_ID="22.04"
# VERSION="22.04.3 LTS (Jammy Jellyfish)"
# VERSION_CODENAME=jammy
# ID=ubuntu
# ID_LIKE=debian
# HOME_URL="https://www.ubuntu.com/"
# SUPPORT_URL="https://help.ubuntu.com/"
# BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
# PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
# UBUNTU_CODENAME=jammy

# Ubuntu 23.10 daily build
#   44dc0f1230636cf51145ad91e0cf77fad53b9d4dbab56abfdfa69f7dc6c5d935 *mantic-desktop-amd64.iso
# /etc/os-release
# PRETTY_NAME="Ubuntu Mantic Minotaur (development branch)"
# NAME="Ubuntu"
# VERSION_ID="23.10"
# VERSION="23.10 (Mantic Minotaur)"
# VERSION_CODENAME=mantic
# ID=ubuntu

uname -a
# Linux ub22svr-ndctl 5.15.0-83-generic #92-Ubuntu SMP Mon Aug 14 09:30:42 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
# uname -r
# 5.15.0-83-generic

sudo ${APTGETENV} apt-get -y install git

# https://github.com/pmem/ndctl/blob/main/ndctl.spec.in BuildRequires:
sudo ${APTGETENV} apt-get -y install xmlto
sudo ${APTGETENV} apt-get -y install automake
sudo ${APTGETENV} apt-get -y install libtool
 sudo ${APTGETENV} apt-get -y install pkg-config
 sudo ${APTGETENV} apt-get -y install libkmod-dev
 sudo ${APTGETENV} apt-get -y install libudev-dev
 sudo ${APTGETENV} apt-get -y install cmake
 sudo ${APTGETENV} apt-get -y install libtraceevent-dev
 sudo ${APTGETENV} apt-get -y install libtracefs-dev
 sudo ${APTGETENV} apt-get -y install asciidoctor
 sudo ${APTGETENV} apt-get -y install uuid-dev
 sudo ${APTGETENV} apt-get -y install libjson-c-dev
 sudo ${APTGETENV} apt-get -y install bash-completion
 sudo ${APTGETENV} apt-get -y install systemd
 sudo ${APTGETENV} apt-get -y install libkeyutils-dev
 # sudo ${APTGETENV} apt-get -y install systemd-rpm-macros # RPM systems only!
 sudo ${APTGETENV} apt-get -y install libiniparser-dev
sudo ${APTGETENV} apt-get -y install meson

# Ubuntu 22.04.0 requires udev; not an issue in Ubuntu 22.04.2.
sudo ${APTGETENV} apt-get -y install udev
