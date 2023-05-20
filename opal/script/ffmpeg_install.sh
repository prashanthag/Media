set -e
. ./env_install.sh
cd $WORK_DIR

echo  "\e[31mInstalling nv-codec-headers\e[0m"
if [ ! -d "nv-codec-headers" ];then
  git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
fi
cd nv-codec-headers
make -j $(nproc -all)
#sudo make install || make install
${SUDO} make install
${SUDO} apt install  -y nasm yasm libfontconfig-dev libfribidi-dev

cd ../
echo  "\e[31mInstalling x264\e[0m"
if [ ! -d "x264" ];then
  git clone https://code.videolan.org/videolan/x264.git
fi
cd x264
./configure --enable-shared
make -j $(nproc -all)
${SUDO} make install

cd ../
echo  "\e[31mInstalling ffmpeg\e[0m"
if [ ! -d "ffmpeg" ];then
  git clone -b ${FFMPEG_VERSION} https://git.ffmpeg.org/ffmpeg.git  || true
fi
cd ffmpeg
mkdir -p gpl 
cd gpl
../configure  --extra-ldflags="-L/${INSTALL_DIR}/lib -L/${INSTALL_DIR}/cuda/lib64" --extra-cflags="-I/${INSTALL_DIR}/include -I/${INSTALL_DIR}/cuda/include"  --enable-shared --enable-gpl --enable-libx264  --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree   --enable-libfreetype --enable-libfontconfig --enable-libfribidi
make -j $(nproc -all)
${SUDO} make install
#sudo make install || make install 
