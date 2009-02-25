--
-- Feeds
--
DROP TABLE feeds CASCADE;

CREATE TABLE feeds (
  id serial PRIMARY KEY,
  name varchar(255) default NULL,
  author varchar(255) default NULL,
  url varchar(255) default NULL,
  blog_url varchar(255) default NULL,
  created_at timestamp default NULL,
  updated_at timestamp default NULL,
  approved smallint NOT NULL default '0'
);

--
-- Feed Indexes
--
DROP INDEX feed_id_index;
DROP INDEX feed_author_index;
CREATE INDEX feed_id_index ON feeds (id);
CREATE INDEX feed_author_index on feeds (author);
--
-- Posts
--
DROP TABLE posts CASCADE;
CREATE TABLE posts (
  id serial PRIMARY KEY,
  feed_id int default NULL,
  url varchar(255) default NULL,
  title varchar(255) default NULL,
  body text DEFAULT '',
  created_at timestamp default NULL,
  updated_at timestamp default NULL
);

--
-- Post Indexes
--
CREATE INDEX posts_id_index ON posts(id);
CREATE INDEX posts_feed_id_index ON posts(feed_id);
CREATE INDEX posts_sorting_index ON posts(created_at);

--
-- Users
--
DROP TABLE users CASCADE;
CREATE TABLE users (
  id serial PRIMARY KEY,
  login varchar(80) default NULL,
  password varchar(40) default NULL,
  name varchar(100) default NULL,
  email varchar(100) default NULL
);
