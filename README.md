<h1 align="center">ATSCAN-V3.3</h1>
<p align="center"> <b>Search / Site / Server Scanner </b></p>
<center>
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

<img src="http://i.imgur.com/3uTDVJq.jpg" />
<p> <b>Description: </b></p>
ATSCAN Version 3 <br /> SEARCH engine <br />XSS scanner. <br /> Sqlmap. <br /> LFI scanner.<br /> Filter wordpress and Joomla sites in the server. <br />Find Admin page.<br /> Decode / Encode MD5 + Base64. <br />This this my first script im sure is full with mistakes!! 

<p> <b>Libreries to install: </b></p>
ap-get install libxml-simple-perl <br />
NOTE: Works in linux platforms.

<p> <b>Permissions & Executution: </b></p>
$chmod +x atscan.pl </br>
Execute: perl ./atscan.pl

<p> <b>Screenshots: </b></p>
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
    <td width="20%">-s</td>
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
    <td>Sqlmaping xss results using tor proxy</td>
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
    <b>Simple search:</b><BR/>
    -s <dork> --mp <number of page results to scan><BR/>
    -s <dork1,dork2,dork3..> --mp <number of page results to scan><BR/> 
    -ls <dork.txt> --mp <number of page results to scan> to scan from list<BR/>
    <B>Subscan from Serach Engine</B><BR/>
    Xss: -s <dork> --mp <1> --xss<BR/>
    Lfi: -s <dork> --mp <1> --lfi<BR/>
    Search + Command: -s <dork> --mp <value> --command 'curl -v' --TARGET<BR/>
    <b>Validation</b><BR/>
    Xss: -s <dork> --mp <1> --xss --valid <txt><BR/>
    Lfi: -s <dork> --mp <1> --lfi --valid <txt><BR/>
    Xss: -s <dork> --mp <1> --xss --isup<BR/>
    Lfi: -s <dork> --mp <1> --xss --isup<BR/>
    <b>Use List / Target</b><BR/>
    Xss: -t <target> --xss<BR/>
    Lfi: -l <target> --lfi<BR/>
    Xss + Validation: -t <target> --xss --valid <txt><BR/>
    Lfi + Validation: -t <target> --lfi --valid <txt> <BR/>
    Xss + Validation: -l <list.txt> --xss --isup<BR/>
    Lfi + Validation: -l <list.txt> --lfi --isup <BR/>
    Find admin page: -t <target> --admin <BR/>
    Find subdomains: -t <target> --shost <BR/>
    <b>Server:  </b><BR/>
    Get Server sites: -t <ip> --mp <value> --sites <BR/>
    Get Server wordpress sites: -t <ip> --mp <value> --wp  <BR/>
    Get Server joomla sites: -t <ip> --mp <value> --joom  <BR/>
    Get Server upload sites: -t <ip> --mp <value> --upload  <BR/>
    Get Server zip sites files: -t <ip> --mp <value> --zip  <BR/>
    WP Arbitry File Download: -t <ip> --mp <value> --wpadf  <BR/>
    Joomla RFI: -t <ip> --mp <1> --joomfri --shell <shell link> <BR/>
    Scan basic tcp (quick): -t <ip> --ports --basic --tcp <BR/>
    Scan basic udp basic (quick): -t <ip> --ports --basic --udp <BR/>
    Scan basic udp+tcp: -t <ip> --ports --basic --udp --tcp <BR/>
    Scan complete tcp: -t <ip> --ports --all --tcp <BR/>
    Scan complete udp: -t <ip> --ports --all --udp <BR/>
    Scan complete tcp+udp: -t <ip> --ports --all --udp --tcp <BR/>
    Scan rang tcp: -t <ip> --ports --start --end --tcp <BR/>
    Scan rang udp: -t <ip> --ports --start --end --udp <BR/>
    Scan rang udp + tcp: -t <ip> --ports --start <value> --end <value> --udp --tcp <BR/>
    <b>Encode / Decode:  </b><BR/>
    Generate MD5: -st <string> --md5  <BR/>
    Encode base64: -st <string> --encode64  <BR/>
    Decode base64: -st <string> --decode64  <BR/>
    </td>
  </tr>
</table>


