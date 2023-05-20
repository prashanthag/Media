set -e
. ./env_install.sh

# ptlib installation
echo "\e[31mInstalling ptlib\e[0m"
if [ ! -d "ptlib" ];then
  git clone -b v2_${SUBVERSION} git://git.code.sf.net/p/opalvoip/ptlib
fi
cd  ptlib
git clean -fd 
git reset HEAD
git checkout  -- ./
git checkout v2_${SUBVERSION} || true

git apply ../ptlib_2_${SUBVERSION}.patch
autoreconf -if | true

./configure  --prefix ${INSTALL_DIR} --enable-pulse --enable-samples 
make -j $(nproc --all)
make -j $(nproc --all) debug
sudo make install || make install

#opal installation
echo "\e[31mInstalling opal\e[0m"
cd ../
if [ ! -d "opal" ];then
  git clone -b v3_${SUBVERSION} git://git.code.sf.net/p/opalvoip/opal
fi
cd opal
git clean -fd 
git reset HEAD
git checkout  -- ./
git checkout v3_${SUBVERSION} || true

git apply ../opal_3_${SUBVERSION}.patch
autoreconf -if | true

./configure --prefix ${INSTALL_DIR}   --enable-samples
make -j $(nproc --all)
make -j $(nproc --all) debug 
sudo make install || make install 
cd samples/openphone
make debug
