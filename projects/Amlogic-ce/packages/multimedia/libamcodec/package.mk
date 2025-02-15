# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="libamcodec"
PKG_VERSION="ae029843502409bd5d4dfe31193f2421384281bc"
PKG_SHA256="236d611e574b7c7e7955dc5580ef9426a09e22d6b4efdee7aa9d73084d4ce24b"
PKG_LICENSE="proprietary"
PKG_SITE="http://openlinux.amlogic.com"
PKG_SOURCE_NAME="libamcodec-aarch64-${PKG_VERSION}.tar.xz"
PKG_URL="https://sources.coreelec.org/${PKG_SOURCE_NAME}"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="libamplayer: Interface library for Amlogic media codecs"
PKG_TOOLCHAIN="manual"

# Rollback package for 4.9 kernel and avoid future conflicts on rebase
case "${KODI_VENDOR}" in
  amlogic-4.9)
    PKG_VERSION="8a779caba41b163fed9ebd0df82db36dd962a9a3"
    if [ "${ARCH}" = "aarch64" ]; then
      PKG_SHA256="0aa305a4ac5f0358a0b06e1d9826526385ec19290f28cfbde1d3e6a66844c69b"
    else
      PKG_SHA256="72aa29376f560994faa8b76cd4d9f8d6790bd2d88748fcf59ed66115e62d3d3f"
    fi
    PKG_SOURCE_NAME="${PKG_NAME}-${ARCH}-${PKG_VERSION}.tar.xz"
    PKG_URL="https://sources.coreelec.org/${PKG_SOURCE_NAME}"
    ;;
esac

make_target() {
  cp -PR * $SYSROOT_PREFIX
}

makeinstall_target() {
  mkdir -p $INSTALL/usr
    cp -PR usr/lib $INSTALL/usr
}
