#!/bin/bash
#
#############################################################################################
# Atscan Install script.
# Install tool in linux os.
# Alisam Technology 2015
#############################################################################################
# PATHs:
# Parent directory => default: /usr/share/atscan/
# /inc/conf/atscan => /etc/bash_completion.d/atscan
# Sym link in /usr/bin/atscan
# Readme /usr/share/doc/atscan/README.md
# Desktop entry /usr/share/applications/atscan.desktop
# Icons /usr/share/icons/hicolor/
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

### Check system compatibility
if [ -d "/usr/bin/" ];
then
echo "[!] Install.sh install atscan tool (sise 500 KB) in your system? [Y/n]: ";
read baba
if [ "$baba" == "y" ] || [ "$baba" == "Y" ] || [ -z "$baba" ]; 
  then
    echo " "
  else
    echo "[!] Installation aborted!";
    exit
fi

### Setting instalation path
current=`pwd`
echo "[!] Where do you want to install ATSCAN?";
echo "[!] Set path or press enter to use default [/usr/share/]: "
read refdir
if [ -z "$refdir" ];
then
  mkdir "/usr/share/atscan/";  
  chmod +x "/usr/share/atscan/";
  refdir="/usr/share/atscan/";
fi

if [ ! -d $refdir ];
then
  until [ -d $refdir ];
  do
   echo "[!] $refdir doesnot exist!!";
   echo "[!] Set path or press enter to use default [/usr/share/]: "
   read refdir
  done
fi
### Checkin previous instalation
echo "[i] Checking directories..."
if [ -e "/usr/bin/atscan" ];
then
echo "[!] A previous instalation was found in /usr/bin/! Do you want to replace it? [Y/n]: "
read mama
if [ "$mama" == "y" ] || [ "$mama" == "Y" ] || [ -z "$mama" ];  
then
 rm "/usr/bin/atscan"
else
 echo "[!] Instalation aborted!";
 exit
fi
fi

## Begin instalation
echo "[i] Installing...";
 
if [ ! -d "$current/inc" ] || [ ! -e "$current/atscan.pl" ];
then
 echo "[i] Downloading missing dependencies...";
 git clone https://github.com/AlisamTechnology/ATSCAN.git $refdir/atscan_install;
 cp -r $refdir/atscan_install/* $refdir/;
else
  if [ $current != $refdir ];
  then
    echo "[i] Moving files to $refdir ...";
    cp -r $current/* $refdir/;
  fi
fi 
 
 sleep 1 && echo "[i] Creating symbolic link...";
 echo "#!/bin/bash 
 perl $refdir/atscan.pl" '${1+"$@"}' > atscan;
 chmod +x atscan;
 sudo cp atscan /usr/bin/;
 rm atscan;
 sleep 1 && echo "[i] Creating Completion link...";
 if [ -d "/etc/bash_completion.d" ] ;
 then
   chmod +x $refdir/inc/conf/atscan;
   sudo cp $refdir/inc/conf/atscan /etc/bash_completion.d/;
 fi
 
 if [ ! -d "/usr/share/applications" ]; 
 then
   mkdir "/usr/share/applications";  
 fi
 chmod +x "/usr/share/applications";
 sudo cp $refdir/inc/conf/desktop/atscan.desktop /usr/share/applications/atscan.desktop;

 if [ ! -d "/usr/share/icons" ]; 
 then
   mkdir "/usr/share/icons";  
 fi
 chmod +x "/usr/share/icons";
 
 if [ ! -d "/usr/share/icons/hicolor" ]; 
 then
   mkdir "/usr/share/icons/hicolor";  
 fi
 chmod +x "/usr/share/icons/hicolor";
 
 
 if [ ! -d "/usr/share/icons/hicolor/16x16" ]; 
 then
   mkdir "/usr/share/icons/hicolor/16x16";  
 fi
 chmod +x "/usr/share/icons/hicolor/16x16";
 if [ ! -d "/usr/share/icons/hicolor/16x16/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/16x16/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/16x16/apps";
 sudo cp $refdir/inc/conf/desktop/16x16/atscan-menu.png /usr/share/icons/hicolor/16x16/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/22x22" ]; 
 then
   mkdir "/usr/share/icons/hicolor/22x22";  
 fi
 chmod +x "/usr/share/icons/hicolor/22x22";
 if [ ! -d "/usr/share/icons/hicolor/22x22/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/22x22/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/22x22/apps";
 sudo cp $refdir/inc/conf/desktop/22x22/atscan-menu.png /usr/share/icons/hicolor/22x22/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/24x24" ]; 
 then
   mkdir "/usr/share/icons/hicolor/24x24";  
 fi
 chmod +x "/usr/share/icons/hicolor/24x24";
 if [ ! -d "/usr/share/icons/hicolor/24x24/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/24x24/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/24x24/apps";
 sudo cp $refdir/inc/conf/desktop/24x24/atscan-menu.png /usr/share/icons/hicolor/24x24/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/48x48" ]; 
 then
   mkdir "/usr/share/icons/hicolor/48x48";  
 fi
 chmod +x "/usr/share/icons/hicolor/48x48";
 if [ ! -d "/usr/share/icons/hicolor/48x48/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/48x48/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/48x48/apps";
 sudo cp $refdir/inc/conf/desktop/48x48/atscan-menu.png /usr/share/icons/hicolor/48x48/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/256x256/" ]; 
 then
   mkdir "/usr/share/icons/hicolor/256x256/";  
 fi
 chmod +x "/usr/share/icons/hicolor/256x256/";
 if [ ! -d "/usr/share/icons/hicolor/256x256//apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/256x256//apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/256x256//apps";
 sudo cp $refdir/inc/conf/desktop/256x256//atscan-menu.png /usr/share/icons/hicolor/256x256//apps/;
 
 ########
 
 if [ ! -d "/usr/share/doc/atscan" ]; then
   mkdir "/usr/share/doc/atscan";
 fi
 ######## 
 
 sleep 1 && echo "[i] Copying README.md to /usr/share/doc/atscan...";
 chmod +x "/usr/share/doc/atscan/";
 chmod +x $refdir/README.md;
 sudo cp $refdir/README.md /usr/share/doc/atscan/;
 sleep 1 && echo "[i] Copying License.txt to /usr/share/doc/atscan...";
 chmod +x $refdir/License.txt;
 sudo cp $refdir/License.txt /usr/share/doc/atscan/;
 echo "[i] Removing install files...";
 rm $refdir/inc/conf/atscan;
 rm $refdir/install.sh;
 if [ -d "$refdir/atscan_install" ];
 then
   rm -r $refdir/atscan_install;
 fi
 rm $refdir/README.md;
 if [ -d "$refdir/inc/conf/desktop" ]; 
 then
   rm -r $refdir/inc/conf/desktop;
 fi
 if [ -e "$refdir/atscan" ] || [ -e "$refdir/atscan.pl" ];
 then
 sleep 1 && echo "[i] Tool successfully installed!";
 echo "[i] Please wait while updating tool.. ";
 sleep 2;
 atscan --update;
else
 echo "[!] Installation faid!! ";
 exit
fi
else
 echo "[!] Tool cannot be installed on your system! Use it as portable!";
fi

### last update 12/06/2017
