# ndctl-ubuntu-22.04 README.md

These bash scripts installs https://github.com/pmem/ndctl [v78](https://github.com/pmem/ndctl/commit/a871e6153b11fe63780b37cdcb1eb347b296095c) in a newly installed Ubuntu 22.04.3 (desktop or server):

1. **ndctl-prereqs-ubuntu-22.04.sh** apt-get install required packages to clone and build ndctl
2. **ndctl-clone-build-install.sh** clone, build, and install ndctl

Install ndctl **before** updating or running the kernel because the new kernel headers may be incompatible with the existing C libraries.

This bash script installs kernel 6.5 in Ubuntu 22.04:
- **ubuntu-22.04-kernel-6.5.sh** installs OEM Kernel 6.5 in Ubuntu 22.04

This bash script installs kernel 6.6 in Ubuntu 22.04:
- **ubuntu-22.04-kernel-6.6.sh** installs mainline kernel 6.6 in Ubuntu 22.04

Hold down [left-shift] key while booting to enter GRUB menu.
Choose "Advanced Options for Ubuntu" then select the kernel version to boot.
