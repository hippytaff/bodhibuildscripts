#!/bin/sh

#Normal package
cp -R /home/jeff/$2/enlightenment-$2 /media/sda5/Bodhi/e17_debs/$1/e19-$1

cd /media/sda5/Bodhi/e17_debs/$1/e19-$1
git apply /home/jeff/bodhi_patch_git.diff

./autogen.sh

cd /media/sda5/Bodhi/e17_debs/$1
tar czvf e19-$1.tar.gz e19-$1/

cd /media/sda5/Bodhi/e17_debs/$1/e19-$1
autoreconf
make distclean
dh_make -e jeffhoogland@linux.com -f ../e19-$1.tar.gz

cp -f /media/sda5/Bodhi/e17_debs/controlfiles/e19/* debian/
dpkg-buildpackage -rfakeroot -b
dpkg -i ../e19*.deb
