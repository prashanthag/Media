set -e
SUBVERSION=18_8
. ./env_install.sh
cd ../
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

git apply ../script/ptlib_2_${SUBVERSION}.patch || true
./configure  --prefix ${INSTALL_DIR} --enable-pulse --enable-samples 
make -j $(nproc --all) debug

exit
sudo make install

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

git apply ../script/opal_3_${SUBVERSION}.patch || true
./configure --prefix ${INSTALL_DIR}   --enable-samples
make -j $(nproc --all) debug 
sudo make install
cd samples/openphone
make debug
