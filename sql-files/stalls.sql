--
-- Table structure for table `stalls`
--

CREATE TABLE IF NOT EXISTS `stalls` (
  `id` int UNSIGNED NOT NULL,
  `char_id` int UNSIGNED NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `class` smallint UNSIGNED NOT NULL DEFAULT '0',
  `map` varchar(20) NOT NULL,
  `x` smallint UNSIGNED NOT NULL,
  `y` smallint UNSIGNED NOT NULL,
  `sex` enum('F','M') NOT NULL DEFAULT 'M',
  `hair` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `weapon` smallint UNSIGNED NOT NULL DEFAULT '0',
  `shield` smallint UNSIGNED NOT NULL DEFAULT '0',
  `head_mid` smallint UNSIGNED NOT NULL DEFAULT '0',
  `head_top` smallint UNSIGNED NOT NULL DEFAULT '0',
  `head_bottom` smallint UNSIGNED NOT NULL DEFAULT '0',
  `hair_color` smallint UNSIGNED NOT NULL DEFAULT '0',
  `clothes_color` smallint UNSIGNED NOT NULL DEFAULT '0',
  `body` smallint UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(80) NOT NULL,
  `expire_time` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY  (`id`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM;

--
-- Table structure for table `stalls_vending_items`
--
CREATE TABLE IF NOT EXISTS  `stalls_vending_items` (
  `stalls_id` int(11) unsigned NOT NULL default '0',
  `index` smallint(5) unsigned NOT NULL,
  `nameid` int(10) unsigned NOT NULL default '0',
  `amount` int(11) unsigned NOT NULL default '0',
  `identify` smallint(6) NOT NULL default '0',
  `refine` tinyint(3) unsigned NOT NULL default '0',
  `attribute` tinyint(4) unsigned NOT NULL default '0',
  `card0` int(10) unsigned NOT NULL default '0',
  `card1` int(10) unsigned NOT NULL default '0',
  `card2` int(10) unsigned NOT NULL default '0',
  `card3` int(10) unsigned NOT NULL default '0',
  `option_id0` smallint(5) NOT NULL default '0',
  `option_val0` smallint(5) NOT NULL default '0',
  `option_parm0` tinyint(3) NOT NULL default '0',
  `option_id1` smallint(5) NOT NULL default '0',
  `option_val1` smallint(5) NOT NULL default '0',
  `option_parm1` tinyint(3) NOT NULL default '0',
  `option_id2` smallint(5) NOT NULL default '0',
  `option_val2` smallint(5) NOT NULL default '0',
  `option_parm2` tinyint(3) NOT NULL default '0',
  `option_id3` smallint(5) NOT NULL default '0',
  `option_val3` smallint(5) NOT NULL default '0',
  `option_parm3` tinyint(3) NOT NULL default '0',
  `option_id4` smallint(5) NOT NULL default '0',
  `option_val4` smallint(5) NOT NULL default '0',
  `option_parm4` tinyint(3) NOT NULL default '0',
  `expire_time` int(11) unsigned NOT NULL default '0',
  `bound` tinyint(3) unsigned NOT NULL default '0',
  `unique_id` bigint(20) unsigned NOT NULL default '0',
  `enchantgrade` tinyint unsigned NOT NULL default '0',
  `price` int(10) unsigned NOT NULL default '0',
   PRIMARY KEY (`stalls_id`, `index`)
) ENGINE=MyISAM;

--
-- Table structure for table `stalls_buying_items`
--
CREATE TABLE IF NOT EXISTS  `stalls_buying_items` (
  `stalls_id` int(11) unsigned NOT NULL default '0',
  `nameid` int(10) unsigned NOT NULL default '0',
  `amount` int(11) unsigned NOT NULL default '0',
  `price` int(10) unsigned NOT NULL default '0',
   PRIMARY KEY (`stalls_id`, `nameid`)
) ENGINE=MyISAM;