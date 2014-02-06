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
	
