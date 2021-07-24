cd ../
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers
make
sudo make install
sudo apt install  -y yasm libfontconfig-dev libfribidi-dev
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
mkdir ffmpeg/gpl
cd ffmpeg/gpl
../configure --prefix=/usr/local --extra-ldflags="-L/usr/local/lib -L/usr/local/cuda/lib64" --extra-cflags="-I/usr/local/include -I/usr/local/cuda/include"  --enable-shared --enable-gpl --enable-libx264  --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree --enable-libnpp  --enable-libfreetype --enable-libfontconfig --enable-libfribidi
make -j 12
sudo make install 
cd ../../
