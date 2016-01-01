
<h1 align="center">ATSCAN</h1>
<p align="center"> <b>Search / Site / Server Scanner </b></p>
<center>
<img src="http://i.imgur.com/jUt3Gn7.png" />
<table border="0" cellpadding="0" cellspacing="2" width="100%px">
  <tr>
    <td align="center">Alisam Technology is not responsible for any misuse, damage caused by this script or attacking targets without prior mutual consent!</td>
  </tr>
</table>
</center>
<table border="0" cellpadding="0" cellspacing="2" width="100%px">
  <tr>
    <td width="30%">AUTHOR:</td><td>Alisam@Technology</td>
  </tr>
  <tr>
    <td width="30%">FACE</td><td>facebook.com/Forces.des.tempetes.marocaines</td>
  </tr>
  <tr>
    <td width="30%">YOUTUBE:</td><td>youtube.com/c/AlisamTechnology</td>
  </tr>
  <tr>
    <td width="30%">WITTER:</td><td>twitter.com/AlisamTechno</td>
  </tr>
  <tr>
    <td width="30%">PLUS:</td><td>plus.google.com/+AlisamTechnology</td>
  </tr>
</table>
<p> <b>Description: </b></p>
ATSCAN <br /> SEARCH engine <br />XSS scanner. <br /> Sqlmap. <br /> LFI scanner.<br /> Filter wordpress and Joomla sites in the server. <br />Find Admin page.<br /> Decode / Encode MD5 + Base64. <br />This this my first script im sure is full with mistakes!! 

<p> <b>Libreries to install: </b></p>
ap-get install libxml-simple-perl<br />
aptitude install libio-socket-ssl-perl<br />
aptitude install libcrypt-ssleay-perl<br />

NOTE: Works in linux platforms. Best Run on Ubuntu 14.04, Kali Linux 2.0, Arch Linux, Fedora Linux, Centos | if you use a windows you can download manualy<br />

<p> <b>Download & Executution: </b></p>
git clone https://github.com/AlisamTechnology/ATSCAN</br>
cd ATSCAN</br>
chmod +x ATSCAN</br>
./ATSCAN</br>
OR</br>
$chmod +x atscan.pl </br>
Execute: perl ./atscan.pl</br>
Execute: perl ./atscan.pl --help</br>

<p> <b>Screenshots: </b></p>
<img src="http://i.imgur.com/QVmt0uL.jpg" /><br />
<img src="http://i.imgur.com/kAHDYnd.jpg" /><br />
<img src="http://i.imgur.com/atgEOXR.jpg" /><br />
<img src="http://i.imgur.com/dgvdZ6O.jpg" /><br />
<img src="http://i.imgur.com/U1TA0iM.jpg" /><br />

<p> <b>HELP: </b></p>
<table cellpadding="0" cellspacing="2" border="0">
  <tr>
    <td width="20%">--tor</td>
    <td>tor proxy [DEFAULT:socks://localhost:9050] Change if needed!</td>
  </tr>
  
  <tr>
    <td width="20%">--dork</td>
    <td>Search engine</td>
  </tr>
  
  <tr>
    <td width="20%">--mp</td>
    <td>set number of page results to scan</td>
  </tr>
  
  <tr>
    <td width="20%">--xss</td>
    <td>Xss scan</td>
  </tr>
  
  
  <tr>
    <td width="20%">--lfi</td>
    <td>lfi scan</td>
  </tr>
  
  <tr>
    <td width="20%">-t</td>
    <td>Target</td>
  </tr>
  <tr>
    <td width="20%">-l</td>
    <td>List name</td>
  </tr>
  <tr>
    <td width="20%">--exp</td>
    <td>Set exploit</td>
  </tr>
  <tr>
    <td width="20%">--valid</td>
    <td>Text for validate results</td>
  </tr>
  <tr>
    <td width="20%">--sqlmap</td>
    <td>Sqlmaping xss results</td>
  </tr>
  <tr>
    <td width="20%">--sqlmaptor</td>
    <td>Sqlmaping xss results using tor proxy                                                                                    </td>
  </tr>
  <tr>
    <td width="20%">--lfi</td>
    <td>local file inclusion</td>
  </tr>
  <tr>
    <td width="20%">--joomrfi</td>
    <td>get joomla sites with rfi in the server</td>
  </tr>
  <tr>
    <td width="20%">--shell</td>
    <td>shell link [Ex: http://www.site.com/shell.txt]</td>
  </tr>
  <tr>
    <td width="20%">--wpadf</td>
    <td>get wordpress sites with arbitery file download in the server</td>
  </tr>
  <tr>
    <td width="20%">--admin</td>
    <td>get site admin page</td>
  </tr>
  <tr>
    <td width="20%">--shost</td>
    <td>get site subdomains</td>
  </tr>
  <tr>
    <td width="20%">--ports</td>
    <td>scan server ports</td>
  </tr>
  <tr>
    <td width="20%">--start</td>
    <td>start scan port</td>
  </tr>
  <tr>
    <td width="20%">--end</td>
    <td>end scan port</td>
  </tr>
  <tr>
    <td width="20%">--tcp</td>
    <td>tcp ports</td>
  </tr>
  <tr>
    <td width="20%">--udp</td>
    <td>udp ports</td>
  </tr>
  <tr>
    <td width="20%">--all</td>
    <td>complete mode</td>
  </tr>
  <tr>
    <td width="20%">--basic</td>
    <td>basic mode</td>
  </tr>
  <tr>
    <td width="20%">--sites</td>
    <td>sites in the server</td>
  </tr>
  <tr>
    <td width="20%">--wp</td>
    <td>wordpress sites in the server</td>
  </tr>
  <tr>
    <td width="20%">--joom</td>
    <td>joomla sites in the server</td>
  </tr>
  <tr>
    <td width="20%">--upload</td>
    <td>get sites with upload files in the server</td>
  </tr>
  <tr>
    <td width="20%">--zip</td>
    <td>get sites with zip files in the server</td>
  </tr>
  <tr>
    <td width="20%">--st</td>
    <td>string</td>
  </tr>
  <tr>
    <td width="20%">--md5</td>
    <td>convert to md5</td>
  </tr>
  <tr>
    <td width="20%">--encode64</td>
    <td>encode base64 string</td>
  </tr>
  <tr>
    <td width="20%">--decode64</td>
    <td>decode base64 string</td>
  </tr>
  <tr>
    <td width="20%">--isup</td>
    <td>check http status 200</td>
  </tr>
  <tr>
    <td width="20%">--httpd</td>
    <td>print site httpd version</td>
  </tr>
</table>
<p> <b>EXAMPLES: </b></p>
<table cellpadding="0" cellspacing="2" border="0">
  <tr>
    <td>
    <b>Simple search:                                                                                                       </b><BR/>
    --dork DORK --mp [number of page results to scan]<BR/>
    --dork [DORK1,DORK2,DORK3..] --mp [number of page results to scan]<BR/> 
    --dork [DORK.txt] --mp [number of page results to scan from list]<BR/>
    <B>Subscan from Serach Engine</B><BR/>
    Xss: --dork DORK --mp 1 --xss<BR/>
    Xss: --dork DORKS.TXT --mp 1 --xss<BR/>
    Lfi: --dork DORK --mp 1 --lfi<BR/>
    Search + Command: -s DORK --mp VALUE --command 'curl -v' --TARGET<BR/>
    <b>Validation</b><BR/>
    Xss: --dork DORK --mp 1 --xss --valid TEXT<BR/>
    Lfi: --dork DORK --mp 1 --lfi --valid TEXT<BR/>
    Xss: --dork DORK --mp 1 --xss --isup<BR/>
    Lfi: --dork DORK --mp 1 --xss --isup<BR/>
    Xss: --dork DORKS.TXT --mp 1 --xss --valid TEXT<BR/>
    Lfi: --dork DORKS.TXT --mp 1 --lfi --valid TEXT<BR/>
    Xss: --dork DORKS.TXT --mp 1 --xss --isup<BR/>
    Lfi: --dork DORKS.TXT --mp 1 --xss --isup<BR/>
    <b>Use List / Target</b><BR/>
    Xss: -t TARGET --xss<BR/>
    Lfi: -l TARGET --lfi<BR/>
    Xss + Validation: -t TARGET --xss --valid TEXT<BR/>
    Lfi + Validation: -t TARGET --lfi --valid TEXT <BR/>
    Xss + Validation: -l list.txt --xss --isup<BR/>
    Lfi + Validation: -l list.txt --lfi --isup <BR/>
    Find admin page: -t TARGET --admin <BR/>
    Find subdomains: -t TARGET --shost <BR/>
    <b>Server:  </b><BR/>
    Get Server sites: -t IP --mp [VALUE] --sites <BR/>
    Get Server sites: -t IP.txt --mp [VALUE] --sites <BR/>
    Get Server wordpress sites: -t IP --mp [VALUE] --wp  <BR/>
    Get Server joomla sites: -t IP --mp [VALUE] --joom  <BR/>
    Get Server upload sites: -t IP --mp [VALUE] --upload  <BR/>
    Get Server zip sites files: -t IP --mp [VALUE] --zip  <BR/>
    WP Arbitry File Download: -t IP --mp [VALUE] --wpadf  <BR/>
    Joomla RFI: -t IP --mp <1> --joomfri --shell SHELL LINK <BR/>
    Scan basic tcp (quick): -t IP --ports --basic --tcp <BR/>
    Scan basic udp basic (quick): -t IP --ports --basic --udp <BR/>
    Scan basic udp+tcp: -t IP --ports --basic --udp --tcp <BR/>
    Scan complete tcp: -t IP --ports --all --tcp <BR/>
    Scan complete udp: -t IP --ports --all --udp <BR/>
    Scan complete tcp+udp: -t IP --ports --all --udp --tcp <BR/>
    Scan rang tcp: -t IP --ports --start --end --tcp <BR/>
    Scan rang udp: -t IP --ports --start --end --udp <BR/>
    Scan rang udp + tcp: -t IP --ports --start VALUE --end VALUE --udp --tcp <BR/>
    <b>Encode / Decode:  </b><BR/>
    Generate MD5: -st STRING --md5  <BR/>
    Encode base64: -st STRING --encode64  <BR/>
    Decode base64: -st STRING --decode64  <BR/>
    </td>
  </tr>
</table>


