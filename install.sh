#!/bin/bash
echo "[ ]====================================================================[ ]";
echo "[ ]                     ALISAM  TECHNOLOGY                             [ ]";
echo "[ ]                  Atscan Tool Install Script                        [ ]";
echo "[ ]====================================================================[ ]";
echo "";
echo "[!] If you are not using kali linux please use tool without installing!"; 
echo "[!] Install.sh will install atscan tool in Kali linux Os! is your case? [Y/n]:" ; 
read baba
if [ $baba == "y" ] ; 
  then
    echo " "
  else
    exit
fi

echo "[!] Where Do you want to install the tool? [Ex:/usr/share/doc]:";
read refdir
echo "[!] Checking directories..."
if [ -d "$refdir/ATSCAN" ] ;
then
echo "[!] A directory ATSCAN was found! Do you want to replace it? [Y/n]:" ; 
read mama
if [ $mama == "y" ] ; 
then
 rm -R "$refdir/ATSCAN"
else
 exit
fi
fi

 echo "[!] Installing ...";
 echo "";
 git clone https://github.com/AlisamTechnology/ATSCAN.git $refdir/ATSCAN;
 echo "#!/bin/bash 
 perl $refdir/ATSCAN/atscan.pl" '${1+"$@"}' > atscan;
 chmod +x atscan;
 sudo cp atscan /usr/bin/;
 rm atscan;


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
