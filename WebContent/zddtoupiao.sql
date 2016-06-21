/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : zddtoupiao

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2016-06-21 09:24:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `info`
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `info_title` varchar(255) NOT NULL,
  `info_content` varchar(255) DEFAULT NULL,
  `info_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info_type` int(11) NOT NULL DEFAULT '0',
  `info_status` int(11) NOT NULL DEFAULT '0',
  `info_danshuang` int(11) NOT NULL DEFAULT '0',
  `info_num` int(11) NOT NULL DEFAULT '0',
  `info_pnum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('1', '谁是最帅的人', 'q', '2015-10-13 09:52:17', '0', '0', '0', '2', '0');
INSERT INTO `info` VALUES ('27', '1+1', null, '2015-10-18 16:48:19', '0', '0', '0', '6', '32');
INSERT INTO `info` VALUES ('28', '错错错', null, '2015-10-18 16:48:51', '0', '0', '0', '5', '2');
INSERT INTO `info` VALUES ('29', '谁是傻逼', null, '2015-10-18 16:49:17', '0', '0', '0', '3', '5');
INSERT INTO `info` VALUES ('30', '哪个', null, '2015-10-18 16:49:38', '0', '0', '0', '2', '1');
INSERT INTO `info` VALUES ('31', '谁啊谁啊', null, '2015-10-18 16:50:04', '0', '0', '1', '3', '2');
INSERT INTO `info` VALUES ('32', '1', null, '2015-10-18 17:15:26', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('33', '1', null, '2015-10-18 17:15:27', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('34', '1', null, '2015-10-18 17:15:29', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('35', '1', null, '2015-10-18 17:15:29', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('36', '1', null, '2015-10-18 17:15:30', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('37', '1', null, '2015-10-18 17:15:30', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('38', '1', null, '2015-10-18 17:15:31', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('39', '1', null, '2015-10-18 17:15:31', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('40', '1', null, '2015-10-18 17:15:31', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('41', '1', null, '2015-10-18 17:15:32', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('42', '1', null, '2015-10-18 17:15:32', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('43', '1', null, '2015-10-18 17:15:32', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('44', '1', null, '2015-10-18 17:15:43', '0', '0', '0', '0', '0');
INSERT INTO `info` VALUES ('46', '1', null, '2015-10-19 19:30:15', '0', '0', '0', '2', '0');
INSERT INTO `info` VALUES ('47', '11', null, '2015-10-19 19:30:42', '0', '0', '0', '2', '0');
INSERT INTO `info` VALUES ('48', '11', null, '2015-10-19 19:30:57', '0', '0', '0', '2', '1');
INSERT INTO `info` VALUES ('49', '11', null, '2015-10-19 19:32:19', '0', '0', '1', '3', '1');
INSERT INTO `info` VALUES ('57', '1', null, '2015-10-21 09:43:46', '0', '0', '0', '3', '1');
INSERT INTO `info` VALUES ('58', '1', null, '2015-10-21 09:43:59', '0', '0', '0', '4', '1');
INSERT INTO `info` VALUES ('59', '654645', null, '2015-10-21 10:17:18', '0', '0', '0', '3', '0');
INSERT INTO `info` VALUES ('60', '5454', null, '2015-10-21 15:57:13', '0', '0', '0', '2', '1');
INSERT INTO `info` VALUES ('61', '11', null, '2015-10-23 20:26:55', '0', '0', '0', '2', '2');
INSERT INTO `info` VALUES ('62', '11', null, '2015-10-23 20:27:15', '0', '0', '0', '2', '1');
INSERT INTO `info` VALUES ('63', '单选测试题', null, '2015-10-23 20:28:39', '0', '0', '0', '5', '2');
INSERT INTO `info` VALUES ('64', '多选测试题', null, '2015-10-23 20:29:06', '0', '0', '0', '3', '1');
INSERT INTO `info` VALUES ('65', '12', null, '2015-10-25 23:09:27', '0', '0', '0', '4', '1');
INSERT INTO `info` VALUES ('66', '主测试题', null, '2015-10-29 15:47:14', '0', '0', '0', '5', '15');

-- ----------------------------
-- Table structure for `kongzhi`
-- ----------------------------
DROP TABLE IF EXISTS `kongzhi`;
CREATE TABLE `kongzhi` (
  `kongzhi_id` int(11) NOT NULL AUTO_INCREMENT,
  `kongzhi_info_id` varchar(255) NOT NULL,
  `kongzhi_user_id` int(11) NOT NULL,
  `kongzhi_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kongzhi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kongzhi
-- ----------------------------
INSERT INTO `kongzhi` VALUES ('1', 'qq\'1cc', '1', '2015-10-25 16:37:22');
INSERT INTO `kongzhi` VALUES ('27', 'b27eb27eb27e', '26', '2015-10-25 16:37:28');
INSERT INTO `kongzhi` VALUES ('28', '27', '26', '2015-10-25 16:37:25');
INSERT INTO `kongzhi` VALUES ('31', '62', '26', '2015-10-25 21:21:04');
INSERT INTO `kongzhi` VALUES ('33', '57', '26', '2015-10-25 21:45:56');
INSERT INTO `kongzhi` VALUES ('34', '58', '26', '2015-10-25 22:02:13');
INSERT INTO `kongzhi` VALUES ('35', '60', '26', '2015-10-25 22:03:06');
INSERT INTO `kongzhi` VALUES ('36', '61', '26', '2015-10-25 22:05:29');
INSERT INTO `kongzhi` VALUES ('42', '49', '26', '2015-10-25 22:22:21');
INSERT INTO `kongzhi` VALUES ('43', '48', '26', '2015-10-25 22:23:58');
INSERT INTO `kongzhi` VALUES ('53', '63', '26', '2015-10-25 23:10:58');
INSERT INTO `kongzhi` VALUES ('58', '64', '26', '2015-10-28 10:06:01');
INSERT INTO `kongzhi` VALUES ('59', '65', '26', '2015-10-28 19:39:20');
INSERT INTO `kongzhi` VALUES ('60', '66', '26', '2015-10-29 15:47:25');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(16) NOT NULL,
  `user_status` int(1) NOT NULL DEFAULT '0',
  `user_type` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('19', '头戴三叉束发紫金冠体挂西川红棉百花袍身披兽面吞头连环铠腰系勒甲玲珑狮蛮带手持方天画戟座下嘶风赤兔马之赵小笛是也', 'zdd', '0', '1');
INSERT INTO `user` VALUES ('26', 'zddzdd', 'zddzdd', '0', '1');
INSERT INTO `user` VALUES ('27', '111111', '111111', '0', '0');
INSERT INTO `user` VALUES ('28', 'sb', 'sb', '0', '0');
INSERT INTO `user` VALUES ('29', 'smile1', 'smile@', '0', '0');

-- ----------------------------
-- Table structure for `xuanxiang`
-- ----------------------------
DROP TABLE IF EXISTS `xuanxiang`;
CREATE TABLE `xuanxiang` (
  `xuanxiang_id` int(11) NOT NULL AUTO_INCREMENT,
  `xuanxiang_info_id` int(11) NOT NULL,
  `xuanxiang_content` varchar(50) NOT NULL,
  `xuanxiang_num` int(11) NOT NULL DEFAULT '0',
  `xuanxiang_pnum` int(11) NOT NULL DEFAULT '0',
  `xuanxiang_iid` int(11) NOT NULL,
  PRIMARY KEY (`xuanxiang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xuanxiang
-- ----------------------------
INSERT INTO `xuanxiang` VALUES ('2', '1', '2', '0', '0', '0');
INSERT INTO `xuanxiang` VALUES ('39', '28', '水水水水', '1', '0', '0');
INSERT INTO `xuanxiang` VALUES ('40', '28', '顶顶顶顶', '1', '0', '1');
INSERT INTO `xuanxiang` VALUES ('41', '28', '轻轻巧巧', '0', '0', '2');
INSERT INTO `xuanxiang` VALUES ('42', '28', '哈哈哈哈', '0', '0', '3');
INSERT INTO `xuanxiang` VALUES ('43', '28', '巴巴爸爸', '0', '0', '4');
INSERT INTO `xuanxiang` VALUES ('44', '29', '他', '5', '0', '0');
INSERT INTO `xuanxiang` VALUES ('45', '29', '不是我', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('46', '29', '自己', '0', '0', '2');
INSERT INTO `xuanxiang` VALUES ('47', '30', '谁啊？', '0', '0', '0');
INSERT INTO `xuanxiang` VALUES ('48', '30', '我不知道啊', '1', '0', '1');
INSERT INTO `xuanxiang` VALUES ('49', '31', '你啊你啊', '1', '0', '0');
INSERT INTO `xuanxiang` VALUES ('50', '31', '我啊我啊', '2', '0', '1');
INSERT INTO `xuanxiang` VALUES ('51', '31', '他啊他啊', '1', '0', '2');
INSERT INTO `xuanxiang` VALUES ('54', '46', '', '0', '0', '0');
INSERT INTO `xuanxiang` VALUES ('55', '46', '', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('56', '47', '', '0', '0', '0');
INSERT INTO `xuanxiang` VALUES ('57', '47', '', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('58', '48', '', '1', '1', '0');
INSERT INTO `xuanxiang` VALUES ('59', '48', '', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('60', '49', '1', '1', '0', '0');
INSERT INTO `xuanxiang` VALUES ('61', '49', '2', '1', '0', '1');
INSERT INTO `xuanxiang` VALUES ('76', '57', '1', '1', '1', '0');
INSERT INTO `xuanxiang` VALUES ('77', '57', '2', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('78', '57', '', '0', '0', '2');
INSERT INTO `xuanxiang` VALUES ('79', '58', '1', '0', '0', '0');
INSERT INTO `xuanxiang` VALUES ('80', '58', '1', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('81', '58', '', '0', '0', '2');
INSERT INTO `xuanxiang` VALUES ('82', '58', '', '1', '1', '3');
INSERT INTO `xuanxiang` VALUES ('83', '59', '5465', '0', '0', '0');
INSERT INTO `xuanxiang` VALUES ('84', '59', '54654', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('85', '59', '54654', '0', '0', '2');
INSERT INTO `xuanxiang` VALUES ('106', '60', '5454', '1', '1', '0');
INSERT INTO `xuanxiang` VALUES ('107', '60', '454', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('135', '27', '11111', '2', '2', '0');
INSERT INTO `xuanxiang` VALUES ('137', '27', '44', '5', '5', '1');
INSERT INTO `xuanxiang` VALUES ('138', '27', '55', '4', '4', '2');
INSERT INTO `xuanxiang` VALUES ('139', '27', '66', '0', '0', '3');
INSERT INTO `xuanxiang` VALUES ('140', '27', '77', '0', '0', '4');
INSERT INTO `xuanxiang` VALUES ('141', '1', '11', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('143', '27', '88', '21', '21', '5');
INSERT INTO `xuanxiang` VALUES ('144', '61', '11111111', '1', '1', '0');
INSERT INTO `xuanxiang` VALUES ('145', '61', '1', '1', '1', '1');
INSERT INTO `xuanxiang` VALUES ('146', '62', '11111111', '1', '1', '0');
INSERT INTO `xuanxiang` VALUES ('147', '62', '1', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('148', '63', '选项1', '1', '1', '0');
INSERT INTO `xuanxiang` VALUES ('149', '63', '选项2', '1', '1', '1');
INSERT INTO `xuanxiang` VALUES ('150', '63', '选项3', '0', '0', '2');
INSERT INTO `xuanxiang` VALUES ('151', '63', '选项4', '0', '0', '3');
INSERT INTO `xuanxiang` VALUES ('152', '63', '选项5', '0', '0', '4');
INSERT INTO `xuanxiang` VALUES ('158', '49', '3', '1', '0', '2');
INSERT INTO `xuanxiang` VALUES ('270', '64', '选项3', '0', '0', '0');
INSERT INTO `xuanxiang` VALUES ('271', '64', '选项4', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('272', '64', '5', '1', '1', '2');
INSERT INTO `xuanxiang` VALUES ('282', '65', '1', '1', '1', '0');
INSERT INTO `xuanxiang` VALUES ('284', '65', '2', '0', '0', '1');
INSERT INTO `xuanxiang` VALUES ('285', '65', '3', '0', '0', '2');
INSERT INTO `xuanxiang` VALUES ('290', '65', '4', '0', '0', '3');
INSERT INTO `xuanxiang` VALUES ('291', '66', '选项1', '1', '0', '0');
INSERT INTO `xuanxiang` VALUES ('292', '66', '选项2', '2', '1', '1');
INSERT INTO `xuanxiang` VALUES ('293', '66', '选项3', '3', '0', '2');
INSERT INTO `xuanxiang` VALUES ('294', '66', '选项4', '4', '0', '3');
INSERT INTO `xuanxiang` VALUES ('295', '66', '选项5', '5', '0', '4');
