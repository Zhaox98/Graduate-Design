/*
Navicat MySQL Data Transfer

Source Server         : localhost_3309
Source Server Version : 50022
Source Host           : localhost:3309
Source Database       : pingjiao

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2020-05-07 21:38:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL auto_increment,
  `createtime` datetime default NULL,
  `creator` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `logtimes` int(11) NOT NULL,
  `nickname` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `rolename` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `xiangpian` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '2020-03-20 15:06:33', null, '1@qq.com', '66', '风波水门', 'admin', '张三', '管理员', '男', '13891902972', 'admin1', '/pingjiao/admin/images/touxiang.jpg');

-- ----------------------------
-- Table structure for `attachement`
-- ----------------------------
DROP TABLE IF EXISTS `attachement`;
CREATE TABLE `attachement` (
  `id` int(11) NOT NULL auto_increment,
  `absolutepath` varchar(255) default NULL,
  `belongfileldname` varchar(255) default NULL,
  `belongid` varchar(255) default NULL,
  `belongtable` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `pubtime` datetime default NULL,
  `title` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of attachement
-- ----------------------------

-- ----------------------------
-- Table structure for `banji`
-- ----------------------------
DROP TABLE IF EXISTS `banji`;
CREATE TABLE `banji` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banji
-- ----------------------------
INSERT INTO `banji` VALUES ('1', '软件1605班');
INSERT INTO `banji` VALUES ('2', '软件1601班');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '软件1605班');
INSERT INTO `class` VALUES ('2', '软件1601班');

-- ----------------------------
-- Table structure for `classes`
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL auto_increment,
  `des` varchar(255) default NULL,
  `subname` varchar(255) default NULL,
  `subno` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `tno` varchar(255) default NULL,
  `xuefen` varchar(255) default NULL,
  `avgscore` double default NULL,
  `pjcount` int(11) default NULL,
  `totalscore` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for `leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `leaveword`;
CREATE TABLE `leaveword` (
  `id` int(11) NOT NULL auto_increment,
  `createtime` datetime default NULL,
  `dcontent` text,
  `lyren` varchar(255) default NULL,
  `replycontent` varchar(255) default NULL,
  `replyren` varchar(255) default NULL,
  `replytime` datetime default NULL,
  `status` int(11) NOT NULL,
  `stname` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of leaveword
-- ----------------------------
INSERT INTO `leaveword` VALUES ('2', '2020-03-29 17:02:13', '测试留言', 'S001', '收到', 'T001', '2020-03-29 17:02:13', '2', '赵旭', '留言1');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '计算机科学与应用');
INSERT INTO `major` VALUES ('2', '软件工程');
INSERT INTO `major` VALUES ('3', '网络工程');
INSERT INTO `major` VALUES ('4', '大数据');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL auto_increment,
  `content` varchar(255) default NULL,
  `createtime` datetime default NULL,
  `pubren` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '五一假期结束，请老师、同学们于5月6日及时返校上课。', '2020-05-07 11:50:43', 'admin1', '开学通知');

-- ----------------------------
-- Table structure for `paike`
-- ----------------------------
DROP TABLE IF EXISTS `paike`;
CREATE TABLE `paike` (
  `id` int(11) NOT NULL auto_increment,
  `kejie` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `tno` varchar(255) default NULL,
  `weekday` varchar(255) default NULL,
  `xuenian` varchar(255) default NULL,
  `class` varchar(255) default NULL,
  `major` varchar(255) default NULL,
  `banji` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of paike
-- ----------------------------
INSERT INTO `paike` VALUES ('1', '第一节', '江涛', 'T001', '周一', '2019-2020学年', '软件1班', '软件工程', null);
INSERT INTO `paike` VALUES ('2', '第三节', '王艳', 'T003', '周一', '2016-2017学年', '软件1班', '软件工程', null);
INSERT INTO `paike` VALUES ('3', '第二节', '王艳', 'T003', '周一', '2016-2017学年', '软件5班', '软件工程', null);

-- ----------------------------
-- Table structure for `pingjiao`
-- ----------------------------
DROP TABLE IF EXISTS `pingjiao`;
CREATE TABLE `pingjiao` (
  `id` int(11) NOT NULL auto_increment,
  `defen` int(11) NOT NULL,
  `pjtime` datetime default NULL,
  `stname` varchar(255) default NULL,
  `stno` varchar(255) default NULL,
  `subname` varchar(255) default NULL,
  `subno` varchar(255) default NULL,
  `des` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of pingjiao
-- ----------------------------

-- ----------------------------
-- Table structure for `pjitems`
-- ----------------------------
DROP TABLE IF EXISTS `pjitems`;
CREATE TABLE `pjitems` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(5000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of pjitems
-- ----------------------------
INSERT INTO `pjitems` VALUES ('1', '遵守教学纪律,无迟到、提前下课、上课拨打手机等现象');
INSERT INTO `pjitems` VALUES ('2', '老师是否有热情，有一种想把知识教给你的强烈欲望与热情，没有仅仅完成任务式的教学');
INSERT INTO `pjitems` VALUES ('3', '老师是否备课充分，熟悉所教内容，无知识性错误');
INSERT INTO `pjitems` VALUES ('4', '老师是否思路清晰，知识概念的概述是否准确，清晰到位。');
INSERT INTO `pjitems` VALUES ('5', '老师上课信息量是否足够，课程内容充实');
INSERT INTO `pjitems` VALUES ('6', '老师对难点的讲解是否有深度');
INSERT INTO `pjitems` VALUES ('7', '老师在课堂是否乐于提问，关注你的消化和吸收情况');
INSERT INTO `pjitems` VALUES ('8', '你对该老师的消化，吸收情况如何，也就是学习效果如何');
INSERT INTO `pjitems` VALUES ('9', '老师在教学过程中能否激发学生的学习兴趣，发挥学生的主观能动性，培养学生的独立思考与创新精神。');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL auto_increment,
  `address` varchar(255) default NULL,
  `banji` varchar(255) default NULL,
  `birthday` datetime default NULL,
  `des` mediumtext,
  `jiguan` varchar(255) default NULL,
  `mianmao` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `nation` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `photo` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `stno` varchar(255) default NULL,
  `zhuanye` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '陕西省西安市', '软件1605班', '2020-05-07 00:00:00', '软件1605赵旭', '河南驻马店', '党员', '17602958485', '赵旭', '汉', '981110', '/pingjiao/upload/nopic.jpg', '男', 'S001', '软件工程');
INSERT INTO `student` VALUES ('2', '陕西省西安市', '软件1601班', '1998-05-27 00:00:00', '2', '陕西咸阳', '党员', '15398088875', '张超', '汉', '980527', '/pingjiao/upload/temp/u=4127933704,3017450191&fm=21&gp=0.jpg', '男', 'S002', '软件工程');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `gradschool` varchar(255) default NULL,
  `jieshao` text,
  `jiguan` varchar(255) default NULL,
  `major` varchar(255) default NULL,
  `mianmao` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `nation` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `photo` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `tno` varchar(255) default NULL,
  `xueli` varchar(255) default NULL,
  `zhicheng` varchar(255) default NULL,
  `zhiwei` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '111@xupt.edu.cn', '西安电子科技大学', '<img src=\"http://shine:8080/pingjiao/editor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />大家好，我是江涛老师。', '陕西西安', '计算机科学与技术', '党员', '江涛', '汉', '123456', '/pingjiao/upload//images/nopic.jpg', '男', '12345678900', 'T001', '博士', '教授', '讲师');

-- ----------------------------
-- Table structure for `xuanke`
-- ----------------------------
DROP TABLE IF EXISTS `xuanke`;
CREATE TABLE `xuanke` (
  `id` int(11) NOT NULL auto_increment,
  `score` double default NULL,
  `sname` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `stno` varchar(255) default NULL,
  `subname` varchar(255) default NULL,
  `subno` varchar(255) default NULL,
  `xktime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xuanke
-- ----------------------------
INSERT INTO `xuanke` VALUES ('5', '0', '赵旭', '选修中', 'S001', '关系数据库原理', 'C002', '2020-05-04 23:56:35');

-- ----------------------------
-- Table structure for `xuenian`
-- ----------------------------
DROP TABLE IF EXISTS `xuenian`;
CREATE TABLE `xuenian` (
  `id` int(11) NOT NULL auto_increment,
  `niandu` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xuenian
-- ----------------------------
