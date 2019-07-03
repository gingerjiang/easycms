/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.36-log : Database - easycms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `cfg` */

CREATE TABLE `cfg` (
  `c` int(11) DEFAULT NULL,
  `c1` varchar(100) DEFAULT NULL,
  `c2` varchar(100) DEFAULT NULL,
  `c3` varchar(100) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  KEY `c` (`c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cfg` */

insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c2','文本-100-2','50',2);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c1','文本-100-1','50',1);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c16','文本-n*-16','n',16);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c4','文本-100-4','50',4);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c5','文本-200-5','100',5);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c6','文本-200-6','100',6);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c7','文本-200-7','100',7);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c8','文本-200-8','100',8);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c9','文本-500-9','250',9);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c10','文本-500-10','250',10);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c11','文本-500-11','250',11);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c12','文本-500-12','250',12);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c13','文本-2000-13','1000',13);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c14','文本-2000-14','1000',14);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c15','文本-n*-15','n',15);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (1,'c3','文本-100-3','50',3);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (2,'data_1','表1',NULL,1);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (3,'text','文本',NULL,1);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (3,'number','数字',NULL,2);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (3,'textarea','文本域',NULL,3);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (3,'date','日期',NULL,4);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (3,'editor','富文本',NULL,6);
insert  into `cfg`(`c`,`c1`,`c2`,`c3`,`seq`) values (3,'combo','下拉列表',NULL,5);

/*Table structure for table `combo` */

CREATE TABLE `combo` (
  `type` int(11) NOT NULL COMMENT '类型',
  `value` varchar(20) NOT NULL COMMENT '值',
  `num` int(11) DEFAULT NULL COMMENT '序号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `combo` */

insert  into `combo`(`type`,`value`,`num`) values (1,'输入值',2);
insert  into `combo`(`type`,`value`,`num`) values (1,'花生棒',1);
insert  into `combo`(`type`,`value`,`num`) values (2,'手机',1);
insert  into `combo`(`type`,`value`,`num`) values (2,'电脑',2);
insert  into `combo`(`type`,`value`,`num`) values (1,'花生壳',3);

/*Table structure for table `data_1` */

CREATE TABLE `data_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c1` varchar(100) DEFAULT NULL,
  `c2` varchar(100) DEFAULT NULL,
  `c3` varchar(100) DEFAULT NULL,
  `c4` varchar(100) DEFAULT NULL,
  `c5` varchar(200) DEFAULT NULL,
  `c6` varchar(200) DEFAULT NULL,
  `c7` varchar(200) DEFAULT NULL,
  `c8` varchar(200) DEFAULT NULL,
  `c9` varchar(500) DEFAULT NULL,
  `c10` varchar(500) DEFAULT NULL,
  `c11` varchar(500) DEFAULT NULL,
  `c12` varchar(500) DEFAULT NULL,
  `c13` text,
  `c14` text,
  `c15` longtext,
  `c16` longtext,
  `subject_id` bigint(20) NOT NULL COMMENT '对应模型id',
  `state` int(11) DEFAULT NULL COMMENT '状态，1已发布，0未发布',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人，账号',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;

/*Data for the table `data_1` */

insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (271,'蛋糕1',NULL,NULL,NULL,'美味',NULL,'images/1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,1,'2018-04-19 18:42:01','admin','2018-04-19 18:52:25','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (272,'蛋糕2',NULL,NULL,NULL,'甜',NULL,'images/2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,1,'2018-04-19 18:47:48','admin','2018-04-19 18:52:36','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (273,'蛋糕3',NULL,NULL,NULL,'快来买',NULL,'images/3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,1,'2018-04-19 18:48:08','admin','2018-04-19 18:54:53','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (274,'蛋糕4',NULL,NULL,NULL,'脆',NULL,'images/4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,1,'2018-04-19 18:48:22','admin','2018-04-19 18:54:39','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (275,'蛋糕5',NULL,NULL,NULL,'香甜',NULL,'images/5.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,1,'2018-04-19 18:48:39','admin','2018-04-19 18:54:33','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (276,'蛋糕6',NULL,NULL,NULL,'美味',NULL,'images/6.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,1,'2018-04-19 18:50:31','admin','2018-04-19 18:54:26','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (277,'Yes, Minister是大臣; Yes,Prime Minister是首相','中英字幕word 笔记 逐行对应','82',NULL,'http://52en.me/doc/YesPrimeMinisterS01.zip','http://52en.me/static/image/banner/yes.jpg','豆瓣9.7分！第一部3季*6+圣诞特别版，第二部2季*8，剧老句不老，经验告诉我们*屏蔽的关键字*问题揭开总有个内幕,内幕揭开还有个黑幕','第一季',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,'2018-04-20 10:02:23','admin','2018-04-25 20:12:04','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (278,'天赋异禀 第一季','中英字幕word 笔记 逐行对应','1',NULL,'http://52en.me/doc/GiftedS01-1-2.zip','http://52en.me/static/image/banner/gift.jpg','X战警剧集，和北极星小姐姐对飙台词？','1-2集.zip',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,'2018-04-20 10:04:53','admin','2018-04-25 20:12:17','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (279,'老友记','中英字幕word 笔记 逐行对应','48',NULL,'http://52en.me/doc/Friends.S01.zip','http://52en.me/static/image/banner/l2.jpg','《老友记》十年间风风雨雨，在嬉笑怒骂中，在离别团聚中，他们向我们讲述着友情、爱情还有生活。','老友记第一季S01.zip',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,'2018-04-20 10:07:11','admin','2018-04-25 20:13:29','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (280,'爱在午夜降临（日落、黎明）前','中英字幕word 笔记 逐行对应','1',NULL,'http://52en.me/doc/1-2-3.zip','http://52en.me/static/image/banner/a3.jpg','话痨电影，学习口语的最佳','1-2-3部.zip',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,'2018-04-20 10:07:52','admin','2018-04-25 20:13:12','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (322,'S01E02',NULL,NULL,NULL,'http://52en.me/res/mp3/yesS01E02.mp3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','13',82,1,'2018-04-23 22:18:55','admin','2018-05-17 14:52:11','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (351,'S02E01',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'14','15',114,1,'2018-04-25 19:57:23','admin','2018-04-25 20:19:37','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (352,'西部世界','最热美剧','114',NULL,'http://52en.me/doc/Westworld.S02E01.zip','http://52en.me/res/images/wests02.png','失去了对机器人的控制','S02E02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,'2018-04-25 20:04:45','admin','2018-04-25 20:10:37','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (383,'是大臣',NULL,NULL,NULL,'n52en/yes1.jpg','https://movie.douban.com/subject/4937405/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,149,1,'2018-05-16 10:16:23','admin','2018-05-17 09:27:27','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (384,'老友记',NULL,NULL,NULL,'n52en/f.jpg','https://movie.douban.com/subject/1393859/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,149,1,'2018-05-16 10:19:34','admin','2018-05-17 09:33:23','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (385,'唐顿庄园',NULL,NULL,NULL,'n52en/dt.jpg','https://movie.douban.com/subject/4769314/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,149,1,'2018-05-16 10:19:50','admin','2018-05-17 09:28:23','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (386,NULL,NULL,NULL,NULL,'n52en/f2l-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,150,1,'2018-05-16 11:22:16','admin','2018-05-16 11:26:26','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (387,NULL,NULL,NULL,NULL,'n52en/f2r-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,151,1,'2018-05-16 11:26:48','admin','2018-05-16 11:27:11','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (388,NULL,NULL,NULL,NULL,'n52en/f2r-2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,151,1,'2018-05-16 11:27:02','admin',NULL,NULL);
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (389,NULL,NULL,NULL,NULL,'n52en/f3-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,152,1,'2018-05-16 14:24:47','admin',NULL,NULL);
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (390,NULL,NULL,NULL,NULL,'n52en/f3-2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,152,1,'2018-05-16 14:24:53','admin',NULL,NULL);
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (391,NULL,NULL,NULL,NULL,'n52en/f3-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,152,1,'2018-05-16 14:24:58','admin',NULL,NULL);
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (392,'美卡 mecca ',NULL,NULL,NULL,'https://movie.douban.com/subject/4937405/comments?status=P',NULL,NULL,NULL,'这仨忒逗了，随便一凑都是戏。 要是把小寒每次冠冕堂皇的话拿下来倒背如流的话，估计口译press conference部分时简直可以鲜花辞（好听的废话）上再添花。',NULL,NULL,NULL,NULL,NULL,NULL,NULL,154,1,'2018-05-16 14:27:48','admin','2018-05-17 14:20:12','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (393,'豆瓣：唐顿庄园',NULL,NULL,NULL,'https://movie.douban.com/subject/4769314/comments?status=P',NULL,NULL,NULL,'伍德与夏洛蒂：无论从时代背景、故事架构、服装造型到台词演技都精致无比。主仆双线交错的叙事内容堪称剧本典范，完全可以收录作为电影学院戏文专业教材。这部厚重感十足的古典精品，是我今年看到的最棒的剧集，期待第二季。',NULL,NULL,NULL,NULL,NULL,NULL,NULL,154,1,'2018-05-16 14:28:01','admin','2018-05-17 14:23:23','admin');
insert  into `data_1`(`id`,`c1`,`c2`,`c3`,`c4`,`c5`,`c6`,`c7`,`c8`,`c9`,`c10`,`c11`,`c12`,`c13`,`c14`,`c15`,`c16`,`subject_id`,`state`,`create_time`,`create_by`,`update_time`,`update_by`) values (394,'是大臣',NULL,NULL,NULL,'https://movie.douban.com/subject/4937405/comments?status=P',NULL,NULL,NULL,'dSword ：一遍又一遍地看这个系列，每次看都有一种“他的机智赢得了全场热烈的掌声”的感觉，真是一个又一个机智的故事啊。以至于我感觉普通人聊*屏蔽的关键字*的时候有两种，一种是看过这部剧的，一种是没看过的',NULL,NULL,NULL,NULL,NULL,NULL,NULL,154,1,'2018-05-16 14:28:17','admin','2018-05-17 14:21:44','admin');

/*Table structure for table `field` */

CREATE TABLE `field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subject_id` bigint(20) NOT NULL COMMENT '模型id',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `seq` int(11) DEFAULT '0' COMMENT '序号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `width` int(11) DEFAULT NULL COMMENT '列表显示时宽带',
  `allow_blank` char(1) DEFAULT NULL COMMENT '允许为空',
  `list_show` char(1) DEFAULT NULL COMMENT '列表显示',
  `sql` varchar(500) DEFAULT NULL COMMENT '下拉对应sql',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `mapping_data` varchar(20) NOT NULL COMMENT '映射字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8;

/*Data for the table `field` */

insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (1,1,'标题','text',1,'标题',200,'0','1',NULL,1,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (2,1,'内容','editor',5,'',200,'1','0',NULL,1,'c15');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (5,3,'标题','text',10,'标题',200,'0','1','',0,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (80,44,'名称','text',1,'标题',200,'0','1',NULL,0,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (81,44,'介绍1','text',2,'',200,'1','1',NULL,0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (100,44,'图片','text',7,'',100,'0','1','',0,'c7');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (262,46,'名称','text',1,'标题',200,'0','1',NULL,0,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (263,46,'介绍1','text',2,'',200,'1','1',NULL,0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (264,46,'图片','text',7,'',100,'0','1','',0,'c7');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (265,47,'名称','text',1,'标题',200,'0','1',NULL,0,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (266,47,'介绍1','text',2,'',200,'1','1',NULL,0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (267,47,'图片','text',7,'',100,'0','1','',0,'c7');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (268,3,'广告','text',20,'',100,'0','1','',0,'c2');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (269,3,'简介','text',30,'',100,'0','0','',0,'c7');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (270,3,'下载','text',40,'',100,'0','1','',0,'c8');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (271,3,'下载链接','text',50,'',100,'1','0','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (272,3,'图片','text',21,'',100,'0','0','',0,'c6');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (273,48,'标题','text',1,'标题1',200,'0','1','',0,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (274,48,'英文内容','editor',5,'',200,'1','0','',0,'c15');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (275,48,'中文内容','editor',15,'',100,'1','0','',0,'c16');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (276,48,'mp3','text',3,'',100,'1','0','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (277,3,'匹配栏目','text',15,'',60,'0','1','',0,'c3');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (279,49,'标题','text',1,'标题',200,'0','1',NULL,1,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (280,49,'mp3','text',3,'',100,'1','0','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (281,49,'英文内容','editor',5,'',200,'1','0','',0,'c15');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (282,49,'中文内容','editor',15,'',100,'1','0','',0,'c16');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (311,81,'标题','text',1,'标题',200,'0','1',NULL,1,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (312,81,'mp3','text',3,'',100,'1','0','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (313,81,'英文内容','editor',5,'',200,'1','0','',0,'c15');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (314,81,'中文内容','editor',15,'',100,'1','0','',0,'c16');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (315,82,'标题','text',1,'标题',200,'0','1',NULL,1,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (316,82,'mp3','text',3,'',100,'1','0','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (317,82,'英文内容','editor',5,'',200,'1','0','',0,'c15');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (318,82,'中文内容','editor',15,'',100,'1','0','',0,'c16');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (319,83,'标题','text',1,'标题',200,'0','1',NULL,1,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (320,83,'mp3','text',3,'',100,'1','0','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (321,83,'英文内容','editor',5,'',200,'1','0','',0,'c15');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (322,83,'中文内容','editor',15,'',100,'1','0','',0,'c16');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (379,114,'标题','text',1,'标题',200,'0','1',NULL,1,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (380,114,'mp3','text',3,'',100,'1','0','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (381,114,'英文内容','editor',5,'',200,'1','0','',0,'c15');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (382,114,'中文内容','editor',15,'',100,'1','0','',0,'c16');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (425,153,'标题','text',1,'标题',200,'0','1',NULL,1,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (427,149,'图片','text',10,'分辨率308*74,path-upload/tmp/a',200,'0','1','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (428,149,'链接','text',20,'网页链接',100,'0','1','',0,'c6');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (429,150,'图片','text',10,'631*299',200,'0','1','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (430,151,'图片','text',10,'308*180,429*155',200,'0','1','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (431,154,'标题','text',1,'标题',200,'0','1',NULL,1,'c1');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (433,154,'内容','textarea',11,'',100,'1','0','',0,'c9');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (434,154,'链接','text',21,'',100,'0','1','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (435,152,'图片','text',10,'316*117',100,'0','1','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (436,153,'匹配栏目','text',11,'',60,'0','1','',0,'c2');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (437,153,'广告','text',21,'',100,'0','1','',0,'c5');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (438,153,'图片','text',31,'220*n',100,'0','0','',0,'c3');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (439,153,'下载','text',41,'',100,'1','1','',0,'c4');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (440,153,'下载链接','text',51,'',1001,'1','0','',0,'c6');
insert  into `field`(`id`,`subject_id`,`name`,`type`,`seq`,`remark`,`width`,`allow_blank`,`list_show`,`sql`,`status`,`mapping_data`) values (441,149,'名称','text',5,'',100,'0','1','',0,'c1');

/*Table structure for table `subject` */

CREATE TABLE `subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '栏目名称',
  `table_name` varchar(50) DEFAULT NULL COMMENT '存放数据的表如data_1',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `leaf` bit(1) DEFAULT NULL COMMENT '是否叶子节点',
  `seq` int(11) DEFAULT NULL COMMENT '排序序号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点',
  `nav` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

/*Data for the table `subject` */

insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (1,'咖啡站','data_1','咖啡站栏目配置','\0',10,0,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (2,'52en.me','data_1','我爱英语','\0',20,0,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (3,'首页','data_1','','\0',10,2,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (36,'首页','data_1','','\0',30,1,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (44,'Meun3','data_1','','\0',5,36,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (46,'Meun2','data_1','','\0',5,36,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (47,'Meun1','data_1','','\0',5,36,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (48,'老友记','data_1','','\0',20,2,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (49,'生活大爆炸','data_1','','\0',30,2,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (81,'唐顿庄园','data_1','','\0',40,2,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (82,'是大臣','data_1','','\0',50,2,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (83,'权利的游戏','data_1','','\0',60,2,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (114,'西部世界第二季','data_1','','\0',70,2,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (148,'新52en站','data_1','30','\0',30,0,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (149,'首页F1图片','data_1','','\0',10,148,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (150,'首页F2左1','data_1','','\0',20,148,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (151,'首页F2右2','data_1','','\0',30,148,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (152,'首页F3图片','data_1','','\0',40,148,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (153,'文章','data_1','','\0',60,148,NULL);
insert  into `subject`(`id`,`name`,`table_name`,`remark`,`leaf`,`seq`,`parent_id`,`nav`) values (154,'轮播','data_1','','\0',50,148,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
