/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : frame

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2020-11-25 17:07:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pay_history
-- ----------------------------
DROP TABLE IF EXISTS `pay_history`;
CREATE TABLE `pay_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `price` decimal(32,8) DEFAULT NULL COMMENT '金额',
  `money` decimal(32,8) DEFAULT NULL COMMENT '优惠价',
  `merchant_no` varchar(32) DEFAULT NULL COMMENT '商家号码',
  `pay_type` varchar(32) DEFAULT NULL COMMENT '支付方式 1 微信\r\n2 支付宝\r\n3 现金',
  `product_name` varchar(255) DEFAULT NULL COMMENT '品名称',
  `product_remake` varchar(32) DEFAULT NULL COMMENT '品描述',
  `type` varchar(32) DEFAULT NULL COMMENT '状态 1 完成支付 \r\n2 支付失败\r\n3 挂单 4交易关闭',
  `zhekou_moling` varchar(100) DEFAULT NULL COMMENT '折扣或抹零',
  `remake` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `pay_msg` varchar(255) DEFAULT NULL,
  `account_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT=' ';

-- ----------------------------
-- Records of pay_history
-- ----------------------------
INSERT INTO `pay_history` VALUES ('1', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '1', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('2', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '2', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('3', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '2', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('4', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '2', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('5', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '1', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('6', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '3', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('7', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '3', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('8', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '3', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('9', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '4', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('10', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '4', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('11', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '1', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('12', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '1', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('13', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '1', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('14', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '3', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('15', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '3', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('16', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '3', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('17', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '3', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('18', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '3', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('19', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '3', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('20', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '1', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('21', '100.25000000', '100.00000000', 'NO14982', '1', '酒类', null, '1', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('22', '100.25000000', '100.00000000', 'NO586982', '1', '酒类', null, '1', null, null, '123123', '2020-10-17 11:45:47', '123123', null, null, null);
INSERT INTO `pay_history` VALUES ('23', '156.00000000', '156.00000000', 'NO586982', '1', '酒鬼花生', null, '3', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：酒鬼花生,原价：156,优惠价：156,折扣：undefined,抹零：undefined', '6', '2020-11-11 11:19:52', null, null, null, null);
INSERT INTO `pay_history` VALUES ('24', '0.10000000', '0.10000000', 'NO14982', '1', '测试', '测试', '1', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.1,优惠价：0.1,折扣：无,抹零：无', '1', '2020-11-12 12:00:25', null, null, '微信或支付宝支付成功', 'NO20201112114021592755');
INSERT INTO `pay_history` VALUES ('25', '152.00000000', '150.00000000', 'NO586982', '1', '酒鬼花生', null, '3', '{\"zhekou\":9.9,\"moling\":-1}', '名称：酒鬼花生,原价：152,优惠价：150,折扣：9.9,抹零：-1', '6', '2020-11-11 11:23:47', null, null, null, null);
INSERT INTO `pay_history` VALUES ('26', '0.10000000', '0.10000000', 'NO14982', '1', '测试', '测试', '1', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.1,优惠价：0.1,折扣：无,抹零：无', '6', '2020-11-11 11:23:47', null, null, '微信或支付宝支付成功', 'NO20201112114455154788');
INSERT INTO `pay_history` VALUES ('27', '0.01000000', '0.01000000', 'NO14982', '1', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-12 13:22:42', '1', '2020-11-12 13:19:24', '失败', 'NO20201112131902080198');
INSERT INTO `pay_history` VALUES ('28', '0.01000000', '0.01000000', 'NO14982', '1', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', null, null, '1', '2020-11-12 13:22:59', '失败', 'NO20201112132250632203');
INSERT INTO `pay_history` VALUES ('29', '0.01000000', '0.01000000', 'NO14982', '1', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', null, null, '1', '2020-11-12 13:25:53', '失败', 'NO20201112132519064486');
INSERT INTO `pay_history` VALUES ('30', '0.01000000', '0.01000000', 'NO14982', '1', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-12 13:27:09', '1', '2020-11-12 13:27:05', '失败', 'NO20201112132650030273');
INSERT INTO `pay_history` VALUES ('31', '0.01000000', '0.01000000', 'NO14982', '1', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', null, null, '1', '2020-11-12 13:27:54', '失败', 'NO20201112132747526374');
INSERT INTO `pay_history` VALUES ('32', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 13:51:12', '1', '2020-11-16 13:43:16', '未支付', 'NO20201116134313752962');
INSERT INTO `pay_history` VALUES ('33', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 13:51:12', '1', '2020-11-16 13:47:35', '未支付', 'NO20201116134733716439');
INSERT INTO `pay_history` VALUES ('34', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 13:52:15', '1', '2020-11-16 13:51:55', '未支付', 'NO20201116135153633516');
INSERT INTO `pay_history` VALUES ('35', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 13:54:18', '1', '2020-11-16 13:54:02', '未支付', 'NO20201116135340708301');
INSERT INTO `pay_history` VALUES ('36', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 13:57:20', '1', '2020-11-16 13:57:05', '未支付', 'NO20201116135701225581');
INSERT INTO `pay_history` VALUES ('37', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 13:59:22', '1', '2020-11-16 13:58:39', '未支付', 'NO20201116135828107541');
INSERT INTO `pay_history` VALUES ('38', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 14:00:18', '1', '2020-11-16 14:00:02', '未支付', 'NO20201116140001434100');
INSERT INTO `pay_history` VALUES ('39', '0.04000000', '0.04000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.04,优惠价：0.04,折扣：无,抹零：无', '1', '2020-11-16 14:01:49', '1', '2020-11-16 14:01:33', '未支付', 'NO20201116140131870583');
INSERT INTO `pay_history` VALUES ('40', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 14:04:23', '1', '2020-11-16 14:03:40', '未支付', 'NO20201116140339486965');
INSERT INTO `pay_history` VALUES ('41', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 14:05:30', '1', '2020-11-16 14:05:14', '未支付', 'NO20201116140512807887');
INSERT INTO `pay_history` VALUES ('42', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 14:06:53', '1', '2020-11-16 14:06:37', '未支付', 'NO20201116140635964769');
INSERT INTO `pay_history` VALUES ('43', '0.01000000', '0.01000000', 'NO14982', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '1', '2020-11-16 14:08:12', '1', '2020-11-16 14:07:57', '未支付', 'NO20201116140755751311');
INSERT INTO `pay_history` VALUES ('44', '0.01000000', '0.01000000', 'NO14982', '1', '测试', '测试', '1', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', null, '2020-11-16 17:08:12', '1', '2020-11-16 14:30:50', '微信或支付宝支付成功', 'NO20201116143042154637');
INSERT INTO `pay_history` VALUES ('45', '0.01000000', '0.01000000', 'NO14982', '1', '测试', '测试', '1', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', null, '2020-11-16 17:08:12', '1', '2020-11-16 17:34:12', '微信或支付宝支付成功', 'NO20201116173409016987');
INSERT INTO `pay_history` VALUES ('46', '0.01000000', '0.01000000', 'NO747087', '1', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '9', '2020-11-16 18:17:25', '9', '2020-11-16 17:57:44', '支付失败！', 'NO20201116174126165153');
INSERT INTO `pay_history` VALUES ('47', '0.01000000', '0.01000000', 'NO747087', '1', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '9', '2020-11-16 18:18:58', '9', '2020-11-16 18:17:20', '支付失败！', 'NO20201116181640076279');
INSERT INTO `pay_history` VALUES ('48', '0.01000000', '0.01000000', 'NO747087', '1', '测试', '测试', '1', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '9', '2020-11-16 18:17:25', '9', '2020-11-16 18:18:37', '微信支付支付成功！', 'NO20201116181834741664');
INSERT INTO `pay_history` VALUES ('49', '0.01000000', '0.01000000', 'NO747087', '2', '测试', '测试', '1', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '9', '2020-11-16 18:18:58', '9', '2020-11-16 18:18:57', '支付宝支付支付成功！', 'NO20201116181853524558');
INSERT INTO `pay_history` VALUES ('50', '0.01000000', '0.01000000', 'NO747087', '2', '测试', '测试', '2', '{\"zhekou\":\"\",\"moling\":\"\"}', '名称：测试,原价：0.01,优惠价：0.01,折扣：无,抹零：无', '9', '2020-11-16 18:21:16', '9', '2020-11-16 18:21:16', '支付失败！', 'NO20201116182112069902');

-- ----------------------------
-- Table structure for pdman_db_version
-- ----------------------------
DROP TABLE IF EXISTS `pdman_db_version`;
CREATE TABLE `pdman_db_version` (
  `DB_VERSION` varchar(256) DEFAULT NULL,
  `VERSION_DESC` varchar(1024) DEFAULT NULL,
  `CREATED_TIME` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pdman_db_version
-- ----------------------------
INSERT INTO `pdman_db_version` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `names` varchar(32) DEFAULT NULL COMMENT '名称',
  `remake` varchar(64) DEFAULT NULL COMMENT '备注',
  `merchant_no` varchar(255) DEFAULT NULL COMMENT '商户编号',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT=' ';

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('5', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('6', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('7', '测试', '测试', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('8', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('9', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('10', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('11', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('12', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('13', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('14', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('15', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('16', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('17', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('18', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('19', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('20', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('21', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('22', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('23', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('24', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('25', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('26', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('27', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('28', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('29', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('30', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('31', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('32', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('33', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('34', '绿化费2', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-11-03 14:43:19');
INSERT INTO `product_type` VALUES ('35', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('36', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('37', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('38', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('39', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('40', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('41', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('42', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('43', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('44', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('45', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('46', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('47', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('48', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('49', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('50', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('51', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('52', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('53', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('54', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('55', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('56', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('57', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('58', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('59', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('60', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('61', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('62', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('63', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('64', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('65', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('66', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('67', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('68', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('69', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('70', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('71', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('72', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('73', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('74', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('75', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('76', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('77', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('78', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('79', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('80', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('81', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('82', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('83', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('84', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('85', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('86', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('87', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('88', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('89', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('90', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('91', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('92', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('93', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('94', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('95', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('96', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('97', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('98', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('99', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('100', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('101', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('102', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('103', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('104', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('105', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('106', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('107', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('108', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('109', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('110', '电费', '电费', 'NO14982', '1', '2020-10-14 15:26:48', '3', '2020-10-16 12:03:39');
INSERT INTO `product_type` VALUES ('111', '水费', '水费', 'NO14982', '2', '2020-10-14 15:27:24', '1', '2020-10-16 12:03:45');
INSERT INTO `product_type` VALUES ('112', '绿化费', '绿化费', 'NO14982', '1', '2020-10-14 15:27:42', '1', '2020-10-16 12:03:43');
INSERT INTO `product_type` VALUES ('113', '雪花啤酒', '雪花啤酒', 'NO586982', '6', '2020-11-11 10:11:41', null, null);
INSERT INTO `product_type` VALUES ('114', '榨汁可乐', null, 'NO586982', '6', '2020-11-11 10:11:55', null, null);
INSERT INTO `product_type` VALUES ('115', '雪碧', null, 'NO586982', '6', '2020-11-11 10:12:01', null, null);
INSERT INTO `product_type` VALUES ('116', '酒鬼瓜子', null, 'NO586982', '6', '2020-11-11 10:12:18', null, null);
INSERT INTO `product_type` VALUES ('117', '酒鬼花生', null, 'NO586982', '6', '2020-11-11 10:12:27', null, null);
INSERT INTO `product_type` VALUES ('118', '测试', '测试', 'NO747087', '9', '2020-11-16 15:45:51', '5', '2020-11-16 15:53:52');

-- ----------------------------
-- Table structure for split_merchant
-- ----------------------------
DROP TABLE IF EXISTS `split_merchant`;
CREATE TABLE `split_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sub_mer_id` varchar(32) NOT NULL COMMENT '二级商户编号 二级商户编号',
  `sub_mer_name` varchar(32) NOT NULL COMMENT '二级商户名称 二级商户名称',
  `sub_mer_type` varchar(32) NOT NULL COMMENT '二级商户类型 二级商户类型 1 个人商户 2 企业商户',
  `status` varchar(32) NOT NULL DEFAULT '0' COMMENT '二级商户状态 二级商户状态 0:关闭 1:正常',
  `contact_name` varchar(32) NOT NULL COMMENT '法定代表人或负责人名称 法定代表人或负责人名称',
  `certificate_type` varchar(32) NOT NULL COMMENT '法定代表人或负责人证件类型 法定代表人或负责人证件类型  I 身份证 P 护照 G 军官证 U 其它证件',
  `certificate_no` varchar(32) NOT NULL COMMENT '法定代表人或负责人证件编号 法定代表人或负责人证件编号',
  `company_name` varchar(32) DEFAULT NULL COMMENT '企业名称 企业名称 企业商户必输',
  `company_cert_type` varchar(32) DEFAULT NULL COMMENT '企业证件类型 企业证件类型 企业商户必输 U 营业执照 Y 组织机构代码证 V 统一社会信用代码',
  `company_cert_no` varchar(32) DEFAULT NULL COMMENT '企业证件编号 企业证件编号企业商户必输',
  `account_name` varchar(32) NOT NULL COMMENT '收款户名 收款户名',
  `account` varchar(32) NOT NULL COMMENT '收款账号 收款账号',
  `bank_name` varchar(32) NOT NULL COMMENT '收款银行 收款银行',
  `mobile_phone` varchar(32) NOT NULL COMMENT '银行预留手机号 银行预留手机号',
  `account_type` varchar(32) NOT NULL COMMENT '收款账户类型 收款账户类型 401-借记卡 601-支票户',
  `address` varchar(32) DEFAULT NULL COMMENT '地址 地址',
  `remake` varchar(64) DEFAULT NULL COMMENT '备注',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `merchant_no` varchar(11) DEFAULT NULL,
  `is_register_nh` varchar(2) DEFAULT '0' COMMENT '是否注册到农行 0否 1是',
  `is_register_can` varchar(255) DEFAULT '1' COMMENT '是否可以注册 0 否 1 是',
  `is_register_error_msg` varchar(255) DEFAULT NULL COMMENT '注册失败的原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT=' ';

-- ----------------------------
-- Records of split_merchant
-- ----------------------------
INSERT INTO `split_merchant` VALUES ('1', '160437447055309', '甘肃橙子信息科技有限公司', '2', '1', '闵锐', 'I', '620102198810213316', '甘肃橙子信息科技有限公司', 'U', '91620102MA73B9QG3L', '甘肃橙子信息科技有限公司', '27034301040008858', '中国农业银行股份有限公司', '13519315420', '601', '甘肃兰州', '甘肃橙子信息技术有限公司', '1', '2020-11-02 18:02:51', '1', '2020-11-06 16:00:56', '', '0', '0', '{ReturnCode=AP6684, ErrorMessage=商户未开通多级账簿，请到柜台办理且核对凭证信息}');

-- ----------------------------
-- Table structure for sys_button
-- ----------------------------
DROP TABLE IF EXISTS `sys_button`;
CREATE TABLE `sys_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(32) DEFAULT NULL COMMENT '名称',
  `name` varchar(32) DEFAULT NULL COMMENT '代码',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `method_name` varchar(32) DEFAULT NULL COMMENT '方法名称',
  `method_param` varchar(32) DEFAULT NULL COMMENT '方法参数',
  `size` varchar(32) DEFAULT NULL COMMENT '按钮大小',
  `type` varchar(32) DEFAULT NULL COMMENT '按钮类型',
  `css` varchar(200) DEFAULT NULL COMMENT '按钮样式',
  `menu_id` varchar(32) DEFAULT NULL COMMENT '所属菜单',
  `remake` varchar(64) DEFAULT NULL COMMENT '备注',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用 0 否 1 是',
  `menu_type` int(1) DEFAULT '1' COMMENT '1 显示菜单  2 条件按钮  3编辑按钮',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='按钮表 ';

-- ----------------------------
-- Records of sys_button
-- ----------------------------
INSERT INTO `sys_button` VALUES ('1', '新增顶级菜单', 'menAdd', '', 'btnClick', 'menuAdd', '', 'danger', '', '2', '', '1', '2020-10-29 16:09:23', '1', '2020-11-06 15:13:18', '1', '2', '2');
INSERT INTO `sys_button` VALUES ('2', '编辑', 'menu-editor', '', 'btnClick', 'menuEditor', '', 'text', '', '2', '', '1', '2020-10-29 16:14:43', '1', '2020-11-06 15:13:54', '1', '1', '1');
INSERT INTO `sys_button` VALUES ('3', '挂单', 'shouyintan-guandan', 'el-icon-s-claim', 'btnClick', 'hangingOrder', 'max', 'primary', 'background:white;color:#409EFF;padding: 15px 60px;font-size: 24px;', '1', '', '1', '2020-11-04 10:34:33', '5', '2020-11-10 18:34:03', '0', '1', '1');
INSERT INTO `sys_button` VALUES ('4', '收银', 'shouyintan-guandan', 'el-icon-coin', 'btnClick', 'cashier', 'max', 'warning', 'padding: 15px 60px;font-size: 24px;', '1', '', '1', '2020-11-04 10:35:48', '5', '2020-11-10 18:34:49', '0', '1', '2');
INSERT INTO `sys_button` VALUES ('8', '搜索', 'shouyintan-search', 'el-icon-search', 'btnClick', 'search', '', 'primary', '', '1', '', '1', '2020-11-04 11:23:34', '5', '2020-11-10 18:14:49', '0', '2', '2');
INSERT INTO `sys_button` VALUES ('9', '取单', 'shouyintan-qudan', 'el-icon-paperclip', 'btnClick', 'getOrder', '', 'text', '', '1', '', '1', '2020-11-04 11:25:48', '5', '2020-11-10 18:15:05', '0', '3', '2');
INSERT INTO `sys_button` VALUES ('10', '关闭', 'shouyintan-guanbi', 'el-icon-lock', 'btnClick', 'closeOrder', '', 'text', 'color:red;', '1', '', '1', '2020-11-04 11:28:23', '5', '2020-11-10 18:14:59', '0', '3', '3');
INSERT INTO `sys_button` VALUES ('11', '禁用', 'menu-disabled', '', 'btnClick', 'menuDisabled', '', 'text', 'color:red;', '2', '', '1', '2020-11-04 11:32:01', '1', '2020-11-06 15:14:01', '1', '1', '2');
INSERT INTO `sys_button` VALUES ('12', '启用', 'menu-enabled', '', 'btnClick', 'menuEnabled', '', 'text', 'color:#67c23a;', '2', '', '1', '2020-11-04 11:32:50', '1', '2020-11-06 15:14:07', '1', '1', '3');
INSERT INTO `sys_button` VALUES ('13', '添加菜单', 'menu-add', '', 'btnClick', 'menuChildAdd', '', 'text', '', '2', '', '1', '2020-11-04 11:33:38', '1', '2020-11-06 15:14:12', '1', '1', '4');
INSERT INTO `sys_button` VALUES ('14', '设置', 'btn-setting', '', 'btnClick', 'menuSetting', '', 'text', 'color:red;', '2', '', '1', '2020-11-04 11:34:11', '1', '2020-11-06 15:14:19', '1', '1', '5');
INSERT INTO `sys_button` VALUES ('15', '新增', 'trunmerchant-Add', '', 'btnClick', 'add', '', 'danger', '', '7', '', '1', '2020-11-04 11:38:36', '1', '2020-11-03 16:41:04', '1', '2', '4');
INSERT INTO `sys_button` VALUES ('16', '编辑', 'trunmerchant-editor', '', 'btnClick', 'editor', '', 'text', '', '7', '', '1', '2020-11-04 11:39:11', '1', '2020-11-05 15:28:30', '1', '1', '2');
INSERT INTO `sys_button` VALUES ('17', '删除', 'trunmerchant-delete', '', 'btnClick', 'delete', '', 'text', 'color:red;', '7', '', '1', '2020-11-04 11:39:56', '1', '2020-11-04 11:31:20', '1', '1', '2');
INSERT INTO `sys_button` VALUES ('18', '查看', 'trunmerchant-read', '', 'btnClick', 'read', '', 'text', '', '7', '', '1', '2020-11-04 11:40:30', '1', '2020-11-05 15:28:34', '1', '1', '1');
INSERT INTO `sys_button` VALUES ('19', '搜索', 'trunmerchant-search', 'el-icon-search', 'btnClick', 'search', '', 'primary', '', '7', '', '1', '2020-11-04 11:41:12', '1', '2020-11-04 11:17:11', '0', '2', '3');
INSERT INTO `sys_button` VALUES ('20', '新增', 'splitmerchant-Add', '', 'btnClick', 'add', '', 'danger', '', '8', '', '1', '2020-11-04 11:38:36', '1', '2020-11-04 11:47:10', '1', '2', '4');
INSERT INTO `sys_button` VALUES ('21', '编辑', 'splitmerchant-editor', '', 'btnClick', 'editor', '', 'text', '', '8', '', '1', '2020-11-04 11:39:11', '1', '2020-11-04 11:47:16', '1', '1', '2');
INSERT INTO `sys_button` VALUES ('22', '删除', 'splitmerchant-delete', '', 'btnClick', 'delete', '', 'text', 'color:red;', '8', '', '1', '2020-11-04 11:39:56', '1', '2020-11-04 11:47:23', '1', '1', '2');
INSERT INTO `sys_button` VALUES ('23', '查看', 'splitmerchant-read', '', 'btnClick', 'read', '', 'text', '', '8', '', '1', '2020-11-04 11:40:30', '1', '2020-11-04 11:47:30', '1', '1', '1');
INSERT INTO `sys_button` VALUES ('24', '搜索', 'splitmerchant-search', 'el-icon-search', 'btnClick', 'search', '', 'primary', '', '8', '', '1', '2020-11-04 11:41:12', '1', '2020-11-04 11:47:40', '0', '2', '3');
INSERT INTO `sys_button` VALUES ('25', '新增', 'user-Add', '', 'btnClick', 'add', '', 'danger', '', '9', '', '1', '2020-11-04 11:38:36', '1', '2020-11-06 14:41:55', '1', '2', '2');
INSERT INTO `sys_button` VALUES ('26', '编辑', 'user-editor', '', 'btnClick', 'editor', '', 'text', '', '9', '', '1', '2020-11-04 11:39:11', '1', '2020-11-06 14:41:01', '1', '1', '4');
INSERT INTO `sys_button` VALUES ('27', '删除', 'user-delete', '', 'btnClick', 'delete', '', 'text', 'color:red;', '9', '', '1', '2020-11-04 11:39:56', '1', '2020-11-06 14:41:06', '1', '1', '5');
INSERT INTO `sys_button` VALUES ('28', '查看', 'user-read', '', 'btnClick', 'read', '', 'text', '', '9', '', '1', '2020-11-04 11:40:30', '1', '2020-11-06 14:40:55', '1', '1', '3');
INSERT INTO `sys_button` VALUES ('29', '搜索', 'user-search', 'el-icon-search', 'btnClick', 'search', '', 'primary', '', '9', '', '1', '2020-11-04 11:41:12', '1', '2020-11-06 14:41:43', '0', '2', '1');
INSERT INTO `sys_button` VALUES ('30', '新增', 'productType-Add', '', 'btnClick', 'add', '', 'danger', '', '10', '', '1', '2020-11-04 11:38:36', '1', '2020-11-06 14:43:39', '1', '2', '2');
INSERT INTO `sys_button` VALUES ('31', '编辑', 'productType-editor', '', 'btnClick', 'editor', '', 'text', '', '10', '', '1', '2020-11-04 11:39:11', '1', '2020-11-04 11:50:18', '1', '1', '2');
INSERT INTO `sys_button` VALUES ('32', '删除', 'productType-delete', '', 'btnClick', 'delete', '', 'text', 'color:red;', '10', '', '1', '2020-11-04 11:39:56', '1', '2020-11-04 11:50:28', '1', '1', '2');
INSERT INTO `sys_button` VALUES ('33', '查看', 'productType-read', '', 'btnClick', 'read', '', 'text', '', '10', '', '1', '2020-11-04 11:40:30', '1', '2020-11-04 11:50:33', '1', '1', '1');
INSERT INTO `sys_button` VALUES ('34', '搜索', 'productType-search', 'el-icon-search', 'btnClick', 'search', '', 'primary', '', '10', '', '1', '2020-11-04 11:41:12', '1', '2020-11-06 14:43:31', '0', '2', '1');
INSERT INTO `sys_button` VALUES ('35', '新增', 'pay-Add', '', 'btnClick', 'payAdd', '', 'danger', '', '6', '', '1', '2020-11-04 11:38:36', '1', '2020-11-06 14:50:00', '1', '2', '2');
INSERT INTO `sys_button` VALUES ('36', '编辑', 'pay-editor', '', 'btnClick', 'payEditor', '', 'text', '', '6', '', '1', '2020-11-04 11:39:11', '1', '2020-11-04 11:51:36', '1', '1', '2');
INSERT INTO `sys_button` VALUES ('37', '删除', 'pay-delete', '', 'btnClick', 'payDelete', '', 'text', 'color:red;', '6', '', '1', '2020-11-04 11:39:56', '1', '2020-11-06 14:50:15', '1', '1', '5');
INSERT INTO `sys_button` VALUES ('38', '查看', 'pay-read', '', 'btnClick', 'payRead', '', 'text', '', '6', '', '1', '2020-11-04 11:40:30', '1', '2020-11-06 14:50:11', '1', '1', '4');
INSERT INTO `sys_button` VALUES ('39', '搜索', 'pay-search', 'el-icon-search', 'btnClick', 'paySearch', '', 'primary', '', '6', '', '1', '2020-11-04 11:41:12', '1', '2020-11-06 14:50:24', '0', '2', '1');
INSERT INTO `sys_button` VALUES ('40', '搜索', 'menSerach', '', 'search', 'menuSearch', '', 'primary', '', '2', '', '1', '2020-11-06 15:13:04', '1', '2020-11-06 15:13:38', '1', '2', '1');
INSERT INTO `sys_button` VALUES ('41', '设置权限', 'roule-setting', 'el-icon-s-tools', 'btnClick', 'rouleSetting', '', 'text', 'color:red;', '11', null, '1', '2020-11-10 09:36:44', null, null, '1', '1', '1');
INSERT INTO `sys_button` VALUES ('42', '按钮', 'roule-button', 'el-icon-s-tools', 'btnClick', 'rouleButton', '', 'text', '', '11', '', '1', '2020-11-10 09:42:34', '', null, '1', '5', '6');
INSERT INTO `sys_button` VALUES ('43', '布局', 'roule-layout', 'el-icon-document-copy', 'btnClick', 'rouleLayout', '', 'text', 'color:green;', '11', '', '1', '2020-11-10 09:43:09', '1', '2020-11-10 09:48:42', '1', '5', '6');
INSERT INTO `sys_button` VALUES ('44', '查询', 'roule-Search', 'el-icon-s-search', 'btnClick', 'rouleSearch', '', 'primary', '', '11', '', '1', '2020-11-10 09:46:37', '1', '2020-11-10 09:47:54', '1', '4', '2');
INSERT INTO `sys_button` VALUES ('45', '保存菜单', 'roule-SaveMenu', 'el-icon-mobile', 'btnClick', 'rouleSaveMenu', '', 'primary', '', '11', '', '1', '2020-11-10 09:50:53', '1', '2020-11-10 09:51:54', '1', '5', '5');
INSERT INTO `sys_button` VALUES ('46', '按钮保存', 'roule-SaveButton', 'el-icon-mobile', 'btnClick', 'rouleSaveButton', '', 'primary', '', '11', '', '1', '2020-11-10 09:52:29', '1', '2020-11-10 09:51:54', '1', '6', '5');
INSERT INTO `sys_button` VALUES ('47', '布局保存', 'roule-SaveLayout', 'el-icon-mobile', 'btnClick', 'rouleSaveLayout', '', 'warning', '', '11', '', '1', '2020-11-10 09:52:53', '1', '2020-11-10 09:53:14', '1', '6', '5');
INSERT INTO `sys_button` VALUES ('48', '查看', 'shouyintan-read', 'el-icon-search', 'btnClick', 'readOrder', '', 'text', '', '1', '', '5', '2020-11-11 11:35:12', '5', '2020-11-11 11:38:48', '1', '3', '2');
INSERT INTO `sys_button` VALUES ('49', '布局设置', 'menu-layoutSetting', null, 'btnClick', 'menuLayoutSetting', '', 'text', null, '2', null, '5', '2020-11-12 13:37:37', null, null, '1', '7', '1');
INSERT INTO `sys_button` VALUES ('50', '按钮设置', 'menu-buttonSetting', '', 'btnClick', 'menuButtonSetting', '', 'text', '', '2', '', '5', '2020-11-12 13:46:00', '', null, '1', '8', '1');
INSERT INTO `sys_button` VALUES ('51', '布局设置', 'menu-layoutSetting', null, 'btnClick', 'rouleLayoutSetting', '', 'text', null, '11', null, '5', '2020-11-12 13:37:37', null, null, '1', '9', '1');
INSERT INTO `sys_button` VALUES ('52', '按钮设置', 'menu-buttonSetting', '', 'btnClick', 'rouleButtonSetting', '', 'text', '', '11', '', '5', '2020-11-12 13:46:00', '', null, '1', '10', '1');

-- ----------------------------
-- Table structure for sys_layout
-- ----------------------------
DROP TABLE IF EXISTS `sys_layout`;
CREATE TABLE `sys_layout` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` varchar(32) DEFAULT NULL COMMENT '菜单编号',
  `layout_json` text COMMENT '布局json',
  `layout_type` int(1) DEFAULT NULL COMMENT '布局类型 布局类型 1:页面 2:查询条件 3:编辑页面',
  `remake` varchar(64) DEFAULT NULL COMMENT '备注',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `api_name` varchar(3000) DEFAULT NULL COMMENT '调用请求使用的api名称',
  `cols` int(1) DEFAULT '1' COMMENT '编辑界面的列数',
  `code` varchar(255) DEFAULT NULL COMMENT '用来标识一个页面多个同类型布局时的唯一代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='页面显示布局 ';

-- ----------------------------
-- Records of sys_layout
-- ----------------------------
INSERT INTO `sys_layout` VALUES ('2', '7', '[{prop:\'id\',label:\'ID\',width:\'50px\',},{prop:\'merchantNo\',label:\'商户号\',width:\'140px\',},{prop:\'type\',label:\'账户类型\',width:\'140px\',getHtml:(val) => {         let t = val == \'1\' ? [\'农业银行\', \'农行\', \'c-s\', \'http://www.abchina.com/cn/images/logo_ue2.png\'] : val == \'2\' ? [\'兴业银行\', \'兴业\', \'c-d\', \'https://www.cib.com.cn/cn/resources/css/2015/images/logo.jpg\'] : [\'其他\', \'其他\', \'c-i\', \'\'];         let html = `<div class=\"${t[2]}\" title=\"${t[0]}\"><img src=\'${t[3]}\' style=\"width:120px\" /></div>`;         return html;     },},{prop:\'merchantId\',label:\'商户代码\',width:\'auto\',},{prop:\'merchantCertFile\',label:\'证书或接口地址\',},{prop:\'remake\',label:\'备注\',width:\'100px\',},{prop:\'createdBy\',label:\'创建人\',width:\'80px\',select:\'getSysUserByData?outColumn=nickName&inColumn=id\',},{prop:\'updatedBy\',label:\'修改人\',width:\'80px\',select:\'getSysUserByData?outColumn=nickName&inColumn=id\',},{prop:\'createdTime\',label:\'创建时间\',width:\'160px\',format:(val) => {         if (val) {             var date = new Date(val);             return this.$util.getNowDT(0, date);         }         return val;     },},{prop:\'updatedTime\',label:\'修改时间\',width:\'160px\',format:(val) => {         if (val) {             var date = new Date(val);             return this.$util.getNowDT(0, date);         }         return val;     },}]', '1', '配置管理显示布局', '1', '2020-11-04 15:05:11', '5', '2020-11-19 16:56:41', '1', '{list:\'getTrustMerchantAll\'}', '1', '');
INSERT INTO `sys_layout` VALUES ('3', '7', '[{\n	prop: \"merchantId\",\n	label: \"商户代码\",\n	placeholder: \'商户代码，由银行指定\',\n	type: \'text\',\n},\n{\n	prop: \"merchantNo\",\n	label: \"商户编号\",\n	type: \'text\',\n}]', '2', '配置管理查询布局', '1', '2020-11-04 15:33:29', '1', '2020-11-06 17:49:47', '1', '{list:\'getTrustMerchantAll\'}', '1', null);
INSERT INTO `sys_layout` VALUES ('4', '7', '[{\n	prop: \"id\",\n	label: \"编号\",\n	type: \'text\',\n	readonly: true,\n	disabled: true\n},\n{\n	prop: \"type\",\n	label: \"商户类型\",\n	type: \'select\',\n	require: true,\n	value:[\n	    {\n	      label:\'农业银行\',\n	      value:\'1\'\n	    },\n	    {\n	      label:\'兴业银行\',\n	      value:\'2\'\n	    },\n	],\n	change: (val) => {\n		let property = {\n			\'merchantId\': {\n				label: val == \'1\'?\'商户代码\':\'商户号\',\n			},\n			\'merchantCertFile\': {\n				label: val==\'1\'?\'商户证书\':\'支付接口地址\',\n			},\n			\'splitMerchantId\': {\n				label: val==\'1\'?\'出金商户号\':\'RSA私钥\',\n				type:val==\'1\'?\'text\':\'textarea\',\n				row:4\n			},\n			\'splitMerchantName\': {\n				label: val==\'1\'?\'出金商户名称\':\'RSA平台公钥\',\n				type:val==\'1\'?\'text\':\'textarea\',\n				row:4\n			},\n			\'merchantCertPassword\': {\n				password: val ==  \'1\',\n				label: val ==  \'1\'?\'商户证书密码\':\'MD5签名密钥\',\n				type:val==\'1\'?\'text\':\'textarea\',\n				require:val ==  \'1\',\n				row:4\n\n			},\n			\'logPath\':{\n				visabled: val ==  \'1\',\n			}\n		};\n		return property;\n	}\n},\n{\n	prop: \"merchantId\",\n	label: \"商户代码\",\n	placeholder: \'商户代码，由银行指定\',\n	type: \'text\',\n	require: true,\n},\n{\n	prop: \"merchantCertFile\",\n	label: \"商户证书\",\n	type: \'text\',\n	require: true,\n},\n{\n	prop: \"splitMerchantId\",\n	label: \"出金商户号\",\n	type: \'text\',\n	require: true,\n},{\n	prop: \"splitMerchantName\",\n	label: \"出金商户名称\",\n	type: \'text\',\n	require: true,\n},\n{\n	prop: \"merchantCertPassword\",\n	label: \"商户证书密码\",\n	type: \'text\',\n	password:\'true\',\n	require: true,\n},\n{\n	prop: \"logPath\",\n	label: \"商户日志目录\",\n	type: \'text\',\n	require: true,\n},\n{\n	prop: \"remake\",\n	label: \"备注\",\n	type: \'textarea\',\n	rows: \'8\'\n},\n]', '3', '商户配置页面', '1', '2020-11-04 15:34:31', '5', '2020-11-16 15:18:05', '1', '{\n	add: \'addTrustMerchant\',\n	upd: \'updTrustMerchant\',\n	byId: \'getTrustMerchantById\'\n}', '1', '');
INSERT INTO `sys_layout` VALUES ('6', '8', '[{\n	prop: \"subMerType\",\n	label: \"类型\",\n	placeholder: \'商户商户\',\n	type: \'select\',\n	value: [{\n			value: \'1\',\n			label: \'个人商户\'\n		},\n		{\n			value: \'2\',\n			label: \'企业商户\'\n		}\n	]\n},\n{\n	prop: \"status\",\n	label: \"商户状态\",\n	type: \'select\',\n	value: [{\n		value: \'1\',\n		label: \'正常\'\n	}, {\n		value: \'0\',\n		label: \'关闭\'\n	}]\n},\n{\n	prop: \"subMerName\",\n	label: \"商户名称\",\n	type: \'text\'\n},\n{\n	prop: \"contactName\",\n	label: \"联系人名称\",\n	type: \'text\'\n},\n{\n	prop: \"mobilePhone\",\n	label: \"联系电话\",\n	type: \'text\'\n},\n{\n	prop: \"isRegisterCan\",\n	label: \"可注册\",\n	type: \'select\',\n	value: [{\n		value: \'1\',\n		label: \'是\'\n	}, {\n		value: \'0\',\n		label: \'否\'\n	}]\n}]', '2', '商户配置', '1', '2020-11-05 17:47:12', null, null, '1', null, '1', null);
INSERT INTO `sys_layout` VALUES ('7', '8', '[{\n	prop: \"id\",\n	label: \"序号\",\n	width: \'50px\',\n},\n{\n	prop: \"subMerId\",\n	label: \"编号\",\n	width: \'140px\',\n},\n{\n	prop: \"subMerName\",\n	label: \"昵称\",\n	width: \'auto\',\n},\n{\n	prop: \"subMerType\",\n	label: \"类型\",\n	getHtml: (val) => {\n		let t = val == \'1\' ? [\'个人商户\', \'个人\', \'c-i\'] : val == \'2\' ? [\'企业商户\', \'企业\', \'c-s\'] : [\'其他\', \'其他\', \'c-w\'];\n		let html = `<div class=\"${t[2]}\" title=\"${t[0]}\">${t[1]}</div>`;\n		return html;\n	}\n},\n{\n	prop: \"status\",\n	label: \"状态\",\n	getHtml: (val) => {\n		let t = val == \'0\' ? [\'关闭\', \'关闭\', \'c-i\'] : [\'正常\', \'正常\', \'c-s\'];\n		let html = `<div class=\"${t[2]}\" title=\"${t[0]}\">${t[1]}</div>`;\n		return html;\n	}\n}, {\n	prop: \"contactName\",\n	label: \"联系人名称\",\n}, {\n	prop: \"companyName\",\n	label: \"企业名称\",\n}, {\n	prop: \"mobilePhone\",\n	label: \"联系电话\",\n}, {\n	prop: \"remake\",\n	label: \"备注\",\n	width: \'100px\',\n},\n{\n	prop: \"createdBy\",\n	label: \"创建人\",\n	width: \'80px\',\n	select: \'getSysUserByData?outColumn=nickName&inColumn=id\'\n}, {\n	prop: \"updatedBy\",\n	label: \"修改人\",\n	width: \'80px\',\n	select: \'getSysUserByData?outColumn=nickName&inColumn=id\'\n},\n{\n	prop: \"createdTime\",\n	label: \"创建时间\",\n	width: \'160px\',\n	format: (val) => {\n		if (val) {\n			var date = new Date(val)\n			return this.$util.getNowDT(0, date);\n		}\n		return val;\n	}\n},\n{\n	prop: \"updatedTime\",\n	label: \"修改时间\",\n	width: \'160px\',\n	format: (val) => {\n		if (val) {\n			var date = new Date(val)\n			return this.$util.getNowDT(0, date);\n		}\n		return val;\n	}\n}]', '1', '商户配置页面布局', '1', '2020-11-06 11:53:10', '1', '2020-11-06 17:46:15', '1', '{list:\'getSplitMerchantAll\'}', '1', null);
INSERT INTO `sys_layout` VALUES ('11', '8', '[{\n						prop: \"id\",\n						label: \"编号\",\n						type: \'text\',\n						readonly: true,\n						disabled: true\n					},\n					{\n						prop: \"subMerId\",\n						label: \"商户编号\",\n						type: \'text\',\n						readonly: true,\n						require: true,\n						regex: \'/^.{4,}$/\',\n						msg: \'必须4个字以上（包含4个字）\'\n					},\n					{\n						prop: \"subMerName\",\n						label: \"商户名称\",\n						type: \'text\',\n						require: true,\n						regex: \'/^.{2,}$/\',\n						msg: \'必须2个字以上（包含2个字）\'\n					},\n					{\n						prop: \"subMerType\",\n						label: \"商户类型\",\n						type: \'select\',\n						require: true,\n						value: [{\n								value: \'1\',\n								label: \'个人商户\'\n							},\n							{\n								value: \'2\',\n								label: \'企业商户\'\n							},\n						],\n						change: (val) => {\n							let property = {\n								\'companyCertNo\': {\n									readonly: val == 1,\n									require: val == 2,\n								},\n								\'companyCertType\': {\n									readonly: val == 1,\n									require: val == 2,\n								},\n								\'companyName\': {\n									readonly: val == 1,\n									require: val == 2,\n								},\n							};\n							return property;\n						}\n					},\n					{\n						prop: \"status\",\n						label: \"状态\",\n						type: \'select\',\n						require: true,\n						value: [{\n								value: \'1\',\n								label: \'正常\'\n							},\n							{\n								value: \'0\',\n								label: \'关闭\'\n							},\n						]\n					},\n					{\n						prop: \"contactName\",\n						label: \"法人或负责人\",\n						require: true,\n						type: \'text\',\n					},\n					{\n						prop: \"certificateType\",\n						label: \"证件类型\",\n						require: true,\n						type: \'select\',\n						value: [{\n								value: \'I\',\n								label: \'身份证\'\n							},\n							{\n								value: \'P\',\n								label: \'护照\'\n							}, {\n								value: \'G\',\n								label: \'军官证\'\n							}, {\n								value: \'U\',\n								label: \'其它证件\'\n							},\n						]\n					},\n					{\n						prop: \"certificateNo\",\n						label: \"证件编号\",\n						regex: \'/^[0-9]{18}$/\',\n						require: true,\n						type: \'text\',\n					},\n					{\n						prop: \"companyCertType\",\n						label: \"企业证件类型\",\n						require: false,\n						type: \'select\',\n						value: [{\n								value: \'U\',\n								label: \'营业执照\'\n							},\n							{\n								value: \'Y\',\n								label: \'组织机构代码证\'\n							}, {\n								value: \'V\',\n								label: \'统一社会信用代码\'\n							}\n						]\n					},\n					{\n						prop: \"companyCertNo\",\n						label: \"企业证件编号\",\n						require: false,\n						type: \'text\',\n					},\n					{\n						prop: \"companyName\",\n						label: \"企业名称\",\n						require: false,\n						type: \'text\',\n					},\n					{\n						prop: \"accountName\",\n						label: \"收款户名\",\n						require: true,\n						type: \'text\',\n					},\n					{\n						prop: \"bankName\",\n						label: \"收款银行\",\n						require: true,\n						type: \'text\',\n					},\n					{\n						prop: \"mobilePhone\",\n						label: \"银行预留手机号\",\n						regex: \'/^[1][0-9]{10}$/\',\n						require: true,\n						type: \'text\',\n					},\n					{\n						prop: \"account\",\n						label: \"收款账户\",\n						require: true,\n						type: \'text\',\n					},\n					{\n						prop: \"accountType\",\n						label: \"收款账户类型\",\n						require: false,\n						type: \'select\',\n						value: [{\n								value: \'401\',\n								label: \'借记卡\'\n							},\n							{\n								value: \'601\',\n								label: \'支票户\'\n							}\n						]\n					},\n					{\n						prop: \"isRegisterCan\",\n						label: \"是否可注册\",\n						type: \'select\',\n						readonly: true,\n						value: [{\n								value: \'0\',\n								label: \'不可注册\'\n							},\n							{\n								value: \'1\',\n								label: \'可注册\'\n							}\n						]\n					}, {\n						prop: \"isRegisterErrorMsg\",\n						label: \"注册失败原因\",\n						readonly: true,\n						type: \'text\',\n					},\n					{\n						prop: \"address\",\n						label: \"地址\",\n						type: \'textarea\',\n						rows: 4\n					},\n					{\n						prop: \"remake\",\n						label: \"备注\",\n						type: \'textarea\',\n						rows: 4\n					},\n\n\n				]', '3', '商户配置编辑布局', '1', '2020-11-06 12:54:50', '', null, '1', '{\n	add: \'addSplitMerchant\',\n	upd: \'updSplitMerchant\',\n	byId: \'getSplitMerchantById\'\n}', '2', null);
INSERT INTO `sys_layout` VALUES ('12', '9', '[{\n	prop: \"id\",\n	label: \"编号\",\n	width: \'50px\',\n},\n{\n	prop: \"phone\",\n	label: \"电话号码\",\n	width: \'140px\',\n},\n{\n	prop: \"nickName\",\n	label: \"昵称\",\n	width: \'auto\',\n},\n{\n	prop: \"birthday\",\n	label: \"出生日期\",\n},\n{\n	prop: \"sex\",\n	label: \"性别\",\n	getHtml: (val) => {\n		return val == \'1\' || val == \'男\' ? `<div style=\"color:green\">男</div>` : `<div style=\"color:red\">女</div>`\n	}\n}, {\n	prop: \"merchantNo\",\n	label: \"商户号\",\n}, {\n	prop: \"userType\",\n	label: \"员工类型\",\n	width: \'100px\',\n	getHtml: (val) => {\n		return val == \'1\' || val == \'员工\' ? `<div class=\"b-s c-f t-c\">员工</div>` : `<div class=\"b-w  c-f t-c\">店长</div>`\n	}\n}, {\n	prop: \"remake\",\n	label: \"备注\",\n	width: \'100px\',\n},\n{\n	prop: \"createdBy\",\n	label: \"创建人\",\n	width: \'80px\',\n	select: \'getSysUserByData?outColumn=nickName&inColumn=id\'\n}, {\n	prop: \"updatedBy\",\n	label: \"修改人\",\n	width: \'80px\',\n	select: \'getSysUserByData?outColumn=nickName&inColumn=id\'\n},\n{\n	prop: \"createdTime\",\n	label: \"创建时间\",\n	width: \'160px\',\n	format: (val) => {\n		if (val) {\n			var date = new Date(val)\n			return this.$util.getNowDT(0, date);\n		}\n		return val;\n	}\n},\n{\n	prop: \"updatedTime\",\n	label: \"修改时间\",\n	width: \'160px\',\n	format: (val) => {\n		if (val) {\n			var date = new Date(val)\n			return this.$util.getNowDT(0, date);\n		}\n		return val;\n	}\n}\n]', '1', '员工显示布局', '1', '2020-11-06 14:37:34', '1', '2020-11-09 10:47:47', '1', '{list:\'getSysUserAll\',del:\'delSysUser\'}', '1', null);
INSERT INTO `sys_layout` VALUES ('13', '9', '[{\n	prop: \"sex\",\n	label: \"性别\",\n	placeholder: \'性别\',\n	type: \'select\',\n	value: [{\n			value: \'1\',\n			label: \'男\'\n		},\n		{\n			value: \'0\',\n			label: \'女\'\n		}\n	]\n},\n{\n	prop: \"userType\",\n	label: \"用户类别\",\n	type: \'select\',\n	value: [{\n			value: \'1\',\n			label: \'员工\'\n		},\n		{\n			value: \'2\',\n			label: \'店长\'\n		}\n	]\n},\n{\n	prop: \"phone\",\n	label: \"手机号码\",\n	type: \'text\'\n},\n{\n	prop: \"nickName\",\n	label: \"昵称\",\n	type: \'text\'\n},\n{\n	prop: \"merchantNo\",\n	label: \"商户号\",\n	type: \'text\'\n}\n]', '2', '员工条件布局', '1', '2020-11-06 14:38:07', '1', '2020-11-09 10:48:27', '1', '', '1', null);
INSERT INTO `sys_layout` VALUES ('14', '9', '[{\n						prop: \"id\",\n						label: \"编号\",\n						type: \'text\',\n						readonly: true,\n						disabled: true\n					},\n					{\n						prop: \"phone\",\n						label: \"电话号码\",\n						type: \'text\',\n						require: true,\n						regex: \'/^[1][0-9]{10}$/\',\n						msg: \'电话号码必须以1开头的11数字\'\n					},\n					{\n						prop: \"nickName\",\n						label: \"昵称\",\n						require: true,\n						type: \'text\',\n					},\n					{\n						prop: \"birthday\",\n						label: \"出生日期\",\n						require: true,\n						format: \'yyyy-MM-dd\',\n						type: \'date\',\n						regex: (val) => {\n							try {\n								return !isNaN(Date.parse(val));\n							} catch (e) {\n								return false;\n								//TODO handle the exception\n							}\n						},\n						disabledDate: (date) => {\n							return this.$util.getDayDiff(this.$util.getNowD(), date) <= 0;\n						},\n						shortcuts: [{\n							text: \'5年前\',\n							onClick(picker) {\n								const date = new Date();\n								date.setFullYear(date.getFullYear() - 5);\n								picker.$emit(\'pick\', date);\n							}\n						}, {\n							text: \'10年前\',\n							onClick(picker) {\n								const date = new Date();\n								date.setFullYear(date.getFullYear() - 10);\n								picker.$emit(\'pick\', date);\n							}\n						}, {\n							text: \'15年前\',\n							onClick(picker) {\n								const date = new Date();\n								date.setFullYear(date.getFullYear() - 15);\n								picker.$emit(\'pick\', date);\n							}\n						}, {\n							text: \'20年前\',\n							onClick(picker) {\n								const date = new Date();\n								date.setFullYear(date.getFullYear() - 20);\n								picker.$emit(\'pick\', date);\n							}\n						}, {\n							text: \'25年前\',\n							onClick(picker) {\n								const date = new Date();\n								date.setFullYear(date.getFullYear() - 25);\n								picker.$emit(\'pick\', date);\n							}\n						}, {\n							text: \'30年前\',\n							onClick(picker) {\n								const date = new Date();\n								date.setFullYear(date.getFullYear() - 30);\n								picker.$emit(\'pick\', date);\n							}\n						}]\n					},\n					{\n						prop: \"sex\",\n						label: \"性别\",\n						require: true,\n						type: \'select\',\n						value: [{\n								value: \'1\',\n								label: \'男\'\n							},\n							{\n								value: \'0\',\n								label: \'女\'\n							}\n						]\n					},\n{\n						prop: \"merchantNo\",\n						label: \" 商家编号\",\n						require: false,\n						type: \'text\',\n					},\n										{\n						prop: \"userType\",\n						label: \"员工类型\",\n						require: true,\n						type: \'select\',\n						value: [{\n								value: \'1\',\n								label: \'员工\'\n							},\n							{\n								value: \'2\',\n								label: \'店主\'\n							}\n						]\n					},\n					{\n						prop: \"remake\",\n						label: \"备注\",\n						type: \'textarea\',\n						rows: \'8\'\n					},\n				]', '3', '员工编辑布局', '1', '2020-11-06 14:38:54', '5', '2020-11-11 10:02:39', '1', '{\n					add: \'addSysUser\',\n					upd: \'updSysUser\',\n					byId: \'getSysUserById\'\n				}', '1', '');
INSERT INTO `sys_layout` VALUES ('15', '6', '[{\n	prop: \"id\",\n	label: \"编号\",\n	width: \'50px\',\n}, {\n	prop: \"productName\",\n	label: \"名称\",\n	width: \'auto\'\n},\n{\n	prop: \"type\",\n	label: \"状态\",\n	getHtml: (val) => {\n		let t = val == \'1\' ? [\'完成支付\', \'完成\', \'c-s\'] : val == \'2\' ? [\'支付失败\', \'失败\', \'c-d\'] : val == \'3\' ? [\'挂单\', \'挂单\',\n			\'c-i\'\n		] : [\'交易关闭\', \'交易关闭\', \'c-i\'];\n		let html = `<div class=\"${t[2]}\" title=\"${t[0]}\">${t[1]}</div>`;\n		return html;\n	}\n},\n{\n	prop: \"price\",\n	label: \"金额\",\n}, {\n	prop: \"money\",\n	label: \"优惠价\",\n}, {\n	prop: \"createdTime\",\n	label: \"时间\",\n	width: \'160px\',\n	format: (val) => {\n		if (val) {\n			var date = new Date(val)\n			return this.$util.getNowDT(0, date);\n		}\n		return val;\n	}\n},\n]', '1', null, '1', '2020-11-06 14:44:38', null, null, '1', '{list:\'getPayHistoryAll\'}', '1', null);
INSERT INTO `sys_layout` VALUES ('16', '6', '[{\n						prop: \"payType\",\n						label: \"结算方式\",\n						type: \'select\',\n						value: [{\n								value: \'1\',\n								label: \'微信\'\n							},\n							{\n								value: \'2\',\n								label: \'支付宝\'\n							},\n							{\n								value: \'3\',\n								label: \'现金\'\n							},\n						]\n					},\n					{\n						prop: \"type\",\n						label: \"状态\",\n						type: \'select\',\n						value: [{\n								value: \'1\',\n								label: \'完成支付\'\n							},\n							{\n								value: \'2\',\n								label: \'支付失败\'\n							},\n							{\n								value: \'3\',\n								label: \'挂单\'\n							},\n							{\n								value: \'4\',\n								label: \'交易关闭\'\n							},\n						]\n					}\n				]', '2', null, '1', '2020-11-06 14:45:06', null, null, '1', '{list:\'getPayHistoryAll\'}', '1', null);
INSERT INTO `sys_layout` VALUES ('17', '10', '[{\n						prop: \"id\",\n						label: \"编号\",\n						width: \'100px\',\n					},\n					{\n						prop: \"names\",\n						label: \"品类名称\",\n						width: \'280px\',\n					},\n					{\n						prop: \"remake\",\n						label: \"备注\",\n						width: \'auto\',\n					},{\n						prop: \"createdBy\",\n						label: \"创建人\",\n						width: \'80px\',\n						select: \'getSysUserByData?outColumn=nickName&inColumn=id\'\n					}, {\n						prop: \"updatedBy\",\n						label: \"修改人\",\n						width: \'80px\',\n						select: \'getSysUserByData?outColumn=nickName&inColumn=id\'\n					},\n				]', '1', null, '1', '2020-11-06 14:54:05', null, null, '1', '{list:\'getProductTypeAll\'}', '1', null);
INSERT INTO `sys_layout` VALUES ('18', '10', '[{\n					prop: \"names\",\n					label: \"品类名称\",\n					placeholder: \'品类名称\',\n					type: \'text\',\n				}]', '2', null, '1', '2020-11-06 14:54:23', null, null, '1', '', '1', null);
INSERT INTO `sys_layout` VALUES ('19', '10', '[{\n						prop: \"id\",\n						label: \"编号\",\n						type: \'text\',\n						readonly: true,\n						disabled: true\n					},\n					{\n						prop: \"names\",\n						label: \"品类名称\",\n						type: \'text\',\n						require: true,\n						regex: \'/^.{2,}$/\',\n						msg: \'品类名称必须2个字以上（包含2个字）\'\n					},\n					{\n						prop: \"remake\",\n						label: \"备注\",\n						type: \'textarea\',\n						rows: 12\n					}\n				]', '3', null, '1', '2020-11-06 14:54:46', null, null, '1', '{\n					add: \'addProductType\',\n					upd: \'updProductType\',\n					byId: \'getProductTypeById\'\n				}', '1', null);
INSERT INTO `sys_layout` VALUES ('20', '2', '[{\n						prop: \"id\",\n						label: \"编号\",\n						type: \'text\',\n						readonly: true,\n						disabled: true\n					},\n					{\n						prop: \"icon\",\n						label: \"图标\",\n						type: \'iconinput\',\n						require: false,\n						regex: \'/^.{2,}$/\',\n						msg: \'必须2个字以上（包含2个字）\'\n					},\n					{\n						prop: \"title\",\n						label: \"名称\",\n						type: \'text\',\n						require: true,\n						regex: \'/^.{2,}$/\',\n						msg: \'必须2个字以上（包含2个字）\'\n					},\n					{\n						prop: \"name\",\n						label: \"代码\",\n						type: \'text\',\n						require: true,\n						regex: \'/^.{2,}$/\',\n						msg: \'必须2个字以上（包含2个字）\'\n					},\n					{\n						prop: \"src\",\n						label: \"页面模板\",\n						type: \'text\',\n						require: true,\n						regex: \'/^.{4,}$/\',\n						msg: \'必须4个字以上（包含4个字）\'\n					},\n					{\n						prop: \"type\",\n						label: \"类型\",\n						require: true,\n						type: \'select\',\n						value: [{\n								value: \'1\',\n								label: \'查看\'\n							},\n							{\n								value: \'2\',\n								label: \'编辑\'\n							},\n							{\n								value: \'3\',\n								label: \'新增\'\n							},\n							{\n								value: \'4\',\n								label: \'删除\'\n							},\n						],\n					},\n					{\n						prop: \"close\",\n						label: \"可关闭\",\n						require: true,\n						type: \'select\',\n						value: [{\n								value: \'1\',\n								label: \'是\'\n							},\n							{\n								value: \'0\',\n								label: \'否\'\n							},\n						]\n					}, {\n						prop: \"parentId\",\n						label: \"关联菜单\",\n						type: \'text\',\n						readonly: true\n					},\n					{\n						prop: \"remake\",\n						label: \"备注\",\n						type: \'textarea\',\n						rows: 12\n					}\n				]', '3', '菜单设置编辑界面', '1', '2020-11-06 14:58:29', '5', '2020-11-16 10:33:02', '1', '{\n					add: \'addSysMenu\',\n					upd: \'updSysMenu\',\n					byId: \'getSysMenuId\'\n				}', '2', 'menuEditor');
INSERT INTO `sys_layout` VALUES ('21', '2', '[{prop:\'icon\',label:\'图标\',width:\'80\',getHtml:(val) => {         return `<i class=\"${val}\"></i>`;     },},{prop:\'title\',label:\'名称\',width:\'auto\',},{prop:\'name\',label:\'代码\',width:\'auto\',},{prop:\'type\',label:\'类型\',getHtml:(val) => {         let t = val == \'1\' ? [\'查看\', \'查看\', \'c-i\'] : val == \'2\' ? [\'编辑\', \'编辑\', \'c-s\'] : val == \'3\' ? [\'新增\', \'新增\', \'c-w\'] : [\'删除\', \'删除\', \'c-d\'];         let html = `<div class=\"${t[2]}\" title=\"${t[0]}\">${t[1]}</div>`;         return html;     },},{prop:\'src\',label:\'路径\',width:\'auto\',},{prop:\'close\',label:\'可关闭\',width:\'auto\',getHtml:(val) => {         let t = val == \'1\' ? [\'有关闭按钮\', \'是\', \'c-s\'] : [\'没有关闭按钮\', \'否\', \'c-d\'];         let html = `<div class=\"${t[2]}\"; title=\"${t[0]}\">${t[1]}</div>`;         return html;     },},{prop:\'createdTime\',label:\'时间\',width:\'160px\',format:(val) => {         if (val) {             var date = new Date(val);             return this.$util.getNowDT(0, date);         }         return val;     },},{prop:\'updatedTime\',label:\'修改时间\',width:\'160px\',format:(val) => {         if (val) {             var date = new Date(val);             return this.$util.getNowDT(0, date);         }         return val;     },}]', '1', '菜单设置显示页面', '1', '2020-11-06 14:59:29', '1', '2020-11-24 14:43:06', '1', '{list:\'getAllSysMenu\'}', '1', 'menuLayout');
INSERT INTO `sys_layout` VALUES ('22', '2', '[{\n						prop: \"title\",\n						label: \"菜单名称\",\n						type: \'text\',\n					},\n					{\n						prop: \"name\",\n						label: \"菜单代码\",\n						type: \'text\',\n					}\n				]', '2', '菜单设置查询条件', '1', '2020-11-06 14:59:54', null, null, '1', '', '1', null);
INSERT INTO `sys_layout` VALUES ('23', '11', '[{\n	prop: \"id\",\n	label: \"编号\",\n	width: \'50px\',\n},\n{\n	prop: \"phone\",\n	label: \"电话号码\",\n	width: \'140px\',\n},\n{\n	prop: \"nickName\",\n	label: \"昵称\",\n	width: \'auto\',\n},\n {\n	prop: \"userType\",\n	label: \"员工类型\",\n	width: \'100px\',\n	getHtml: (val) => {\n		return val == \'1\' || val == \'员工\' ? `<div class=\"b-s c-f t-c\">员工</div>` : `<div class=\"b-w  c-f t-c\">店长</div>`\n	}\n}\n]', '1', '员工显示布局', '1', '2020-11-06 14:37:34', '1', '2020-11-09 10:54:52', '1', '{list:\'getSysUserAll\',del:\'delSysUser\'}', '1', null);
INSERT INTO `sys_layout` VALUES ('25', '11', '[\n{\n	prop: \"userType\",\n	label: \"用户类别\",\n	type: \'select\',\n	value: [{\n			value: \'1\',\n			label: \'员工\'\n		},\n		{\n			value: \'2\',\n			label: \'店长\'\n		}\n	]\n},\n{\n	prop: \"phone\",\n	label: \"手机号码\",\n	type: \'text\'\n},\n{\n	prop: \"nickName\",\n	label: \"昵称\",\n	type: \'text\'\n},\n\n]', '2', '员工条件布局', '1', '2020-11-06 14:38:07', '1', '2020-11-09 10:53:27', '1', '', '1', null);
INSERT INTO `sys_layout` VALUES ('26', '2', '[{\n						prop: \"id\",\n						label: \"编号\",\n						type: \'text\',\n						readonly: true,\n						disabled: true\n					},\n					{\n						prop: \"icon\",\n						label: \"图标\",\n						type: \'icon\',\n						require: false,\n						regex: \'/^.{2,}$/\',\n						msg: \'图标必须2个字以上（包含2个字）\'\n					},\n					{\n						prop: \"title\",\n						label: \"名称\",\n						type: \'text\',\n						require: true,\n						regex: \'/^.{2,}$/\',\n						msg: \'名称必须2个字以上（包含2个字）\'\n					},\n					{\n						prop: \"name\",\n						label: \"代码\",\n						type: \'text\',\n						require: true,\n						regex: \'/^.{2,}$/\',\n						msg: \'必须2个字以上（包含2个字）\'\n					},\n					{\n						prop: \"methodName\",\n						label: \"方法名称\",\n						type: \'text\',\n						require: true,\n						regex: \'/^.{4,}$/\',\n						msg: \'必须4个字以上（包含4个字）\'\n					},\n					{\n						prop: \"menuType\",\n						label: \"按钮所属\",\n						require: true,\n						type: \'select\',\n						value: [{\n								value: \'1\',\n								label: \'显示菜单\'\n							},\n							{\n								value: \'2\',\n								label: \'条件按钮\'\n							},\n							{\n								value: \'3\',\n								label: \'编辑按钮\'\n							}\n						]\n					},\n					{\n						prop: \"sort\",\n						label: \"排序\",\n						require: true,\n						type: \'text\',\n						regex: \'/^[1-9][0-9]*$/\'\n					},\n					{\n						prop: \"methodParam\",\n						label: \"方法参数\",\n						require: true,\n						type: \'text\'\n					},\n					{\n						prop: \"size\",\n						label: \"尺寸\",\n						require: false,\n						type: \'select\',\n						value: [{\n								value: \'\',\n								label: \'默认\'\n							},\n							{\n								value: \'max\',\n								label: \'大型\'\n							},\n							{\n								value: \'medium\',\n								label: \'中等\'\n							},\n							{\n								value: \'small\',\n								label: \'小型\'\n							}, {\n								value: \'mini\',\n								label: \'超小\'\n							},\n						],\n						getHtml: (item) => {\n							return `<div class=\"f-b\"><span>${item.label}</span><button type=\"button\" class=\"el-button m-l10 el-button--${item.value}\"><span>${item.label}</span></button></div>`\n						}\n					},\n					{\n						prop: \"type\",\n						label: \"类型\",\n						type: \'select\',\n						value: [{\n								value: \'\',\n								label: \'默认\'\n							},\n							{\n								value: \'success\',\n								label: \'成功\'\n							},\n							{\n								value: \'primary\',\n								label: \'主要\'\n							},\n							{\n								value: \'warning\',\n								label: \'警告\'\n							},\n							{\n								value: \'danger\',\n								label: \'危险\'\n							},\n							{\n								value: \'info\',\n								label: \'信息\'\n							},\n							{\n								value: \'text\',\n								label: \'文字\'\n							},\n						],\n						getHtml: (item) => {\n							return `<div class=\"f-b\"><span>${item.label}</span><button type=\"button\" class=\"el-button el-button--${item.value}\"><span>${item.label}</span></button></div>`\n						}\n					}, {\n						prop: \"css\",\n						label: \"样式\",\n						type: \'textarea\',\n						row: 3\n					}\n				]', '3', '菜单管理界面按钮添加布局', '1', '2020-11-09 14:28:57', '5', '2020-11-16 11:06:24', '1', '{\n					add: \'addSysButton\',\n					upd: \'updSysButton\',\n					byId: \'getSysButtonById\'\n				}', '1', 'buttonLayout');
INSERT INTO `sys_layout` VALUES ('28', '2', '[{\n						prop: \"id\",\n						label: \"编号\",\n						type: \'text\',\n						readonly: true,\n						disabled: true\n					},\n					{\n						prop: \"code\",\n						label: \"代码\",\n						type: \'text\',\n						require: false,\n						placeholder: \'同类型布局区别码！\'\n					},\n					{\n						prop: \"layoutJson\",\n						label: \"布局JSON\",\n						type: \'textarea\',\n						require: true,\n						rows: 12,\n					},\n					{\n						prop: \"layoutType\",\n						label: \"类型\",\n						type: \'select\',\n						require: true,\n						value: [{\n								value: \'1\',\n								label: \'展示布局\',\n							},\n							{\n								value: \'2\',\n								label: \'查询布局\',\n							},\n							{\n								value: \'3\',\n								label: \'编辑页面\',\n							}\n						]\n					},\n\n					{\n						prop: \'apiName\',\n						label: \"调用api\",\n						type: \'select\',\n						type: \'textarea\',\n						rows: 3,\n					},\n					{\n						prop: \"remake\",\n						label: \"备注\",\n						type: \'select\',\n						type: \'textarea\',\n						rows: 3,\n					}\n				]', '3', '菜单管理界面编辑布局', '1', '2020-11-09 15:26:19', null, null, '1', '{\n	add: \'addSysLayout\',\n	upd: \'updSysLayout\',\n	byId: \'getSysLayoutById\'\n}', '1', 'documentLayout');
INSERT INTO `sys_layout` VALUES ('29', '11', '[\n					{\n						prop: \"icon\",\n						label: \"图标\",\n						width: \'80\',\n						getHtml: (val) => {\n							return `<i class=\"${val}\"></i>`\n						}\n					},\n					{\n						prop: \"title\",\n						label: \"名称\",\n						width: \'auto\'\n					},\n					{\n						prop: \"name\",\n						label: \"代码\",\n						width: \'auto\'\n					}				]', '1', '权限菜单', '1', '2020-11-06 14:59:29', '1', '2020-11-09 16:52:38', '1', '{list:\'getAllSysMenu\'}', '1', 'menuLayout');
INSERT INTO `sys_layout` VALUES ('30', '1', '[\n					{\n						prop: \"id\",\n						label: \"编号\",\n						width: \'39px\',\n					}, {\n						prop: \"productName\",\n						label: \"名称\",\n						width: \'auto\'\n					},\n					{\n						prop: \"type\",\n						label: \"状态\",\n						width: \'50px\',\n						getHtml: (val) => {\n							let t = val == \'1\' ? [\'完成支付\', \'完成\', \'c-s\'] : val == \'2\' ? [\'支付失败\', \'失败\', \'c-d\'] : val == \'3\' ? [\'挂单\', \'挂单\',\n								\'c-i\'\n							] : [\'交易关闭\', \'关闭\', \'c-i\'];\n							let html = `<div class=\"${t[2]}\" title=\"${t[0]}\">${t[1]}</div>`;\n							return html;\n						}\n					},\n					{\n						prop: \"price\",\n						label: \"金额\",\n					}, {\n						prop: \"money\",\n						label: \"优惠价\",\n					}, {\n						prop: \"createdTime\",\n						label: \"时间\",\n						width: \'160px\',\n						format: (val) => {\n							if (val) {\n								var date = new Date(val)\n								return this.$util.getNowDT(0, date);\n							}\n							return val;\n						}\n					},\n				]', '1', null, '5', '2020-11-10 18:25:11', null, null, '1', '{\'list\':\'getPayHistoryAll\'}', '1', 'history-layout');
INSERT INTO `sys_layout` VALUES ('31', '1', '[{\n						prop: \"payType\",\n						label: \"方式\",\n						type: \'select\',\n						value: [{\n								value: \'1\',\n								label: \'微信\'\n							},\n							{\n								value: \'2\',\n								label: \'支付宝\'\n							},\n							{\n								value: \'3\',\n								label: \'现金\'\n							},\n						]\n					},\n					{\n						prop: \"type\",\n						label: \"状态\",\n						type: \'select\',\n						value: [{\n								value: \'1\',\n								label: \'完成支付\'\n							},\n							{\n								value: \'2\',\n								label: \'支付失败\'\n							},\n							{\n								value: \'3\',\n								label: \'挂单\'\n							},\n							{\n								value: \'4\',\n								label: \'交易关闭\'\n							},\n						]\n					}\n				]', '2', null, '5', '2020-11-10 18:28:16', null, null, '1', '{\r\n byId: \'getPayHistoryId\'\r\n}', '1', 'pay-historty-editor');
INSERT INTO `sys_layout` VALUES ('34', '6', '[{\n						prop: \"id\",\n						label: \"编号\",\n						type: \'text\',\n						readonly: true,\n						disabled: true\n					},\n\n					{\n						prop: \"productName\",\n						label: \"商品品类\",\n						type: \'text\',\n						require: true,\n					},\n\n					{\n						prop: \"productRemake\",\n						label: \"商品描述\",\n						type: \'text\',\n						require: true,\n					},\n					{\n						prop: \"price\",\n						label: \"价格\",\n						type: \'text\',\n						require: true,\n					},\n					{\n						prop: \"money\",\n						label: \"优惠价\",\n						type: \'text\',\n						require: true,\n					},\n					{\n						prop: \"merchantNo\",\n						label: \"商户编号\",\n						type: \'text\',\n						require: true,\n					}, {\n						prop: \"payType\",\n						label: \"出金商户名称\",\n						type: \'select\',\n						value: [{\n								label: \'微信\',\n								value: \'1\'\n							},\n							{\n								label: \'支付宝\',\n								value: \'2\'\n							},\n							{\n								label: \'现金\',\n								value: \'3\'\n							}\n						],\n					},\n					{\n						prop: \"type\",\n						label: \"订单状态\",\n						type: \'select\',\n						value: [{\n								label: \'完成支付\',\n								value: \'1\'\n							},\n							{\n								label: \'支付失败\',\n								value: \'2\'\n							},\n							{\n								label: \'挂单\',\n								value: \'3\'\n							},\n							{\n								label: \'交易关闭\',\n								value: \'4\'\n							}\n						],\n					},\n					{\n						prop: \"zhekouMoling\",\n						label: \"折扣或抹零\",\n						type: \'text\',\n						readonly:true,\n					},\n					{\n						prop: \"remake\",\n						label: \"备注\",\n						type: \'textarea\',\n						rows: \'8\'\n					},\n				]', '3', '', '5', '2020-11-11 16:00:03', '5', '2020-11-11 15:49:47', '1', '{\n	add: \'addPayHistory\',\n	upd: \'updPayHistory\',\n	byId: \'getPayHistoryId\'\n}', '1', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `title` varchar(32) DEFAULT NULL COMMENT '名称',
  `name` varchar(32) DEFAULT NULL COMMENT '代码',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `src` varchar(32) DEFAULT NULL COMMENT '地址',
  `close` varchar(1) DEFAULT NULL COMMENT '是否可以关闭',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父菜单主键',
  `remake` varchar(64) DEFAULT NULL COMMENT '备注',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用 0 否 1 是',
  `template` varchar(255) DEFAULT NULL COMMENT '使用页面模板',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='菜单表 ';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', 'el-icon-s-shop', '收银台', 'cashier20201016', '1', 'cashier', '1', '', '', '1', '2020-10-29 10:43:02', '5', '2020-11-16 11:10:08', '1', '', null);
INSERT INTO `sys_menu` VALUES ('2', 'el-icon-menu', '菜单管理', 'sys-menu', '1', 'sys-menu', '1', '3', null, '1', '2020-10-29 10:52:46', null, null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('3', 'el-icon-s-data', '系统设置', '1604396264707', '1', '#111111', '0', '', '', '1', '2020-11-03 17:38:31', '1', '2020-11-09 10:34:56', '1', '', null);
INSERT INTO `sys_menu` VALUES ('4', 'el-icon-location', '基本信息设置', '1604396884362', '1', null, '1', '', null, '1', '2020-11-03 17:49:11', null, null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('5', 'el-icon-s-data', '统计管理', '1604396974404', '1', null, '1', '', null, '1', '2020-11-03 17:49:51', null, null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('6', 'el-icon-s-finance', '支付记录', '1604397017168', '1', 'frame1', '1', '5', null, '1', '2020-11-03 17:50:34', null, null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('7', 'el-icon-s-tools', '配置管理', 'trust-merchant', '1', 'frame1', '1', '4', null, '1', '2020-11-03 17:52:04', null, null, '1', 'trust-merchant', null);
INSERT INTO `sys_menu` VALUES ('8', 'el-icon-s-tools', '商户管理', 'split-merchant', '1', 'frame1', '1', '4', 'split-merchant', '1', '2020-11-03 17:52:27', null, null, '1', 'trust-merchant', null);
INSERT INTO `sys_menu` VALUES ('9', 'el-icon-user-solid', '员工管理', 'sys-user', '1', 'frame1', '1', '4', null, '1', '2020-11-03 17:52:52', null, null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('10', 'el-icon-s-grid', '品类管理', 'product-type', '1', 'frame1', '1', '4', null, '1', '2020-11-03 17:53:23', null, null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('11', 'el-icon-s-opportunity', '权限设置', 'sys-roule', '1', 'sys-roule', '1', '3', null, '1', '2020-11-09 10:13:28', null, null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('12', null, '测试', 'test', '1', 'frame1', '1', '', null, '5', '2020-11-19 15:50:07', null, null, '0', null, null);

-- ----------------------------
-- Table structure for sys_roule
-- ----------------------------
DROP TABLE IF EXISTS `sys_roule`;
CREATE TABLE `sys_roule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(32) DEFAULT NULL COMMENT '权限类型 1菜单 2按钮 3布局 当为3布局信息时，数据查询需要链表查询合集，不是交际',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `roule_id` varchar(32) DEFAULT NULL COMMENT '权限编号 商家编号',
  `control_id` varchar(32) DEFAULT NULL COMMENT '管理编号 菜单或按钮编号',
  `remake` varchar(64) DEFAULT NULL COMMENT '备注 菜单编号',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `layout_json` varchar(255) DEFAULT NULL COMMENT '布局设置json',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=624 DEFAULT CHARSET=utf8 COMMENT='权限表 ';

-- ----------------------------
-- Records of sys_roule
-- ----------------------------
INSERT INTO `sys_roule` VALUES ('56', '1', '3', 'NO14982', '7', null, '5', '2020-11-10 15:58:08', '5', '2020-11-10 15:58:08', null);
INSERT INTO `sys_roule` VALUES ('57', '1', '3', 'NO14982', '8', null, '5', '2020-11-10 15:58:09', '5', '2020-11-10 15:58:09', null);
INSERT INTO `sys_roule` VALUES ('58', '1', '3', 'NO14982', '9', null, '5', '2020-11-10 15:58:09', '5', '2020-11-10 15:58:09', null);
INSERT INTO `sys_roule` VALUES ('59', '1', '3', 'NO14982', '10', null, '5', '2020-11-10 15:58:09', '5', '2020-11-10 15:58:09', null);
INSERT INTO `sys_roule` VALUES ('60', '1', '3', 'NO14982', '4', null, '5', '2020-11-10 15:58:09', '5', '2020-11-10 15:58:09', null);
INSERT INTO `sys_roule` VALUES ('61', '1', '3', 'NO14982', '6', null, '5', '2020-11-10 15:58:09', '5', '2020-11-10 15:58:09', null);
INSERT INTO `sys_roule` VALUES ('62', '1', '3', 'NO14982', '5', null, '5', '2020-11-10 15:58:09', '5', '2020-11-10 15:58:09', null);
INSERT INTO `sys_roule` VALUES ('101', '2', '4', 'NO14982', '10', '1', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('102', '2', '4', 'NO14982', '15', '7', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('103', '2', '4', 'NO14982', '18', '7', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('104', '2', '4', 'NO14982', '19', '7', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('105', '2', '4', 'NO14982', '20', '8', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('106', '2', '4', 'NO14982', '23', '8', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('107', '2', '4', 'NO14982', '24', '8', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('108', '2', '4', 'NO14982', '25', '9', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('109', '2', '4', 'NO14982', '26', '9', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('110', '2', '4', 'NO14982', '27', '9', '5', '2020-11-10 17:57:06', '5', '2020-11-10 17:57:06', null);
INSERT INTO `sys_roule` VALUES ('111', '2', '4', 'NO14982', '28', '9', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('112', '2', '4', 'NO14982', '29', '9', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('113', '2', '4', 'NO14982', '30', '10', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('114', '2', '4', 'NO14982', '31', '10', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('115', '2', '4', 'NO14982', '32', '10', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('116', '2', '4', 'NO14982', '33', '10', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('117', '2', '4', 'NO14982', '34', '10', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('118', '2', '4', 'NO14982', '35', '6', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('119', '2', '4', 'NO14982', '36', '6', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('120', '2', '4', 'NO14982', '37', '6', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('121', '2', '4', 'NO14982', '38', '6', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('122', '2', '4', 'NO14982', '39', '6', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('123', '2', '4', 'NO14982', '42', '11', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('124', '2', '4', 'NO14982', '43', '11', '5', '2020-11-10 17:57:07', '5', '2020-11-10 17:57:07', null);
INSERT INTO `sys_roule` VALUES ('125', '1', '4', 'NO14982', '1', null, '5', '2020-11-10 18:45:38', '5', '2020-11-10 18:45:38', null);
INSERT INTO `sys_roule` VALUES ('126', '1', '4', 'NO14982', '7', null, '5', '2020-11-10 18:45:38', '5', '2020-11-10 18:45:38', null);
INSERT INTO `sys_roule` VALUES ('127', '1', '4', 'NO14982', '8', null, '5', '2020-11-10 18:45:38', '5', '2020-11-10 18:45:38', null);
INSERT INTO `sys_roule` VALUES ('128', '1', '4', 'NO14982', '9', null, '5', '2020-11-10 18:45:38', '5', '2020-11-10 18:45:38', null);
INSERT INTO `sys_roule` VALUES ('129', '1', '4', 'NO14982', '10', null, '5', '2020-11-10 18:45:38', '5', '2020-11-10 18:45:38', null);
INSERT INTO `sys_roule` VALUES ('130', '1', '4', 'NO14982', '4', null, '5', '2020-11-10 18:45:38', '5', '2020-11-10 18:45:38', null);
INSERT INTO `sys_roule` VALUES ('131', '1', '4', 'NO14982', '6', null, '5', '2020-11-10 18:45:38', '5', '2020-11-10 18:45:38', null);
INSERT INTO `sys_roule` VALUES ('132', '1', '4', 'NO14982', '5', null, '5', '2020-11-10 18:45:38', '5', '2020-11-10 18:45:38', null);
INSERT INTO `sys_roule` VALUES ('301', '2', '8', 'NO586982', '3', '1', '5', '2020-11-11 11:38:06', '5', '2020-11-11 11:38:06', null);
INSERT INTO `sys_roule` VALUES ('302', '2', '8', 'NO586982', '4', '1', '5', '2020-11-11 11:38:06', '5', '2020-11-11 11:38:06', null);
INSERT INTO `sys_roule` VALUES ('303', '2', '8', 'NO586982', '8', '1', '5', '2020-11-11 11:38:06', '5', '2020-11-11 11:38:06', null);
INSERT INTO `sys_roule` VALUES ('304', '2', '8', 'NO586982', '9', '1', '5', '2020-11-11 11:38:06', '5', '2020-11-11 11:38:06', null);
INSERT INTO `sys_roule` VALUES ('305', '2', '8', 'NO586982', '10', '1', '5', '2020-11-11 11:38:06', '5', '2020-11-11 11:38:06', null);
INSERT INTO `sys_roule` VALUES ('306', '2', '8', 'NO586982', '48', '1', '5', '2020-11-11 11:38:06', '5', '2020-11-11 11:38:06', null);
INSERT INTO `sys_roule` VALUES ('340', '1', '2', 'NO14982', '2', null, '5', '2020-11-12 13:42:13', '5', '2020-11-12 13:42:13', null);
INSERT INTO `sys_roule` VALUES ('341', '1', '2', 'NO14982', '3', null, '5', '2020-11-12 13:42:13', '5', '2020-11-12 13:42:13', null);
INSERT INTO `sys_roule` VALUES ('342', '1', '2', 'NO14982', '7', null, '5', '2020-11-12 13:42:13', '5', '2020-11-12 13:42:13', null);
INSERT INTO `sys_roule` VALUES ('343', '1', '2', 'NO14982', '8', null, '5', '2020-11-12 13:42:13', '5', '2020-11-12 13:42:13', null);
INSERT INTO `sys_roule` VALUES ('344', '1', '2', 'NO14982', '9', null, '5', '2020-11-12 13:42:13', '5', '2020-11-12 13:42:13', null);
INSERT INTO `sys_roule` VALUES ('345', '1', '2', 'NO14982', '10', null, '5', '2020-11-12 13:42:13', '5', '2020-11-12 13:42:13', null);
INSERT INTO `sys_roule` VALUES ('346', '1', '2', 'NO14982', '4', null, '5', '2020-11-12 13:42:13', '5', '2020-11-12 13:42:13', null);
INSERT INTO `sys_roule` VALUES ('347', '1', '2', 'NO14982', '6', null, '5', '2020-11-12 13:42:13', '5', '2020-11-12 13:42:13', null);
INSERT INTO `sys_roule` VALUES ('348', '1', '2', 'NO14982', '5', null, '5', '2020-11-12 13:42:13', '5', '2020-11-12 13:42:13', null);
INSERT INTO `sys_roule` VALUES ('357', '2', '2', 'NO14982', '1', '2', '5', '2020-11-12 13:42:34', '5', '2020-11-12 13:42:34', null);
INSERT INTO `sys_roule` VALUES ('358', '2', '2', 'NO14982', '2', '2', '5', '2020-11-12 13:42:34', '5', '2020-11-12 13:42:34', null);
INSERT INTO `sys_roule` VALUES ('359', '2', '2', 'NO14982', '11', '2', '5', '2020-11-12 13:42:34', '5', '2020-11-12 13:42:34', null);
INSERT INTO `sys_roule` VALUES ('360', '2', '2', 'NO14982', '12', '2', '5', '2020-11-12 13:42:34', '5', '2020-11-12 13:42:34', null);
INSERT INTO `sys_roule` VALUES ('361', '2', '2', 'NO14982', '13', '2', '5', '2020-11-12 13:42:34', '5', '2020-11-12 13:42:34', null);
INSERT INTO `sys_roule` VALUES ('362', '2', '2', 'NO14982', '14', '2', '5', '2020-11-12 13:42:34', '5', '2020-11-12 13:42:34', null);
INSERT INTO `sys_roule` VALUES ('363', '2', '2', 'NO14982', '40', '2', '5', '2020-11-12 13:42:34', '5', '2020-11-12 13:42:34', null);
INSERT INTO `sys_roule` VALUES ('366', '1', '8', 'NO586982', '1', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('367', '1', '8', 'NO586982', '11', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('368', '1', '8', 'NO586982', '3', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('369', '1', '8', 'NO586982', '7', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('370', '1', '8', 'NO586982', '8', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('371', '1', '8', 'NO586982', '9', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('372', '1', '8', 'NO586982', '10', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('373', '1', '8', 'NO586982', '4', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('374', '1', '8', 'NO586982', '6', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('375', '1', '8', 'NO586982', '5', null, '6', '2020-11-13 18:32:26', '6', '2020-11-13 18:32:26', null);
INSERT INTO `sys_roule` VALUES ('412', '2', '6', 'NO586982', '3', '1', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('413', '2', '6', 'NO586982', '4', '1', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('414', '2', '6', 'NO586982', '8', '1', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('415', '2', '6', 'NO586982', '9', '1', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('416', '2', '6', 'NO586982', '10', '1', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('417', '2', '6', 'NO586982', '15', '7', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('418', '2', '6', 'NO586982', '16', '7', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('419', '2', '6', 'NO586982', '18', '7', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('420', '2', '6', 'NO586982', '19', '7', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('421', '2', '6', 'NO586982', '20', '8', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('422', '2', '6', 'NO586982', '23', '8', '5', '2020-11-13 19:40:24', '5', '2020-11-13 19:40:24', null);
INSERT INTO `sys_roule` VALUES ('423', '2', '6', 'NO586982', '24', '8', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('424', '2', '6', 'NO586982', '25', '9', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('425', '2', '6', 'NO586982', '26', '9', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('426', '2', '6', 'NO586982', '27', '9', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('427', '2', '6', 'NO586982', '28', '9', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('428', '2', '6', 'NO586982', '29', '9', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('429', '2', '6', 'NO586982', '30', '10', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('430', '2', '6', 'NO586982', '31', '10', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('431', '2', '6', 'NO586982', '32', '10', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('432', '2', '6', 'NO586982', '33', '10', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('433', '2', '6', 'NO586982', '34', '10', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('434', '2', '6', 'NO586982', '35', '6', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('435', '2', '6', 'NO586982', '38', '6', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('436', '2', '6', 'NO586982', '39', '6', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('437', '2', '6', 'NO586982', '41', '11', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('438', '2', '6', 'NO586982', '44', '11', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('439', '2', '6', 'NO586982', '45', '11', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('440', '2', '6', 'NO586982', '46', '11', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('441', '2', '6', 'NO586982', '47', '11', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('442', '2', '6', 'NO586982', '48', '1', '5', '2020-11-13 19:40:25', '5', '2020-11-13 19:40:25', null);
INSERT INTO `sys_roule` VALUES ('445', '3', '6', 'NO586982', '6', '8', '5', '2020-11-16 09:49:43', '5', '2020-11-16 09:49:43', '{\"isRegisterCan\":{\"visabled\":false}}');
INSERT INTO `sys_roule` VALUES ('446', '3', '6', 'NO586982', '14', '9', '5', '2020-11-16 09:49:43', '5', '2020-11-16 09:49:43', '{\"merchantNo\":{\"visabled\":false}}');
INSERT INTO `sys_roule` VALUES ('447', '1', '6', 'NO586982', '1', null, '5', '2020-11-16 09:58:25', '5', '2020-11-16 09:58:25', null);
INSERT INTO `sys_roule` VALUES ('448', '1', '6', 'NO586982', '11', null, '5', '2020-11-16 09:58:26', '5', '2020-11-16 09:58:26', null);
INSERT INTO `sys_roule` VALUES ('449', '1', '6', 'NO586982', '3', null, '5', '2020-11-16 09:58:26', '5', '2020-11-16 09:58:26', null);
INSERT INTO `sys_roule` VALUES ('450', '1', '6', 'NO586982', '7', null, '5', '2020-11-16 09:58:26', '5', '2020-11-16 09:58:26', null);
INSERT INTO `sys_roule` VALUES ('451', '1', '6', 'NO586982', '9', null, '5', '2020-11-16 09:58:26', '5', '2020-11-16 09:58:26', null);
INSERT INTO `sys_roule` VALUES ('452', '1', '6', 'NO586982', '10', null, '5', '2020-11-16 09:58:26', '5', '2020-11-16 09:58:26', null);
INSERT INTO `sys_roule` VALUES ('453', '1', '6', 'NO586982', '4', null, '5', '2020-11-16 09:58:26', '5', '2020-11-16 09:58:26', null);
INSERT INTO `sys_roule` VALUES ('454', '1', '6', 'NO586982', '6', null, '5', '2020-11-16 09:58:26', '5', '2020-11-16 09:58:26', null);
INSERT INTO `sys_roule` VALUES ('455', '1', '6', 'NO586982', '5', null, '5', '2020-11-16 09:58:26', '5', '2020-11-16 09:58:26', null);
INSERT INTO `sys_roule` VALUES ('516', '1', '9', 'NO545398', '1', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('517', '1', '9', 'NO545398', '11', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('518', '1', '9', 'NO545398', '3', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('519', '1', '9', 'NO545398', '7', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('520', '1', '9', 'NO545398', '8', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('521', '1', '9', 'NO545398', '9', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('522', '1', '9', 'NO545398', '10', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('523', '1', '9', 'NO545398', '4', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('524', '1', '9', 'NO545398', '6', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('525', '1', '9', 'NO545398', '5', null, '5', '2020-11-16 15:44:46', '5', '2020-11-16 15:44:46', null);
INSERT INTO `sys_roule` VALUES ('526', '2', '9', 'NO545398', '3', '1', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('527', '2', '9', 'NO545398', '4', '1', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('528', '2', '9', 'NO545398', '8', '1', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('529', '2', '9', 'NO545398', '9', '1', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('530', '2', '9', 'NO545398', '10', '1', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('531', '2', '9', 'NO545398', '15', '7', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('532', '2', '9', 'NO545398', '16', '7', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('533', '2', '9', 'NO545398', '17', '7', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('534', '2', '9', 'NO545398', '18', '7', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('535', '2', '9', 'NO545398', '19', '7', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('536', '2', '9', 'NO545398', '20', '8', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('537', '2', '9', 'NO545398', '21', '8', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('538', '2', '9', 'NO545398', '22', '8', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('539', '2', '9', 'NO545398', '23', '8', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('540', '2', '9', 'NO545398', '24', '8', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('541', '2', '9', 'NO545398', '25', '9', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('542', '2', '9', 'NO545398', '26', '9', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('543', '2', '9', 'NO545398', '27', '9', '5', '2020-11-16 15:44:52', '5', '2020-11-16 15:44:52', null);
INSERT INTO `sys_roule` VALUES ('544', '2', '9', 'NO545398', '28', '9', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('545', '2', '9', 'NO545398', '29', '9', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('546', '2', '9', 'NO545398', '30', '10', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('547', '2', '9', 'NO545398', '31', '10', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('548', '2', '9', 'NO545398', '32', '10', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('549', '2', '9', 'NO545398', '33', '10', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('550', '2', '9', 'NO545398', '34', '10', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('551', '2', '9', 'NO545398', '35', '6', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('552', '2', '9', 'NO545398', '36', '6', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('553', '2', '9', 'NO545398', '37', '6', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('554', '2', '9', 'NO545398', '38', '6', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('555', '2', '9', 'NO545398', '39', '6', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('556', '2', '9', 'NO545398', '48', '1', '5', '2020-11-16 15:44:53', '5', '2020-11-16 15:44:53', null);
INSERT INTO `sys_roule` VALUES ('567', '2', '1', 'NO14982', '1', '2', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('568', '2', '1', 'NO14982', '2', '2', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('569', '2', '1', 'NO14982', '3', '1', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('570', '2', '1', 'NO14982', '4', '1', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('571', '2', '1', 'NO14982', '8', '1', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('572', '2', '1', 'NO14982', '9', '1', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('573', '2', '1', 'NO14982', '10', '1', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('574', '2', '1', 'NO14982', '11', '2', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('575', '2', '1', 'NO14982', '12', '2', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('576', '2', '1', 'NO14982', '13', '2', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('577', '2', '1', 'NO14982', '14', '2', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('578', '2', '1', 'NO14982', '15', '7', '5', '2020-11-24 14:40:30', '5', '2020-11-24 14:40:30', null);
INSERT INTO `sys_roule` VALUES ('579', '2', '1', 'NO14982', '16', '7', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('580', '2', '1', 'NO14982', '17', '7', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('581', '2', '1', 'NO14982', '18', '7', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('582', '2', '1', 'NO14982', '19', '7', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('583', '2', '1', 'NO14982', '20', '8', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('584', '2', '1', 'NO14982', '21', '8', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('585', '2', '1', 'NO14982', '22', '8', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('586', '2', '1', 'NO14982', '23', '8', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('587', '2', '1', 'NO14982', '24', '8', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('588', '2', '1', 'NO14982', '25', '9', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('589', '2', '1', 'NO14982', '26', '9', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('590', '2', '1', 'NO14982', '27', '9', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('591', '2', '1', 'NO14982', '28', '9', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('592', '2', '1', 'NO14982', '29', '9', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('593', '2', '1', 'NO14982', '30', '10', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('594', '2', '1', 'NO14982', '31', '10', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('595', '2', '1', 'NO14982', '32', '10', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('596', '2', '1', 'NO14982', '33', '10', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('597', '2', '1', 'NO14982', '34', '10', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('598', '2', '1', 'NO14982', '35', '6', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('599', '2', '1', 'NO14982', '36', '6', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('600', '2', '1', 'NO14982', '37', '6', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('601', '2', '1', 'NO14982', '38', '6', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('602', '2', '1', 'NO14982', '39', '6', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('603', '2', '1', 'NO14982', '40', '2', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('604', '2', '1', 'NO14982', '41', '11', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('605', '2', '1', 'NO14982', '42', '11', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('606', '2', '1', 'NO14982', '43', '11', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('607', '2', '1', 'NO14982', '44', '11', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('608', '2', '1', 'NO14982', '45', '11', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('609', '2', '1', 'NO14982', '46', '11', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('610', '2', '1', 'NO14982', '47', '11', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('611', '2', '1', 'NO14982', '49', '2', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('612', '2', '1', 'NO14982', '50', '2', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('613', '2', '1', 'NO14982', '51', '11', '5', '2020-11-24 14:40:31', '5', '2020-11-24 14:40:31', null);
INSERT INTO `sys_roule` VALUES ('614', '2', '1', 'NO14982', '52', '11', '5', '2020-11-24 14:40:32', '5', '2020-11-24 14:40:32', null);
INSERT INTO `sys_roule` VALUES ('615', '1', '1', 'NO14982', '2', null, '5', '2020-11-24 14:41:33', '5', '2020-11-24 14:41:33', null);
INSERT INTO `sys_roule` VALUES ('616', '1', '1', 'NO14982', '11', null, '5', '2020-11-24 14:41:33', '5', '2020-11-24 14:41:33', null);
INSERT INTO `sys_roule` VALUES ('617', '1', '1', 'NO14982', '3', null, '5', '2020-11-24 14:41:33', '5', '2020-11-24 14:41:33', null);
INSERT INTO `sys_roule` VALUES ('618', '1', '1', 'NO14982', '8', null, '5', '2020-11-24 14:41:33', '5', '2020-11-24 14:41:33', null);
INSERT INTO `sys_roule` VALUES ('619', '1', '1', 'NO14982', '9', null, '5', '2020-11-24 14:41:34', '5', '2020-11-24 14:41:34', null);
INSERT INTO `sys_roule` VALUES ('620', '1', '1', 'NO14982', '10', null, '5', '2020-11-24 14:41:34', '5', '2020-11-24 14:41:34', null);
INSERT INTO `sys_roule` VALUES ('621', '1', '1', 'NO14982', '4', null, '5', '2020-11-24 14:41:34', '5', '2020-11-24 14:41:34', null);
INSERT INTO `sys_roule` VALUES ('622', '1', '1', 'NO14982', '6', null, '5', '2020-11-24 14:41:34', '5', '2020-11-24 14:41:34', null);
INSERT INTO `sys_roule` VALUES ('623', '1', '1', 'NO14982', '5', null, '5', '2020-11-24 14:41:34', '5', '2020-11-24 14:41:34', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `nick_name` varchar(32) DEFAULT NULL COMMENT '昵称',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `sex` varchar(32) DEFAULT '1' COMMENT '性别',
  `merchant_no` varchar(32) DEFAULT NULL COMMENT '商家号',
  `user_type` int(11) DEFAULT '1' COMMENT '员工类型 1员工 2店主',
  `remake` varchar(64) DEFAULT NULL COMMENT '备注',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统用户表 系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '18293115323', '123123', '2020-10-01', '1', 'NO14982', '1', '12313', 'null', '2020-10-13 10:30:18', '1', '2020-10-16 10:10:35', 'MONIDUPSDXSSVIDB');
INSERT INTO `sys_user` VALUES ('2', '18293115322', '123456', '1994-01-02', '1', 'NO14982', '1', '1111', 'null', '2020-10-13 16:23:42', '3', '2020-10-14 17:26:26', 'MONIDUPSDXSSVIDB');
INSERT INTO `sys_user` VALUES ('3', '18293115321', 'zhangsan', '2005-10-14', '0', 'NO14982', '1', 'null', 'null', '2020-10-13 17:23:03', '2', '2020-10-14 17:30:28', 'MONIDUPSDXSSVIDB');
INSERT INTO `sys_user` VALUES ('4', '18293115320', '123456', '1994-01-02', '1', 'NO14982', '2', 'null', 'null', '2020-10-13 17:38:25', '3', '2020-10-14 17:29:31', 'MONIDUPSDXSSVIDB');
INSERT INTO `sys_user` VALUES ('5', '18888888888', '超级管理员', '1994-01-02', '1', '', '3', 'null', 'null', '2020-10-13 17:38:25', '3', '2020-10-14 17:29:31', 'MOMOFBQGQQQMDGQQQ');
INSERT INTO `sys_user` VALUES ('6', '17700552622', '张毛毛', '2000-11-11', '1', 'NO586982', '1', '', '4', '2020-11-11 09:57:53', '5', '2020-11-11 10:03:06', 'MNMHULBVVIGOQBLB');
INSERT INTO `sys_user` VALUES ('7', '18293456281', '李四', '1995-11-11', '1', 'NO14982', '1', null, '4', '2020-11-11 10:04:04', null, null, 'MONIDUPSDGGOQLBQ');
INSERT INTO `sys_user` VALUES ('8', '18800995522', '张二毛', '1995-11-11', '0', 'NO586982', '1', null, '6', '2020-11-11 10:13:10', null, null, 'MOMOFBQGVVSOILIIB');
INSERT INTO `sys_user` VALUES ('9', '17788088828', '兴业银行接口测试账户', '2000-11-16', '1', 'NO747087', '2', '兴业银行接口测试账户', '5', '2020-11-16 15:43:19', '5', '2020-11-16 15:53:02', 'MNMHULBQQVMDGQQB');
