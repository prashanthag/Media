set -e
. ./env_install.sh
git clone git://git.code.sf.net/p/opalvoip/ptlib ptlib || true
cd  ptlib
git clean -fd 
git checkout  -- ./
if git rev-parse --quiet --verify  v2_${SUBVERSION} >/dev/null; then
  echo "Branch v2_${SUBVERSION} exists"
  git checkout v2_${SUBVERSION}
else
  git checkout -b v2_${SUBVERSION} v2_${SUBVERSION}
fi
git clean -fd 
git checkout  -- ./

current_version=$(echo "$SUBVERSION" | tr -d '_')
if [ $current_version -eq 143 ]  ; then 
    machine_arch=$(uname -m)
    if [ "${machine_arch}" = "aarch64" ]; then
        echo "ARM architecture (aarch64) applying config.patch"
	echo "$(pwd)"
        git apply ../ptlib_config.patch 
	autoreconf -if | true
    fi      
else
    git apply ../ptlib_2_${SUBVERSION}.patch || true
fi

./configure  --prefix ${INSTALL_DIR} --enable-pulse --enable-samples 
make -j $(nproc --all) debug

make install
cd ../
git clone git://git.code.sf.net/p/opalvoip/opal  opal || true
cd opal
git clean -fd 
git checkout  -- ./
if git rev-parse --quiet --verify  v3_${SUBVERSION} >/dev/null; then
  echo "Branch v3_${SUBVERSION} exists"
  git checkout v3_${SUBVERSION}
else
  git checkout -b v3_${SUBVERSION} v3_${SUBVERSION} || true
fi
git clean -fd 
git checkout  -- ./

if [ $current_version -eq 143 ]  ; then 
    machine_arch=$(uname -m)
    if [ "${machine_arch}" = "aarch64" ]; then
        echo "ARM architecture (aarch64) applying config.patch"
	echo "$(pwd)"
        git apply ../opal_config.patch 
        git apply ../opal.patch 
	autoreconf -if | true
    fi      
else
    git apply ../opal_3_${SUBVERSION}.patch || true
fi
./configure --prefix ${INSTALL_DIR}   --enable-samples
make -j $(nproc --all) debug 
make install
cd samples/openphone
make debug
