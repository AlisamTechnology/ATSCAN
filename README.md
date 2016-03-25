<html>
<body>
<h1 align="center">ATSCAN</h1>
<p align="center"> <b>Search / Site / Server Scanner </b></p>
<center><img src="http://i.imgur.com/jUt3Gn7.png" /></center>
<table border="0" cellpadding="2" cellspacing="2" width="100%">
  <tr>
    <td align="center"><b>Alisam Technology is not responsible for any misuse, damage caused by this script or attacking targets without prior mutual consent!<b></td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="2" width="100%">
  <tr>
    <td width="100px" class="main2"><b>AUTHOR:</b></td><td width="780px">Alisam@Technology</td>
  </tr>
  <tr>
    <td width="100px" class="main2"><b>FACE:</b></td><td>facebook.com/Forces.des.tempetes.marocaines </td>
  </tr>
  <tr>
    <td width="100px" class="main2"><b>YOUTUBE:</b></td><td>youtube.com/c/AlisamTechnology</td>
  </tr>
  <tr>
    <td width="100px" class="main2"><b>WITTER:</b></td><td>twitter.com/AlisamTechno</td>
  </tr>
  <tr>
    <td width="100px" class="main2"><b>PLUS:</b></td><td>plus.google.com/+AlisamTechnology</td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3"><b>Description:</b></td>
  </tr>
  <tr>
    <td class="main" width="890px"><b>ATSCAN version 7.0</b><br /> Search engine <br />XSS scanner. <br /> Sqlmap.<br /> 
        LFI scanner.<br /> Filter wordpress and Joomla sites in the server. <br />Find Admin page.<br /> Decode / Encode MD5 + Base64.<br/> Ports scan. <br/> Scan E-mails in sites. <br/> Use proxy. <br/> Random user agent. <br/> Fandom search engine. <br/> Scan errors. <br/> Detect Cms.<br/>Multiple instant scan. <br/> Brute force.<br/>Disponible on BlackArch Linux Platform.
    </td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3" width="890px"> <b>Libreries to install:</b></td>
  </tr>
  <tr>
    <td class="main">
      ap-get install libxml-simple-perl <br/>
      aptitude install libio-socket-ssl-perl <br/>
      aptitude install libcrypt-ssleay-perl <br/>
      NOTE: Works in linux platforms. Best Run on Ubuntu 14.04, Kali Linux 2.0, Arch Linux, Fedora Linux, Centos | if you use a windows you can download manualy.
    </td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3" width="890px"><b>Download & Executution:</b></td>
  </tr>
  <tr>
    <td class="main">
      git clone https://github.com/AlisamTechnology/ATSCAN <br/>
      cd ATSCAN <br/>
      chmod +x atscan.pl <br/>
      OR <br/>
      $chmod +x atscan.pl  <br/>
      Execute: perl ./atscan.pl <br/>
      Help: perl ./atscan.pl --help<br/>
      Update: perl ./atscan.pl --update<br/>
    </td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3" width="890px"><b>Tool Install:</b></td>
  </tr>
  <tr>
    <td class="main">
      git clone https://github.com/AlisamTechnology/ATSCAN <br/>
      cd ATSCAN <br/>
      chmod +x install.sh <br/>
      Execute: atscan <br/>
      ./install.sh<br/>
    </td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3"><b>Screenshots:</b></td>
  </tr>
  <tr>
    <td align="center" width="890px">
    <img src="http://i.imgur.com/UmU9sBZ.jpg" /><br/><br/>
    <img src="http://i.imgur.com/E4aqmZf.jpg" /><br/><br/>
    <img src="http://i.imgur.com/muppdYP.jpg" /><br/><br/>
    <img src="http://i.imgur.com/YlRj5xK.jpg" /><br/><br/>
    </td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3" width="890px"><b>Help:</b></td>
  </tr>
  <tr>
    <td class="main"><table border="0" cellpadding="2" cellspacing="5" width="100%">
      <tr>
        <td width="200px" class="main">--proxy</td>
        <td width="680px">Set tor proxy [Ex: socks://localhost:9050]</td>
      </tr>
      <tr>
         <td width="200px" class="main">--dork</td>
        <td class="main">dork to search [Ex: house,cars,hotel]</td>
      </tr>
      <tr>
        <td width="200px" class="main">--level</td>
        <td class="main">Scan level (+- Number of page results to scan)</td>
      </tr>
      <tr>
        <td width="200px" class="main">--xss</td>
        <td class="main">Xss scan</td>
      </tr>
      <tr>
        <td width="200px" class="main">--joomrfi</td>
        <td class="main">joomla local file inclusion scan</td>
      </tr>
      <tr>
        <td width="200px" class="main">-t</td>
        <td class="main">Target</td>
      </tr>
      
      <tr>
        <td width="200px" class="main">--TARGET</td>
        <td class="main">Captured Target</td>
      </tr>
      <tr>
        <td width="200px" class="main">--FULL_TARGET</td>
        <td class="main">Captured Full Target</td>
      </tr>
      <tr>
        <td width="200px" class="main">--exp</td>
        <td class="main">Set exploit</td>
      </tr>
      <tr>
        <td width="200px" class="main">--valid</td>
        <td class="main">Text to validate results</td>
      </tr>
      <tr>
        <td width="200px" class="main">--ifinurl</td>
        <td class="main">Text to validate target url</td>
      </tr>
      <tr>
        <td width="200px" class="main">--sqlmap</td>
        <td class="main">Sqlmaping xss results</td>
      </tr>
      <tr>
        <td width="200px" class="main">--lfi</td>
        <td class="main">local file inclusion</td>
      </tr>
      <tr>
        <td width="200px" class="main">--joomrfi</td>
        <td class="main">get joomla sites with rfi</td>
      </tr>
      <tr>
        <td width="200px" class="main">--shell</td>
        <td class="main">shell link [Ex: http://www.site.com/shell.txt]</td>
      </tr>
      <tr>
        <td width="200px" class="main">--wpadf</td>
        <td class="main">get wordpress sites with arbitery file download</td>
      </tr>
      <tr>
        <td width="200px" class="main">--admin</td>
        <td class="main">get site admin page</td>
      </tr>
      <tr>
        <td width="200px" class="main">--shost</td>
        <td class="main">get site subdomains</td>
      </tr>
      <tr>
        <td width="200px" class="main">--ports</td>
        <td class="main">scan server ports</td>
      </tr>
      <tr>
        <td width="200px" class="main">--start</td>
        <td class="main">start scan port</td>
      </tr>
      <tr>
        <td width="200px" class="main">--end</td>
        <td class="main">end scan port</td>
      </tr>
      <tr>
        <td width="200px" class="main">--all</td>
        <td class="main">complete mode</td>
      </tr>
      <tr>
        <td width="200px" class="main">--basic</td>
        <td class="main">basic mode</td>
      </tr>
      <tr>
        <td width="200px" class="main">--select</td>
        <td class="main">Select mode you can set rang of ports</td>
      </tr>
      <tr>
        <td width="200px" class="main">--sites</td>
        <td class="main">sites in the server</td>
      </tr>
      <tr>
        <td width="200px" class="main">--wp</td>
        <td class="main">get wordpress sites</td>
      </tr>
      <tr>
        <td width="200px" class="main">--joom</td>
        <td class="main">Getjoomla sites</td>
      </tr>
      <tr>
        <td width="200px" class="main">--upload</td>
        <td class="main">get sites with upload files</td>
      </tr>
      <tr>
        <td width="200px" class="main">--zip</td>
        <td class="main">get sites with zip files</td>
      </tr>
      <tr>
        <td width="200px" class="main">--save</td>
        <td class="main">file prefix to save results (if not set tool sets one)</td>
      </tr>
      <tr>
        <td width="200px" class="main">--md5</td>
        <td class="main">convert to md5</td>
      </tr>
      <tr>
        <td width="200px" class="main">--encode64</td>
        <td class="main">encode base64 string</td>
      </tr>
      <tr>
        <td width="200px" class="main">--decode64</td>
        <td class="main">decode base64 string</td>
      </tr>
      <tr>
        <td width="200px" class="main">--isup</td>
        <td class="main">check http status 200</td>
      </tr>
      <tr>
        <td width="200px" class="main">--email</td>
        <td class="main">Extract e-mails</td>
      </tr> 
      <tr>
        <td width="200px" class="main">--command</td>
        <td class="main">External Command</td>
      </tr>
      <tr>
        <td width="200px" class="main">--replace</td>
        <td class="main">string to replace</td>
      </tr>
      <tr>
        <td width="200px" class="main">--with</td>
        <td class="main">string to replace with</td>
      </tr>
      <tr>
        <td width="200px" class="main">--save</td>
        <td class="main">Set prefix to saved files</td>
      </tr>
      <tr>
        <td width="200px" class="main">--rang</td>
        <td class="main">Set range of ip</td>
      </tr>
      <tr>
      <tr>
        <td width="200px" class="main">--wpbf</td>
        <td class="main">Wordpress admin login brute force</td>
      </tr>
      <tr>
        <td width="200px" class="main">--joombf</td>
        <td class="main">Joomla admin login brute force</td>
      </tr>
      <tr>
        <td width="200px" class="main">--user</td>
        <td class="main">Set username Wordpress/Joomla login brute force</td>
      </tr>
      <tr>
        <td width="200px" class="main">--pass</td>
        <td class="main">Set password list Wordpress/Joomla login brute force</td>
      </tr>
      
        <td width="200px" class="main">--nobanner</td>
        <td class="main">Hide tool banner</td>
      </tr>    
      <tr>
        <td width="200px" class="main">--beep</td>
        <td class="main">Produce beep sound if positive scan found</td>
      </tr>    
    </table></td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td width="890px"><b>Examples:</b></td>
  </tr>
  <tr>
    <td class="main">
<b>Simple search: </b><br/>
  Search: --dork [dork] --level [level] <br/>
  Search with many dorks: --dork [dork1,dork2,dork3] --level [level] <br/>
  Search + set save file: --dork [dorks.txt] --level [level] --save myfile.txt <br/>
  Search + Replace + Exploit: --dork [dorks.txt] --level [level] --replace [string] --with [string] --valid [string] <br/>
  Search + Extract e-mails: --dork [dorks.txt] --level [level] --email <br/>
  Search + Brute Force: --dork [dorks.txt] --level [10] --wpbf/--joombf --user [username] --pass [list.txt] <br/>
  <br/>

<b>Subscan from Serach Engine: </b><br/>
  Search + Exploitation: --dork [dork] --level [10] --xss/--lfi/--wp ... <br/>
  Search + xss + sqlmap: --dork [dork] --level [10] --xss --sqlmap <br/>
  Search + Server Exploitation: -t [ip] --level [10] --xss/--lfi/--wp ... <br/>
  Search + Server Exploitation: --rang 133.21.10.155-19.102.25.14 --level [10] --xss/--lfi/--wp ... <br/>
  Search + Server Exploitation: -t [ip] --level [10] --wpbf/--joombf --user [username] --pass [list.txt] <br/>
  Search + Replace + Exploit: --dork [dork] --level [10] --replace [string] --with [string] --exp [exploit] --xss/--lfi/--wp ... <br/><br/>

<b>Validation: </b><br/>
  Search + Exploit + Validation: --dork [dork] --level [10] --exp --isup/--valid [string] <br/>
  Search + Url Validation: --dork [dork] --level [10] --ifinurl [string] <br/>
  Search + Server Exploit + Validation: -t [ip] --level [10] --exp --isup/--valid [string] <br/>
  Search + Replace + Exploit: --dork [dork] --level [10] --replace [string] --with [string] --isup/--valid [string] <br/><br/>

<b>Use List / Target: </b><br/>
  -t [target/targets.txt] --exp --isup/--valid [string] <br/>
  -t [target/targets.txt] --xss/--lfi ..  <br/><br/>

<b>Server: </b><br/>
  Get Server sites: -t [ip] --level [value] --sites <br/>
  Get Server wordpress sites: -t [ip] --level [value] --wp <br/>
  Get Server joomla sites: -t [ip] --level [value] --joom <br/>
  Get Server upload sites: -t [ip] --level [value] --upload <br/>
  Get Server zip sites files: -t [ip] --level [value] --zip <br/>
  WP Arbitry File Download: -t [ip] --level [value] --wpadf <br/>
  Joomla RFI: -t [ip] --level [1] --joomfri --shell [shell link] <br/>
  Scan basic tcp (quick): -t [ip] --ports --basic tcp <br/>
  Scan basic udp basic (quick): -t [ip] --ports --basic udp <br/>
  Scan basic udp+tcp: -t [ip] --ports --basic udp+tcp <br/>
  Scan complete tcp: -t [ip] --ports --all tcp <br/>
  Scan complete udp: -t [ip] --ports --all udp <br/>
  Scan complete udp+tcp: -t [ip] --ports --all udp+tcp <br/>
  Scan rang tcp: -t [ip] --ports --select  tcp --start [value] --end [value] <br/>
  Scan rang udp: -t [ip] --ports --select  udp--start [value] --end [value] <br/>
  Scan rang udp + tcp: -t [ip] --ports --select  udp+tcp --start [value] --end [value] <br/><br/>

<b>Encode / Decode: </b><br/>
  Generate MD5: --md5 [string] <br/>
  Encode base64: --encode64 [string]  <br/>
  Decode base64: --decode64 [string]  <br/><br/>

<b>External Command: </b><br/>
 --dork [dork/dorks.txt] --level [level] --command "curl -v --TARGET" <br/>
 --dork [dork/dorks.txt] --level [level] --command "curl -v --FULL_TARGET" <br/>
 -t [target/targets.txt] --level [level] --command "curl -v --TARGET" <br/>
 -t [target/targets.txt] --command "curl -v --FULL_TARGET" <br/><br/>
 
<b>Multiple Scan: </b><br/>
  --dork [dork] --level [10] --xss/--lfi/--wp ... <br/>
  --dork [dork] --level [10] --replace [string] --with [string] --exp [exploit] --xss --lfi --wp ... <br/>
  -t [ip] --level [10] --xss --lfi --wp ... <br/>
  -t [targets] --xss --lfi --wp ...<br/><br/>
  .....<br/><br/>
<b>Check for updates: </b><br/>
  --update</b><br/>
    </td>
  </tr>
</table>  
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td width="890px"><b>Support us: </b><br/><br/><a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QFG4VKCYFMSB8" target="_blank"><img src="http://i.imgur.com/ewuSvSh.jpg" border="0"></a> 
</td>
  </tr>
  </table>
</body>
</html>

