<html>
<body>
<h1 align="center">ATSCAN</h1>
<p align="center"> <b>Search / Server / Site / Dork / Exploitation Scanner </b></p>
<center><img src="http://i.imgur.com/jUt3Gn7.png" /></center>
<table border="0" cellpadding="2" cellspacing="2" width="100%">
  <tr>
    <td align="center"><b>Alisam Technology is not responsible for any misuse, damage caused by this script or attacking targets without prior mutual consent!<b></td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="2" width="100%">
  <tr>
    <td width="100px" class="main2"><b>Tool:</b></td>
    <td width="780px">ATSCAN version 9.2</td>
  </tr>
  <tr>
    <td width="100px" class="main2"><b>Codename:</b></td><td width="780px">Anon4t</td>
  </tr>
  <tr>
    <td width="100px" class="main2"><b>AUTHOR:</b></td><td width="780px">Ali MEHDIOUI</td>
  </tr>
  <tr>
    <td width="100px" class="main2"><b>GROUP:</b></td><td width="780px">Alisam Technology</td>
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
    <td class="main" width="890px">Search engine Google / Bing / Ask / Yandex / Sogou <br />
        Mass Dork Search<br/>Multiple instant scans. <br/>Mass Exploitation <br/>Extern commands execution.<br/>
        XSS scanner.<br />LFI / AFD scanner.<br /> Filter wordpress and Joomla sites in the server. <br />
        Find Admin page.<br />Decode / Encode MD5 + Base64.<br/> Ports scan. <br/>Scan ips<br/>Scan E-mails. <br/> Use proxy. <br/> Random user agent. <br/> Random proxy. <br/> Scan errors. <br/> Detect Cms.<br/>And more...
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
      NOTE: Works in linux platforms. Best Run on Ubuntu 14.04, Kali Linux 2.0, Arch Linux, Fedora Linux, Centos.. <br/> 
      if you use a windows you can download manualy.
    </td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3" width="890px"><b>Download:</b></td>
  </tr>
  <tr>
    <td class="main">
      git clone https://github.com/AlisamTechnology/ATSCAN <br/>
      OR direct link: https://github.com/AlisamTechnology/ATSCAN
    </td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3" width="890px"><b>Permissions:</b></td>
  </tr>
  <tr>
    <td class="main">
      cd ATSCAN <br/>
      chmod +x ATSCAN
    </td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3" width="890px"><b>Installation:</b></td>
  </tr>
  <tr>
    <td class="main">chmod +x ./install.sh <br/>./install.sh </td>
  </tr>
</table>

<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3" width="890px"><b>Execution:</b></td>
  </tr>
  <tr>
    <td class="main">
      Direct Tool Execution: perl ./atscan.pl<br/>
      Installed Tool Execution: atscan
    </td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td class="main3"><b>Screenshots:</b></td>
  </tr>
  <tr>
    <td align="center" width="890px">
    <img src="http://i.imgur.com/c9V8cGR.jpg" /><br/><br/>
    <img src="http://i.imgur.com/EvHAssB.jpg" /><br/><br/>
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
        <td width="680px">Set tor proxy [Ex: socks://localhost:9050].<br/> Set proxy  [Ex: http://12.231.54.87:8080 | list.txt].</td>
      </tr>
      <tr>
        <td width="200px" class="main">--random</td>
        <td width="680px">Renew identity foreach link scanned.</td>
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
        <td width="200px" class="main">-m</td>
        <td class="main">Set engine motor [Bing = 1][Google = 2][Ask = 3][Yandex = 4][Sogou = 5][All = all]</td>
      </tr>
      <tr>
        <td width="200px" class="main">-t</td>
        <td class="main">Target [http://site.com]</td>
      </tr>
      <tr>
        <td width="200px" class="main">-p</td>
        <td class="main">Set test param to xss</td>
      </tr>
      <tr>
        <td width="200px" class="main">--time</td>
        <td class="main">Set browser time out.</td>
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
        <td width="200px" class="main">--TARGET</td>
        <td class="main">Will be replaced by target in extern commands</td>
      </tr>
      <tr>
        <td width="200px" class="main">--dom</td>
        <td class="main">Domaine</td>
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
        <td width="200px" class="main">--unique</td>
        <td class="main">Get urls with exact dork matching</td>
      </tr>
      <tr>
        <td width="200px" class="main">--regex</td>
        <td class="main">Crawl to get strings matching regex</td>
      </tr>
      <tr>
        <td width="200px" class="main">--noquery</td>
        <td class="main">Remove Query string from url. [lives url like: site.com/index.php?id=]</td>
      </tr>
      <tr>
        <td width="200px" class="main">--reg</td>
        <td class="main">Get urls with matching regex</td>
      </tr>
      <tr>
        <td width="200px" class="main">--ip</td>
        <td class="main">Scan targets for ips.</td>
      </tr>
      <tr>
        <td width="200px" class="main">--pause</td>
        <td class="main">Pause scan when first result found.</td>
      </tr>
      <tr>
        <td width="200px" class="main">--ifinurl</td>
        <td class="main">Text to validate target url</td>
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
        <td width="200px" class="main">--wpafd</td>
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
        <td width="200px" class="main">--port</td>
        <td class="main">port</td>
      </tr>      
      <tr>
        <td width="200px" class="main">--udp</td>
        <td class="main">UDP port</td>
      </tr>
      <tr>
        <td width="200px" class="main">--tcp</td>
        <td class="main">TCP port</td>
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
        <td class="main">Save scan results.</td>
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
        <td width="200px" class="main">--nobanner</td>
        <td class="main">Hide tool banner</td>
      </tr>
      <tr>
        <td width="200px" class="main">--noinfo</td>
        <td class="main">Jump extra results info.</td>
      </tr>
      <tr>
        <td width="200px" class="main">--save</td>
        <td class="main">Set file to save results.</td>
      </tr>
      <tr>
        <td width="200px" class="main">--beep</td>
        <td class="main">Produce beep sound if positive scan found</td>
      </tr> 
      <tr>
        <td width="200px" class="main">--help / -h</td>
        <td class="main">Help.</td>
      </tr> 
      <tr>
        <td width="200px" class="main">--update</td>
        <td class="main">Check / Update.</td>
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
<b>Proxy: </b><br/>
  Tor --proxy [proxy] [Ex: socks://localhost:9050].<br/>
  Proxy --proxy [proxy] [Ex: http://12.32.1.5:8080] | --proxy [list.txt><br/>
  Random --random<br/><br/>
    
<b>Simple search: </b><br/>
  Search: atscan --dork [dork] --level [level]  <br/>
  Set engine: atscan --dork [dork] --level [level] -m [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all] <br/>
  Set selective engines: atscan --dork [dork] --level [level] -m 1,2,3..   <br/>
  Search with many dorks: atscan --dork [dork1,dork2,dork3] --level [level]    <br/>
  Get Server sites: atscan -t [ip] --level [value] --sites <br/>
  Get Server wordpress sites: atscan -t [ip] --level [value] --wp  <br/>
  Get Server joomla sites: atscan -t [ip] --level [value] --joom  <br/>
  Get Server upload sites: atscan -t [ip] --level [value] --upload  <br/>
  Get Server zip sites files: atscan -t [ip] --level [value] --zip  <br/>
  WP Arbitry File Download: atscan -t [ip] --level [value] --wpafd  <br/>
  Joomla RFI: atscan  -t [ip] --level [10] --joomfri --shell [shell link] <br/>
  Search + set save file: atscan --dork [dorks.txt] --level [level] --save <br/>
  Replace + Exploit: atscan --dork [dorks.txt] --level [level] --replace [string] --with [string] --valid [string] <br/>  
  Search + get emails: atscan --dork [dorks.txt] --level [level] --email  <br/>
  Search + get site emails: atscan --dork [site:site.com] --level [level] --email  <br/>  
  Search + get ips: atscan --dork [dork] --level [level] --ip  <br/>
  Search by url regex: atscan --dork [dork] --level [level] --sregex [regex] <br/><br/>

<b>Regular Expressions Scan: </b><br/>
  Regex use: atscan [--dork dork | -t target] --level [level] --regex [regex] <br/>
  EX: To get ips ((\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})) <br/>
  EX: To get mails ((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}).<br/><br/>

<b>Subscan from Serach Engine:</b><br/>
  Exploitation: atscan --dork [dork] --level [10] [--xss | --lfi | --wp |...] <br/>
  Server Exploitation: atscan -t [ip] --level [10] [--xss | --lfi | --wp |...] <br/>
  Replace + Exploit: atscan --dork [dork] --level [10] --replace [string] --with [string] --exp [exploit] [--xss | --lfi |...]<br/><br/>

<b>Validation:</b><br/>
  Search + Url Validation: atscan --dork [dork] --level [10] --ifinurl [string] <br/>
  Search + dork Validation: atscan --dork [dork] --level [10] --unique <br/>
  Search + Exploit + Validation: atscan --dork [dork] --level [10] --exp [--isup | --valid] [string] <br/>
  Search + Server Exploit + Validation: atscan -t [ip] --level [10] --exp [--isup | --valid] [string] <br/>
  Replace + Exploit: atscan --dork [dork] --level [10] --replace [string] --with [string] [--isup | --valid] [string]<br/><br/>

<b>Use List / Target:</b><br/>
  atscan -t [target | targets.txt] --exp [--isup | --valid] [string] <br/>
  atscan -t [target | targets.txt] [--xss | --lfi | --wp |...]<br/><br/>

<b>Server Ports:</b><br/>
  atscan -t [ip] --ports [--udp | --tcp] --port [port] <br/>
  atscan -t (ip start)-(ip end) --ports [--udp | --tcp] --port [port] <br/>
  atscan -t [ip] --ports [--udp | --tcp] --port (port start)-(port end)<br/><br/>

<b>Encode / Decode:</b><br/>
  Generate MD5: atscan --md5 [string]  <br/>
  Encode base64: atscan --encode64 [string]  <br/> 
  Decode base64: atscan --decode64 [string] <br/><br/>

<b>External Command:</b><br/>
  atscan --dork [dork | dorks.txt] --level [level] --command "curl -v --TARGET"  <br/>
  atscan -t [target | targets.txt] --command "curl -v --TARGET" <br/> <br/>

<b>Multiple Scan:</b><br/>
  atscan --dork [dork] --level [10] --xss --lfi --wp .. <br/>
  atscan --dork [dork] --level [10] --replace [string] --with [string] --exp [exploit] [--xss | --lfi | --wp |...] <br/>
  atscan -t [ip] --level [10] [--xss | --lfi | --wp |...] <br/>
  atscan -t [targets] [--xss | --lfi | --wp |...] <br/><br/>

<b>Check Tool Version and Update:</b><br/>
  atscan --update <br/><br/>
    </td>
  </tr>
</table>  
</body>
</html>
