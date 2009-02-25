--
-- Feeds
--
CREATE TABLE `feeds` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `author` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `blog_url` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `approved` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Posts
--
CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `feed_id` int(11) default NULL,
  `url` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `feed_id` (`feed_id`,`url`),
  KEY `sorting` (`created_at`),
  FULLTEXT KEY `text` (`title`,`body`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Users
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(80) default NULL,
  `password` varchar(40) default NULL,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

