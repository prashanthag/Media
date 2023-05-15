DEBIAN_FRONTEND=noninteractive apt install -y vim g++ git make autoconf libpcap-dev libexpat-dev libssl-dev libsasl2-dev libldap-dev  unixodbc-dev liblua5.3-dev libv8-dev libncurses-dev libsdl2-dev libavformat-dev  libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
DEBIAN_FRONTEND=noninteractive apt install -y libwxgtk3.0-gtk3-dev libsrtp2-dev libgsm1-dev libspeex-dev libopus-dev libavcodec-dev libx264-dev libvpx-dev libtheora-dev libspandsp-dev capiutils 
git clone git://git.code.sf.net/p/opalvoip/ptlib ptlib
git clone git://git.code.sf.net/p/opalvoip/opal  opal
