package Engine;

use strict;
use Socket;
use Exploits;

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(get_engine);

## Copy@right Alisam Technology see License.txt

#########################################################################################################################
## ENGINE MOTORS
my $motor1 = "http://www.bing.com/search?q=MYDORK&first=MYNPAGES&FORM=PERE&cc=MYBROWSERLANG";
my $motor2 = "http://www.google.MYGOOGLEDOMAINE/search?q=MYDORK&start=MYNPAGES";
my $motor3 = "http://webcache.googleusercontent.com/search?q=cache:MYDORK/&start=MYNPAGES";
my $motor4 = "https://www.googleapis.com/customsearch/v1?key=MYAPIKEY&cx=MYCX&q=MYDORK&start=MYNPAGES";
my $motor5 = "http://www.sogou.com/web?query=MYDORK&page=MYNPAGES&ie=utf8";
my $motor6 = "https://www.exalead.com/search/web/results/?q=MYDORK&elements_per_page=10&start_index=MYNPAGES";
my $motor7 = "http://www.ask.com/web?q=MYDORK&page=MYNPAGES&qid=MYID";
my $motor8 = "http://www.yandex.com/search/?msid=MYMSID&text=MYDORK&lr=25402&p=MYNPAGES";
my @mrands = ('bing', 'ask', 'google', 'yandex', 'sogou', 'exalead', 'googleapis', 'googleusercontent');

## BROWSER LANGUAGES
my @browserlangs=("af", "am", "ar-SA", "as", "az-Latn", "be", "bg", "bn-BD", "bn-IN", "bs", "ca", "ca-ES-valencia", "cs", "da", "de", "de-DE", "el", "en-CA", "en-GB", "en-IN", "en-AU",
                  "en-US", "es", "es-ES", "es-US", "es-MX", "et", "eu", "fa", "fi", "fil-Latn", "fr", "fr-FR", "fr-CA", "ga", "gd-Latn", "gl", "gu", "ha-Latn", "he", "hi", "hr", "hu", "hy",
                  "id", "ig-Latn", "is", "it", "it-IT", "ja", "ka", "kk", "km", "kn", "ko", "kok", "ku-Arab", "ky-Cyrl", "lb", "lt", "lv", "mi-Latn", "mk", "ml", "mn-Cyrl", "mr", "ms", "mt",
                  "nb", "ne", "nl", "nl-BE", "nn", "nso", "or", "pa", "pa-Arab", "pl", "prs-Arab", "pt-BR", "pt-PT", "qut-Latn", "quz", "ro", "ru", "rw", "sd-Arab", "si", "sk", "sl", "sq",
                  "sr-Cyrl-BA", "sr-Cyrl-RS", "sr-Latn-RS", "sv", "sw", "ta", "te", "tg-Cyrl", "th", "ti", "tk-Latn", "tn", "tr", "tt-Cyrl", "ug-Arab", "uk", "ur", "uz-Latn", "vi", "zh-Hans",
                  "zh-Hant", "zu");

## GOOGLE DOMAINS
my @googleDomains=("com", "ac", "com.om", "ad", "ae", "com.af", "com.ag", "com.ai", "am", "it.ao", "com.ar", "cat", "as", "at", "com.au", "az", "ba", "com.bd", "be", "bf", "bg", "com.bh",
                   "bi", "bj", "com.bn", "com.bo", "com.br", "bs", "co.bw", "com.by", "com.bz", "ca", "com.kh", "cc", "cd", "cf", "cn", "com.co", "co.nz", "cg", "ch", "ci", "co.ck", "cl", "cm",
                   "co.cr", "com.cu", "cv", "cz", "de", "nu", "dj", "dk", "dm", "com.do", "dz", "no", "com.ec", "ee", "com.eg", "es", "com.et", "com.np", "fi", "com.fj", "fm", "fr", "ga",
                   "nl", "ge", "gf", "gg", "com.gh", "com.gi", "nr", "gl", "gm", "gp", "gr", "com.gt", "com.ni", "gy", "com.hk", "hn", "hr", "ht", "com.ng", "hu", "co.id", "iq", "ie", "co.il",
                   "com.nf", "im", "co.in", "io", "is", "it", "ne", "je", "com.jm", "jo", "co.jp", "co.ke", "com.na", "ki", "kg", "co.kr", "com.kw", "kz", "co.mz", "la", "com.lb", "com.lc",
                   "li", "lk", "com.our", "co.ls", "lt", "lu", "lv", "com.ly", "com.mx", "co.ma", "md", "me", "mg", "mk", "mw", "ml", "mn", "ms", "com.mt", "mu", "mv", "com.pa", "com.pe",
                   "com.ph", "com.pk", "pn", "com.pr", "ps", "pt", "com.py", "com.qa", "ro", "rs", "ru", "rw", "com.sa", "com.sb", "sc", "se", "com.sg", "sh", "si", "sk", "com.sl", "sn", "sm",
                   "so", "st", "com.sv", "td", "tg", "co.th", "tk", "tl", "tm", "to", "com.tn", "com.tr", "tt", "com.tw", "co.tz", "com.ua", "co.ug", "co.uk", "us", "com.uy", "co.uz", "com.vc",
                   "co.ve", "vg", "co.vi", "com.vn", "vu", "ws", "co.za", "co.zm", "co.zw");

## ID RANDOM
my @Ids=(
"5D4B3C17298B25CC309D9A0951C6BA04", "761446B6C1810068798CA09C88BE0776", "76DE276369845330D17C7CD111A536DD", "A0A6BD56DD1A054B1FF32E7FE3A44D27", "F856B0C416AEBE6E6C7610C3B89B5245",
"88ADADC7E5DB1A344000A6F8C2B0BFA9", "6B815A7FDAF8A283440CD6AEB586CED3", "B6B0770CB0F48619CA0EDE35E451F9E5", "D6EA6D2A00270CA431DD36486EE53F35", "7E84432C6967B7DC0AA29A493A1B8FD0"
);

## MSID RANDOM
my @MsIds=(
"1462902128.39925.22889.22408", "1462902552.15536.22876.27365", "1462902586.95962.22874.20936", "1462902627.17116.22876.27348", "1462902668.37045.20953.58001",
"1462902238.39125.22589.29408", "1462902129.37521.22479.24410", "1462902113.35935.22853.22412", "1462902138.59225.22845.22478", "1462902145.39925.22812.22432",
);

## BROWSER RANDOM
my @vary=("Firefox","Opera", "SeaMonkey", "Safari", "Dragon", "GNU IceCat", "Seamonkey", "Galaxy", "GoogleBot", "Tor Browser", "Konqueror", "Flock", "Chrome", "Mobile");

## BROWSER RANDOM
my $browserLang=$browserlangs[rand @browserlangs];

## GOOGLE DOMAINS
my $googleDomain=$googleDomains[rand @googleDomains];

## ID RANDOM
my $Id=$Ids[rand @Ids];

## MSID RANDOM
my $MsId=$MsIds[rand @MsIds];

###########################################################################################################
## CHECK PLUGINS
sub get_engine {
  my ($motor, $mrandom, $mlevel, $shodan, $bugtraq) = @_;
  my (@motors, @motor);
  if (defined $mlevel && (!defined $shodan && !defined $bugtraq)) {
    for ($motor, $mrandom) {
	  if (defined $_) {
	    $_ =~ s/\s//g;
        if ($_ =~ /all/) {
	      push @motor, @mrands;
        }else{
          @motor = split(",", $_);
        }
	  }
    }
	push @motor, "bing" if (scalar @motor < 1);
	
    ## build
    for my $mot(@motor) {
      if ($mot =~/^bing$/) { $mot = soubstituteRefs($motor1); }
      if ($mot =~/^google$/) { $mot = soubstituteRefs($motor2); }
      if ($mot =~/^googlecache$/) { $mot = soubstituteRefs($motor3); }
      if ($mot =~/^googleapis$/) { $mot = soubstituteRefs($motor4); }
      if ($mot =~/^sogou$/) { $mot = soubstituteRefs($motor5); }
      if ($mot =~/^exalead$/) { $mot = soubstituteRefs($motor6); }
      if ($mot =~/^ask$/) { $mot = soubstituteRefs($motor7); }
      if ($mot =~/^yandex$/) { $mot = soubstituteRefs($motor8); }	
	  push @motors, $mot;
	}
  }

  return \@motors;
}

#########################################################################################################################
##
sub soubstituteRefs {
  my $mot = $_[0];
  $mot=~s/MYBROWSERLANG/$browserLang/g;
  $mot=~s/MYGOOGLEDOMAINE/$googleDomain/g;
  $mot=~s/MYID/$Id/g;
  $mot=~s/MYMSID/$MsId/g;
  return $mot;
}

#########################################################################################################################

1;