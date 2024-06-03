#!/bin/bash

# https://docs.pmem.io/ndctl-user-guide/installing-ndctl/installing-ndctl-from-source-on-linux
# https://wiki.almalinux.org/repos/AlmaLinux.html

dnf repolist
  sudo dnf -y install epel-release
# sudo dnf config-manager --set-enabled powertools
  sudo dnf config-manager --set-enabled crb
  sudo dnf -y install git gcc gcc-c++ autoconf automake asciidoc bash-completion xmlto libtool pkgconfig glib2 glib2-devel libfabric libfabric-devel doxygen graphviz pandoc ncurses kmod kmod-devel libudev-devel libuuid-devel json-c-devel keyutils-libs-devel gem make bc meson
  sudo gem install asciidoctor

  sudo dnf -y install cmake
  sudo dnf -y install libtraceevent-devel
  sudo dnf -y install libtracefs-devel
  sudo dnf -y install iniparser-devel
