#!/bin/bash
#BY VICTOR
echo VERSION=1.00000

LOGFILE=/tmp/actualizacion.log
exec 1> $LOGFILE 2>&1
set -x

#BORRADO CARPETAS
rm -r /tmp/actualizacion-master
rm -r /etc/enigma2/astra-master
rm -r /media/usb/picon-master
rm -r /etc/init.d/script-master
#BORRADO ZIP
rm /tmp/master.zip
rm /etc/enigma2/master.zip
rm /media/usb/master.zip
rm /etc/init.d/master.zip


#ACTUALIZACION
wget https://github.com/cccam2021/actualizacion/archive/master.zip -P /tmp/
unzip -o /tmp/master.zip -d /tmp/
cp -i /tmp/actualizacion-master/* /tmp/

#BORRADO CARPETAS
rm -r /tmp/actualizacion-master
#BORRADO ZIP
rm /tmp/master.zip

file1=/tmp/ACT_L
file2=/etc/enigma2/ACT_L
file3=/tmp/ACT_P
file4=/media/usb/picon/ACT_P
file5=/tmp/ACT_S
file6=/etc/init.d/ACT_S

echo
echo " ¿ ACTUALIZACION SCRIPT ? : "
echo
bool=$(cmp -s "$file5" "$file6" )
if cmp -s "$file5" "$file6"
then
   echo "NO ACTUALIZACION"
else
   echo "ACTUALIZACION"
#SCRIPT (SCRIPT a CLIENT¿?)
wget https://github.com/cccam2021/script/archive/master.zip -P /etc/init.d/
unzip -o /etc/init.d/master.zip -d /etc/init.d/
cp -i /etc/init.d/script-master/* /etc/init.d/   
#CCAM (CCCAM CLIENT)
#sed -i "1,5d" /etc/CCcam.cfg
#sed -i 'li CCCAM1' /etc/CCcam.cfg
#sed -i 'li CCCAM2' /etc/CCcam.cfg
#sed -i 'li CCCAM3' /etc/CCcam.cfg
#sed -i 'li CCCAM4' /etc/CCcam.cfg
#sed -i 'li CCCAM5' /etc/CCcam.cfg
#sed -i 'li CCCAM6' /etc/CCcam.cfg
#BORRADO CARPETAS
rm -r /etc/init.d/script-master
#BORRADO ZIP
rm /etc/init.d/master.zip
fi

echo
echo " ¿ ACTUALIZACION LISTA ? : "
echo
bool=$(cmp -s "$file1" "$file2" )
if cmp -s "$file1" "$file2"
then
   echo "NO ACTUALIZACION"
else
   echo "ACTUALIZACION"

#LISTA DE CANALES
wget https://github.com/cccam2021/astra/archive/master.zip -P /etc/enigma2/
unzip -o /etc/enigma2/master.zip -d /etc/enigma2/
cp -i /etc/enigma2/astra-master/* /etc/enigma2/

#BORRADO CARPETAS
rm -r /etc/enigma2/astra-master
#BORRADO ZIP
rm /etc/enigma2/master.zip

wget -qO - http://127.0.0.1/web/servicelistreload?mode=0
fi

echo
echo " ¿ ACTUALIZACION PICON ? : "
echo
bool=$(cmp -s "$file3" "$file4" )
if cmp -s "$file3" "$file4"
then
   echo "NO ACTUALIZACION"
else
   echo "ACTUALIZACION"
#PICON
wget https://github.com/cccam2021/picon/archive/master.zip -P /media/usb/
unzip -o /media/usb/master.zip -d /media/usb/
cp -i /media/usb/picon-master/* /media/usb/picon/

#BORRADO CARPETAS
rm -r /media/usb/picon-master
#BORRADO ZIP
rm /media/usb/master.zip


fi



 
