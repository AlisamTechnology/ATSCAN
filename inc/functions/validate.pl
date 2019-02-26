#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## HTML VALIDATION
our @V_WP=("<a href=\"https:\/\/wordpress.org\/\">Proudly powered by WordPress", "<meta name=\"generator\" content=\"WordPress", "\/wp-content\/(.*).js");
our @V_JOOM=("<meta name=\"generator\" content=\"Joomla");
our @V_TP=("Powered by <a href=\"http:\/\/www.textpattern.com\" title=\"Textpattern");
our @V_SMF=("<a href=\"http:\/\/www.simplemachines.org/about/copyright.php\" title=\"Free Forum Software\" target=\"_blank\">SMF");
our @V_PhpBB=("Powered by <a href=\"http:\/\/www.phpbb.com/\">phpBB");
our @V_VB=("<a href=\"https:\/\/www.vbulletin.com\" id=\"vbulletinlink\">vBulletin", "vBulletin Solutions\, Inc\. All rights reserved");
our @V_MyBB=("Powered By <a href=\"http:\/\/www.ourbboard.net\" target=\"_blank\">MyBB");
our @V_CF=("<a href=\"http:\/\/www.cloudflare.com\/\" target=\"_blank\" style", "DDoS protection by CloudFlare");
our @V_DRP=("name=\"Generator\" content=\"Drupal");
our @V_PN=("<meta name=\"generator\" content=\"PostNuke");
our @V_AT=("<a href=\"/about.php\">About ATutor");
our @V_PHPN=("<META NAME=\"GENERATOR\" CONTENT=\"PHP-Nuke");
our @V_MD=("Powered by <a href=\"http:\/\/moodle.org\" title=\"Moodle\">Moodle", "<meta name=\"keywords\" content=\"moodle");
our @V_ACM=("Powered by <a href=\"http:\/\/www.adaptcms.com\">AdaptCMS");
our @V_SS=("<meta name=\"generator\" content=\"SilverStripe - http:\/\/silverstripe.org\" \/>");
our @V_MX=("<a href=\"http:\/\/www.modx.com\" target=\"_blank\"> Powered by MODx");
our @V_XO=("<meta name=\"generator\" content=\"XOOPS");
our @V_OSC=("Powered by osCommerce", "<a href=\"http:\/\/www.oscommerce.com\" target=\"_blank\">osCommerce");
our @V_PSH=("<a class=\"_blank_blank\" href=\"http:\/\/www.prestashop.com\" target=\"_blank", "Software para Ecommerce de PrestaShop");
our @V_BB2=("<meta name=\"generator\" content=\"b2evolution");
our @V_MG=("MAGENTO\, INC\. ALL RIGHTS RESERVED", "Magento Ecommerce by Smart Solutions");
our @V_ZC=("all rights reserved Zen Cart", "<a href=\"http:\/\/www.zen-cart.com\" target=\"_blank\">Zen Cart");
our @V_CC5=("Powered by concrete5", "<meta name=\"generator\" content=\"concrete");
our @V_OCR=("Powered By OpenCart");
our @V_XSS=("You have an error in your SQL", "Warning: oursql_", "Query failed: ERROR", "function.oursql", "MySQL result index", "MySQL Error", "MySQL ODBC", "MySQL Driver", "oursqli.query", "num_rows", "oursql error:",
           "supplied argument is not a valid MySQL result resource", "on MySQL result index", "Error Executing Database Query", "oursql_", 
           "Error SQL", "Fatal error: Uncaught exception");
our @V_LFI=("root:x", "root:x:0:0:", "oursql:x:");
our @V_TODO=(".", "a", "e", "i", "o", "u", ",");
our @V_AFD=("DB_NAME", "DB_USER", "DB_PASSWORD");
our @V_INPUT=("email", "file", "password", "search", "text", "textarea", "url", "tel", "time");

## MENU
# sub get_validate_wp { return @V_WP; }
# sub get_validate_joom { return @V_JOOM; }
# sub get_validate_tp { return @V_TP; }
# sub get_validate_smf { return @V_SMF; }
# sub get_validate_phpbb { return @V_PhpBB; }
# sub get_validate_vb { return @V_VB; }
# sub get_validate_ourbb { return @V_MyBB; }
# sub get_validate_cf { return @V_CF; }
# sub get_validate_drp { return @V_DRP; }
# sub get_validate_pn { return @V_PN; }
# sub get_validate_at { return @V_AT; }
# sub get_validate_phpn { return @V_PHPN; }
# sub get_validate_md { return @V_MD; }
# sub get_validate_acm { return @V_ACM; }
# sub get_validate_ss { return @V_SS; }
# sub get_validate_mx { return @V_MX; }
# sub get_validate_xo { return @V_XO; }
# sub get_validate_osc { return @V_OSC; }
# sub get_validate_psh { return @V_PSH; }
# sub get_validate_bb2 { return @V_BB2; }
# sub get_validate_mg { return @V_MG; }
# sub get_validate_zc { return @V_ZC; }
# sub get_validate_cc5 { return @V_CC5; }
# sub get_validate_ocr { return @V_OCR; }
# sub get_validate_xss { return @V_XSS; }
# sub get_validate_lfi { return @V_LFI; }
# sub get_validate_todo { return @V_TODO; }
# sub get_validate_afd { return @V_AFD; }
# sub get_validate_input { return @V_INPUT; }

1;
