#!/bin/bash
echo "[ ]====================================================================[ ]"
echo "[ ]                     ALISAM  TECHNOLOGY                             [ ]"
echo "[ ]                  Atscan Tool Install Script                        [ ]"
echo "[ ]====================================================================[ ]"
echo "[!] Install.sh will install atscan tool in the system [Y/n]" ; 
read baba

if [ $baba == "y" ] ; 
then
    echo " "
else
    exit
fi

echo "[ ] Checking directories..."

if [ -d "/usr/share/doc/ATSCAN" ] ; 
then
echo "[!] A directory ATSCAN was found! Do you want to replace it? [Y/n]" ; 
read mama

if [ $mama == "y" ] ; 
then
  rm -R "/usr/share/doc/ATSCAN/"
else
  exit
fi
fi
echo "[!] Installing ..."
git clone https://github.com/AlisamTechnology/ATSCAN.git /usr/share/doc/ATSCAN/
echo '#!/bin/bash
perl /usr/share/doc/ATSCAN/atscan.pl ${1+"$@"}' > atscan
chmod +x atscan
sudo cp atscan /usr/bin/
rm atscan

if [ -d "/usr/share/doc/ATSCAN" ] ; 
then
  echo "[ ]====================================================================[ ]"
  echo "[ ]     All is done!! You can execute Atscan by typing atscan !        [ ]" 
  echo "[ ]====================================================================[ ]"
else
  echo "[!] Install faid!! "
exit
fi
