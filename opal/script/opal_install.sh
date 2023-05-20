#!/bin/bash
set -e 
. ./env.sh
cd ../opal
git checkout -e v3_18_8 v3_18_8 || true
#./configure --prefix ${OPALDIR}  --enable-cpp17 --enable-samples --with-ptlib=${PTLIBDIR}  --with-plugin-installdir=${PTLIBPLUGINDIR}
./configure --enable-samples      
#make clean
make -j12 debug 
