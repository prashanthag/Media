set -e
. ./env_install.sh
script_dir=$(pwd)
cd $WORK_DIR
#opal installation
echo "\e[31mInstalling opal\e[0m"
if [ ! -d "opal" ];then
  git clone -b v3_${SUBVERSION} git://git.code.sf.net/p/opalvoip/opal
fi
cd opal
git clean -fd 
git reset HEAD
git checkout  -- ./
git checkout v3_${SUBVERSION} || true

git apply ${script_dir}/opal_3_${SUBVERSION}.patch
#autoreconf -if | true // TODO commented as it results in g.722.1 plugin failure

./configure --prefix ${INSTALL_DIR}   --enable-samples
make -j $(nproc --all)
make -j $(nproc --all) debug 
${SUDO} make install
#sudo make install || make install 
cd samples/openphone
make debug
make

