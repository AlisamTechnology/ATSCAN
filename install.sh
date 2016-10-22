#!/bin/bash
####################################################################################################
# Atscan Install script.
# Install tool in linux os.
# Alisam Technology 2015
####################################################################################################
# PATHs:
# Parent directory => User choice.
# /inc/conf/atscan => /etc/bash_completion.d/atscan
# Bash link in /usr/bin/atscan
####################################################################################################
##
echo "[ ]====================================================================[ ]";
echo "[ ]                     ALISAM  TECHNOLOGY                             [ ]";
echo "[ ]                  Atscan Tool Install Script                        [ ]";
echo "[ ]====================================================================[ ]";
echo "";
if [ -d "/usr/bin/" ];
then
echo "[!] Install.sh install atscan tool in your system? [y/n]: ";
read baba
if [ "$baba" == "y" ] || [ "$baba" == "Y" ] || [ -z "$baba" ]; 
  then
    echo " "
  else
    echo "[!] Installation aborted!";
    exit
fi
current=`pwd`
echo "[!] Where do you want to install ATSCAN?";
echo "[!] Set path or press enter to use default dir [$current]: "
read refdir
if [ -z "$refdir" ];
then
 refdir=`pwd`;
fi

echo "[!] Checking directories..."
if [ -e "/usr/bin/atscan" ];
then
echo "[!] A previous instalation was found in /usr/bin/! Do you want to replace it? [y/n]: "
read mama
if [ "$mama" == "y" ] || [ "$mama" == "Y" ] || [ -z "$mama" ];  
then
 rm "/usr/bin/atscan"
else
 echo "[!] Installation aborted!";
 exit
fi
fi

 echo "[!] Installing ...";
 git clone https://github.com/AlisamTechnology/ATSCAN.git $refdir/atscan_install;
 cp -r $refdir/atscan_install/* $refdir/;
 echo "#!/bin/bash 
 perl $refdir/atscan.pl" '${1+"$@"}' > atscan;
 chmod +x atscan;
 sudo cp atscan /usr/bin/;
 rm atscan;
 if [ -d "/etc/bash_completion.d" ] ;
 then
   chmod +x $refdir/inc/conf/atscan;
   sudo cp $refdir/inc/conf/atscan /etc/bash_completion.d/;
 fi
 if [ ! -d "/usr/share/doc/atscan" ]; then
   mkdir "/usr/share/doc/atscan";
 fi
 chmod +x "/usr/share/doc/atscan/";
 chmod +x $refdir/README.md;
 sudo cp $refdir/README.md /usr/share/doc/atscan/;
 chmod +x $refdir/Lisence.txt;
 sudo cp $refdir/Lisence.txt /usr/share/doc/atscan/;
 echo "[!] Removing install files ...";
 rm $refdir/inc/conf/atscan;
 rm $refdir/install.sh;
 rm -r $refdir/atscan_install;
 rm $refdir/README.md;

if [ -e "$refdir/atscan" ] || [ -e "$refdir/atscan.pl" ];
then
echo "[!] Tool successfully installed";
echo "[!] Updating tool.. ";
sleep 2;
. ~/.bashrc;
atscan --update;
else
  echo "[!] Installation faid!! ";
  exit
fi
else
echo "Tool can be installed on your system! Use it as portable!";
fi
