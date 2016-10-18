#!/bin/bash
############################
# Atscan Install script.
# Install tool in linux os.
# Alisam Technology 2015
############################
# PLACEMENT:
# Parent directory => User choice.
# /inc/conf/atscan => /etc/bash_completion.d/atscan
# Bash link in /usr/bin/atscan
############################
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
if [ $baba == "y" ] || [ $baba == "Y" ]; 
  then
    echo " "
  else
    echo "[!] Installation canceled!";
    exit
fi
current=`pwd`
if [ ! -d "$current/inc" ]; 
then 
  echo "[!] Please make sure you have inc/ directory in $current/!";
  exit 
fi
echo "[!] ATSCAN will be installed in $current Set other path OR press Enter to continue: "
read refdir
echo "[!] Checking directories..."
if [ -d "$refdir/atscan" ] ;
then
echo "[!] A directory named ATSCAN was found in $refdir/atscan/! Do you want to replace it? [y/n]: "
read mama
if [ $mama == "y" ] || [ $mama == "Y" ]; 
then
 rm -R "$refdir/atscan"
else
 echo "[!] Installation canceled!";
 exit
fi
fi

 echo "[!] Installing ...";
 echo "";
 git clone https://github.com/AlisamTechnology/ATSCAN.git $refdir/ATSCAN;
 echo "#!/bin/bash 
 perl $refdir/atscan/atscan.pl" '${1+"$@"}' > atscan;
 chmod +x atscan;
 sudo cp atscan /usr/bin/;
 rm atscan;
 if [ -d "/etc/bash_completion.d" ] ;
 then
   chmod +x $refdir/atscan/inc/conf/atscan;
   sudo cp $refdir/atscan/inc/conf/atscan /etc/bash_completion.d/;
 fi
 echo "[!] Removing install files ...";
 rm $refdir/atscan/inc/conf/atscan;
 rm $refdir/atscan/install.sh;

if [ -d "$refdir/atscan" ] ;
then
. ~/.bashrc;
echo "";
echo "Tool istalled with success!";
echo "";
  echo "[ ]====================================================================[ ]";
  echo "[ ]     All is done!! You can execute Atscan by typing atscan !        [ ]"; 
  echo "[ ]====================================================================[ ]";
  echo "";
else
  echo "[!] Installation faid!! ";
  exit
fi
else
echo "Tool can be installed only in linux os! Use it as portable!";
fi

