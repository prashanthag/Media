cd ../
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
../configure  --extra-ldflags="-L/usr/local/lib -L/usr/local/cuda/lib64" --extra-cflags="-I/usr/local/include -I/usr/local/cuda/include"  --enable-shared --enable-gpl --enable-libx264  --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree --enable-libnpp  --enable-libfreetype --enable-libfontconfig --enable-libfribidi
make -j $(nproc -all)
sudo make install 
cd ../../
