/*
SQLyog Trial v10.51 
MySQL - 5.6.10 : Database - zblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zblog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zblog`;

/*Table structure for table `rel_article_tag` */

DROP TABLE IF EXISTS `rel_article_tag`;

CREATE TABLE `rel_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

/*Data for the table `rel_article_tag` */

/*Table structure for table `tb_article` */

DROP TABLE IF EXISTS `tb_article`;

CREATE TABLE `tb_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` text NOT NULL COMMENT '文章内容',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `category` int(11) NOT NULL COMMENT '文章分类',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `deleted` int(11) DEFAULT '0' COMMENT '逻辑删除，0表示未删除，1表示删除',
  `read_count` int(11) DEFAULT '0' COMMENT '文章访问量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `tb_article` */

/*Table structure for table `tb_article_category` */

DROP TABLE IF EXISTS `tb_article_category`;

CREATE TABLE `tb_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `description` text COMMENT '分类描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tb_article_category` */

/*Table structure for table `tb_article_comment` */

DROP TABLE IF EXISTS `tb_article_comment`;

CREATE TABLE `tb_article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `user_name` varchar(50) NOT NULL COMMENT '留言人姓名',
  `content` text NOT NULL COMMENT '留言内容',
  `blog_url` varchar(200) DEFAULT NULL COMMENT '博客地址',
  `create_time` datetime DEFAULT NULL COMMENT '留言时间',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `father_comm` int(11) DEFAULT '0' COMMENT '父级评论，默认0',
  `be_feedback` varchar(200) DEFAULT NULL COMMENT '如果为回复内容，此字段为回复人姓名链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `tb_article_comment` */

/*Table structure for table `tb_article_tag` */

DROP TABLE IF EXISTS `tb_article_tag`;

CREATE TABLE `tb_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tb_article_tag` */

/*Table structure for table `tb_extend_page` */

DROP TABLE IF EXISTS `tb_extend_page`;

CREATE TABLE `tb_extend_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(500) DEFAULT NULL COMMENT '页面地址',
  `name` varchar(20) NOT NULL COMMENT '页面名称',
  `page_content` text COMMENT '导航页面的具体内容',
  `display` int(1) DEFAULT '0' COMMENT '是否显示该页面，0表示显示，1非显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tb_extend_page` */

/*Table structure for table `tb_friendly_link` */

DROP TABLE IF EXISTS `tb_friendly_link`;

CREATE TABLE `tb_friendly_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tb_friendly_link` */

insert  into `tb_friendly_link`(`id`,`name`,`link`) values (4,'Ziv博客园','http://www.cnblogs.com/zivxiaowei/'),(5,'ZivCSDN','http://blog.csdn.net/zivxiaowei');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `show_name` varchar(20) DEFAULT NULL COMMENT '显示名称',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `description` text COMMENT '描述信息',
  `image` text COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`name`,`password`,`show_name`,`email`,`description`,`image`) values (1,'wewoor','H3BqjOsDt7OBn8y/CtYvQw==','Ziv小威','wewoor@foxmail.com',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
