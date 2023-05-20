
#DEBIAN_FRONTEND=noni0nteractive apt install -y libavformat-dev libavcodec-dev libx264-dev 
set -e
. ./env_install.sh
SSL_DEV=libssl-dev
current_version=$(echo "$SUBVERSION" | tr -d '_')
if [ $current_version -le 160 ]  ; then 
	echo "Opal version is 3_$SUBVERSION and so installing libssl1.0-dev"
	SSL_DEV=libssl1.0-dev
else
	echo "Opal version 3_$SUBVERSION and so installing libv8-dev"
	apt install -y libv8-dev
fi
DEBIAN_FRONTEND=noninteractive apt install -y libfontconfig-dev libfribidi-dev $SSL_DEV
DEBIAN_FRONTEND=noninteractive apt install -y  libspeex-dev libopus-dev   libvpx-dev libtheora-dev libspandsp-dev 
DEBIAN_FRONTEND=noninteractive apt install -y vim g++ git make autoconf libpcap-dev libexpat-dev  libsasl2-dev libldap-dev  unixodbc-dev liblua5.3-dev  libncurses-dev libsdl-dev libsdl2-dev  libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libwxgtk3.0-gtk3-dev libsrtp2-dev libgsm1-dev  capiutils dahdi 

