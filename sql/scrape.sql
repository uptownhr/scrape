-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: jien_scrape
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.10.1-log

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
-- Table structure for table `Authenticator`
--

DROP TABLE IF EXISTS `Authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authenticator` (
  `authenticator_id` int(11) NOT NULL AUTO_INCREMENT,
  `authenticator_user_id` int(11) DEFAULT NULL,
  `authenticator_secret` varchar(16) DEFAULT NULL,
  `authenticator_sms` varchar(64) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`authenticator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authenticator`
--

LOCK TABLES `Authenticator` WRITE;
/*!40000 ALTER TABLE `Authenticator` DISABLE KEYS */;
/*!40000 ALTER TABLE `Authenticator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `category` varchar(128) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `path` varchar(512) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`category_id`),
  KEY `path` (`path`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Datatype`
--

DROP TABLE IF EXISTS `Datatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Datatype` (
  `datatype_id` int(11) NOT NULL AUTO_INCREMENT,
  `datatype` varchar(32) NOT NULL,
  `rank` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`datatype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Datatype`
--

LOCK TABLES `Datatype` WRITE;
/*!40000 ALTER TABLE `Datatype` DISABLE KEYS */;
INSERT INTO `Datatype` VALUES (1,'Post',1,'2013-12-03 17:21:11','0000-00-00 00:00:00',NULL,1);
/*!40000 ALTER TABLE `Datatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Page`
--

DROP TABLE IF EXISTS `Page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `view_script` varchar(32) NOT NULL,
  `title` varchar(128) NOT NULL,
  `permalink` varchar(512) NOT NULL,
  `src` enum('none','file','html') NOT NULL DEFAULT 'file',
  `file` varchar(128) NOT NULL,
  `html` text NOT NULL,
  `rank` tinyint(4) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Page`
--

LOCK TABLES `Page` WRITE;
/*!40000 ALTER TABLE `Page` DISABLE KEYS */;
/*!40000 ALTER TABLE `Page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Post`
--

DROP TABLE IF EXISTS `Post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `body` text NOT NULL,
  `author` varchar(32) NOT NULL,
  `url` varchar(256) NOT NULL,
  `domain` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (1,'The Tricky Business Of Taxing Bitcoin - Forbes','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFDI-CwbbD65BVva8D6V2vqp8xDvg&amp;url=http://www.forbes.com/sites/greatspeculations/2013/12/03/the-tricky-business-of-taxing-bitcoin/\"><b>The Tricky Business Of Taxing <b>Bitcoin</b></b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">Forbes</font></b></font><br /><font size=\"-1\">While the Federal Reserve gave tacit approval, stating â€œvirtual currencies like <b>bitcoin</b> have legitimate uses and should not be banned,â€ the IRS has not yet issued tax guidance. Despite the lack of guidance, income from <b>bitcoin</b> transactions must be <b>...</b></font><br /><font size=\"-1\" class=\"p\"></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=dyP-2Gvlqr7sotM&amp;ned=us\"><nobr><b></b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNFDI-CwbbD65BVva8D6V2vqp8xDvg&url=http://www.forbes.com/sites/greatspeculations/2013/12/03/the-tricky-business-of-taxing-bitcoin/','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1),(2,'Here\'s what critics miss about Bitcoin\'s long-term potential - W','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNHmzhDGSQgFg8KuTTOFd_I0Mmp__w&amp;url=http://www.washingtonpost.com/blogs/the-switch/wp/2013/12/03/heres-what-critics-miss-about-bitcoins-long-term-potential/\"><img src=\"//t3.gstatic.com/images?q=tbn:ANd9GcT-Sa-LT3_JftOiFeYMN8kHHiHQlqovUXOX6m9DV9C_G_04UrZi8c7LIz8um4i9HhgrHmetwH8\" alt=\"\" border=\"1\" width=\"80\" height=\"80\" /><br /><font size=\"-2\">Washington Post (blog)</font></a></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNHmzhDGSQgFg8KuTTOFd_I0Mmp__w&amp;url=http://www.washingtonpost.com/blogs/the-switch/wp/2013/12/03/heres-what-critics-miss-about-bitcoins-long-term-potential/\"><b>Here&#39;s what critics miss about <b>Bitcoin&#39;s</b> long-term potential</b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">Washington Post (blog)</font></b></font><br /><font size=\"-1\">And anything gold can do <b>Bitcoin</b> can do better. In essence you&#39;ve combined the smuggling utility of pieces of paper with pictures of Ben Franklin on them with the inflation hedging properties of gold. That&#39;s a decent achievement. But it&#39;s not going to <b>...</b></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFXDPLDW35HHdOeQs6H9ZDeszDG4g&amp;url=http://www.newrepublic.com/article/115801/bernankes-bitcoin-comments-signal-growing-acceptance\"><b>Bitcoin&#39;s</b> Bandwagon Has Never Been More Crowded</a><font size=\"-1\" color=\"#6f6f6f\"><nobr>The New Republic</nobr></font></font><br /><font size=\"-1\" class=\"p\"></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=dbyhvwVwfyW2VGMxom1pjljsUv7hM&amp;ned=us\"><nobr><b>all 3 news articles&nbsp;&raquo;</b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNHmzhDGSQgFg8KuTTOFd_I0Mmp__w&url=http://www.washingtonpost.com/blogs/the-switch/wp/2013/12/03/heres-what-critics-miss-about-bitcoins-long-term-potential/','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1),(3,'Bitcoin And The Two Things You Need To Know - Forbes','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNGSWa0OvWYa8AHDxoFS5DWDlDCm7w&amp;url=http://www.forbes.com/sites/danreich/2013/12/03/bitcoin-and-the-two-things-you-need-to-know/\"><b><b>Bitcoin</b> And The Two Things You Need To Know</b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">Forbes</font></b></font><br /><font size=\"-1\">The discussions that are happening around <b>Bitcoin</b> feel a lot like those from the early days of the internet. It&#39;s like when my parents asked me about AOL dial-up. â€œWho is the computer calling? Now the questions are, â€œwhat are these <b>Bitcoins</b> and can I <b>...</b></font><br /><font size=\"-1\" class=\"p\"></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=d1Q2QeQKIZJUj6M&amp;ned=us\"><nobr><b></b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNGSWa0OvWYa8AHDxoFS5DWDlDCm7w&url=http://www.forbes.com/sites/danreich/2013/12/03/bitcoin-and-the-two-things-you-need-to-know/','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1),(4,'Bitcoin Can\'t Be a Better Dollar if It\'s a Newer Tulip - Busines','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFg8EPB-l_SBGHf-tN9qyQvZXw5ow&amp;url=http://www.businessweek.com/articles/2013-12-02/bitcoin-cant-be-a-better-dollar-if-its-a-newer-tulip\"><b><b>Bitcoin</b> Can&#39;t Be a Better Dollar if It&#39;s a Newer Tulip</b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">Businessweek</font></b></font><br /><font size=\"-1\">The price of <b>Bitcoin</b> as of today is $1,003â€”or at least it was as of the time I typed that last sentence. By now it could be worth significantly more or less. But as <b>Bitcoin</b> mania drives the price upward, a chorus of skeptics predictâ€”or openly pine <b>...</b></font><br /><font size=\"-1\" class=\"p\"></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=duOxlD--N9M3GIM&amp;ned=us\"><nobr><b></b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNFg8EPB-l_SBGHf-tN9qyQvZXw5ow&url=http://www.businessweek.com/articles/2013-12-02/bitcoin-cant-be-a-better-dollar-if-its-a-newer-tulip','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1),(5,'What Is Beijing\'s Rationale For Promoting Bitcoin? - Forbes','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNH6T47EVTU94IIWMQWEBFiURXHuxw&amp;url=http://www.businessinsider.com/bitcoin-mining-is-booming-chart-2013-12\"><img src=\"//t1.gstatic.com/images?q=tbn:ANd9GcQDLvB9uFXUfHQkhFFjF5FkT6oEunlrJWyWHGwkXacdbhMGHc71b3D5LWoTYKRixRrZuwcfXcf7\" alt=\"\" border=\"1\" width=\"80\" height=\"80\" /><br /><font size=\"-2\">Business Insider</font></a></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNGu7M7NOvJXBgNVMzxInUOW_nKKJg&amp;url=http://www.forbes.com/sites/quora/2013/12/03/what-is-beijings-rationale-for-promoting-bitcoin/\"><b>What Is Beijing&#39;s Rationale For Promoting <b>Bitcoin</b>?</b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">Forbes</font></b></font><br /><font size=\"-1\">There are several reasons for giving it higher visibility; most recently I&#39;ve noticed that China Telecom China Telecom, a Chinese state-owned enterprise (SOE) is accepting bill payments in <b>Bitcoin</b>. Here are some of the reasons: China&#39;s economy is too <b>...</b></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNH6T47EVTU94IIWMQWEBFiURXHuxw&amp;url=http://www.businessinsider.com/bitcoin-mining-is-booming-chart-2013-12\">The Amount Of Computing Power Dedicated To Mining <b>Bitcoin</b> Has Gone <b>...</b></a><font size=\"-1\" color=\"#6f6f6f\"><nobr>Business Insider</nobr></font></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFaMuR2ZhOIyULgCpwUPoJAUuwhNA&amp;url=http://www.cnbc.com/id/101237537\">Meet &#39;<b>Bitcoin</b> Jesus,&#39; a virtual currency millionaire</a><font size=\"-1\" color=\"#6f6f6f\"><nobr>CNBC.com</nobr></font></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNGdlrDuB23R2SUs2x_CDlylr7duvw&amp;url=http://www.theverge.com/2013/12/2/5167670/sheep-marketplace-bitcoin-heist-nets-at-least-5-million-owners-blamed\">Online black market members hunt down $100 million in...</a><font size=\"-1\" color=\"#6f6f6f\"><nobr>The Verge</nobr></font></font><br /><font size=\"-1\" class=\"p\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFZxiCoO2A6d-dlods0r0QFVZ073A&amp;url=http://boingboing.net/2013/12/03/tracking-96000-stolen-bitcoin.html\"><nobr>Boing Boing</nobr></a>&nbsp;-<a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNHHbPcXplAG0HB5cvoQnbtynhhEQw&amp;url=http://www.fastcodesign.com/3022540/the-insanity-of-bitcoin-explained\"><nobr>Co.Design</nobr></a>&nbsp;-<a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNF4mmU0z2GjU5bExjzS17CPqRobdw&amp;url=http://www.inquisitr.com/1050140/bitcoin-mining-scams-value-bubbles-and-7-5-million-lost-in-a-landfill/\"><nobr>The Inquisitr</nobr></a></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=dfwSlVDYJwJ4sRMGnGbO6xEikunxM&amp;ned=us\"><nobr><b>all 180 news articles&nbsp;&raquo;</b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNGu7M7NOvJXBgNVMzxInUOW_nKKJg&url=http://www.forbes.com/sites/quora/2013/12/03/what-is-beijings-rationale-for-promoting-bitcoin/','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1),(6,'One college football sign netted over $20000 in donations... - T','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFr4fPQob4mCZhsn1YbnRmlsamE3w&amp;url=http://www.ibtimes.com/college-football-sign-earns-26000-student-receives-bitcoin-donations-after-qr-code-featured-college\"><img src=\"//t2.gstatic.com/images?q=tbn:ANd9GcS4ud7jSmUAgbU0EH1zN6JcJXRZN8wrsQBZOLyCQiCIvyPTYQxPPwn9bPnLiWU3ttDlInBfjIk\" alt=\"\" border=\"1\" width=\"80\" height=\"80\" /><br /><font size=\"-2\">International Business Times</font></a></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFp5VaaBe6qMgqf-P5bbtG8_w65og&amp;url=http://www.theverge.com/2013/12/1/5163926/one-college-football-sign-netted-22-bitcoins-for-enthusiast\"><b>One college football sign netted over $20000 in donations...</b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">The Verge</font></b></font><br /><font size=\"-1\">After significant publicity and a rapidly appreciating conversion rate, <b>Bitcoin</b> is a widely recognized phenomenon. But to some extent it&#39;s also still a geeky crypto-currency held by a relatively small number of people â€” who, at least in a recent case <b>...</b></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNF_wXBr3ve226AxqpRapqc_LjHAMg&amp;url=http://bleacherreport.com/articles/1872958-football-fans-clever-bitcoin-sign-on-espns-college-gameday-nets-over-20k\">Football Fan&#39;s Clever <b>Bitcoin</b> Sign on ESPN&#39;s &#39;College GameDay&#39; Nets over $20K</a><font size=\"-1\" color=\"#6f6f6f\"><nobr>Bleacher Report</nobr></font></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFCj9C26RsXLNNziMl7ZRDpDD9_wA&amp;url=http://www.zdnet.com/football-fan-holds-up-qr-code-gets-23k-in-bitcoin-7000023858/\">Football fan holds up QR code, gets $23K in <b>Bitcoin</b></a><font size=\"-1\" color=\"#6f6f6f\"><nobr>ZDNet</nobr></font></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFr4fPQob4mCZhsn1YbnRmlsamE3w&amp;url=http://www.ibtimes.com/college-football-sign-earns-26000-student-receives-bitcoin-donations-after-qr-code-featured-college\">College Football Sign Earns $26000: Student Receives <b>Bitcoin</b> Donations After <b>...</b></a><font size=\"-1\" color=\"#6f6f6f\"><nobr>International Business Times</nobr></font></font><br /><font size=\"-1\" class=\"p\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFVaW9H3ABUwKlWsXnLwmPewrJyoQ&amp;url=http://www.seattlepi.com/technology/businessinsider/article/This-College-Kid-Made-Over-24-000-Yesterday-Just-5025855.php\"><nobr>Seattle Post Intelligencer</nobr></a>&nbsp;-<a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFFAX-y1lnAhPsMpxC48TWYFcrHWw&amp;url=http://www.businessinsider.com/someone-holding-bitcoin-sign-on-college-gameday-receives-over-22-bitcoins-2013-12\"><nobr>Business Insider</nobr></a></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=dL1bGsBwl74QaxMyIaSO2K229HjWM&amp;ned=us\"><nobr><b>all 28 news articles&nbsp;&raquo;</b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNFp5VaaBe6qMgqf-P5bbtG8_w65og&url=http://www.theverge.com/2013/12/1/5163926/one-college-football-sign-netted-22-bitcoins-for-enthusiast','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1),(7,'The secret Hong Kong facility that uses boiling goo to mine Bitc','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNGv0m60U4QrADPLZ4MeMl9LEy8Eqg&amp;url=http://www.ibtimes.com/secret-bitcoin-mine-chinese-facility-uses-boiling-liquid-cool-massive-computers-generate-bitcoins\"><img src=\"//t0.gstatic.com/images?q=tbn:ANd9GcRfCpGp3N0jH00Pbc6HCveNCMNvk3vGKREuGgj-zWfP6rBPQBdHc_-RlEYbQ68PEXqPXNaHKgIi\" alt=\"\" border=\"1\" width=\"80\" height=\"80\" /><br /><font size=\"-2\">International Business Times</font></a></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFP68P2o0uhEfqk3XMjUHYPD5CuUQ&amp;url=http://www.theverge.com/2013/12/2/5165428/bitcoin-mine-in-hong-kong-uses-jelly-to-keep-cool\"><b>The secret Hong Kong facility that uses boiling goo to mine <b>Bitcoins</b></b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">The Verge</font></b></font><br /><font size=\"-1\">Serious miners have started to build dedicated facilities for the sole purpose of <b>Bitcoin</b> mining. Journalist Xiaogang Cao visited one such center in Hong Kong, the &quot;secret mining facility&quot; of ASICMINER, reportedly located in a Kwai Chung industrial <b>...</b></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNGv0m60U4QrADPLZ4MeMl9LEy8Eqg&amp;url=http://www.ibtimes.com/secret-bitcoin-mine-chinese-facility-uses-boiling-liquid-cool-massive-computers-generate-bitcoins\">Secret <b>Bitcoin</b> Mine: Chinese Facility Uses Boiling Liquid To Cool Massive <b>...</b></a><font size=\"-1\" color=\"#6f6f6f\"><nobr>International Business Times</nobr></font></font><br /><font size=\"-1\" class=\"p\"></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=dGdWeXT5Z63dSJMUPUQg3MYIVsStM&amp;ned=us\"><nobr><b>all 3 news articles&nbsp;&raquo;</b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNFP68P2o0uhEfqk3XMjUHYPD5CuUQ&url=http://www.theverge.com/2013/12/2/5165428/bitcoin-mine-in-hong-kong-uses-jelly-to-keep-cool','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1),(8,'Sneaky software turns your PC into a Bitcoin-mining zombie -- an','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNEAXOtPx6Tk3hXd-ugPmqlX-KGoxg&amp;url=http://www.theguardian.com/technology/2013/dec/02/bitcoin-mining-malwarebytes-app-pc\"><img src=\"//t1.gstatic.com/images?q=tbn:ANd9GcQOm7wMCul8R0NE3z1gtPNXiELOcaAW4IxR_A5DyalvJO11sb8IyLzCXrys856Pfdvl0xSahV8\" alt=\"\" border=\"1\" width=\"80\" height=\"80\" /><br /><font size=\"-2\">The Guardian</font></a></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNEFa0A3HQW5Kkl0zA7wf4-EbRPalA&amp;url=http://www.pcworld.com/article/2068102/sneaky-software-turns-your-pc-into-a-bitcoin-mining-zombie-and-owns-up-to-it-in-the-eula.html\"><b>Sneaky software turns your PC into a <b>Bitcoin</b>-mining zombie -- and owns up to <b>...</b></b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">PCWorld (blog)</font></b></font><br /><font size=\"-1\">As the <b>Bitcoin</b> bubble inflates to over $1,000 per unit, legions of newcomers are scrambling to join the digital gold rush. For some companies, that means accepting the currency at online checkout counters; for others, it means releasing PC hardware <b>...</b></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNEAXOtPx6Tk3hXd-ugPmqlX-KGoxg&amp;url=http://www.theguardian.com/technology/2013/dec/02/bitcoin-mining-malwarebytes-app-pc\"><b>Bitcoin</b> mining malware could be hidden in app, security researchers warn</a><font size=\"-1\" color=\"#6f6f6f\"><nobr>The Guardian</nobr></font></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNGUwCsGNY-fAsMqxLd3zqvZEDw0fA&amp;url=http://venturebeat.com/2013/12/02/pup-bitcoin-miner/\">You may have just given a toolbar permission to mine <b>Bitcoins</b> from your computer</a><font size=\"-1\" color=\"#6f6f6f\"><nobr>VentureBeat</nobr></font></font><br /><font size=\"-1\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNGLJFBqwMon_4y8svX7OFu3I1cQRA&amp;url=http://techcrunch.com/2013/12/01/yourfreeproxy-is-caught-installing-a-toolbar-that-mines-bitcoin-on-the-sly/\">YourFreeProxy Is Caught Installing A Toolbar That Mines <b>Bitcoin</b> On The Sly</a><font size=\"-1\" color=\"#6f6f6f\"><nobr>TechCrunch</nobr></font></font><br /><font size=\"-1\" class=\"p\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNGrRzyRNmOa3J2YQ70BVgni0YMDGA&amp;url=http://www.tomsguide.com/us/security-bitcoins-toolbars-malwarebytes-bitcoin-mining,news-17936.html\"><nobr>Tom\'s Guide</nobr></a>&nbsp;-<a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNF5exsR893x5e58urZZmmAO802X8g&amp;url=http://www.slashgear.com/bitcoin-mined-from-computers-via-toolbar-without-users-knowledge-02307340/\"><nobr>SlashGear</nobr></a>&nbsp;-<a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNEjfuG4doejnqU_PvLdf5bW2xlTdg&amp;url=http://boingboing.net/2013/12/01/apps-come-bundled-with-secret.html\"><nobr>Boing Boing</nobr></a></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=dh395vDfsdZm8NMP5Fj7SOqLYJS1M&amp;ned=us\"><nobr><b>all 32 news articles&nbsp;&raquo;</b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNEFa0A3HQW5Kkl0zA7wf4-EbRPalA&url=http://www.pcworld.com/article/2068102/sneaky-software-turns-your-pc-into-a-bitcoin-mining-zombie-and-owns-up-to-it-in-the-eula.html','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1),(9,'Bitcoin, Gold and Tulips - Barron\'s','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFvt2q6nR4WyC8bY8bYUw3DvEwLDg&amp;url=http://online.barrons.com/article/SB50001424053111903302604579233990748865878.html?mod%3DBOL_twm_da\"><b><b>Bitcoin</b>, Gold and Tulips</b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">Barron\'s</font></b></font><br /><font size=\"-1\">In January, <b>bitcoin</b> was trading around $13. By November, it was at $200, and it had soared past $1,200 by Thanksgiving before backing down. Is <b>bitcoin</b> the wave of the future, or nothing more than digital tulips? One look at the chart says the present <b>...</b></font><br /><font size=\"-1\" class=\"p\"></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=dfjZjOoIAdjbpuM&amp;ned=us\"><nobr><b></b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNFvt2q6nR4WyC8bY8bYUw3DvEwLDg&url=http://online.barrons.com/article/SB50001424053111903302604579233990748865878.html?mod%3DBOL_twm_da','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1),(10,'Bitcoin fever is a fool\'s gold rush - MarketWatch','<table border=\"0\" cellpadding=\"2\" cellspacing=\"7\" style=\"vertical-align:top;\"><tr><td width=\"80\" align=\"center\" valign=\"top\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFrEotnx9PwmiwVx_xdS8-4AL35Gw&amp;url=http://www.marketwatch.com/story/bitcoin-fever-is-a-fools-gold-rush-2013-12-03\"><img src=\"//t3.gstatic.com/images?q=tbn:ANd9GcRgpSqyfx5-D5F-5r1Rcxs0XE2DJRUP_PvGfimEHK6nF6vPLJGtXa_boy66_sjf2x3DHoS6sz04\" alt=\"\" border=\"1\" width=\"80\" height=\"80\" /><br /><font size=\"-2\">MarketWatch</font></a></font></td><td valign=\"top\" class=\"j\"><font style=\"font-size:85%;font-family:arial,sans-serif\"><br /><div style=\"padding-top:0.8em;\"><img alt=\"\" height=\"1\" width=\"1\" /></div><div class=\"lh\"><a href=\"http://news.google.com/news/url?sa=t&amp;fd=R&amp;usg=AFQjCNFrEotnx9PwmiwVx_xdS8-4AL35Gw&amp;url=http://www.marketwatch.com/story/bitcoin-fever-is-a-fools-gold-rush-2013-12-03\"><b><b>Bitcoin</b> fever is a fool&#39;s gold rush</b></a><br /><font size=\"-1\"><b><font color=\"#6f6f6f\">MarketWatch</font></b></font><br /><font size=\"-1\"><b>Bitcoin</b>, it turns out, doesn&#39;t seem to be going away soon. To the contrary, it&#39;s becoming more popular and well known. There are more than 12 million <b>bitcoins</b> in circulation worth more than $12 billion. And the more people know about virtual currency <b>...</b></font><br /><font size=\"-1\" class=\"p\"></font><br /><font class=\"p\" size=\"-1\"><a class=\"p\" href=\"http://news.google.com/news/more?ncl=d9ZnN_uMpc3-osM&amp;ned=us\"><nobr><b></b></nobr></a></font></div></font></td></tr></table>','Tommy Lee','http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNFrEotnx9PwmiwVx_xdS8-4AL35Gw&url=http://www.marketwatch.com/story/bitcoin-fever-is-a-fools-gold-rush-2013-12-03','news.google.com','2013-12-03 17:27:05','0000-00-00 00:00:00',NULL,1);
/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provider`
--

DROP TABLE IF EXISTS `Provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provider` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL,
  `deleted` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provider`
--

LOCK TABLES `Provider` WRITE;
/*!40000 ALTER TABLE `Provider` DISABLE KEYS */;
INSERT INTO `Provider` VALUES (1,'website','2011-11-02 05:16:23','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(2,'facebook','2011-11-02 05:16:48','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(3,'twitter','2011-11-02 05:16:53','0000-00-00 00:00:00','0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `Provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(32) NOT NULL,
  `parent_id` tinyint(4) NOT NULL,
  `mptt_left` int(11) DEFAULT NULL,
  `mptt_right` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL,
  `deleted` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'guest',0,11,12,'2011-10-27 02:13:00','2013-09-27 15:05:25','0000-00-00 00:00:00',1),(2,'member',1,10,13,'2011-10-27 02:13:10','2011-11-06 20:20:16','0000-00-00 00:00:00',1),(3,'vip',2,9,14,'2011-10-27 02:13:41','2012-11-07 17:35:48','0000-00-00 00:00:00',1),(10,'moderator',3,8,15,'2011-10-27 02:13:47','2013-11-14 00:56:04','0000-00-00 00:00:00',1),(11,'admin',10,1,16,'2011-10-27 02:13:52','2011-11-06 20:20:35','0000-00-00 00:00:00',1),(12,'staff',0,2,7,'2013-11-20 16:33:48','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(13,'underwriter',0,3,4,'2013-11-20 16:33:48','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(14,'accounting',0,5,6,'2013-11-20 16:33:48','0000-00-00 00:00:00','0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL DEFAULT '1',
  `uid` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '1',
  `username` varchar(64) NOT NULL,
  `password` varchar(60) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `email` varchar(64) NOT NULL,
  `birthday` date DEFAULT NULL,
  `b_fname` varchar(64) NOT NULL,
  `b_lname` varchar(64) NOT NULL,
  `b_addr1` varchar(128) NOT NULL,
  `b_addr2` varchar(128) NOT NULL,
  `b_city` varchar(128) NOT NULL,
  `b_state` varchar(2) NOT NULL,
  `b_zip` int(11) NOT NULL,
  `b_country` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `comment` text,
  `token` varchar(1024) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `accessed` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (5,1,0,11,'admin','$2a$08$LtbZ7x22f4uYzlBJz.2nBuIg2L5HiX0APDWPJZT0Tv1pkVvs6BYqS','male','admin@demo.com','1982-01-06','jien','framework','123 abc','#101','abc city','CA',90000,'United States','1231231234','Test','','2011-10-11 15:40:41','2013-11-20 15:06:19','0000-00-00 00:00:00','2013-11-20 15:06:19',1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-03 17:27:42
