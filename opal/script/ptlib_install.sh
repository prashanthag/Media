set -e
. ./env_install.sh
script_dir=$(pwd)
cd $WORK_DIR
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

git apply ${script_dir}/ptlib_2_${SUBVERSION}.patch
autoreconf -if | true

./configure  --prefix ${INSTALL_DIR} --enable-pulse --enable-samples 
make -j $(nproc --all)
make -j $(nproc --all) debug
${SUDO} make install
#sudo make install || make install

