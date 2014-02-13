-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: jien_scrape
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.10.1

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Datatype`
--

LOCK TABLES `Datatype` WRITE;
/*!40000 ALTER TABLE `Datatype` DISABLE KEYS */;
INSERT INTO `Datatype` VALUES (2,'Scrapesource',2,'2013-12-04 14:39:23','0000-00-00 00:00:00',NULL,1),(4,'Post',3,'2013-12-04 15:08:08','0000-00-00 00:00:00',NULL,1),(9,'Site',4,'2014-01-29 18:45:45','0000-00-00 00:00:00',NULL,1);
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
  `scrapesource_id` int(11) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `url` varchar(256) NOT NULL,
  `domain` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `author` varchar(128) NOT NULL,
  `date` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `Postcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `url` (`url`,`scrapesource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (1,1,1,'http://www.reddit.com/r/litecoin/comments/1s9zsu/announcement_someone_donated_some_litecoins_to/','www.reddit.com','Announcement: Someone donated some Litecoins to ALTcointip bot\'s faucet, come redeem your karma!','<!-- SC_OFF --><div class=\"md\"><p>Hey <strong><a href=\"/r/Litecoin\">/r/Litecoin</a></strong>,</p> <p>A few days ago an anonymous donor sent me a few Litecoins as a thanks for running the ALTcointip bot. I&#39;ve decided to put some of that funds into the ALTcointip bot&#39;s redeem karma faucet, so come claim your karma!</p> <p>I will also tip a few of the most helpful/fun/insightful posts in this subreddit!</p> <p>To redeem your karma, you&#39;ll need to <strong><a href=\"http://www.reddit.com/message/compose?to=ALTcointip&amp;subject=register&amp;message=%2Bregister\">+register</a></strong> with the bot first, which will create an account and generate your unique deposit addresses. Then you can send a <strong><a href=\"http://www.reddit.com/message/compose?to=ALTcointip&amp;subject=redeem&amp;message=%2Bredeem%20litecoin\">+redeem</a></strong> command to have your karma converted into Litecoins! Finally, you can either hold on to your shiny new coins, or tip others!</p> <p>Visit <strong><a href=\"/r/ALTcointip\">/r/ALTcointip</a></strong> for more information about the bot.</p> <p>Good luck, and happy tipping!</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/im14\"> im14 </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9zsu/announcement_someone_donated_some_litecoins_to/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9zsu/announcement_someone_donated_some_litecoins_to/\">[11 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(2,1,1,'http://www.reddit.com/r/litecoin/comments/1s8z61/feeling_good_about_thishow_many_khs_do_you_think/','www.reddit.com','Feeling Good About This...How Many KH/s Do You Think It Can Do?','<table> <tr><td> <a href=\"http://www.reddit.com/r/litecoin/comments/1s8z61/feeling_good_about_thishow_many_khs_do_you_think/\"><img src=\"http://d.thumbs.redditmedia.com/I63v-qQQpevu_uRK.jpg\" alt=\"Feeling Good About This...How Many KH/s Do You Think It Can Do?\" title=\"Feeling Good About This...How Many KH/s Do You Think It Can Do?\" /></a> </td><td> submitted by <a href=\"http://www.reddit.com/user/SuperJackpot\"> SuperJackpot </a> <br/> <a href=\"http://imgur.com/BtjRJ1z\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s8z61/feeling_good_about_thishow_many_khs_do_you_think/\">[50 comments]</a> </td></tr></table>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(3,1,1,'http://www.reddit.com/r/litecoin/comments/1saazb/crowdfunding_campaign_to_put_pressure_on_bitcoin/','www.reddit.com','Crowdfunding Campaign To Put Pressure On Bitcoin Exchanges To Support Litecoin','<!-- SC_OFF --><div class=\"md\"><p>Why don&#39;t we crowd fund a publicity campaign?</p> <ol> <li>We could put rent out billboard space close to all the big exchanges / Bitpays head offices.</li> <li>We could superglue physical litecoins to the pavement of all the office car parks / bus stops at the offices</li> <li>We could hire someone wearing a Litecoin sandwich board to hangout right outside each office from 9-6pm</li> <li>Rent an outdoor projector and project the Litecoin logo on the offices and/or famous buildings</li> </ol> <p>Providing we raised enough money (a little from the whole community) we could cause enough of a stir to get some real media attention.</p> <p>What do you think? More suggestions please........ :)</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/greens27\"> greens27 </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1saazb/crowdfunding_campaign_to_put_pressure_on_bitcoin/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1saazb/crowdfunding_campaign_to_put_pressure_on_bitcoin/\">[2 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(4,1,1,'http://www.reddit.com/r/litecoin/comments/1s97au/just_saw_05_ltc_sell_for_5000_on_ebay/','www.reddit.com','Just saw 0.5 LTC sell for $5000 on Ebay....','<table> <tr><td> <a href=\"http://www.reddit.com/r/litecoin/comments/1s97au/just_saw_05_ltc_sell_for_5000_on_ebay/\"><img src=\"http://a.thumbs.redditmedia.com/DDGpbK8GoJbGA-Px.jpg\" alt=\"Just saw 0.5 LTC sell for $5000 on Ebay....\" title=\"Just saw 0.5 LTC sell for $5000 on Ebay....\" /></a> </td><td> submitted by <a href=\"http://www.reddit.com/user/ranger111133\"> ranger111133 </a> <br/> <a href=\"http://www.ebay.com/itm/0-5-Litecoin-0-5-LTC-/291032134008?pt=US_World_Coins&amp;hash=item43c2ddf178&amp;autorefresh=true\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s97au/just_saw_05_ltc_sell_for_5000_on_ebay/\">[27 comments]</a> </td></tr></table>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(5,1,1,'http://www.reddit.com/r/litecoin/comments/1s93o4/this_is_what_i_like_to_see_when_im_sitting_on_a/','www.reddit.com','This is what I like to see when I\'m sitting on a lot of USD','<table> <tr><td> <a href=\"http://www.reddit.com/r/litecoin/comments/1s93o4/this_is_what_i_like_to_see_when_im_sitting_on_a/\"><img src=\"http://b.thumbs.redditmedia.com/-gE6nygyXdQQC7Bg.jpg\" alt=\"This is what I like to see when I\'m sitting on a lot of USD\" title=\"This is what I like to see when I\'m sitting on a lot of USD\" /></a> </td><td> submitted by <a href=\"http://www.reddit.com/user/gteh420\"> gteh420 </a> <br/> <a href=\"http://i.imgur.com/QNg6yLH.jpg\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s93o4/this_is_what_i_like_to_see_when_im_sitting_on_a/\">[19 comments]</a> </td></tr></table>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(6,1,1,'http://www.reddit.com/r/litecoin/comments/1sabxg/the_quickly_increasing_difficulty_is_scaring_me/','www.reddit.com','The quickly increasing difficulty is scaring me to not start mining.','<!-- SC_OFF --><div class=\"md\"><p>i&#39;m planning to buy 2x a R9 290X, 100361SR card tomorrow. and Start to mine asap. But the quick difficulty increase is scaring me. Can anyone explain to me if it is still worth it? or if i missed the boat already?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/Gothlike\"> Gothlike </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sabxg/the_quickly_increasing_difficulty_is_scaring_me/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sabxg/the_quickly_increasing_difficulty_is_scaring_me/\">[3 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(7,1,1,'http://www.reddit.com/r/litecoin/comments/1s8qsi/post_a_pic_of_your_miner/','www.reddit.com','Post a pic of your miner.','<!-- SC_OFF --><div class=\"md\"><p><a href=\"http://i.imgur.com/xWWJ1C0.jpg\">Here&#39;s mine.</a></p> <p>We call it the Pampers Miner!</p> <p>It&#39;s 3x 7950. It takes cold air from outside and heat the room. We got it stable at +-70 celcius. Depends on the outside temp.</p> <p>What about yours?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/laristocrate\"> laristocrate </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1s8qsi/post_a_pic_of_your_miner/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s8qsi/post_a_pic_of_your_miner/\">[116 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(8,1,1,'http://www.reddit.com/r/litecoin/comments/1sa7p4/2_college_students_arrested_for_mining_on_1/','www.reddit.com','2 college students arrested for mining on 1 school computer today...','<!-- SC_OFF --><div class=\"md\"><p>So my friend and I have had a pretty litecoin-related day. Heâ€™s a CS major, and Iâ€™m IT. We go to a uni in the midwest, have had class together, and decided we wanted to mine some litecoin.</p> <p>Usually, I wouldnâ€™t spoil it, but Iâ€™ll tell you the ending first.</p> <p>We each get arrested and given summons for two charges a piece. Tampering with computer users to defraud or obtain property Tampering with computer data</p> <p>Those charges sound vague, and thatâ€™s because they are. Now let me tell you the story from the beginning.</p> <p>We were trying to figure out how much litecoin could be mined from our personal laptops, realized itâ€™s inefficiency, so then decided to investigate all the beefier-built machines we had at our disposal and again realized we were getting nowhere.</p> <p>We then decide to maybe run a miner overnight on a school computer, and see how well it works because lots of the computers in our schools journalism department are well built for video editing, rendering, and things of the sort. So to do this, we sit down and reset the local admin password on the machine (Mac 27â€) so we can install the mining software. Itâ€™s very easy to do, google it. Then we installed asteroid, configured it, and installed InsomniaX as well to keep the computer from automatically sleeping or logging out. Then we set an reset timer so the machine would automatically restart at 7am, before any class would start, and the computer would be regularly usable. We then changed the lock screen message to read something along the lines of â€˜this computer is temporarily unavailableâ€™.</p> <p>Overnight, somebody noticed. That somebody was in IT, and called our Uniâ€™s PD. Now we are being charged with the above listed: Tampering with computer users to defraud or obtain property Tampering with computer data</p> <p>We understand we changed the local admin password, that was wrong, but all of this? We talked to the IT department, and got to speak with the incident manager, but all he could say was to wait for the meeting with the school, and then the court date.</p> <p>There was no malicious intent, and we did it just to see how it worked. It was purely educational, as it should be allowed in a school. We didnâ€™t have the intensity maxed out either, so I canâ€™t see the real harm to the machine compared to HD Video rendering thatâ€™s done daily. It ran for about 6 hours overnight too btw.</p> <p>We can already see this getting too out of hand, and not really having any options. Iâ€™m not rich, and in fact weâ€™re both college-kid poor, so the courtâ€™s costs by themselves are already scary.</p> <p>We just felt like you guys would understand, and would like some advice.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/elggurts\"> elggurts </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sa7p4/2_college_students_arrested_for_mining_on_1/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sa7p4/2_college_students_arrested_for_mining_on_1/\">[16 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(9,1,1,'http://www.reddit.com/r/litecoin/comments/1s9bf4/10_dollar_give_away_in_ltc_submit_answers_by/','www.reddit.com','$10 Dollar Give Away in LTC! Submit Answers By 11:00PM Est!','submitted by <a href=\"http://www.reddit.com/user/OMGnohedidnt\"> OMGnohedidnt </a> <br/> <a href=\"http://www.reddit.com/r/LitecoinProjects/comments/1s7v1r/contest_10_given_away_1100pm_126/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9bf4/10_dollar_give_away_in_ltc_submit_answers_by/\">[16 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(10,1,1,'http://www.reddit.com/r/litecoin/comments/1s96ux/hey_guys_were_building_useful_sites_for_the/','www.reddit.com','Hey guys, we\'re building useful sites for the Litecoin community! Our first release at Cointerest.org: find where to spend your ','<!-- SC_OFF --><div class=\"md\"><p>Hey guys, <a href=\"/u/nickkthequick\">/u/nickkthequick</a> and I recently got into Litecoin and are loving this community! Thanks to <a href=\"/u/anarcoin\">/u/anarcoin</a> and <a href=\"/r/litecoinprojects\">/r/litecoinprojects</a>, we had the opportunity to update coinmap for Litecoin.</p> <p>We decided that we wanted to take a different approach from coinmap. We&#39;re aiming for a highly scalable, user friendly map where the goal is to both display current merchants that sell using Litecoin/Bitcoin and also to facilitate more merchants accepting the coins.</p> <p>Check it out at <a href=\"http://cointerest.org\">http://cointerest.org</a> and let us know what you think! We&#39;ll be adding the ability to add new merchants later today. We&#39;re really looking forward to your comments and suggestions -- let&#39;s build a great thing together!</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/Phecalfeliac\"> Phecalfeliac </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1s96ux/hey_guys_were_building_useful_sites_for_the/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s96ux/hey_guys_were_building_useful_sites_for_the/\">[3 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(11,1,1,'http://www.reddit.com/r/litecoin/comments/1s92mq/its_times_like_these_that_im_glad_i_have_a_cold/','www.reddit.com','It\'s times like these that I\'m glad I have a cold wallet','<!-- SC_OFF --><div class=\"md\"><p>With the recent price downtrend, I&#39;m glad I don&#39;t have any LTCs on exchanges, as I could be tempted to trade following emotions rather than my initial plan. </p> <p>For those who are selling right now, why are you doing so? Is is to try your hand at daily trading (buy high sell low), is it because you&#39;re taking some profits off the table or is it because you lost confidence in LTC?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/Eljoka\"> Eljoka </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1s92mq/its_times_like_these_that_im_glad_i_have_a_cold/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s92mq/its_times_like_these_that_im_glad_i_have_a_cold/\">[17 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(12,1,1,'http://www.reddit.com/r/litecoin/comments/1saamb/i_know_this_has_probably_been_asked_a_lot_but/','www.reddit.com','I know this has probably been asked a lot, but with Litecoin network difficulty rapidly increasing (looking like it will reach 5','<!-- SC_OFF --><div class=\"md\"><p>I&#39;m interested and certainly capable of building a 6 GPU mining system, but after looking at recent charts for Litecoin network difficulty it seems to me like it will not be worth the trouble very soon. It&#39;s already topping 2000 and climbing very fast.</p> <p>From what I understand if it gets to be about 4-5k then it&#39;s not really worth building a system you&#39;ll only barely break even. Any thoughts appreciated.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/tcdoey\"> tcdoey </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1saamb/i_know_this_has_probably_been_asked_a_lot_but/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1saamb/i_know_this_has_probably_been_asked_a_lot_but/\">[2 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(13,1,1,'http://www.reddit.com/r/litecoin/comments/1s9z3z/fontas_was_arrested_goodbye_trollbox_no_more/','www.reddit.com','Fontas was arrested == \"Goodbye Trollbox. No more pumps. All accounts wiped. Authorities found me. I got fontased\"','<!-- SC_OFF --><div class=\"md\"><p>These were his final two messages: fontas 25503109 11 Hours Ago == Court hearing in a week == fontas 25502595 11 Hours Ago == Goodbye Trollbox. No more pumps. All accounts wiped. Authorities found me. I got fontased ==</p> <p>proof: <a href=\"http://trollboxarchive.com/search.php?search_type=username&amp;search=fontas\">http://trollboxarchive.com/search.php?search_type=username&amp;search=fontas</a></p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/bitcoinjj\"> bitcoinjj </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9z3z/fontas_was_arrested_goodbye_trollbox_no_more/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9z3z/fontas_was_arrested_goodbye_trollbox_no_more/\">[5 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(14,1,1,'http://www.reddit.com/r/litecoin/comments/1s9b2s/how_to_understand_charts/','www.reddit.com','How to understand charts?','submitted by <a href=\"http://www.reddit.com/user/hackersofgrowth\"> hackersofgrowth </a> <br/> <a href=\"http://cryptocurrenciestalk.com/t/how-to-understand-bitcoinwisdom-charts/9\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9b2s/how_to_understand_charts/\">[1 comment]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(15,1,1,'http://www.reddit.com/r/litecoin/comments/1s9mpw/speculation_do_you_guys_see_it_midas_is_coming/','www.reddit.com','Speculation: Do you guys see it? Midas is coming','<!-- SC_OFF --><div class=\"md\"><p>After this afternoon&#39;s 60 minute lag they will have to schedule the launch ahead to save face. There are 10 million USD buy/sell orders which cannot be left to trade on some mickey mouse engine.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/litecoin123\"> litecoin123 </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9mpw/speculation_do_you_guys_see_it_midas_is_coming/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9mpw/speculation_do_you_guys_see_it_midas_is_coming/\">[9 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(16,1,1,'http://www.reddit.com/r/litecoin/comments/1sa425/amd_conspiracy/','www.reddit.com','AMD Conspiracy?','<!-- SC_OFF --><div class=\"md\"><p>Before anyone takes this seriously, I mean this post mostly as a joke.</p> <p>That said, what if AMD bid up the price of litecoin to drive GPU sales? Litecoin is/was small enough that it would not be too difficult to manipulate or pump. The recent litecoin craze has likely driven thousands of GPU sales (see: all of the out of stock AMD GPUs on most retail websites), meaning real $ for AMD.</p> <p>Just some food for thought.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/mvnman\"> mvnman </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sa425/amd_conspiracy/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sa425/amd_conspiracy/\">[5 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(17,1,1,'http://www.reddit.com/r/litecoin/comments/1sa12y/80000_litecoins_currently_beeing_sold_for_30_btce/','www.reddit.com','80000. Litecoins currently beeing sold for 30$ @ BTC-e','<!-- SC_OFF --><div class=\"md\"><p>What is this? <a href=\"http://bitcoinwisdom.com/markets/btce/ltcusd\">http://bitcoinwisdom.com/markets/btce/ltcusd</a></p> <p>edit: has been canceled. About 15k coins got sold.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/gergi\"> gergi </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sa12y/80000_litecoins_currently_beeing_sold_for_30_btce/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sa12y/80000_litecoins_currently_beeing_sold_for_30_btce/\">[2 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(18,1,1,'http://www.reddit.com/r/litecoin/comments/1s9z3m/stolen_litecoins/','www.reddit.com','Stolen Litecoins','<!-- SC_OFF --><div class=\"md\"><p>Sup m8s</p> <p>I just wanted say that my account on BTC-E got compromised and I lost 17.5x Litecoins, which is quite a lot of money for me, everything I had actually.</p> <p>Here is some data about the hacker that logged into my account:</p> <p>Login: --- IP: 169.204.207.81 Date and time: 07.12.13 00:39</p> <p>also Q_Q: <a href=\"http://imgur.com/FqhPaY2\">http://imgur.com/FqhPaY2</a></p> <p>The thing is I have absolutely no idea how they got into my account, having an unique password, fairly clean computer and e-mail that is almost impossible to hack.</p> <p>I recently found out about the 2F-Identification method for maximum security, but it was already too late.</p> <p>Eh. Shit happens.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/Clayless\"> Clayless </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9z3m/stolen_litecoins/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9z3m/stolen_litecoins/\">[16 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(19,1,1,'http://www.reddit.com/r/litecoin/comments/1s8e8i/with_uni_over_im_just_getting_back_into/','www.reddit.com','With uni over I\'m just getting back into cryptocurrencies, I should not have checked my BTC-E notification history..','<table> <tr><td> <a href=\"http://www.reddit.com/r/litecoin/comments/1s8e8i/with_uni_over_im_just_getting_back_into/\"><img src=\"http://f.thumbs.redditmedia.com/JPQQYfcbSEKLa2gk.jpg\" alt=\"With uni over I\'m just getting back into cryptocurrencies, I should not have checked my BTC-E notification history..\" title=\"With uni over I\'m just getting back into cryptocurrencies, I should not have checked my BTC-E notification history..\" /></a> </td><td> submitted by <a href=\"http://www.reddit.com/user/DarkRyoushii\"> DarkRyoushii </a> <br/> <a href=\"http://i.imgur.com/Iu0sQWL.png\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s8e8i/with_uni_over_im_just_getting_back_into/\">[19 comments]</a> </td></tr></table>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(20,1,1,'http://www.reddit.com/r/litecoin/comments/1s6jcf/all_the_important_information/','www.reddit.com','All the important information...','<table> <tr><td> <a href=\"http://www.reddit.com/r/litecoin/comments/1s6jcf/all_the_important_information/\"><img src=\"http://d.thumbs.redditmedia.com/oN8vpuG7Gkpqfr2Q.jpg\" alt=\"All the important information...\" title=\"All the important information...\" /></a> </td><td> submitted by <a href=\"http://www.reddit.com/user/nbash\"> nbash </a> <br/> <a href=\"http://imgur.com/zP3PSUe\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s6jcf/all_the_important_information/\">[48 comments]</a> </td></tr></table>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(21,1,1,'http://www.reddit.com/r/litecoin/comments/1s9wid/looking_to_buy_some_ltc_whats_the_easiestmost/','www.reddit.com','Looking to buy some ltc. What\'s the easiest/most cost effective method?','<!-- SC_OFF --><div class=\"md\"><p>Was looking at just using a credit card or PayPal. However, neither of these are acceptable. </p> <p>I&#39;m also not interested in losing a bunch of cash in transaction fees</p> <p>I&#39;m at the very first step. I don&#39;t have any digital currency right now. I&#39;ve decided to take the plunge. How do I get the money I have either in my bank account or on my credit card into the litecoin market?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/Ne0r15s\"> Ne0r15s </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9wid/looking_to_buy_some_ltc_whats_the_easiestmost/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9wid/looking_to_buy_some_ltc_whats_the_easiestmost/\">[8 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(22,1,1,'http://www.reddit.com/r/litecoin/comments/1sacto/dae_have_experience_with_cryptost/','www.reddit.com','DAE have experience with Crypto.St?','<!-- SC_OFF --><div class=\"md\"><p>DAE have experience with Crypto.St? I had LTC over there, accidentally sent LTC to my BTC address and now they won&#39;t respond to support calls or emails trying to get it fixed. My balance is incorrect and when you call support it appears to forward to someone&#39;s cell phone. Any idea on what I can do next?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/winethief\"> winethief </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sacto/dae_have_experience_with_cryptost/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sacto/dae_have_experience_with_cryptost/\">[comment]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(23,1,1,'http://www.reddit.com/r/litecoin/comments/1sacrk/would_it_be_possible_to_mine_ltc_on_an_asic_with/','www.reddit.com','Would it be possible to mine LTC on an ASIC with onboard RAM?','<!-- SC_OFF --><div class=\"md\"><p>This is just a hypothetical question from a computer engineering student with a new interest in cryptology. So I love and embrace the idea that LTC will stay in the realm of consumer hardware (vs. being mined with ASICs or FPGAs) because it&#39;s very RAM-intensive. With that being said, couldn&#39;t you theoretically design an ASIC chip with onboard or insertable RAM that could solve scrypt? If not, then why not?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/bmzimmerman\"> bmzimmerman </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sacrk/would_it_be_possible_to_mine_ltc_on_an_asic_with/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sacrk/would_it_be_possible_to_mine_ltc_on_an_asic_with/\">[comment]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(24,1,1,'http://www.reddit.com/r/litecoin/comments/1sacmh/anyone_has_a_couple_of_litecoins_i_could_buy/','www.reddit.com','Anyone has a couple of litecoins I could buy. Paying in AUD via paypal','submitted by <a href=\"http://www.reddit.com/user/Super_toad\"> Super_toad </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sacmh/anyone_has_a_couple_of_litecoins_i_could_buy/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sacmh/anyone_has_a_couple_of_litecoins_i_could_buy/\">[comment]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(25,1,1,'http://www.reddit.com/r/litecoin/comments/1s7t7e/just_checked_coinmap_and_they_have_litecoin_now/','www.reddit.com','Just checked coinmap, and they have Litecoin now!','submitted by <a href=\"http://www.reddit.com/user/PaperPlaneFlyer123\"> PaperPlaneFlyer123 </a> <br/> <a href=\"http://coinmap.org/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s7t7e/just_checked_coinmap_and_they_have_litecoin_now/\">[8 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(26,1,1,'http://www.reddit.com/r/litecoin/comments/1s9q6v/storing_ltc_on_usb/','www.reddit.com','Storing ltc on usb','<!-- SC_OFF --><div class=\"md\"><p>Hi guys,</p> <p>Is it possible to install the litecoin-QT wallet on my usb stick, launch and sync it when i need my coins? </p> <p>Or is this not good? </p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/Exposuredd\"> Exposuredd </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9q6v/storing_ltc_on_usb/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1s9q6v/storing_ltc_on_usb/\">[4 comments]</a>','litecoin',NULL,'2013-12-06 17:49:51','2013-12-17 01:27:17',NULL,1,NULL),(28,1,1,'http://www.reddit.com/r/litecoin/comments/1sam21/just_got_my_first_payment_in_ltc_so_addictive_now/','www.reddit.com','Just got my first payment in LTC! So addictive now..','<table> <tr><td> <a href=\"http://www.reddit.com/r/litecoin/comments/1sam21/just_got_my_first_payment_in_ltc_so_addictive_now/\"><img src=\"http://e.thumbs.redditmedia.com/uDj0MooA6RnkGMip.jpg\" alt=\"Just got my first payment in LTC! So addictive now..\" title=\"Just got my first payment in LTC! So addictive now..\" /></a> </td><td> submitted by <a href=\"http://www.reddit.com/user/brokenskill\"> brokenskill </a> <br/> <a href=\"http://i.imgur.com/X3VTVNf.png\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sam21/just_got_my_first_payment_in_ltc_so_addictive_now/\">[9 comments]</a> </td></tr></table>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(32,1,1,'http://www.reddit.com/r/litecoin/comments/1sapp8/google_hangout/','www.reddit.com','Google Hangout?','<!-- SC_OFF --><div class=\"md\"><p>I just spent the last 4 hours of my life &quot;hanging out&quot; via Google Hangout and heard some nifty, experienced cryptography currency trading chatter. During the 4 hours, I was bouncing back and forth between two bitcoin related hangouts. </p> <p>Does anyone know of a regular Litecoin hangout that exists? I tried searching for one and came up with nothing. </p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/littletinym0nkey\"> littletinym0nkey </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sapp8/google_hangout/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sapp8/google_hangout/\">[1 comment]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(33,1,1,'http://www.reddit.com/r/litecoin/comments/1sazk4/what_happened_to_ltcbtc_values/','www.reddit.com','What happened to LTC/BTC values?','<!-- SC_OFF --><div class=\"md\"><p>What did I miss? I checked a couple days ago and BTC was around $1000, LTC was around 40, and NMC around $9. I know there is going to be fluctuation but this seems like a huge decline. Wondering if I missed some news explaining the drops?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/Hambayas\"> Hambayas </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sazk4/what_happened_to_ltcbtc_values/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sazk4/what_happened_to_ltcbtc_values/\">[5 comments]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(34,1,1,'http://www.reddit.com/r/litecoin/comments/1saslz/arguments_for_and_against_price_parity_or_how_can/','www.reddit.com','Arguments for and against price parity; Or \"How can multiple cryptocurrencies peacefully coexist?\"','<!-- SC_OFF --><div class=\"md\"><p>Comrades, I&#39;ve been doing a lot of thinking on the subject lately, as the proud owner of some LTC and a recent believer in cryptocurrencies.</p> <p>It has struck me that it&#39;s inevitable that BTC and LTC should reach a balance point where their prices are relatively stable relative to each other. </p> <p>In fact, this can anecdotally be seen on exchanges such as btc-e where the price of LTC_BTC is remaining fixed at around 0.035 (at the time of writing) despite the USD fluctuations of both cryptocurrencies.</p> <p>What I&#39;m getting at: Should the two cryptocurrencies gain wide adoption, it would seem natural to say (for example) Please pay me &#39;X$&#39; or &#39;Y BTC&#39; or &#39;Z LTC&#39;. It appears that the ratio of Y:Z would remain fixed for the mostpart, as both would be pegged against the $ (or other currency) and any inconsistencies would become homogenized through trading.</p> <p>Furthermore: Should this be true, it would stand to reason that the ratio would also be affected by the relative number of coins in circulation.. for many reasons that I would be glad to explore in the comments.</p> <p>Any thoughts supporting or contradicting this hypothesis?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/cakedaemon\"> cakedaemon </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1saslz/arguments_for_and_against_price_parity_or_how_can/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1saslz/arguments_for_and_against_price_parity_or_how_can/\">[2 comments]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(36,1,1,'http://www.reddit.com/r/litecoin/comments/1sazy7/if_youre_having_trouble_finding_video_cards/','www.reddit.com','If you\'re having trouble finding video cards...','<!-- SC_OFF --><div class=\"md\"><p>Just wait about a week because if the price keeps falling I bet people will have second thoughts and sell their equipment on Ebay. ROI time period just doubled if not trippled what with lower price of LTC and increased difficulty.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/lamecooter\"> lamecooter </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sazy7/if_youre_having_trouble_finding_video_cards/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sazy7/if_youre_having_trouble_finding_video_cards/\">[2 comments]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(41,1,1,'http://www.reddit.com/r/litecoin/comments/1saee9/why_are_most_of_you_here_rather_than_in_btc/','www.reddit.com','Why are most of you here rather than in BTC?','<!-- SC_OFF --><div class=\"md\"><p>I want people here to be honest as to why they&#39;re in this cryptocurrency rather than BTC.</p> <p>There will be some people who troll and that&#39;s fine, but I hope the real answers float to the top.</p> <p>For me, initially it was because I missed the boat with Bitcoins, or at least felt like I missed the boat. I saw that there was growth potential in LTC. However, later on, I started to realize that having 2 or 3 currencies might be a good thing. With competition, there will always be developers improving the network.</p> <p>Or I could be completely wrong in that aspect which means, I&#39;m here because I missed the boat.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/OMGnohedidnt\"> OMGnohedidnt </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1saee9/why_are_most_of_you_here_rather_than_in_btc/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1saee9/why_are_most_of_you_here_rather_than_in_btc/\">[23 comments]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(42,1,1,'http://www.reddit.com/r/litecoin/comments/1sb15g/quick_confidence_in_litecoin_survey_guessing_of/','www.reddit.com','Quick confidence in Litecoin survey (+ guessing of future price points)','<!-- SC_OFF --><div class=\"md\"><p>Previous post got cough in spam filter, so here it is again</p> <p><a href=\"https://docs.google.com/forms/d/1LTiYkk2v3BDOK-e5hczpmceEJrB4YTI9zNWyTpuwsLc/viewform\">Litecoin confidence survey</a></p> <p>Should take you all but 30 seconds to fill out, on the second page you can guess future price points if you want, and I&#39;ll reveal the results at the specified time points.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/tetralogy\"> tetralogy </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sb15g/quick_confidence_in_litecoin_survey_guessing_of/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sb15g/quick_confidence_in_litecoin_survey_guessing_of/\">[comment]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(43,1,1,'http://www.reddit.com/r/litecoin/comments/1sazqr/reagent_kits_for_litecoins_marquis_mandelin/','www.reddit.com','Reagent kits for litecoins (Marquis, Mandelin, Froehde, Robadope A&B, Analogue (modified Liebermann)','<!-- SC_OFF --><div class=\"md\"><p>If anyone wants to get rid of a small amount of LTC before the price drops too much more, I am still selling my reagents. I have hundreds of satisfied buyers as well as well known vendors who stock my product (check my feedback on ebay ID: &quot;realtimereagents&quot;) School is done so shipping times will be same or next day. If you are interested send me a message with what kits you want and I will let you know a price based on current LTC conversion (I am asking $15 per kit, shipped)</p> <p>These are 10mL amber glass bottles. They have about 200 tests per bottle. 2+ year shelf life. Comes with a color chart and borosilicate test tube.</p> <p><a href=\"http://www.reddit.com/r/SilkRoad/comments/1qg3ek/any_interest_in_testing_reagents_marquis_mandelin/\">Previous thread:</a></p> <p>I also have kits for sale by vendors, but I am just doing a special right now as I have finished school and can start shipping now. If you would like proof of kits, I can snap some new pictures with my new packaging and charts as well.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/hoxie3000\"> hoxie3000 </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sazqr/reagent_kits_for_litecoins_marquis_mandelin/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sazqr/reagent_kits_for_litecoins_marquis_mandelin/\">[comment]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(44,1,1,'http://www.reddit.com/r/litecoin/comments/1sajb3/backing_up_wallet/','www.reddit.com','Backing Up Wallet','<!-- SC_OFF --><div class=\"md\"><p>Backing up wallets.. do I have to back it up after every transaction I do on litecoin qt?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/OMGnohedidnt\"> OMGnohedidnt </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sajb3/backing_up_wallet/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sajb3/backing_up_wallet/\">[4 comments]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(48,1,1,'http://www.reddit.com/r/litecoin/comments/1saw84/moving_litecoin_wallet_to_truecrypt_volume/','www.reddit.com','Moving litecoin wallet to truecrypt volume.','<!-- SC_OFF --><div class=\"md\"><p>I want to move my litecoin information all to a truecrypt volume to increase the security of it. What is the process for doing so? Or would it be better to just make backups to that volume?</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/iplay88keys\"> iplay88keys </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1saw84/moving_litecoin_wallet_to_truecrypt_volume/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1saw84/moving_litecoin_wallet_to_truecrypt_volume/\">[comment]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(49,1,1,'http://www.reddit.com/r/litecoin/comments/1saw62/yelp_for_exchanges_and_conversion_sites/','www.reddit.com','Yelp for Exchanges and conversion sites.','<!-- SC_OFF --><div class=\"md\"><p>All I&#39;m saying is that I&#39;d donate to a website that was essentially a Yelp.com site for exchanges and fiat withdraw sites etc... Reddit is neat, forums are neat, but damn there are a lot people yammering for different reasons. Need a site where you can build up a reputation for quality reviews and get rid of all the chaff. </p> <p>In my head, this plan works perfectly. </p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/FranksWild\"> FranksWild </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1saw62/yelp_for_exchanges_and_conversion_sites/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1saw62/yelp_for_exchanges_and_conversion_sites/\">[1 comment]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL),(51,1,1,'http://www.reddit.com/r/litecoin/comments/1sasmh/has_anyone_been_having_issues_with_cryptsy_lately/','www.reddit.com','Has anyone been having issues with Cryptsy Lately?','<!-- SC_OFF --><div class=\"md\"><p><a href=\"http://www.reddit.com/r/Bitcoin/comments/1s73f7/i_have_sent_back_the_60_btc_i_was_mistakenly_able/\">They sent 60 BTC to a user by accident</a></p> <p>Not trying to cause panic here but try be careful when using cryptsy, they seem to be pretty incompetent these days when it comes to security of users funds.</p> <p>Also has anyone been having issues with them lately? </p> <p>as many users on IRC have reported there bitcoin vanishing when placing an order.</p> </div><!-- SC_ON --> submitted by <a href=\"http://www.reddit.com/user/Litecoin_Messiah\"> Litecoin_Messiah </a> <br/> <a href=\"http://www.reddit.com/r/litecoin/comments/1sasmh/has_anyone_been_having_issues_with_cryptsy_lately/\">[link]</a> <a href=\"http://www.reddit.com/r/litecoin/comments/1sasmh/has_anyone_been_having_issues_with_cryptsy_lately/\">[2 comments]</a>','litecoin',NULL,'2013-12-06 23:57:36','2013-12-17 01:27:17',NULL,1,NULL);
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
-- Table structure for table `Scrapesource`
--

DROP TABLE IF EXISTS `Scrapesource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Scrapesource` (
  `scrapesource_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `name` varchar(16) NOT NULL,
  `url` varchar(256) NOT NULL,
  `parser` varchar(16) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`scrapesource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scrapesource`
--

LOCK TABLES `Scrapesource` WRITE;
/*!40000 ALTER TABLE `Scrapesource` DISABLE KEYS */;
INSERT INTO `Scrapesource` VALUES (1,NULL,'litecoin','http://www.reddit.com/r/litecoin.rss','rss','2013-12-04 15:47:17','2013-12-07 01:02:58',NULL,1),(2,NULL,'obamacare','https://news.google.com/news/feeds?q=obamacare&output=rss','rss','2013-12-04 15:47:40','2013-12-17 01:45:38','2013-12-06 17:02:44',0),(3,NULL,'affordablecareac','http://www.reddit.com/r/affordablecareact/.rss','rss','2013-12-04 15:49:08','2013-12-17 01:45:38','2013-12-06 17:02:42',0),(4,NULL,'affordablecareac','https://news.google.com/news/feeds?q=affordablecareact&output=rss','rss','2013-12-04 15:49:36','2013-12-17 01:45:38','2013-12-06 17:02:38',0);
/*!40000 ALTER TABLE `Scrapesource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Site`
--

DROP TABLE IF EXISTS `Site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_title` varchar(128) NOT NULL,
  `site_url` varchar(128) NOT NULL DEFAULT '',
  `twitter_user` varchar(64) NOT NULL,
  `twitter_widget` text NOT NULL,
  `google_analytics` text NOT NULL,
  `Sitecol` varchar(45) DEFAULT NULL,
  `consumerKey` varchar(45) DEFAULT NULL,
  `consumerSecret` varchar(45) DEFAULT NULL,
  `accessToken` varchar(90) DEFAULT NULL,
  `accessTokenSecret` varchar(90) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Site`
--

LOCK TABLES `Site` WRITE;
/*!40000 ALTER TABLE `Site` DISABLE KEYS */;
INSERT INTO `Site` VALUES (1,'The Scrapist','scrapist.app','jaequery','<a class=','<script>  (function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)  })(window,document,\'script\',\'//www.google-analytics.com/analytics.js\',\'ga\');  ga(\'create\', \'UA-46282306-2\', \'lolhacker.com\');  ga(\'send\', \'pageview\');</script>','','zytcqMmSYglIzBZfgCilA','4x273Y8JbxWO8ggQnt98KYpGTPaSaQyWYooCPIso','2249518130-ioWLWli9l5wX3U8LEm3s71wQvKFprZpF0w5Fqp1','rlreEkoFGpQ9Oa6BTrWh4DEc7BrrWECx2zNp1aEavAORo','2013-12-06 23:39:02','2013-12-17 00:51:50',NULL,1);
/*!40000 ALTER TABLE `Site` ENABLE KEYS */;
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
INSERT INTO `User` VALUES (5,1,0,11,'admin','$2a$08$LtbZ7x22f4uYzlBJz.2nBuIg2L5HiX0APDWPJZT0Tv1pkVvs6BYqS','male','admin@demo.com','1982-01-06','jien','framework','123 abc','#101','abc city','CA',90000,'United States','1231231234','Test','','2011-10-11 15:40:41','2014-01-29 18:42:58','0000-00-00 00:00:00','2014-01-29 18:42:58',1);
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

-- Dump completed on 2014-01-29 18:46:58
 ALTER TABLE Scrapesource ADD COLUMN category_id INT NOT NULL ; 


CREATE TABLE `Scrapesource_hash` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scrapesource_id` int(10) unsigned NOT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`hash_id`)
	

