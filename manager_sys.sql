/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : manager_sys

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-04-05 19:46:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `flname` varchar(255) DEFAULT NULL,
  `fltitle` varchar(255) DEFAULT NULL,
  `fltype` varchar(50) DEFAULT NULL,
  `fllength` varchar(30) DEFAULT NULL,
  `userid` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`userid`),
  CONSTRAINT `user_id` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('8', '9adc4ab52fd7ca71c0cd54447684fee432ba22f9.jpg', 'aaa', 'image/jpeg', '68416', '2');

-- ----------------------------
-- Table structure for linkman
-- ----------------------------
DROP TABLE IF EXISTS `linkman`;
CREATE TABLE `linkman` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `lmname` varchar(255) DEFAULT NULL,
  `lmphone` varchar(255) DEFAULT NULL,
  `lmaddress` varchar(255) DEFAULT NULL,
  `userid` int(30) DEFAULT NULL,
  `lmemail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_id` (`userid`) USING BTREE,
  CONSTRAINT `userid_id` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linkman
-- ----------------------------
INSERT INTO `linkman` VALUES ('3', '22 3 33', '11111111111', '111111212', '2', '111@qq.com');
INSERT INTO `linkman` VALUES ('4', '333', '11111111111', '1111111', '2', '111@qq.com');
INSERT INTO `linkman` VALUES ('9', '富豪啊实打实', '12121212121', '1111111', '2', '111@qq.com');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `userpass` varchar(30) DEFAULT NULL,
  `age` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `birth` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '10', 'xfh@163.com', null, '11111111111', null, null);
INSERT INTO `user` VALUES ('2', 'xfh123', '111', '13', 'ww@ww.com', '2017-03-12', '12121', 'wqwq', 'Men');
