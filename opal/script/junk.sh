
. ./env.sh
cd ../opal
./configure   --enable-cpp17 --enable-samples --with-ptlib=${PTLIBDIR}  --with-plugin-installdir=${PTLIBPLUGINDIR}
make -j12 debug 
