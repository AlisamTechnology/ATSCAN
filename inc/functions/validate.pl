#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## HTML VALIDATION
my @V_WP=("<a href=\"https:\/\/wordpress.org\/\">Proudly powered by WordPress", "<meta name=\"generator\" content=\"WordPress", "\/wp-content\/(.*).js");
my @V_JOOM=("<meta name=\"generator\" content=\"Joomla");
my @V_TP=("Powered by <a href=\"http:\/\/www.textpattern.com\" title=\"Textpattern");
my @V_SMF=("<a href=\"http:\/\/www.simplemachines.org/about/copyright.php\" title=\"Free Forum Software\" target=\"_blank\">SMF");
my @V_PhpBB=("Powered by <a href=\"http:\/\/www.phpbb.com/\">phpBB");
my @V_VB=("<a href=\"https:\/\/www.vbulletin.com\" id=\"vbulletinlink\">vBulletin", "vBulletin Solutions\, Inc\. All rights reserved");
my @V_MyBB=("Powered By <a href=\"http:\/\/www.mybboard.net\" target=\"_blank\">MyBB");
my @V_CF=("<a href=\"http:\/\/www.cloudflare.com\/\" target=\"_blank\" style", "DDoS protection by CloudFlare");
my @V_DRP=("name=\"Generator\" content=\"Drupal");
my @V_PN=("<meta name=\"generator\" content=\"PostNuke");
my @V_AT=("<a href=\"/about.php\">About ATutor");
my @V_PHPN=("<META NAME=\"GENERATOR\" CONTENT=\"PHP-Nuke");
my @V_MD=("Powered by <a href=\"http:\/\/moodle.org\" title=\"Moodle\">Moodle", "<meta name=\"key words\" content=\"moodle");
my @V_ACM=("Powered by <a href=\"http:\/\/www.adaptcms.com\">AdaptCMS");
my @V_SS=("<meta name=\"generator\" content=\"SilverStripe - http:\/\/silverstripe.org\" \/>");
my @V_MX=("<a href=\"http:\/\/www.modx.com\" target=\"_blank\"> Powered by MODx");
my @V_XO=("<meta name=\"generator\" content=\"XOOPS");
my @V_OSC=("Powered by osCommerce", "<a href=\"http:\/\/www.oscommerce.com\" target=\"_blank\">osCommerce");
my @V_PSH=("<a class=\"_blank_blank\" href=\"http:\/\/www.prestashop.com\" target=\"_blank", "Software para Ecommerce de PrestaShop");
my @V_BB2=("<meta name=\"generator\" content=\"b2evolution");
my @V_MG=("MAGENTO\, INC\. ALL RIGHTS RESERVED", "Magento Ecommerce by Smart Solutions");
my @V_ZC=("all rights reserved Zen Cart", "<a href=\"http:\/\/www.zen-cart.com\" target=\"_blank\">Zen Cart");
my @V_CC5=("Powered by concrete5", "<meta name=\"generator\" content=\"concrete");
my @V_OCR=("Powered By OpenCart");
my @V_XSS=("You have an error in your SQL", "Warning: mysql_", "function.mysql", "MySQL result index", "MySQL Error", "MySQL ODBC", "MySQL Driver", "mysqli.query", "num_rows", "mysql error:",
           "supplied argument is not a valid MySQL result resource", "on MySQL result index", "Error Executing Database Query", "mysql_");
my @V_LFI=("root:x", "root:x:0:0:", "mysql:x:");
my @V_TODO=(".", "a", "e", "i", "o", "u", ",");
my @V_AFD=("DB_NAME", "DB_USER", "DB_PASSWORD");


## MENU
sub get_validate_wp { return @V_WP; }
sub get_validate_joom { return @V_JOOM; }
sub get_validate_tp { return @V_TP; }
sub get_validate_smf { return @V_SMF; }
sub get_validate_phpbb { return @V_PhpBB; }
sub get_validate_vb { return @V_VB; }
sub get_validate_mybb { return @V_MyBB; }
sub get_validate_cf { return @V_CF; }
sub get_validate_drp { return @V_DRP; }
sub get_validate_pn { return @V_PN; }
sub get_validate_at { return @V_AT; }
sub get_validate_phpn { return @V_PHPN; }
sub get_validate_md { return @V_MD; }
sub get_validate_acm { return @V_ACM; }
sub get_validate_ss { return @V_SS; }
sub get_validate_mx { return @V_MX; }
sub get_validate_xo { return @V_XO; }
sub get_validate_osc { return @V_OSC; }
sub get_validate_psh { return @V_PSH; }
sub get_validate_bb2 { return @V_BB2; }
sub get_validate_mg { return @V_MG; }
sub get_validate_zc { return @V_ZC; }
sub get_validate_cc5 { return @V_CC5; }
sub get_validate_ocr { return @V_OCR; }
sub get_validate_xss { return @V_XSS; }
sub get_validate_lfi { return @V_LFI; }
sub get_validate_todo { return @V_TODO; }
sub get_validate_afd { return @V_AFD; }

1;
