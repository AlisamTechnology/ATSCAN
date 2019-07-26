package Checkcms;

use strict;
use Socket;
use Exploits;

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(checkCms);

## Copy@right Alisam Technology see License.txt

my @V_WP    = Exploits::V_WP();
my @V_JOOM  = Exploits::V_JOOM(); 
my @V_TP    = Exploits::V_TP(); 
my @V_SMF   = Exploits::V_SMF(); 
my @V_PhpBB = Exploits::V_PhpBB(); 
my @V_VB    = Exploits::V_VB(); 
my @V_MyBB  = Exploits::V_MyBB(); 
my @V_CF    = Exploits::V_CF(); 
my @V_DRP   = Exploits::V_DRP(); 
my @V_PN    = Exploits::V_PN(); 
my @V_AT    = Exploits::V_AT(); 
my @V_PHPN  = Exploits::V_PHPN(); 
my @V_MD    = Exploits::V_MD(); 
my @V_ACM   = Exploits::V_ACM(); 
my @V_SS    = Exploits::V_SS(); 
my @V_MX    = Exploits::V_MX(); 
my @V_XO    = Exploits::V_XO(); 
my @V_OSC   = Exploits::V_OSC(); 
my @V_PSH   = Exploits::V_PSH(); 
my @V_BB2   = Exploits::V_BB2(); 
my @V_MG    = Exploits::V_MG(); 
my @V_ZC    = Exploits::V_ZC(); 
my @V_CC5   = Exploits::V_CC5(); 
my @V_OCR   = Exploits::V_OCR();
my @cms=("CMS", "Wordpress", "Joomla", "Textpattern", "SMF", "PhpBB!", "VBulletin", "MyBB", "CloudFlare", "Post Nuke", "Drupal", "ATutor", "Php Nuke", "Moodle", "Adapt Cms", "Silver Stripe",
         "Modx", "XOOPS", "Oscommerce", "PrestaShop", "B2evolution", "Smart Solutions", "Zen Cart", "concrete5", "OpenCart");
  
my @CMS = (@V_WP, @V_JOOM, @V_TP, @V_SMF, @V_PhpBB, @V_VB, @V_MyBB, @V_CF, @V_DRP, @V_PN, @V_AT, @V_PHPN, 
		   @V_MD, @V_ACM, @V_SS, @V_MX, @V_XO, @V_OSC, @V_PSH, @V_BB2, @V_MG, @V_ZC, @V_CC5, @V_OCR);
my $type;
my @c = Print::colors();
###########################################################################################################
## CHECK CMS
sub checkCms {
  my $ht = $_[0];  
  my $j=1;
  for my $CMS(@CMS) { 
    if ( $ht=~/$CMS/ ) { 
      $type = checkCmsType($CMS); 
	  print $c[1]." CMS       $c[4]$type \n" if $type;
	  last;	    
	} 
  }
}

## CHECK CMS
sub checkCmsType {
  my $CMS=$_[0];
  if (grep( /^$CMS$/, @V_WP)) { $type = $cms[1]; } 
  if (grep( /^$CMS$/, @V_JOOM)) { $type = $cms[2]; }
  if (grep( /^$CMS$/, @V_TP)) { $type = $cms[3]; }
  if (grep( /^$CMS$/, @V_SMF)) { $type = $cms[4]; }
  if (grep( /^$CMS$/, @V_PhpBB)) { $type = $cms[5]; }
  if (grep( /^$CMS$/, @V_VB)) { $type = $cms[6]; }
  if (grep( /^$CMS$/, @V_MyBB)) { $type = $cms[7]; }
  if (grep( /^$CMS$/, @V_CF)) { $type = $cms[8]; }
  if (grep( /^$CMS$/, @V_PN)) { $type = $cms[9]; }
  if (grep( /^$CMS$/, @V_DRP)) { $type = $cms[10]; } 
  if (grep( /^$CMS$/, @V_AT)) { $type = $cms[11]; }
  if (grep( /^$CMS$/, @V_PHPN)) { $type = $cms[12]; }
  if (grep( /^$CMS$/, @V_MD)) { $type = $cms[13]; }
  if (grep( /^$CMS$/, @V_ACM)) { $type = $cms[14]; }
  if (grep( /^$CMS$/, @V_SS)) { $type = $cms[15]; }
  if (grep( /^$CMS$/, @V_MX)) { $type = $cms[16]; }
  if (grep( /^$CMS$/, @V_XO)) { $type = $cms[17]; }
  if (grep( /^$CMS$/, @V_OSC)) { $type = $cms[18]; }
  if (grep( /^$CMS$/, @V_PSH)) { $type = $cms[19]; }
  if (grep( /^$CMS$/, @V_BB2)) { $type = $cms[20]; }
  if (grep( /^$CMS$/, @V_MG)) { $type = $cms[21]; }
  if (grep( /^$CMS$/, @V_ZC)) { $type = $cms[22]; }
  if (grep( /^$CMS$/, @V_CC5)) { $type = $cms[23]; }
  if (grep( /^$CMS$/, @V_OCR)) { $type = $cms[24]; }
  return $type;
}

1;