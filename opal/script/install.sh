#!/bin/sh
set -e 
. ./env_install.sh
mkdir -p ${WORK_DIR}
sh preinstall_conf.sh
sh ffmpeg_install.sh
sh ptlib_install.sh
sh opal_install.sh
