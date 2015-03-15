
/**
* 创建库
**/

CREATE DATABASE IF NOT EXISTS fm_citypatient DEFAULT CHARACTER SET utf8 ;


USE fm_citypatient;

/**
* 用户表
**/
DROP TABLE IF EXISTS tb_user;

CREATE TABLE tb_user (
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	ct datetime COMMENT'创建日期',
	PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/**
* 歌曲表
**/
DROP TABLE IF EXISTS tb_songs;

CREATE TABLE tb_songs (
	id int(11)  NOT NULL AUTO_INCREMENT COMMENT'ID',
	name varchar(100) NOT NULL COMMENT'歌曲名称',
	addr text NOT NULL COMMENT'歌曲地址', 
	online int(1) DEFAULT 0 COMMENT'上线（0）/下线 (1)',
	lyrics text COMMENT'歌词内容',
	c_id int(11) COMMENT'分类',
	ct datetime COMMENT'创建日期',
	author varchar(100) DEFAULT '匿名' COMMENT '作者',
	author_addr varchar(1000) COMMENT'作者地址',
	primary key (id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS tb_cates;
CREATE TABLE tb_cates(
	id int(11)  NOT NULL AUTO_INCREMENT COMMENT'ID',
	name varchar(100) NOT NULL COMMENT'分类名称',
	ct datetime COMMENT'创建日期',
	primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
