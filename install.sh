#!/bin/bash
echo "[ ]====================================================================[ ]";
echo "[ ]                     ALISAM  TECHNOLOGY                             [ ]";
echo "[ ]                  Atscan Tool Install Script                        [ ]";
echo "[ ]====================================================================[ ]";
echo "";
echo "[!] Install.sh will install atscan tool in the system [Y/n]" ; 
read baba
if [ $baba == "y" ] ; 
then
echo "[!] Where Do you want to install the tool? [Ex:/usr/share/doc]:";
read refdir
echo "[ ] Checking directories..."
if [ -d "$refdir/ATSCAN" ] ;
then
echo "[!] A directory ATSCAN was found! Do you want to replace it? [Y/n]:" ; 
read mama
if [ $mama == "y" ] ; 
then
 rm -R "$refdir/ATSCAN"

 echo "[!] Installing ...";
 echo "";
 git clone https://github.com/AlisamTechnology/ATSCAN.git $refdir/ATSCAN;
 echo "#!/bin/bash 
 perl $refdir/ATSCAN/atscan.pl" '${1+"$@"}' > atscan;
 chmod +x atscan;
 sudo cp atscan /usr/bin/;
 rm atscan;

else
    exit
fi
fi
fi

if [ -d "$refdir/ATSCAN" ] ;
then
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
