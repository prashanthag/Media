INSTALL_DIR=/usr/local
SUBVERSION=14_4
FFMPEG_VERSION=n6.0
WORK_DIR=~/conference
export PKG_CONFIG_PATH=${INSTALL_DIR}/lib/pkgconfig
export LD_LIBRARY_PATH=${INSTALL_DIR}/lib
export PTLIBPLUGINDIR=${INSTALL_DIR}/lib/ptlib:${INSTALL_DIR}/lib/opal

if command -v sudo >/dev/null 2>&1; then
   SUDO=sudo
else
   SUDO=""
fi


