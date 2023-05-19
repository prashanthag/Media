. ../env_install.sh
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers
make -j $(nproc -all)
sudo make install
sudo apt install  -y nasm yasm libfontconfig-dev libfribidi-dev
cd ../
git clone https://code.videolan.org/videolan/x264.git
cd x264
./configure --enable-shared
make -j $(nproc -all)
sudo make install
cd ../
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
mkdir ffmpeg/gpl
cd ffmpeg/gpl
../configure  --extra-ldflags="-L/${INSTALL_DIR}/lib -L/${INSTALL_DIR}/cuda/lib64" --extra-cflags="-I/${INSTALL_DIR}/include -I/${INSTALL_DIR}/cuda/include"  --enable-shared --enable-gpl --enable-libx264  --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree   --enable-libfreetype --enable-libfontconfig --enable-libfribidi
make -j $(nproc -all)
sudo make install 
