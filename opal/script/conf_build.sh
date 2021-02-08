. ./env.sh
cd ../ptlib
git checkout v2_18
./configure --prefix ${PTLIBDIR} --enable-cpp17 --enable-samples --enable-pulse
make -j12 debug
cd ../opal
git checkout v3_18
./configure --prefix ${OPALDIR}  --enable-cpp17 --enable-samples --with-ptlib=${PTLIBDIR}  --with-plugin-installdir=${PTLIBPLUGINDIR}
make -j12 debug 
