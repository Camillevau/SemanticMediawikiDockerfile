-- MySQL dump 10.13  Distrib 5.6.25, for Linux (x86_64)
--
-- Host: 172.17.0.1    Database: mediawiki
-- ------------------------------------------------------
-- Server version	5.7.7-rc

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` tinyblob NOT NULL,
  `ar_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_user_text` varbinary(255) NOT NULL,
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned DEFAULT NULL,
  `ar_text_id` int(10) unsigned DEFAULT NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_model` varbinary(32) DEFAULT NULL,
  `ar_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  KEY `ar_revid` (`ar_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varbinary(255) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation` (`cl_collation`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag`
--

DROP TABLE IF EXISTS `change_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag` (
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(11) DEFAULT NULL,
  `ct_rev_id` int(11) DEFAULT NULL,
  `ct_tag` varbinary(255) NOT NULL,
  `ct_params` blob,
  UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag`
--

LOCK TABLES `change_tag` WRITE;
/*!40000 ALTER TABLE `change_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
INSERT INTO `externallinks` VALUES (1,1,'//meta.wikimedia.org/wiki/Help:Contents','http://org.wikimedia.meta./wiki/Help:Contents'),(2,1,'//meta.wikimedia.org/wiki/Help:Contents','https://org.wikimedia.meta./wiki/Help:Contents'),(3,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings','http://org.mediawiki.www./wiki/Special:MyLanguage/Manual:Configuration_settings'),(4,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings','https://org.mediawiki.www./wiki/Special:MyLanguage/Manual:Configuration_settings'),(5,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ','http://org.mediawiki.www./wiki/Special:MyLanguage/Manual:FAQ'),(6,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ','https://org.mediawiki.www./wiki/Special:MyLanguage/Manual:FAQ'),(7,1,'https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce','https://org.wikimedia.lists./mailman/listinfo/mediawiki-announce'),(8,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources','http://org.mediawiki.www./wiki/Special:MyLanguage/Localisation#Translation_resources'),(9,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources','https://org.mediawiki.www./wiki/Special:MyLanguage/Localisation#Translation_resources');
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` blob,
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` tinyblob,
  `fa_user` int(10) unsigned DEFAULT '0',
  `fa_user_text` varbinary(255) DEFAULT NULL,
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hitcounter`
--

DROP TABLE IF EXISTS `hitcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hitcounter` (
  `hc_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 MAX_ROWS=25000;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hitcounter`
--

LOCK TABLES `hitcounter` WRITE;
/*!40000 ALTER TABLE `hitcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `hitcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description` tinyblob NOT NULL,
  `img_user` int(10) unsigned NOT NULL DEFAULT '0',
  `img_user_text` varbinary(255) NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_to`,`il_from_namespace`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varbinary(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
INSERT INTO `interwiki` VALUES ('acronym','http://www.acronymfinder.com/~/search/af.aspx?string=exact&Acronym=$1','','',0,0),('advogato','http://www.advogato.org/$1','','',0,0),('arxiv','http://www.arxiv.org/abs/$1','','',0,0),('c2find','http://c2.com/cgi/wiki?FindPage&value=$1','','',0,0),('cache','http://www.google.com/search?q=cache:$1','','',0,0),('commons','https://commons.wikimedia.org/wiki/$1','','',0,0),('dictionary','http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1','','',0,0),('docbook','http://wiki.docbook.org/$1','','',0,0),('doi','http://dx.doi.org/$1','','',0,0),('drumcorpswiki','http://www.drumcorpswiki.com/$1','','',0,0),('dwjwiki','http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1','','',0,0),('elibre','http://enciclopedia.us.es/index.php/$1','','',0,0),('emacswiki','http://www.emacswiki.org/cgi-bin/wiki.pl?$1','','',0,0),('foldoc','http://foldoc.org/?$1','','',0,0),('foxwiki','http://fox.wikis.com/wc.dll?Wiki~$1','','',0,0),('freebsdman','http://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1','','',0,0),('gej','http://www.esperanto.de/dej.malnova/aktivikio.pl?$1','','',0,0),('gentoo-wiki','http://gentoo-wiki.com/$1','','',0,0),('google','http://www.google.com/search?q=$1','','',0,0),('googlegroups','http://groups.google.com/groups?q=$1','','',0,0),('hammondwiki','http://www.dairiki.org/HammondWiki/$1','','',0,0),('hrwiki','http://www.hrwiki.org/wiki/$1','','',0,0),('imdb','http://www.imdb.com/find?q=$1&tt=on','','',0,0),('jargonfile','http://sunir.org/apps/meta.pl?wiki=JargonFile&redirect=$1','','',0,0),('kmwiki','http://kmwiki.wikispaces.com/$1','','',0,0),('linuxwiki','http://linuxwiki.de/$1','','',0,0),('lojban','http://www.lojban.org/tiki/tiki-index.php?page=$1','','',0,0),('lqwiki','http://wiki.linuxquestions.org/wiki/$1','','',0,0),('lugkr','http://www.lug-kr.de/wiki/$1','','',0,0),('meatball','http://www.usemod.com/cgi-bin/mb.pl?$1','','',0,0),('mediawikiwiki','https://www.mediawiki.org/wiki/$1','','',0,0),('mediazilla','https://bugzilla.wikimedia.org/$1','','',0,0),('memoryalpha','http://en.memory-alpha.org/wiki/$1','','',0,0),('metawiki','http://sunir.org/apps/meta.pl?$1','','',0,0),('metawikimedia','https://meta.wikimedia.org/wiki/$1','','',0,0),('mozillawiki','http://wiki.mozilla.org/$1','','',0,0),('mw','http://www.mediawiki.org/wiki/$1','','',0,0),('oeis','http://oeis.org/$1','','',0,0),('openwiki','http://openwiki.com/ow.asp?$1','','',0,0),('ppr','http://c2.com/cgi/wiki?$1','','',0,0),('pythoninfo','http://wiki.python.org/moin/$1','','',0,0),('rfc','http://www.rfc-editor.org/rfc/rfc$1.txt','','',0,0),('s23wiki','http://s23.org/wiki/$1','','',0,0),('seattlewireless','http://seattlewireless.net/$1','','',0,0),('senseislibrary','http://senseis.xmp.net/?$1','','',0,0),('shoutwiki','http://www.shoutwiki.com/wiki/$1','','',0,0),('sourceforge','http://sourceforge.net/$1','','',0,0),('sourcewatch','http://www.sourcewatch.org/index.php?title=$1','','',0,0),('squeak','http://wiki.squeak.org/squeak/$1','','',0,0),('tejo','http://www.tejo.org/vikio/$1','','',0,0),('theopedia','http://www.theopedia.com/$1','','',0,0),('tmbw','http://www.tmbw.net/wiki/$1','','',0,0),('tmnet','http://www.technomanifestos.net/?$1','','',0,0),('twiki','http://twiki.org/cgi-bin/view/$1','','',0,0),('uea','http://uea.org/vikio/index.php/$1','','',0,0),('uncyclopedia','http://en.uncyclopedia.co/wiki/$1','','',0,0),('unreal','http://wiki.beyondunreal.com/$1','','',0,0),('usemod','http://www.usemod.com/cgi-bin/wiki.pl?$1','','',0,0),('webseitzwiki','http://webseitz.fluxent.com/wiki/$1','','',0,0),('wiki','http://c2.com/cgi/wiki?$1','','',0,0),('wikia','http://www.wikia.com/wiki/$1','','',0,0),('wikibooks','https://en.wikibooks.org/wiki/$1','','',0,0),('wikif1','http://www.wikif1.org/$1','','',0,0),('wikihow','http://www.wikihow.com/$1','','',0,0),('wikimedia','https://wikimediafoundation.org/wiki/$1','','',0,0),('wikinews','https://en.wikinews.org/wiki/$1','','',0,0),('wikinfo','http://wikinfo.co/English/index.php/$1','','',0,0),('wikipedia','https://en.wikipedia.org/wiki/$1','','',0,0),('wikiquote','https://en.wikiquote.org/wiki/$1','','',0,0),('wikisource','https://wikisource.org/wiki/$1','','',0,0),('wikispecies','https://species.wikimedia.org/wiki/$1','','',0,0),('wikiversity','https://en.wikiversity.org/wiki/$1','','',0,0),('wikivoyage','https://en.wikivoyage.org/wiki/$1','','',0,0),('wikt','https://en.wiktionary.org/wiki/$1','','',0,0),('wiktionary','https://en.wiktionary.org/wiki/$1','','',0,0);
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_text` varbinary(255) NOT NULL DEFAULT '',
  `ipb_reason` tinyblob NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iwlinks`
--

DROP TABLE IF EXISTS `iwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `iwl_from` (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iwlinks`
--

LOCK TABLES `iwlinks` WRITE;
/*!40000 ALTER TABLE `iwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `iwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_params` blob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT '0',
  `job_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_cache`
--

DROP TABLE IF EXISTS `l10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  KEY `lc_lang_key` (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_cache`
--

LOCK TABLES `l10n_cache` WRITE;
/*!40000 ALTER TABLE `l10n_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `l10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_search`
--

DROP TABLE IF EXISTS `log_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ls_field_val` (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_search`
--

LOCK TABLES `log_search` WRITE;
/*!40000 ALTER TABLE `log_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) unsigned NOT NULL DEFAULT '0',
  `log_user_text` varbinary(255) NOT NULL DEFAULT '',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment` varbinary(255) NOT NULL DEFAULT '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`),
  KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `type_action` (`log_type`,`log_action`,`log_timestamp`),
  KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  KEY `log_user_text_time` (`log_user_text`,`log_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_deps`
--

DROP TABLE IF EXISTS `module_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  UNIQUE KEY `md_module_skin` (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_deps`
--

LOCK TABLES `module_deps` WRITE;
/*!40000 ALTER TABLE `module_deps` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_resource`
--

DROP TABLE IF EXISTS `msg_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_resource` (
  `mr_resource` varbinary(255) NOT NULL,
  `mr_lang` varbinary(32) NOT NULL,
  `mr_blob` mediumblob NOT NULL,
  `mr_timestamp` binary(14) NOT NULL,
  UNIQUE KEY `mr_resource_lang` (`mr_resource`,`mr_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_resource`
--

LOCK TABLES `msg_resource` WRITE;
/*!40000 ALTER TABLE `msg_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_resource_links`
--

DROP TABLE IF EXISTS `msg_resource_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_resource_links` (
  `mrl_resource` varbinary(255) NOT NULL,
  `mrl_message` varbinary(255) NOT NULL,
  UNIQUE KEY `mrl_message_resource` (`mrl_message`,`mrl_resource`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_resource_links`
--

LOCK TABLES `msg_resource_links` WRITE;
/*!40000 ALTER TABLE `msg_resource_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_resource_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
INSERT INTO `objectcache` VALUES ('mediawiki:pcache:idhash:1-0!*!*!*!*!*!*','ΩV€n7Õ≥æÇŸ>( ÌEí/+Y@‡:∂+Vc\'y4Ë›ëƒöK.HÆe’–OË7ˆK:‰rÂïÏ\0ISƒvbkn<3úô√À4N“`FïuYô≤2A⁄?Lu:LÉ‚\ZL0“i<L–j\\N∆⁄()ì)‰å~bwå,©&∑\0ÇË*À@Îy≈˘ö0°\rÂÚﬁ8Ù.ùqà˛Â‰X\n]qCÃ»ò¸(r.9ó´Ä™`éÇõ[N≈]@2Nµ>\n(A91Y*òaXÄ°Ω¬(,ûûTã–~\nœÄó)d@L>`r?krZ±∆!ùêπTˇ/®aR¸©4 F ZŒÕä*Ë9ÿùÒ2¡‹K*\Z@≈™ªös&  ,?\nN¡åpÉy+y0Ò‚XtüåãUäXçÜÃù\\“S ô·üÒä£ ~!ƒ∂Ûd\"¨Œ∏‚ì1g[Õo+ﬂjµÍπ Ÿîü™wUB∆(OßÎ*¬\nßTT(¡íŒŸ¢RÆj7∫ÜáﬁíìFN8”∆÷{\"ºŒ¬¯ˆÕÔA´?Ò„sﬂ—tKcJùÜ°ÕMÔÙ^A/®p:€^·xó\n!+ëA\Z¢\0™ÅX7{Õ?∂\\2£x¢ª≤üÆö◊◊™@ÀJ·,o‰	¥ù5Í	˜Å6à«!6bß3~›ÌíŒ;XÕfòQ¡ÊYJe:«≥ƒ`µp‘–-%Q/ä∂ﬂ•»uÁ=ÿ\\v‘˝çzÜAî¥œøgö·<!s ÷’§§∆ë˚⁄6]Ä\0lÀ„É\'c©Õ?˝\r8ú9ÓÑåWh¶ŸüAòDá˚∏˚»Ì⁄ÄÓ\\CQbçÄ‡çTÆñ/ÿù±≈¥!.®∂ëCiñ)I¬A‘9y(•˜Ä≥o∑.ôc_∏πÒ‡\"Æ”Ì6µº¢˜`°5ˆÕ‹ñ2Krk≤πÌ¥töîÂ∏ìói‹ç^ˇÚÙMl~∂æ∏Läí$Q<åˆ„A¥7L¢»)ÿ∫\"ñì∏C,\0∑˚HM◊\\0qßÉM£ÙÒ3Íb‘cIR1h+\"ÀÃph(‰0mm9¸ºg£ÓDsNæ»my“íüÁ-Õ>*Œåÿ∂>@·[∆·\n® ñó•≠m[oÛ9Ò”≥A0¥îáƒ˜’§2biåiÏ˜”ˇqë˙†√¡\nj7üè∞á∞æwS5|òØÿ+.≤Ω\n˚∆8«Ç*Ï•ﬁ¬5rUì]0∫M£ë˜9C\"Ae˚Áù<µµﬁíû!Wü(ZÒmõLe^qÿméZzï)Vö∂Æˇ§3Îm∑·F5≈Ω≥”ê÷Ô7]_˘Gú·ùŒÆü]gR∂≥«N,>Q%Í∂hK}“N\Zßèì§òÃ£À»»å√=M\'•Åˇåá•AbcäÓŸ‚ãπÛ»≥)™‚îwãÉ:9<¥eàgÆdaÏ†∑Ü¸¶r[{ªÂ|é=Ó@Ì˜Î®»ñRÌÄÿºûFüõI>¡˜éO˘ZﬁÅÕ˚÷•Ê˙c¶d	 lÌÎu}y|v=Ω∞·B7íﬂÕb€^ÉA›OΩÂI}ZÇê_µü…Ø∞q±\Z3…Y∂nù”èûæqc»ü≠¢‰‡ô≠]Lé3~•Ü>Yæı¬rÎ{G≠ç≠ÎÇ¯–ﬁ/Íj⁄Ìfhçi˚+t§kˇN¢m≥NÕé]?â∑Ì “≥ØÂSóKR7!K˚ÆÈ_Õ≠#ü·∂˜Üêü˚<˜Ô˜w¸ëÆkÆˆTmx+H‰ÉxJvAíÌ ∆SIC„_c∑nw‘æÂùxÔAù¡‡ôcMˇ\rÌ;÷Ò¯ÿ÷¿áÿπ||„‹#Úclæª?hvá≥≥Ÿwvß|h∑€ªQ=Ai∑.›\r«ΩΩﬁ`3«ˆÈpÌÔˇìë4v¯Ñav¡⁄¿±Â`Àä8˜˙íÁS∫`ŸÀ^„Úﬁ?.Œsø˝ˇ','2015-07-15 06:52:00'),('mediawiki:pcache:idoptions:1','EéA\n¬0EÔ2(ìê¶u≤.§ Í>∂AlZ:Eî“ª€äª·Ωˇ?S—é`ÔÎg∏pÄ,MBJ¥W	M’è‹EÁ	iöÖ E‹¬ \'î®Ãf&›\n˜_JƒhT9 †Õ5‚Jıñ;|zæ‡òJkì+íÎ‚Ë9JıjN˛¡5∏;≠“n≈sxsz·ÿ§≤rÛ','2015-07-15 06:52:00');
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` tinyblob NOT NULL,
  `oi_user` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_user_text` varbinary(255) NOT NULL,
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_counter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,'Main_Page','',0,0,1,0.729620697874,'20150714065200','20150714065200',1,592,'wikitext',NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  UNIQUE KEY `pp_page_propname` (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_namespace`,`pl_title`,`pl_from_namespace`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` tinyblob,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL,
  UNIQUE KEY `pt_namespace_title` (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varbinary(255) NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_user_text` varbinary(255) NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment` varbinary(255) NOT NULL DEFAULT '',
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_source` varbinary(16) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
INSERT INTO `recentchanges` VALUES (1,'20150714065200',0,'MediaWiki default',0,'Main_Page','',0,0,1,1,1,0,1,'mw.new',0,'30.0.0.20',0,592,0,0,NULL,'','');
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` tinyblob NOT NULL,
  `rev_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_user_text` varbinary(255) NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_model` varbinary(32) DEFAULT NULL,
  `rev_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  UNIQUE KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,'',0,'MediaWiki default','20150714065200',0,0,592,0,'glba3g2evzm40dqnqxegze66eqibkvb',NULL,NULL);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'main page',' mediawiki hasu800 been successfully installed. consult theu800 metau82ewikimediau82eorgu800 wiki help contents user user\'su800 guide foru800 information onu800 using theu800 wiki software. getting started getting started getting started wwwu800u82emediawikiu82eorgu800 wiki special mylanguage manual configuration_settings configuration settings list wwwu800u82emediawikiu82eorgu800 wiki special mylanguage manual faqu800 mediawiki faqu800 mediawiki release mailing list wwwu800u82emediawikiu82eorgu800 wiki special mylanguage localisation#translation_resources localise mediawiki foru800 your language ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_identifiers`
--

DROP TABLE IF EXISTS `site_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_identifiers` (
  `si_site` int(10) unsigned NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  UNIQUE KEY `site_ids_type` (`si_type`,`si_key`),
  KEY `site_ids_site` (`si_site`),
  KEY `site_ids_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_identifiers`
--

LOCK TABLES `site_identifiers` WRITE;
/*!40000 ALTER TABLE `site_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_views` bigint(20) unsigned DEFAULT '0',
  `ss_total_edits` bigint(20) unsigned DEFAULT '0',
  `ss_good_articles` bigint(20) unsigned DEFAULT '0',
  `ss_total_pages` bigint(20) DEFAULT '-1',
  `ss_users` bigint(20) DEFAULT '-1',
  `ss_active_users` bigint(20) DEFAULT '-1',
  `ss_images` int(11) DEFAULT '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` VALUES (1,0,1,0,1,1,-1,0);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `sites_global_key` (`site_global_key`),
  KEY `sites_type` (`site_type`),
  KEY `sites_group` (`site_group`),
  KEY `sites_source` (`site_source`),
  KEY `sites_language` (`site_language`),
  KEY `sites_protocol` (`site_protocol`),
  KEY `sites_domain` (`site_domain`),
  KEY `sites_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(11) DEFAULT NULL,
  `ts_rev_id` int(11) DEFAULT NULL,
  `ts_tags` blob NOT NULL,
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  KEY `tl_backlinks_namespace` (`tl_namespace`,`tl_title`,`tl_from_namespace`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'<strong>MediaWiki has been successfully installed.</strong>\n\nConsult the [//meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]','utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcache`
--

DROP TABLE IF EXISTS `transcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` blob,
  `tc_time` binary(14) NOT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcache`
--

LOCK TABLES `transcache` WRITE;
/*!40000 ALTER TABLE `transcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
INSERT INTO `updatelog` VALUES ('filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),('image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),('oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),('updatelist-1.24.2-1436856720','a:0:{}'),('user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),('user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),('user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadstash`
--

DROP TABLE IF EXISTS `uploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) unsigned NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadstash`
--

LOCK TABLES `uploadstash` WRITE;
/*!40000 ALTER TABLE `uploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','',':pbkdf2:sha256:10000:128:At5/4zgDqMSFdOzhafp1hA==:dTre5WuBGW19B5Dz+4jd8f+P6YR3ZE4PVDYUZD/YffwA3xAaHFdb8LQjXGW7aFFECAY8f0/EP2J9MsPuwzR6HNfuigA6Gz2Nr+GaQNxE1DK+Qq6tUxEef/TpELnucKXm0pIafa66LXhgWPvjZWb2g+y/sJvcv9Ptbtxn+ZMcQjs=','',NULL,'','20150714065205','15498975f4e8a034a83fbea5a0c957b1',NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20150714065200',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_former_groups`
--

DROP TABLE IF EXISTS `user_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ufg_user_group` (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_former_groups`
--

LOCK TABLES `user_former_groups` WRITE;
/*!40000 ALTER TABLE `user_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ug_user_group` (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'bureaucrat'),(1,'sysop');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_newtalk` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_properties`
--

DROP TABLE IF EXISTS `user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_properties` (
  `up_user` int(11) NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob,
  UNIQUE KEY `user_properties_user_property` (`up_user`,`up_property`),
  KEY `user_properties_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_properties`
--

LOCK TABLES `user_properties` WRITE;
/*!40000 ALTER TABLE `user_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_tag`
--

DROP TABLE IF EXISTS `valid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valid_tag` (
  `vt_tag` varbinary(255) NOT NULL,
  PRIMARY KEY (`vt_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid_tag`
--

LOCK TABLES `valid_tag` WRITE;
/*!40000 ALTER TABLE `valid_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL,
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-14  7:01:08
