<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<h1 align="center">ATSCAN</h1>
<p align="center"> <b>Search / Site / Server Scanner </b></p>
<center><img src="http://i.imgur.com/jUt3Gn7.png" /></center>
<table border="0" cellpadding="2" cellspacing="2" width="100%">
  <tr>
    <td align="center" class="main3"><b>Alisam Technology is not responsible for any misuse, damage caused by this script or attacking targets without prior mutual consent!<b></td>
  </tr>
</table>
<br />
<table border="0" cellpadding="0" cellspacing="2" width="100%">
  <tr>
    <td width="100px" class="main2">AUTHOR:</td><td>Alisam@Technology</td>
  </tr>
  <tr>
    <td width="100px" class="main2">FACE:</td><td>facebook.com/Forces.des.tempetes.marocaines</td>
  </tr>
  <tr>
    <td width="100px" class="main2">YOUTUBE:</td><td>youtube.com/c/AlisamTechnology</td>
  </tr>
  <tr>
    <td width="100px" class="main2">WITTER:</td><td>twitter.com/AlisamTechno</td>
  </tr>
  <tr>
    <td width="100px" class="main2">PLUS:</td><td>plus.google.com/+AlisamTechnology</td>
  </tr>
</table>
<br />

<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3">Description:</td>
  </tr>
  <tr>
    <td class="main">ATSCAN <br /> SEARCH engine <br />XSS scanner. <br /> Sqlmap.<br /> 
        LFI scanner.<br /> Filter wordpress and Joomla sites in the server. <br />Find Admin page.<br /> Decode / Encode MD5 + Base64. <br />This this my first script im sure is full with mistakes!! 
    </td>
  </tr>
</table>
<br />
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3"> Libreries to install:</td>
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
<br />
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3">Download & Executution:</td>
  </tr>
  <tr>
    <td class="main">
      git clone https://github.com/AlisamTechnology/ATSCAN <br/>
      cd ATSCAN <br/>
      chmod +x ATSCAN <br/>
      ./ATSCAN <br/>
      OR <br/>
      $chmod +x atscan.pl  <br/>
      Execute: perl ./atscan.pl <br/>
      Execute: perl ./atscan.pl --help
    </td>
  </tr>
</table>
<br />
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3">Screenshots:</td>
  </tr>
  <tr>
    <td align="center">
    <img src="http://i.imgur.com/J0fM1PB.jpg" /><br/><br/>
    <img src="http://i.imgur.com/JGBKRGw.jpg" /><br/><br/>
    <img src="http://i.imgur.com/HxdjrM8.jpg" /><br/><br/>
    <img src="http://i.imgur.com/yZOSiei.jpg" /><br/><br/>
    </td>
  </tr>
</table>
<br />
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3">Help:</td>
  </tr>
  <tr>
    <td class="main"><table border="0" cellpadding="2" cellspacing="5" width="100%">
      <tr>
        <td width="100px" class="main">--tor</td>
        <td class="main">tor proxy [DEFAULT:socks://localhost:9050] Change if needed!</td>
      </tr>
      <tr>
         <td width="100px" class="main">--dork</td>
        <td class="main">Search engine</td>
      </tr>
      <tr>
        <td width="100px" class="main">--mp</td>
        <td class="main">set number of page results to scan</td>
      </tr>
      <tr>
        <td width="100px" class="main">--xss</td>
        <td class="main">Xss scan</td>
      </tr>
      <tr>
        <td width="100px" class="main">--lfi</td>
        <td class="main">lfi scan</td>
      </tr>
      <tr>
        <td width="100px" class="main">-t</td>
        <td class="main">Target</td>
      </tr>
      <tr>
        <td width="100px" class="main">-l</td>
        <td class="main">List name</td>
      </tr>
      <tr>
        <td width="100px" class="main">--exp</td>
        <td class="main">Set exploit</td>
      </tr>
      <tr>
        <td width="100px" class="main">--valid</td>
        <td class="main">Text for validate results</td>
      </tr>
      <tr>
        <td width="100px" class="main">--sqlmap</td>
        <td class="main">Sqlmaping xss results</td>
      </tr>
      <tr>
        <td width="100px" class="main">--sqlmaptor</td>
        <td class="main">Sqlmaping xss results using tor proxy</td>
      </tr>
      <tr>
        <td width="100px" class="main">--lfi</td>
        <td class="main">local file inclusion</td>
      </tr>
      <tr>
        <td width="100px" class="main">--joomrfi</td>
        <td class="main">get joomla sites with rfi in the server</td>
      </tr>
      <tr>
        <td width="100px" class="main">--shell</td>
        <td class="main">shell link [Ex: http://www.site.com/shell.txt]</td>
      </tr>
      <tr>
        <td width="100px" class="main">--wpadf</td>
        <td class="main">get wordpress sites with arbitery file download in the server</td>
      </tr>
      <tr>
        <td width="100px" class="main">--admin</td>
        <td class="main">get site admin page</td>
      </tr>
      <tr>
        <td width="100px" class="main">--shost</td>
        <td class="main">get site subdomains</td>
      </tr>
      <tr>
        <td width="100px" class="main">--ports</td>
        <td class="main">scan server ports</td>
      </tr>
      <tr>
        <td width="100px" class="main">--start</td>
        <td class="main">start scan port</td>
      </tr>
      <tr>
        <td width="100px" class="main">--end</td>
        <td class="main">end scan port</td>
      </tr>
      <tr>
        <td width="100px" class="main">--tcp</td>
        <td class="main">tcp ports</td>
      </tr>
      <tr>
        <td width="100px" class="main">--udp</td>
        <td class="main">udp ports</td>
      </tr>
      <tr>
        <td width="100px" class="main">--all</td>
        <td class="main">complete mode</td>
      </tr>
      <tr>
        <td width="100px" class="main">--basic</td>
        <td class="main">basic mode</td>
      </tr>
      <tr>
        <td width="100px" class="main">--select</td>
        <td class="main">Select mode you can set rang of ports</td>
      </tr>
      <tr>
        <td width="100px" class="main">--sites</td>
        <td class="main">sites in the server</td>
      </tr>
      <tr>
        <td width="100px" class="main">--wp</td>
        <td class="main">wordpress sites in the server</td>
      </tr>
      <tr>
        <td width="100px" class="main">--joom</td>
        <td class="main">joomla sites in the server</td>
      </tr>
      <tr>
        <td width="100px" class="main">--upload</td>
        <td class="main">get sites with upload files in the server</td>
      </tr>
      <tr>
        <td width="100px" class="main">--zip</td>
        <td class="main">get sites with zip files in the server</td>
      </tr>
      <tr>
        <td width="100px" class="main">--st</td>
        <td class="main">string</td>
      </tr>
      <tr>
        <td width="100px" class="main">--md5</td>
        <td class="main">convert to md5</td>
      </tr>
      <tr>
        <td width="100px" class="main">--encode64</td>
        <td class="main">encode base64 string</td>
      </tr>
      <tr>
        <td width="100px" class="main">--decode64</td>
        <td class="main">decode base64 string</td>
      </tr>
      <tr>
        <td width="100px" class="main">--isup</td>
        <td class="main">check http status 200</td>
      </tr>
      <tr>
        <td width="100px" class="main">--httpd</td>
        <td class="main">print site httpd version</td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3">Examples:</td>
  </tr>
  <tr>
    <td class="main">
    <b>Simple search: </b><br/>
    --dork DORK --mp [number of page results to scan]<br/>
    --dork [DORK1,DORK2,DORK3..] --mp [number of page results to scan]<br/>
    --dork [DORK.txt] --mp [number of page results to scan from list]<br/><br/>
    <b>Subscan from Serach Engine: </b><br/>
    Xss: --dork DORK --mp 1 --xss<br/>
    Xss: --dork DORKS.TXT --mp 1 --xss <br/>
    Lfi: --dork DORK --mp 1 --lfi<br/>
    Search + Command: --dork DORK --mp VALUE --command 'curl -v' --TARGET<br/><br/>
    <b>Validation: </b><br/>
    Xss: --dork DORK --mp 1 --xss --valid TEXT <br/>
    Lfi: --dork DORK --mp 1 --lfi --valid TEXT <br/>
    Xss: --dork DORK --mp 1 --xss --isup <br/>
    Lfi: --dork DORK --mp 1 --xss --isup <br/>
    Xss: --dork DORKS.TXT --mp 1 --xss --valid TEXT <br/>
    Lfi: --dork DORKS.TXT --mp 1 --lfi --valid TEXT <br/>
    Xss: --dork DORKS.TXT --mp 1 --xss --isup <br/>
    Lfi: --dork DORKS.TXT --mp 1 --xss --isup <br/><br/>
    <b>Use List / Target: </b><br/>
    Xss: -t TARGET --xss <br/>
    Lfi: -l TARGET --lfi <br/>
    Xss + Validation: -t TARGET --xss --valid TEXT <br/>
    Lfi + Validation: -t TARGET --lfi --valid TEXT  <br/>
    Xss + Validation: -l list.txt --xss --isup <br/>
    Lfi + Validation: -l list.txt --lfi --isup  <br/>
    Find admin page: -t TARGET --admin  <br/>
    Find subdomains: -t TARGET --shost  <br/><br/>
    
    <b>Server: </b>  <br/>
    Get Server sites: -t IP --mp [VALUE] --sites   <br/>
    Get Server sites: -t IP.txt --mp [VALUE] --sites   <br/>
    Get Server wordpress sites: -t IP --mp [VALUE] --wp   <br/>
    Get Server joomla sites: -t IP --mp [VALUE] --joom   <br/>
    Get Server upload sites: -t IP --mp [VALUE] --upload   <br/>
    Get Server zip sites files: -t IP --mp [VALUE] --zip   <br/>
    WP Arbitry File Download: -t IP --mp [VALUE] --wpadf   <br/>
    Joomla RFI: -t IP --mp <1> --joomfri --shell SHELL LINK   <br/>
    Scan basic tcp (quick): -t IP --ports --basic --tcp   <br/>
    Scan basic udp basic (quick): -t IP --ports --basic --udp   <br/>
    Scan basic udp+tcp: -t IP --ports --basic --udp --tcp   <br/>
    Scan complete tcp: -t IP --ports --all --tcp   <br/>
    Scan complete udp: -t IP --ports --all --udp   <br/>
    Scan complete tcp+udp: -t IP --ports --all --udp --tcp   <br/>
    Scan rang tcp: -t IP --ports --select --start --end --tcp   <br/>
    Scan rang udp: -t IP --ports --select --start --end --udp   <br/>
    Scan rang udp + tcp: -t IP --ports --select --start VALUE --end VALUE --udp --tcp <br/><br/>
    <b>Encode / Decode:  </b> <br/>
    Generate MD5: -st STRING --md5 <br/>
    Encode base64: -st STRING --encode64  <br/> 
    Decode base64: -st STRING --decode64 
    </td>
  </tr>
</table>  
</body>
</html>
