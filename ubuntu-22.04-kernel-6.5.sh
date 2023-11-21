#!/bin/bash -x

# Fri, Nov 17, 2023 10:57:12 PM
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

# rcpao@ub22svr-ndctl:~$ uname -a
# Linux ub22svr-ndctl 6.5.0-1003-oem #3-Ubuntu SMP PREEMPT_DYNAMIC Mon Aug 28 15:04:22 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
# rcpao@ub22svr-ndctl:~$ uname -r
# 6.5.0-1003-oem
UNAME_R=$(uname -r)


# cat /etc/os-release
# set -o allexport # https://stackoverflow.com/a/30969768
#     source /etc/os-release
# set -o allexport
. /etc/os-release

echo UBUNTU_CODENAME=${UBUNTU_CODENAME}
if [ "${UBUNTU_CODENAME}" == "jammy" ]; then # jammy = 22.04
    if [ "${UNAME_R}" != "6.5.0-1003-oem" ]; then
        # https://ubuntuhandbook.org/index.php/2023/09/linux-kernel-6-5-is-ready-to-install-in-ubuntu-22-04-lts/
        sudo ${APTGETENV} apt-get -y install linux-oem-22.04d
        # https://stackoverflow.com/questions/18544359/how-do-i-read-user-input-into-a-variable-in-bash
        read -p "Reboot to 6.5.0-1003-oem? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || sudo reboot
        echo "Not rebooting, but you really should."
        return 1
    fi
fi
