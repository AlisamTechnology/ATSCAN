#!/bin/bash
#
#############################################################################################
# Atscan Install script.
# Install tool in linux os.
# Alisam Technology 2015
#############################################################################################
# PATHs:
# Parent directory => User choice.
# /inc/conf/atscan => /etc/bash_completion.d/atscan
# Sym link in /usr/bin/atscan
# Readme /usr/share/doc/atscan/README.md
# License /usr/share/doc/atscan/License.txt
#############################################################################################
##
echo "[ ]=======================================================================[ ]";
echo "[ ]                      ALISAM  TECHNOLOGY                               [ ]";
echo "[ ]                   Atscan Tool Install Script                          [ ]";
echo "[ ]=======================================================================[ ]";
echo "[ ] MIT License                                                           [ ]";
echo "[ ]                                                                       [ ]";
echo "[ ] Copyright (c) 2015 Alisam Technology                                  [ ]";
echo "[ ]                                                                       [ ]";
echo "[ ] Permission is hereby granted, free of charge, to any person obtaining [ ]";
echo "[ ] a copy of this software and associated documentation files (atscan),  [ ]";
echo "[ ] to dealin the Software without restriction, including without         [ ]";
echo "[ ] limitation the rights to use, copy, modify, merge, publish,           [ ]";
echo "[ ] distribute, sublicense, and/or sellcopies of the Software, end to     [ ]";
echo "[ ] permit persons to whom the Software is furnished to do so, subject    [ ]";
echo "[ ] to the following conditions:                                          [ ]";
echo "[ ]                                                                       [ ]";
echo "[ ] The above copyright notice and this permission notice shall be        [ ]";
echo "[ ] included in all copies or substantial portions of the Software.       [ ]";
echo "[ ]                                                                       [ ]";
echo "[ ] THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS [ ]";
echo "[ ] OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF            [ ]";
echo "[ ] MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT [ ]";
echo "[ ] IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY  [ ]";
echo "[ ] CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,  [ ]";
echo "[ ] TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE     [ ]";
echo "[ ] SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                [ ]";
echo "[ ]=======================================================================[ ]";

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

 echo "[!] Connecting...";
 git clone https://github.com/AlisamTechnology/ATSCAN.git $refdir/atscan_install;
 echo "[!] Installing...";
 cp -r $refdir/atscan_install/* $refdir/;
 sleep 1 && echo "[!] Creating symbolic link...";
 echo "#!/bin/bash 
 perl $refdir/atscan.pl" '${1+"$@"}' > atscan;
 chmod +x atscan;
 sudo cp atscan /usr/bin/;
 rm atscan;
 sleep 1 && echo "[!] Creating Completion link...";
 if [ -d "/etc/bash_completion.d" ] ;
 then
   chmod +x $refdir/inc/conf/atscan;
   sudo cp $refdir/inc/conf/atscan /etc/bash_completion.d/;
 fi
 if [ ! -d "/usr/share/doc/atscan" ]; then
   mkdir "/usr/share/doc/atscan";
 fi
 sleep 1 && echo "[!] Copying README.md to /usr/share/doc/atscan...";
 chmod +x "/usr/share/doc/atscan/";
 chmod +x $refdir/README.md;
 sudo cp $refdir/README.md /usr/share/doc/atscan/;
 sleep 1 && echo "[!] Copying License.txt to /usr/share/doc/atscan...";
 chmod +x $refdir/License.txt;
 sudo cp $refdir/License.txt /usr/share/doc/atscan/;
 echo "[!] Removing install files...";
 rm $refdir/inc/conf/atscan;
 rm $refdir/install.sh;
 rm -r $refdir/atscan_install;
 rm $refdir/README.md;

if [ -e "$refdir/atscan" ] || [ -e "$refdir/atscan.pl" ];
then
sleep 1 && echo "[!] Tool successfully installed";
echo "[!] Updating tool.. ";
sleep 2;
atscan --update;
else
  echo "[!] Installation faid!! ";
  exit
fi
else
echo "Tool can be installed on your system! Use it as portable!";
fi
#############################################################################################
## END ######################################################################################
