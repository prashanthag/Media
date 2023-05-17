#!/bin/bash
set -e 
. ./docker_env.sh
git clone git://git.code.sf.net/p/opalvoip/ptlib ptlib
git clone git://git.code.sf.net/p/opalvoip/opal  opal
cd  ptlib
git checkout -b v2_18_8  v2_18_8 || true
git apply ../ptlib.patch
./configure  --enable-samples --enable-pulse
make debug -j12 
make -j12
cd ../opal
git checkout -b v3_18_8 v3_18_8 || true
git apply ../opal.patch
./configure    --enable-samples
make -j12
make  debug -j12
cd samples/openphone
make debug
