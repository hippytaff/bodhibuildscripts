#!/bin/sh

cd /home/jeff/e17_src/snow && make distclean
./autogen.sh
cp -R /home/jeff/e17_src/snow /media/sda5/Bodhi/e17_debs/$1/snow-$1
cd /media/sda5/Bodhi/e17_debs/$1
tar czvf /media/sda5/Bodhi/e17_debs/$1/snow-$1.tar.gz snow-$1/

cd /media/sda5/Bodhi/e17_debs/$1/snow-$1
make distclean
dh_make -e jeffhoogland@linux.com -f ../snow-$1.tar.gz

cp /media/sda5/Bodhi/e17_debs/controlfiles/snow/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../snow*.deb
