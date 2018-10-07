/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : zhpt

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 07/10/2018 13:42:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_ad
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad`;
CREATE TABLE `cms_ad`  (
  `f_ad_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_adslot_id` int(11) NOT NULL,
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_begin_date` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `f_end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `f_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告url',
  `f_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文字',
  `f_script` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '代码',
  `f_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `f_flash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'flash',
  `f_seq` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  PRIMARY KEY (`f_ad_id`) USING BTREE,
  INDEX `fk_cms_ad_adslot`(`f_adslot_id`) USING BTREE,
  INDEX `fk_cms_ad_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_ad_adslot` FOREIGN KEY (`f_adslot_id`) REFERENCES `cms_ad_slot` (`f_adslot_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_ad_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ad
-- ----------------------------
INSERT INTO `cms_ad` VALUES (2, 1, 1, 'jspxcms演示广告', NULL, NULL, 'http://www.jspxcms.com/', 'jspxcms演示广告', NULL, '/template/1/default/_files/img/dd.jpg', NULL, 50);

-- ----------------------------
-- Table structure for cms_ad_slot
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad_slot`;
CREATE TABLE `cms_ad_slot`  (
  `f_adslot_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_type` int(11) NOT NULL COMMENT '类型(1:文字,2:图片,3:FLASH,4:代码)',
  `f_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板',
  `f_width` int(11) NOT NULL COMMENT '宽度',
  `f_height` int(11) NOT NULL COMMENT '高度',
  PRIMARY KEY (`f_adslot_id`) USING BTREE,
  INDEX `fk_cms_adslot_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_adslot_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告版位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ad_slot
-- ----------------------------
INSERT INTO `cms_ad_slot` VALUES (1, 1, '首页广告', 'homepage', NULL, 2, '/sys_ad/ad_homepage.html', 1000, 80);

-- ----------------------------
-- Table structure for cms_advice
-- ----------------------------
DROP TABLE IF EXISTS `cms_advice`;
CREATE TABLE `cms_advice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_organ_id` bigint(20) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `record_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attendant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `co_organizer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deal_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivery_time` datetime(0) NULL DEFAULT NULL,
  `lead_deal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` bigint(20) NULL DEFAULT NULL,
  `organizer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_time` datetime(0) NULL DEFAULT NULL,
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roll_deal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `session_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_attachment
-- ----------------------------
DROP TABLE IF EXISTS `cms_attachment`;
CREATE TABLE `cms_attachment`  (
  `f_attachment_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_user_id` int(11) NOT NULL COMMENT '上传人',
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `f_length` bigint(20) NULL DEFAULT NULL COMMENT '文件长度',
  `f_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `f_time` datetime(0) NOT NULL COMMENT '时间',
  PRIMARY KEY (`f_attachment_id`) USING BTREE,
  INDEX `fk_cms_attachement_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_attachment_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_attachement_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_attachment_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_attachment_ref
-- ----------------------------
DROP TABLE IF EXISTS `cms_attachment_ref`;
CREATE TABLE `cms_attachment_ref`  (
  `f_attachementref_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_attachment_id` int(11) NOT NULL,
  `f_ftype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外表标识',
  `f_fid` int(11) NOT NULL COMMENT '外表ID',
  PRIMARY KEY (`f_attachementref_id`) USING BTREE,
  INDEX `fk_cms_attachmentref_attach`(`f_attachment_id`) USING BTREE,
  INDEX `fk_cms_attachmentref_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_attachmentref_attach` FOREIGN KEY (`f_attachment_id`) REFERENCES `cms_attachment` (`f_attachment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_attachmentref_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_attribute
-- ----------------------------
DROP TABLE IF EXISTS `cms_attribute`;
CREATE TABLE `cms_attribute`  (
  `f_attribute_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `f_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  `f_is_with_image` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否包含图片',
  `f_is_scale` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否图片压缩',
  `f_is_exact` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否图片拉伸',
  `f_is_watermark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否图片水印',
  `f_image_width` int(11) NULL DEFAULT NULL COMMENT '图片宽度',
  `f_image_height` int(11) NULL DEFAULT NULL COMMENT '图片高度',
  PRIMARY KEY (`f_attribute_id`) USING BTREE,
  INDEX `fk_cms_attribute_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_attribute_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_attribute
-- ----------------------------
INSERT INTO `cms_attribute` VALUES (2, 1, 'headlines', '头条', 6, '0', '0', '0', '0', NULL, NULL);
INSERT INTO `cms_attribute` VALUES (5, 1, 'focusnews', '新闻焦点', 1, '1', '0', '0', '0', 660, 250);
INSERT INTO `cms_attribute` VALUES (6, 1, 'focusphoto', '图片焦点', 2, '1', '0', '0', '0', 1000, 500);
INSERT INTO `cms_attribute` VALUES (7, 1, 'focusvideo', '视频焦点', 3, '1', '0', '0', '0', 1000, 410);
INSERT INTO `cms_attribute` VALUES (8, 1, 'focusproduct', '产品焦点', 4, '1', '0', '0', '0', 770, 190);
INSERT INTO `cms_attribute` VALUES (9, 1, 'focusdownload', '下载焦点', 5, '1', '0', '0', '0', 310, 210);
INSERT INTO `cms_attribute` VALUES (10, 1, 'focusmobile', '手机焦点', 7, '1', '0', '0', '0', 640, 330);
INSERT INTO `cms_attribute` VALUES (12, 1, 'focus', '焦点', 0, '1', '0', '0', '0', 318, 212);

-- ----------------------------
-- Table structure for cms_collect
-- ----------------------------
DROP TABLE IF EXISTS `cms_collect`;
CREATE TABLE `cms_collect`  (
  `f_collect_id` int(11) NOT NULL,
  `f_node_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_charset` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'UTF-8' COMMENT '字符集',
  `f_user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Mozilla/5.0' COMMENT '用户代理',
  `f_interval_min` int(11) NOT NULL DEFAULT 0 COMMENT '最小间隔时间',
  `f_interval_max` int(11) NOT NULL DEFAULT 0 COMMENT '最大间隔时间',
  `f_list_pattern` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表地址',
  `f_list_next_pattern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下一页列表地址',
  `f_is_list_next_reg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '下一页列表地址是否正则',
  `f_item_area_pattern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章地址区域',
  `f_is_item_area_reg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '文章地址区域是否正则',
  `f_item_pattern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章地址',
  `f_is_item_reg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '文章地址是否正则',
  `f_block_area_pattern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章块区域',
  `f_is_block_area_reg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '文章快区域是否正则',
  `f_block_pattern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章块',
  `f_is_block_reg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '文章块是否正则',
  `f_page_begin` int(11) NOT NULL DEFAULT 2 COMMENT '起始序号',
  `f_page_end` int(11) NOT NULL DEFAULT 10 COMMENT '结束序号',
  `f_is_desc` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否倒序',
  `f_is_submit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否提交',
  `f_is_allow_duplicate` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否允许重复标题',
  `f_is_download_image` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否采集正文中的图片',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:就绪,1:运行中,2:暂停)',
  PRIMARY KEY (`f_collect_id`) USING BTREE,
  INDEX `fk_cms_collect_node`(`f_node_id`) USING BTREE,
  INDEX `fk_cms_collect_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_collect_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_collect_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_collect_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_collect_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_collect
-- ----------------------------
INSERT INTO `cms_collect` VALUES (1, 42, 1, 1, '新浪新闻', 'UTF-8', 'Mozilla/5.0', 0, 0, 'http://roll.news.sina.com.cn/news/gnxw/gdxw1/index.shtml\r\nhttp://roll.news.sina.com.cn/news/gnxw/gdxw1/index_(*).shtml', NULL, '0', '<ul class=\"list_009\">(*)</ul>', '0', '<li><a href=\"(*)\" target=\"_blank\">', '0', NULL, '0', NULL, '0', 2, 10, '1', '0', '0', '1', 0);

-- ----------------------------
-- Table structure for cms_collect_field
-- ----------------------------
DROP TABLE IF EXISTS `cms_collect_field`;
CREATE TABLE `cms_collect_field`  (
  `f_collectfield_id` int(11) NOT NULL,
  `f_collect_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `f_type` int(11) NOT NULL DEFAULT 1 COMMENT '类型(1;系统字段,2:custom字段,3:clob字段)',
  `f_source_type` int(11) NOT NULL DEFAULT 1 COMMENT '来源(1:详细页,2:列表页,3:固定值,4:URL)',
  `f_source_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源URL',
  `f_source_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源文本',
  `f_data_area_pattern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据区域',
  `f_is_data_area_reg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '数据区域是否正则',
  `f_data_pattern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '匹配规则',
  `f_is_data_reg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '匹配规则是否正则',
  `f_date_format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期格式',
  `f_download_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载类型(为空不下载)',
  `f_image_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片参数',
  `f_filter` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过滤规则',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排列顺序',
  PRIMARY KEY (`f_collectfield_id`) USING BTREE,
  INDEX `fk_cms_collectfield_collect`(`f_collect_id`) USING BTREE,
  INDEX `fk_cms_collectfield_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_collectfield_collect` FOREIGN KEY (`f_collect_id`) REFERENCES `cms_collect` (`f_collect_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_collectfield_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_collect_field
-- ----------------------------
INSERT INTO `cms_collect_field` VALUES (2, 1, 1, '标题', 'title', 1, 1, NULL, NULL, NULL, '0', '<meta property=\"og:title\" content=\"(*)\" />', '0', NULL, NULL, NULL, NULL, 2147483647);
INSERT INTO `cms_collect_field` VALUES (3, 1, 1, '正文', 'text', 1, 1, NULL, NULL, NULL, '0', '<div class=\"article article_16\" id=\"artibody\">\r\n(*)\r\n			\r\n        </div>', '0', NULL, NULL, NULL, NULL, 2147483647);
INSERT INTO `cms_collect_field` VALUES (4, 1, 1, '发布时间', 'publishDate', 1, 1, NULL, NULL, NULL, '0', '<span class=\"time-source\" id=\"navtimeSource\">(*)		<span>', '0', 'yyyy年MM月dd日HH:mm', NULL, NULL, NULL, 2147483647);

-- ----------------------------
-- Table structure for cms_collect_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_collect_log`;
CREATE TABLE `cms_collect_log`  (
  `f_collectlog_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采集地址',
  `f_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `f_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息',
  `f_time` datetime(0) NOT NULL COMMENT '时间',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:成功,1:失败)',
  PRIMARY KEY (`f_collectlog_id`) USING BTREE,
  INDEX `fk_cms_collectlog_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_collectlog_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment`  (
  `f_comment_id` int(11) NOT NULL,
  `f_parent_id` int(11) NULL DEFAULT NULL COMMENT '父评论ID',
  `f_site_id` int(11) NOT NULL COMMENT '站点ID',
  `f_creator_id` int(11) NOT NULL COMMENT '创建人',
  `f_auditor_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `f_ftype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外表标识',
  `f_fid` int(11) NOT NULL COMMENT '外表ID',
  `f_creation_date` datetime(0) NOT NULL COMMENT '评论时间',
  `f_audit_date` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `f_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'localhost' COMMENT 'IP地址',
  `f_country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `f_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `f_score` int(11) NOT NULL DEFAULT 0 COMMENT '得分',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '0:未审核;1:已审核;2:推荐;3:屏蔽',
  `f_text` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`f_comment_id`) USING BTREE,
  INDEX `fk_cms_comment_auditor`(`f_auditor_id`) USING BTREE,
  INDEX `fk_cms_comment_creator`(`f_creator_id`) USING BTREE,
  INDEX `fk_cms_comment_parent`(`f_parent_id`) USING BTREE,
  INDEX `fk_cms_comment_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_comment_auditor` FOREIGN KEY (`f_auditor_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_comment_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_comment_parent` FOREIGN KEY (`f_parent_id`) REFERENCES `cms_comment` (`f_comment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_comment_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES (16, NULL, 1, 1, NULL, 'Info', 28, '2014-02-22 12:40:48', NULL, '0:0:0:0:0:0:0:1', NULL, NULL, 0, 1, '很好看。我很喜欢。');
INSERT INTO `cms_comment` VALUES (17, NULL, 1, 1, NULL, 'Info', 35, '2014-04-04 20:35:51', NULL, '0:0:0:0:0:0:0:1', NULL, NULL, 0, 1, '现在除了情人节、七夕节等传统的结婚登记吉日，5.20、9.9等谐音吉日也越来越受到年轻人的追捧。');
INSERT INTO `cms_comment` VALUES (18, NULL, 1, 0, NULL, 'Info', 100, '2014-04-04 20:36:28', NULL, '0:0:0:0:0:0:0:1', NULL, NULL, 0, 1, '西班牙正考虑将直布罗陀争议诉至联合国与海牙国际法庭等国际机构，并考虑与阿根廷结成统一阵线');
INSERT INTO `cms_comment` VALUES (19, NULL, 1, 0, NULL, 'Info', 73, '2014-04-04 20:40:51', NULL, '0:0:0:0:0:0:0:1', NULL, NULL, 0, 1, '生活中不仅有幸福和快乐，更有悲伤和无奈，都要笑纳，因为它们都是生活的组成部分。');
INSERT INTO `cms_comment` VALUES (20, NULL, 1, 0, NULL, 'Info', 26, '2014-04-04 20:41:28', NULL, '0:0:0:0:0:0:0:1', NULL, NULL, 0, 1, '请市民减少出行，注意交通安全，山区防山洪、滑坡、泥石流地质灾害');

-- ----------------------------
-- Table structure for cms_favorite
-- ----------------------------
DROP TABLE IF EXISTS `cms_favorite`;
CREATE TABLE `cms_favorite`  (
  `favorite_id_` int(11) NOT NULL,
  `user_id_` int(11) NOT NULL COMMENT '收藏用户',
  `dtype_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏数据类型',
  `did_` int(11) NOT NULL COMMENT '收藏数据ID',
  `created_` datetime(0) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`favorite_id_`) USING BTREE,
  INDEX `fk_reference_148`(`user_id_`) USING BTREE,
  CONSTRAINT `fk_reference_148` FOREIGN KEY (`user_id_`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `cms_friendlink`;
CREATE TABLE `cms_friendlink`  (
  `f_friendlink_id` int(11) NOT NULL,
  `f_friendlinktype_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `f_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站地址',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  `f_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站Logo',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站描述',
  `f_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站长Email',
  `f_is_with_logo` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否带Logo',
  `f_is_recommend` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:已审核,1:未审核)',
  PRIMARY KEY (`f_friendlink_id`) USING BTREE,
  INDEX `fk_cms_friendlink_fltype`(`f_friendlinktype_id`) USING BTREE,
  INDEX `fk_cms_friendlink_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_friendlink_fltype` FOREIGN KEY (`f_friendlinktype_id`) REFERENCES `cms_friendlink_type` (`f_friendlinktype_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_friendlink_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_friendlink
-- ----------------------------
INSERT INTO `cms_friendlink` VALUES (7, 1, 1, 'JSPXCMS官方', 'http://www.jspxcms.com/', 2147483647, NULL, NULL, NULL, '0', '0', 0);
INSERT INTO `cms_friendlink` VALUES (8, 3, 1, 'JAVA', 'http://www.java.com/', 2147483647, NULL, NULL, NULL, '0', '0', 0);
INSERT INTO `cms_friendlink` VALUES (9, 3, 1, 'TOMCAT', 'http://tomcat.apache.org/', 2147483647, NULL, NULL, NULL, '0', '0', 0);

-- ----------------------------
-- Table structure for cms_friendlink_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_friendlink_type`;
CREATE TABLE `cms_friendlink_type`  (
  `f_friendlinktype_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  PRIMARY KEY (`f_friendlinktype_id`) USING BTREE,
  INDEX `fk_cms_friendlinktype_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_friendlinktype_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_friendlink_type
-- ----------------------------
INSERT INTO `cms_friendlink_type` VALUES (1, 1, '综合类', 'zonghe', 0);
INSERT INTO `cms_friendlink_type` VALUES (3, 1, '技术类', 'yule', 1);

-- ----------------------------
-- Table structure for cms_global
-- ----------------------------
DROP TABLE IF EXISTS `cms_global`;
CREATE TABLE `cms_global`  (
  `f_global_id` int(11) NOT NULL,
  `f_protocol` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http' COMMENT '协议',
  `f_port` int(11) NULL DEFAULT NULL COMMENT '服务端口号',
  `f_context_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上下文路径',
  `f_uploads_publishpoint_id` int(11) NULL DEFAULT NULL COMMENT '附件发布点',
  `f_captcha_errors` int(11) NOT NULL DEFAULT 3 COMMENT '需要验证码的错误次数(总是需要则为0)',
  `f_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'jspxcms版本号',
  PRIMARY KEY (`f_global_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全局表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_global
-- ----------------------------
INSERT INTO `cms_global` VALUES (1, 'http', 8080, NULL, 1, 3, '9.0.0');

-- ----------------------------
-- Table structure for cms_global_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_global_clob`;
CREATE TABLE `cms_global_clob`  (
  `f_global_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  INDEX `fk_cms_globalclob_global`(`f_global_id`) USING BTREE,
  CONSTRAINT `fk_cms_globalclob_global` FOREIGN KEY (`f_global_id`) REFERENCES `cms_global` (`f_global_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全局大字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_global_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_global_custom`;
CREATE TABLE `cms_global_custom`  (
  `f_global_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_cms_globalcustom_global`(`f_global_id`) USING BTREE,
  CONSTRAINT `fk_cms_globalcustom_global` FOREIGN KEY (`f_global_id`) REFERENCES `cms_global` (`f_global_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全局自定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_global_custom
-- ----------------------------
INSERT INTO `cms_global_custom` VALUES (1, 'poweredby', ' - Powered by Jspxcms');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_mail_smtpHost', 'smtp.126.com');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_mail_smtpPassword', '123');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_mail_smtpAuth', 'true');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_mail_from', 'myemail@126.com');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_mail_smtpUsername', 'myemail@126.com');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_mail_smtpSsl', 'false');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_validCharacter', '^[0-9a-zA-Z\\u4e00-\\u9fa5\\.\\-@_]+$');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_passwordEmailSubject', '找回密码通知');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_verifyMode', '0');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_groupId', '1');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_minLength', '3');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_passwordEmailText', '亲爱的${username}:\r\n  请复制以下链接到浏览器中打开，进入密码修改页面。\r\n  ${url}\r\n\r\n${sitename}');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_verifyEmailSubject', '帐号激活邮件');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_mode', '1');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_verifyEmailText', '亲爱的${username}:\r\n  请复制以下链接到浏览器中打开，以便激活您的帐号。\r\n  ${url}\r\n\r\n${sitename}');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_orgId', '1');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_maxLength', '15');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_userAgreement', '    1、在本站注册的会员，必须遵守《互联网电子公告服务管理规定》，不得在本站发表诽谤他人，侵犯他人隐私，侵犯他人知识产权，传播病毒，政治言论，商业讯息等信息。\r\n\r\n    2、在所有在本站发表的文章，本站都具有最终编辑权，并且保留用于印刷或向第三方发表的权利，如果你的资料不齐全，我们将有权不作任何通知使用你在本站发布的作品。\r\n\r\n    3、在登记过程中，您将选择注册名和密码。注册名的选择应遵守法律法规及社会公德。您必须对您的密码保密，您将对您注册名和密码下发生的所有活动承担责任。');
INSERT INTO `cms_global_custom` VALUES (1, 'oauth', '1');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_avatarLarge', '120');
INSERT INTO `cms_global_custom` VALUES (1, 'sys_register_avatarSmall', '50');

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook`;
CREATE TABLE `cms_guestbook`  (
  `f_guestbook_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_guestbooktype_id` int(11) NOT NULL COMMENT '留言类型',
  `f_creator_id` int(11) NOT NULL COMMENT '创建者',
  `f_replyer_id` int(11) NULL DEFAULT NULL COMMENT '回复者',
  `f_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言标题',
  `f_text` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言内容',
  `f_creation_date` datetime(0) NOT NULL COMMENT '留言日期',
  `f_creation_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言IP',
  `f_creation_country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言国家',
  `f_creation_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言地区',
  `f_reply_text` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `f_reply_date` datetime(0) NULL DEFAULT NULL COMMENT '回复日期',
  `f_reply_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复IP',
  `f_reply_country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复国家',
  `f_reply_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复地区',
  `f_is_reply` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否回复',
  `f_is_recommend` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:已审核,1:未审核,2:屏蔽)',
  `f_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `f_gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `f_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `f_mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `f_qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号码',
  `f_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  PRIMARY KEY (`f_guestbook_id`) USING BTREE,
  INDEX `fk_cms_guestbook_creator`(`f_creator_id`) USING BTREE,
  INDEX `fk_cms_guestbook_guestbooktype`(`f_guestbooktype_id`) USING BTREE,
  INDEX `fk_cms_guestbook_replyer`(`f_replyer_id`) USING BTREE,
  INDEX `fk_cms_guestbook_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_guestbook_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_guestbook_guestbooktype` FOREIGN KEY (`f_guestbooktype_id`) REFERENCES `cms_guestbook_type` (`f_guestbooktype_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_guestbook_replyer` FOREIGN KEY (`f_replyer_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_guestbook_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_guestbook
-- ----------------------------
INSERT INTO `cms_guestbook` VALUES (23, 1, 1, 1, 1, 'jspxcms升级了', '终于等到jspxcms升级了，期待很久了。\r\n呵呵！', '2013-08-12 08:54:43', '0:0:0:0:0:0:0:1', NULL, NULL, '非常感谢大家长久以来的支持！', '2013-08-12 08:56:00', '0:0:0:0:0:0:0:1', NULL, NULL, '1', '0', 0, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `cms_guestbook` VALUES (28, 1, 8, 1, NULL, '功能有改进', '留言功能更好用了！', '2014-03-18 13:56:44', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', 0, NULL, '1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_guestbook_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook_type`;
CREATE TABLE `cms_guestbook_type`  (
  `f_guestbooktype_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`f_guestbooktype_id`) USING BTREE,
  INDEX `fk_cms_guestbooktype_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_guestbooktype_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言板类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_guestbook_type
-- ----------------------------
INSERT INTO `cms_guestbook_type` VALUES (1, 1, '咨询', 'zixun', 1, '咨询');
INSERT INTO `cms_guestbook_type` VALUES (4, 1, '投诉', 'tousu', 2, '投诉');
INSERT INTO `cms_guestbook_type` VALUES (5, 1, '建议', 'jianyi', 3, '建议');
INSERT INTO `cms_guestbook_type` VALUES (6, 1, '反馈', 'fankui', 4, '反馈');
INSERT INTO `cms_guestbook_type` VALUES (7, 1, '其他', 'qita', 5, '其他');
INSERT INTO `cms_guestbook_type` VALUES (8, 1, '普通', 'putong', 0, NULL);

-- ----------------------------
-- Table structure for cms_info
-- ----------------------------
DROP TABLE IF EXISTS `cms_info`;
CREATE TABLE `cms_info`  (
  `f_info_id` int(11) NOT NULL,
  `f_org_id` int(11) NOT NULL COMMENT '组织',
  `f_creator_id` int(11) NOT NULL COMMENT '创建者',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_node_id` int(11) NOT NULL COMMENT '栏目',
  `f_from_site_id` int(11) NULL DEFAULT NULL COMMENT '推送来源站点',
  `f_publish_date` datetime(0) NOT NULL COMMENT '发布日期',
  `f_off_date` datetime(0) NULL DEFAULT NULL COMMENT '关闭日期',
  `f_priority` tinyint(4) NOT NULL DEFAULT 0 COMMENT '优先级',
  `f_is_with_image` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否包含图片',
  `f_views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览总数',
  `f_downloads` int(11) NOT NULL DEFAULT 0 COMMENT '下载总数',
  `f_comments` int(11) NOT NULL DEFAULT 0 COMMENT '评论总数',
  `f_diggs` int(11) NOT NULL DEFAULT 0 COMMENT '顶',
  `f_score` int(11) NOT NULL DEFAULT 0 COMMENT '得分',
  `f_favorites` int(11) NOT NULL DEFAULT 0 COMMENT '收藏次数',
  `f_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT '状态(0:发起者,1-9:审核中,A:已发布,B:草稿,C:投稿,D:退稿,E:采集,F:待发布,G:已过期,X:回收站,Z:归档)',
  `f_p0` tinyint(4) NULL DEFAULT NULL COMMENT '自定义0',
  `f_p1` tinyint(4) NULL DEFAULT NULL COMMENT '自定义1',
  `f_p2` tinyint(4) NULL DEFAULT NULL COMMENT '自定义2',
  `f_p3` tinyint(4) NULL DEFAULT NULL COMMENT '自定义3',
  `f_p4` tinyint(4) NULL DEFAULT NULL COMMENT '自定义4',
  `f_p5` tinyint(4) NULL DEFAULT NULL COMMENT '自定义5',
  `f_p6` tinyint(4) NULL DEFAULT NULL COMMENT '自定义6',
  `f_html_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'HTML状态(0:未开启,1:待生成,2:待更新,3:已生成)',
  PRIMARY KEY (`f_info_id`) USING BTREE,
  INDEX `fk_cms_info_node`(`f_node_id`) USING BTREE,
  INDEX `fk_cms_info_org`(`f_org_id`) USING BTREE,
  INDEX `fk_cms_info_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_info_site_from`(`f_from_site_id`) USING BTREE,
  INDEX `fk_cms_info_user_creator`(`f_creator_id`) USING BTREE,
  CONSTRAINT `fk_cms_info_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_info_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_info_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_info_site_from` FOREIGN KEY (`f_from_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_info_user_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info
-- ----------------------------
INSERT INTO `cms_info` VALUES (24, 1, 1, 1, 42, NULL, '2013-03-18 01:40:28', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (25, 1, 1, 1, 42, NULL, '2013-03-18 01:43:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (26, 1, 1, 1, 40, NULL, '2013-08-05 17:31:32', NULL, 0, '0', 0, 0, 1, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (27, 1, 1, 1, 42, NULL, '2013-03-18 01:46:31', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (28, 1, 1, 1, 42, NULL, '2013-08-05 17:31:36', NULL, 0, '0', 50, 0, 1, 2, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (30, 1, 1, 1, 44, NULL, '2013-08-05 17:31:32', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (32, 1, 1, 1, 44, NULL, '2014-03-06 07:31:32', NULL, 0, '1', 60, 0, 0, 1, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (33, 1, 1, 1, 42, NULL, '2013-08-05 17:31:32', NULL, 0, '1', 20, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (34, 1, 1, 1, 42, NULL, '2013-08-05 17:31:32', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (35, 1, 1, 1, 42, NULL, '2013-08-14 17:31:32', NULL, 0, '0', 10, 0, 1, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (36, 1, 1, 1, 42, NULL, '2013-08-06 17:31:32', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (43, 1, 1, 1, 38, NULL, '2013-08-11 00:55:52', NULL, 0, '1', 10, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (44, 1, 1, 1, 38, NULL, '2013-08-11 01:02:32', NULL, 0, '1', 10, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (45, 1, 1, 1, 38, NULL, '2013-03-11 01:06:31', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (46, 1, 1, 1, 38, NULL, '2013-08-11 01:09:43', NULL, 0, '0', 10, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (47, 1, 1, 1, 40, NULL, '2013-03-19 01:16:20', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (48, 1, 1, 1, 40, NULL, '2013-03-19 01:17:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (49, 1, 1, 1, 40, NULL, '2013-03-19 01:20:15', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (50, 1, 1, 1, 40, NULL, '2013-03-19 01:23:30', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (52, 1, 1, 1, 42, NULL, '2013-03-19 01:31:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (53, 1, 1, 1, 44, NULL, '2013-03-19 01:32:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (54, 1, 1, 1, 42, NULL, '2013-03-19 01:36:50', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (73, 1, 1, 1, 38, NULL, '2013-08-07 04:07:07', NULL, 0, '1', 10, 0, 1, 10, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (78, 1, 1, 1, 88, NULL, '2014-03-06 06:51:58', NULL, 0, '1', 10, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (80, 1, 1, 1, 90, NULL, '2013-08-06 08:26:57', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (81, 1, 1, 1, 90, NULL, '2014-03-06 08:36:28', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (83, 1, 1, 1, 79, NULL, '2013-08-06 09:32:47', NULL, 0, '1', 0, 6, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (87, 1, 1, 1, 82, NULL, '2014-12-28 02:53:12', NULL, 0, '1', 100, 0, 0, 3, 0, 0, 'A', NULL, 0, 1, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (93, 1, 1, 1, 78, NULL, '2013-08-08 07:32:47', NULL, 0, '1', 0, 5, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (94, 1, 1, 1, 84, NULL, '2014-03-05 07:35:46', NULL, 0, '1', 0, 0, 0, 0, 56, 0, 'A', NULL, 7, 0, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (95, 1, 1, 1, 85, NULL, '2014-03-21 09:50:20', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (97, 1, 1, 1, 83, NULL, '2013-08-08 09:26:09', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (98, 1, 1, 1, 83, NULL, '2013-08-12 01:33:02', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (99, 1, 1, 1, 44, NULL, '2013-08-13 08:02:06', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (100, 1, 1, 1, 44, NULL, '2013-08-13 08:03:20', NULL, 0, '0', 0, 0, 1, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (117, 1, 1, 1, 69, NULL, '2014-03-18 14:36:08', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (118, 1, 1, 1, 69, NULL, '2014-03-18 14:36:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (126, 1, 1, 1, 42, NULL, '2014-03-23 22:11:43', NULL, 0, '0', 240, 0, 3, 1, 2, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (127, 1, 1, 1, 42, NULL, '2014-03-23 22:11:44', NULL, 0, '0', 480, 0, 8, 1, 8, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (128, 1, 1, 1, 42, NULL, '2014-03-23 22:11:40', NULL, 0, '0', 50, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (129, 1, 1, 1, 84, NULL, '2014-04-01 09:42:55', NULL, 0, '1', 30, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (130, 1, 1, 1, 83, NULL, '2014-04-01 14:26:53', NULL, 0, '1', 10, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (131, 1, 1, 1, 96, NULL, '2014-03-06 06:14:31', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (132, 1, 1, 1, 95, NULL, '2014-04-01 10:17:56', NULL, 0, '1', 0, 0, 0, 0, 3, 0, 'A', NULL, 0, 0, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (133, 1, 1, 1, 79, NULL, '2014-04-01 16:17:47', NULL, 0, '1', 0, 1, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (134, 1, 1, 1, 79, NULL, '2014-04-01 16:42:25', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (135, 1, 1, 1, 77, NULL, '2014-04-01 16:44:23', NULL, 0, '1', 10, 4, 0, 1, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (136, 1, 1, 1, 77, NULL, '2014-04-01 16:47:02', NULL, 0, '1', 0, 2, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (137, 1, 1, 1, 80, NULL, '2012-04-02 20:54:50', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 5, 2, 99, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (138, 1, 1, 1, 80, NULL, '2009-04-02 21:07:34', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 9, 11, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (139, 1, 1, 1, 81, NULL, '2010-04-02 21:14:10', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, 100, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (140, 1, 1, 1, 81, NULL, '2013-08-08 02:47:18', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, 100, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (141, 1, 1, 1, 88, NULL, '2014-03-07 22:15:56', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (142, 1, 1, 1, 87, NULL, '2014-04-03 23:05:08', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (143, 1, 1, 1, 88, NULL, '2014-04-03 23:11:05', NULL, 0, '1', 10, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (144, 1, 1, 1, 69, NULL, '2014-04-04 22:32:07', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (145, 1, 1, 1, 69, NULL, '2014-04-04 22:33:53', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (146, 1, 1, 1, 69, NULL, '2014-04-04 22:37:05', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (148, 1, 1, 1, 78, NULL, '2014-04-05 13:40:11', NULL, 0, '1', 10, 4, 0, 1, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (149, 1, 1, 1, 78, NULL, '2014-04-05 13:41:40', NULL, 0, '1', 0, 1, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (150, 1, 1, 1, 79, NULL, '2014-04-05 13:43:23', NULL, 0, '1', 10, 2, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (151, 1, 1, 1, 82, NULL, '2014-10-02 21:15:32', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 2, 13, 100, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (162, 1, 1, 1, 93, NULL, '2014-11-26 17:52:33', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (163, 1, 1, 1, 94, NULL, '2014-11-26 17:52:43', NULL, 0, '1', 20, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (164, 1, 1, 1, 87, NULL, '2014-12-09 11:29:10', NULL, 0, '1', 180, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (165, 1, 1, 1, 88, NULL, '2014-12-09 11:34:38', NULL, 0, '1', 540, 0, 0, 0, 0, 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (166, 1, 1, 1, 82, NULL, '2014-12-12 22:43:36', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 1, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (167, 1, 1, 1, 82, NULL, '2014-12-12 12:42:55', NULL, 0, '1', 0, 0, 0, 1, 0, 0, 'A', NULL, 0, 1, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (168, 1, 1, 1, 80, NULL, '2014-12-12 17:28:21', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, 99, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (169, 1, 1, 1, 80, NULL, '2014-10-01 17:40:22', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 3, 5, 99, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (170, 1, 1, 1, 81, NULL, '2014-12-12 14:25:30', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 1, 1, 99, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (172, 1, 1, 1, 82, NULL, '2014-12-17 11:05:19', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 1, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (173, 1, 1, 1, 82, NULL, '2014-12-17 11:09:02', NULL, 0, '1', 0, 0, 0, 0, 0, 0, 'A', NULL, 0, 1, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (174, 1, 1, 1, 81, NULL, '2014-12-17 11:41:40', NULL, 0, '1', 30, 0, 0, 0, 0, 0, 'A', NULL, 0, 0, 100, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (180, 1, 1, 1, 44, NULL, '2015-12-23 21:01:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'X', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (221, 1, 1, 1, 42, NULL, '2018-10-06 14:03:36', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (222, 1, 1, 1, 42, NULL, '2018-10-06 14:03:36', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (223, 1, 1, 1, 42, NULL, '2018-10-06 14:03:36', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (224, 1, 1, 1, 42, NULL, '2018-10-06 14:03:36', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (225, 1, 1, 1, 42, NULL, '2018-10-06 14:03:36', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (226, 1, 1, 1, 42, NULL, '2018-10-06 14:03:36', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (227, 1, 1, 1, 42, NULL, '2018-10-06 14:03:36', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (228, 1, 1, 1, 42, NULL, '2018-10-06 14:03:36', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (229, 1, 1, 1, 42, NULL, '2018-10-06 14:03:36', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (230, 1, 1, 1, 42, NULL, '2018-10-06 14:03:37', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (231, 1, 1, 1, 42, NULL, '2018-10-06 14:03:37', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (232, 1, 1, 1, 42, NULL, '2018-10-06 14:03:37', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (233, 1, 1, 1, 42, NULL, '2018-10-06 14:03:37', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (234, 1, 1, 1, 42, NULL, '2018-10-06 14:03:37', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (235, 1, 1, 1, 42, NULL, '2018-10-06 14:03:37', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (236, 1, 1, 1, 42, NULL, '2018-10-06 14:03:37', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (237, 1, 1, 1, 42, NULL, '2018-10-06 14:03:37', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (238, 1, 1, 1, 42, NULL, '2018-10-06 14:03:37', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (239, 1, 1, 1, 42, NULL, '2018-10-06 14:03:38', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (240, 1, 1, 1, 42, NULL, '2018-10-06 14:03:38', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (241, 1, 1, 1, 42, NULL, '2018-10-06 14:03:38', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (242, 1, 1, 1, 42, NULL, '2018-10-06 14:03:38', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (243, 1, 1, 1, 42, NULL, '2018-10-06 14:03:38', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (244, 1, 1, 1, 42, NULL, '2018-10-06 14:03:38', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (245, 1, 1, 1, 42, NULL, '2018-10-06 14:03:38', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (246, 1, 1, 1, 42, NULL, '2018-10-06 14:03:38', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (247, 1, 1, 1, 42, NULL, '2018-10-06 14:03:38', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (248, 1, 1, 1, 42, NULL, '2018-10-06 14:03:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (249, 1, 1, 1, 42, NULL, '2018-10-06 14:03:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (250, 1, 1, 1, 42, NULL, '2018-10-06 14:03:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (251, 1, 1, 1, 42, NULL, '2018-10-06 14:03:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (252, 1, 1, 1, 42, NULL, '2018-10-06 14:03:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (253, 1, 1, 1, 42, NULL, '2018-10-06 14:03:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (254, 1, 1, 1, 42, NULL, '2018-10-06 14:03:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (255, 1, 1, 1, 42, NULL, '2018-10-06 14:03:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (256, 1, 1, 1, 42, NULL, '2018-10-06 14:03:39', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (257, 1, 1, 1, 42, NULL, '2018-10-06 14:03:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (258, 1, 1, 1, 42, NULL, '2018-10-06 14:03:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (259, 1, 1, 1, 42, NULL, '2018-10-06 14:03:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (260, 1, 1, 1, 42, NULL, '2018-10-06 14:03:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (261, 1, 1, 1, 42, NULL, '2018-10-06 14:03:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (262, 1, 1, 1, 42, NULL, '2018-10-06 14:03:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (263, 1, 1, 1, 42, NULL, '2018-10-06 14:03:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (264, 1, 1, 1, 42, NULL, '2018-10-06 14:03:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (265, 1, 1, 1, 42, NULL, '2018-10-06 14:03:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (266, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (267, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (268, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (269, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (270, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (271, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (272, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (273, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (274, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (275, 1, 1, 1, 42, NULL, '2018-10-06 14:03:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (276, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (277, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (278, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (279, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (280, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (281, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (282, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (283, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (284, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (285, 1, 1, 1, 42, NULL, '2018-10-06 14:03:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (286, 1, 1, 1, 42, NULL, '2018-10-06 14:03:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (287, 1, 1, 1, 42, NULL, '2018-10-06 14:03:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (288, 1, 1, 1, 42, NULL, '2018-10-06 14:03:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (289, 1, 1, 1, 42, NULL, '2018-10-06 14:03:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (290, 1, 1, 1, 42, NULL, '2018-10-06 14:03:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (291, 1, 1, 1, 42, NULL, '2018-10-06 14:03:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (292, 1, 1, 1, 42, NULL, '2018-10-06 14:03:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (293, 1, 1, 1, 42, NULL, '2018-10-06 14:03:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (294, 1, 1, 1, 42, NULL, '2018-10-06 14:03:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (295, 1, 1, 1, 42, NULL, '2018-10-06 14:03:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (296, 1, 1, 1, 42, NULL, '2018-10-06 14:03:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (297, 1, 1, 1, 42, NULL, '2018-10-06 14:03:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (298, 1, 1, 1, 42, NULL, '2018-10-06 14:03:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (299, 1, 1, 1, 42, NULL, '2018-10-06 14:03:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (300, 1, 1, 1, 42, NULL, '2018-10-06 14:03:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (301, 1, 1, 1, 42, NULL, '2018-10-06 14:03:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (302, 1, 1, 1, 42, NULL, '2018-10-06 14:03:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (303, 1, 1, 1, 42, NULL, '2018-10-06 14:03:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (304, 1, 1, 1, 42, NULL, '2018-10-06 14:03:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (305, 1, 1, 1, 42, NULL, '2018-10-06 14:03:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (306, 1, 1, 1, 42, NULL, '2018-10-06 14:03:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (307, 1, 1, 1, 42, NULL, '2018-10-06 14:03:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (308, 1, 1, 1, 42, NULL, '2018-10-06 14:03:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (309, 1, 1, 1, 42, NULL, '2018-10-06 14:03:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (310, 1, 1, 1, 42, NULL, '2018-10-06 14:03:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (311, 1, 1, 1, 42, NULL, '2018-10-06 14:03:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (312, 1, 1, 1, 42, NULL, '2018-10-06 14:03:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (313, 1, 1, 1, 42, NULL, '2018-10-06 14:03:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (314, 1, 1, 1, 42, NULL, '2018-10-06 14:03:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (315, 1, 1, 1, 42, NULL, '2018-10-06 14:03:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (316, 1, 1, 1, 42, NULL, '2018-10-06 14:03:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (317, 1, 1, 1, 42, NULL, '2018-10-06 14:03:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (318, 1, 1, 1, 42, NULL, '2018-10-06 14:03:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (319, 1, 1, 1, 42, NULL, '2018-10-06 14:03:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (320, 1, 1, 1, 42, NULL, '2018-10-06 14:03:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (321, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (322, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (323, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (324, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (325, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (326, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (327, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (328, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (329, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (330, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (331, 1, 1, 1, 42, NULL, '2018-10-06 14:03:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (332, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (333, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (334, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (335, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (336, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (337, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (338, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (339, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (340, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (341, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (342, 1, 1, 1, 42, NULL, '2018-10-06 14:03:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (343, 1, 1, 1, 42, NULL, '2018-10-06 14:03:49', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (344, 1, 1, 1, 42, NULL, '2018-10-06 14:03:49', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (345, 1, 1, 1, 42, NULL, '2018-10-06 14:03:49', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (346, 1, 1, 1, 42, NULL, '2018-10-06 14:03:49', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (347, 1, 1, 1, 42, NULL, '2018-10-06 14:03:49', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (348, 1, 1, 1, 42, NULL, '2018-10-06 14:03:49', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (349, 1, 1, 1, 42, NULL, '2018-10-06 14:03:49', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (350, 1, 1, 1, 42, NULL, '2018-10-06 14:03:49', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (351, 1, 1, 1, 42, NULL, '2018-10-06 14:03:49', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (352, 1, 1, 1, 42, NULL, '2018-10-06 14:03:50', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (353, 1, 1, 1, 42, NULL, '2018-10-06 14:03:50', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (354, 1, 1, 1, 42, NULL, '2018-10-06 14:03:50', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (355, 1, 1, 1, 42, NULL, '2018-10-06 14:03:50', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (356, 1, 1, 1, 42, NULL, '2018-10-06 14:03:50', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (357, 1, 1, 1, 42, NULL, '2018-10-06 14:03:50', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (358, 1, 1, 1, 42, NULL, '2018-10-06 14:03:51', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (359, 1, 1, 1, 42, NULL, '2018-10-06 14:03:51', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (360, 1, 1, 1, 42, NULL, '2018-10-06 14:03:51', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (361, 1, 1, 1, 42, NULL, '2018-10-06 14:03:51', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (362, 1, 1, 1, 42, NULL, '2018-10-06 14:03:51', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (363, 1, 1, 1, 42, NULL, '2018-10-06 14:03:51', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (364, 1, 1, 1, 42, NULL, '2018-10-06 14:03:51', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (365, 1, 1, 1, 42, NULL, '2018-10-06 14:03:51', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (366, 1, 1, 1, 42, NULL, '2018-10-06 14:03:52', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (367, 1, 1, 1, 42, NULL, '2018-10-06 14:03:52', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (368, 1, 1, 1, 42, NULL, '2018-10-06 14:03:52', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (369, 1, 1, 1, 42, NULL, '2018-10-06 14:03:52', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (370, 1, 1, 1, 42, NULL, '2018-10-06 14:03:52', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (371, 1, 1, 1, 42, NULL, '2018-10-06 14:03:52', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (372, 1, 1, 1, 42, NULL, '2018-10-06 14:03:52', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (373, 1, 1, 1, 42, NULL, '2018-10-06 14:03:52', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (374, 1, 1, 1, 42, NULL, '2018-10-06 14:03:53', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (375, 1, 1, 1, 42, NULL, '2018-10-06 14:03:53', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (376, 1, 1, 1, 42, NULL, '2018-10-06 14:03:53', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (377, 1, 1, 1, 42, NULL, '2018-10-06 14:03:53', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (378, 1, 1, 1, 42, NULL, '2018-10-06 14:03:53', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (379, 1, 1, 1, 42, NULL, '2018-10-06 14:03:53', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (380, 1, 1, 1, 42, NULL, '2018-10-06 14:03:53', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (381, 1, 1, 1, 42, NULL, '2018-10-06 14:03:54', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (382, 1, 1, 1, 42, NULL, '2018-10-06 14:03:54', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (383, 1, 1, 1, 42, NULL, '2018-10-06 14:03:54', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (384, 1, 1, 1, 42, NULL, '2018-10-06 14:03:54', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (385, 1, 1, 1, 42, NULL, '2018-10-06 14:03:54', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (386, 1, 1, 1, 42, NULL, '2018-10-06 14:03:54', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (387, 1, 1, 1, 42, NULL, '2018-10-06 14:03:54', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (388, 1, 1, 1, 42, NULL, '2018-10-06 14:03:55', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (389, 1, 1, 1, 42, NULL, '2018-10-06 14:03:55', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (390, 1, 1, 1, 42, NULL, '2018-10-06 14:03:55', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (391, 1, 1, 1, 42, NULL, '2018-10-06 14:03:55', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (392, 1, 1, 1, 42, NULL, '2018-10-06 14:03:55', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (393, 1, 1, 1, 42, NULL, '2018-10-06 14:03:55', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (394, 1, 1, 1, 42, NULL, '2018-10-06 14:03:55', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (395, 1, 1, 1, 42, NULL, '2018-10-06 14:03:55', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (396, 1, 1, 1, 42, NULL, '2018-10-06 14:03:56', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (397, 1, 1, 1, 42, NULL, '2018-10-06 14:03:56', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (398, 1, 1, 1, 42, NULL, '2018-10-06 14:03:56', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (399, 1, 1, 1, 42, NULL, '2018-10-06 14:03:56', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (400, 1, 1, 1, 42, NULL, '2018-10-06 14:03:56', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (401, 1, 1, 1, 42, NULL, '2018-10-06 14:03:56', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (402, 1, 1, 1, 42, NULL, '2018-10-06 14:03:56', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (403, 1, 1, 1, 42, NULL, '2018-10-06 14:03:56', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (404, 1, 1, 1, 42, NULL, '2018-10-06 14:03:56', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (405, 1, 1, 1, 42, NULL, '2018-10-06 14:03:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (406, 1, 1, 1, 42, NULL, '2018-10-06 14:03:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (407, 1, 1, 1, 42, NULL, '2018-10-06 14:03:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (408, 1, 1, 1, 42, NULL, '2018-10-06 14:03:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (409, 1, 1, 1, 42, NULL, '2018-10-06 14:03:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (410, 1, 1, 1, 42, NULL, '2018-10-06 14:03:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (411, 1, 1, 1, 42, NULL, '2018-10-06 14:03:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (412, 1, 1, 1, 42, NULL, '2018-10-06 14:03:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (413, 1, 1, 1, 42, NULL, '2018-10-06 14:03:57', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (414, 1, 1, 1, 42, NULL, '2018-10-06 14:03:58', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (415, 1, 1, 1, 42, NULL, '2018-10-06 14:03:58', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (416, 1, 1, 1, 42, NULL, '2018-10-06 14:03:58', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (417, 1, 1, 1, 42, NULL, '2018-10-06 14:03:58', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (418, 1, 1, 1, 42, NULL, '2018-10-06 14:03:58', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (419, 1, 1, 1, 42, NULL, '2018-10-06 14:03:58', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (420, 1, 1, 1, 42, NULL, '2018-10-06 14:03:58', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (421, 1, 1, 1, 42, NULL, '2018-10-06 14:03:58', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (422, 1, 1, 1, 42, NULL, '2018-10-06 14:03:59', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (423, 1, 1, 1, 42, NULL, '2018-10-06 14:03:59', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (424, 1, 1, 1, 42, NULL, '2018-10-06 14:03:59', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (425, 1, 1, 1, 42, NULL, '2018-10-06 14:03:59', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (426, 1, 1, 1, 42, NULL, '2018-10-06 14:03:59', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (427, 1, 1, 1, 42, NULL, '2018-10-06 14:03:59', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (428, 1, 1, 1, 42, NULL, '2018-10-06 14:03:59', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (429, 1, 1, 1, 42, NULL, '2018-10-06 14:03:59', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (430, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (431, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (432, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (433, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (434, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (435, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (436, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (437, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (438, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (439, 1, 1, 1, 42, NULL, '2018-10-06 14:04:00', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (440, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (441, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (442, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (443, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (444, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (445, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (446, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (447, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (448, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (449, 1, 1, 1, 42, NULL, '2018-10-06 14:04:01', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (450, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (451, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (452, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (453, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (454, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (455, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (456, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (457, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (458, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (459, 1, 1, 1, 42, NULL, '2018-10-06 14:04:02', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (460, 1, 1, 1, 42, NULL, '2018-10-06 14:04:03', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (461, 1, 1, 1, 42, NULL, '2018-10-06 14:04:03', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (462, 1, 1, 1, 42, NULL, '2018-10-06 14:04:03', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (463, 1, 1, 1, 42, NULL, '2018-10-06 14:04:03', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (464, 1, 1, 1, 42, NULL, '2018-10-06 14:04:03', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (465, 1, 1, 1, 42, NULL, '2018-10-06 14:04:03', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (466, 1, 1, 1, 42, NULL, '2018-10-06 14:04:03', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (467, 1, 1, 1, 42, NULL, '2018-10-06 14:04:03', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (468, 1, 1, 1, 42, NULL, '2018-10-06 14:04:03', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (469, 1, 1, 1, 42, NULL, '2018-10-06 14:04:04', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (470, 1, 1, 1, 42, NULL, '2018-10-06 14:04:04', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (471, 1, 1, 1, 42, NULL, '2018-10-06 14:04:04', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (472, 1, 1, 1, 42, NULL, '2018-10-06 14:04:04', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (473, 1, 1, 1, 42, NULL, '2018-10-06 14:04:04', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (474, 1, 1, 1, 42, NULL, '2018-10-06 14:04:04', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (475, 1, 1, 1, 42, NULL, '2018-10-06 14:04:05', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (476, 1, 1, 1, 42, NULL, '2018-10-06 14:04:05', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (477, 1, 1, 1, 42, NULL, '2018-10-06 14:04:05', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (478, 1, 1, 1, 42, NULL, '2018-10-06 14:04:05', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (479, 1, 1, 1, 42, NULL, '2018-10-06 14:04:05', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (480, 1, 1, 1, 42, NULL, '2018-10-06 14:04:05', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (481, 1, 1, 1, 42, NULL, '2018-10-06 14:04:05', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (482, 1, 1, 1, 42, NULL, '2018-10-06 14:04:06', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (483, 1, 1, 1, 42, NULL, '2018-10-06 14:04:06', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (484, 1, 1, 1, 42, NULL, '2018-10-06 14:04:06', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (485, 1, 1, 1, 42, NULL, '2018-10-06 14:04:06', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (486, 1, 1, 1, 42, NULL, '2018-10-06 14:04:06', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (487, 1, 1, 1, 42, NULL, '2018-10-06 14:04:06', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (488, 1, 1, 1, 42, NULL, '2018-10-06 14:04:06', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (489, 1, 1, 1, 42, NULL, '2018-10-06 14:04:06', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (490, 1, 1, 1, 42, NULL, '2018-10-06 14:04:07', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (491, 1, 1, 1, 42, NULL, '2018-10-06 14:04:07', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (492, 1, 1, 1, 42, NULL, '2018-10-06 14:04:07', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (493, 1, 1, 1, 42, NULL, '2018-10-06 14:04:07', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (494, 1, 1, 1, 42, NULL, '2018-10-06 14:04:08', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (495, 1, 1, 1, 42, NULL, '2018-10-06 14:04:08', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (496, 1, 1, 1, 42, NULL, '2018-10-06 14:04:08', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (497, 1, 1, 1, 42, NULL, '2018-10-06 14:04:09', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (498, 1, 1, 1, 42, NULL, '2018-10-06 14:04:09', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (499, 1, 1, 1, 42, NULL, '2018-10-06 14:04:09', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (500, 1, 1, 1, 42, NULL, '2018-10-06 14:04:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (501, 1, 1, 1, 42, NULL, '2018-10-06 14:04:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (502, 1, 1, 1, 42, NULL, '2018-10-06 14:04:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (503, 1, 1, 1, 42, NULL, '2018-10-06 14:04:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (504, 1, 1, 1, 42, NULL, '2018-10-06 14:04:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (505, 1, 1, 1, 42, NULL, '2018-10-06 14:04:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (506, 1, 1, 1, 42, NULL, '2018-10-06 14:04:40', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (507, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (508, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (509, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (510, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (511, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (512, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (513, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (514, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (515, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (516, 1, 1, 1, 42, NULL, '2018-10-06 14:04:41', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (517, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (518, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (519, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (520, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (521, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (522, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (523, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (524, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (525, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (526, 1, 1, 1, 42, NULL, '2018-10-06 14:04:42', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (527, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (528, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (529, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (530, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (531, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (532, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (533, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (534, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (535, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (536, 1, 1, 1, 42, NULL, '2018-10-06 14:04:43', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (537, 1, 1, 1, 42, NULL, '2018-10-06 14:04:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (538, 1, 1, 1, 42, NULL, '2018-10-06 14:04:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (539, 1, 1, 1, 42, NULL, '2018-10-06 14:04:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (540, 1, 1, 1, 42, NULL, '2018-10-06 14:04:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (541, 1, 1, 1, 42, NULL, '2018-10-06 14:04:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (542, 1, 1, 1, 42, NULL, '2018-10-06 14:04:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (543, 1, 1, 1, 42, NULL, '2018-10-06 14:04:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (544, 1, 1, 1, 42, NULL, '2018-10-06 14:04:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (545, 1, 1, 1, 42, NULL, '2018-10-06 14:04:44', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (546, 1, 1, 1, 42, NULL, '2018-10-06 14:04:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (547, 1, 1, 1, 42, NULL, '2018-10-06 14:04:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (548, 1, 1, 1, 42, NULL, '2018-10-06 14:04:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (549, 1, 1, 1, 42, NULL, '2018-10-06 14:04:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (550, 1, 1, 1, 42, NULL, '2018-10-06 14:04:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (551, 1, 1, 1, 42, NULL, '2018-10-06 14:04:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (552, 1, 1, 1, 42, NULL, '2018-10-06 14:04:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (553, 1, 1, 1, 42, NULL, '2018-10-06 14:04:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (554, 1, 1, 1, 42, NULL, '2018-10-06 14:04:45', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (555, 1, 1, 1, 42, NULL, '2018-10-06 14:04:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (556, 1, 1, 1, 42, NULL, '2018-10-06 14:04:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (557, 1, 1, 1, 42, NULL, '2018-10-06 14:04:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (558, 1, 1, 1, 42, NULL, '2018-10-06 14:04:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (559, 1, 1, 1, 42, NULL, '2018-10-06 14:04:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (560, 1, 1, 1, 42, NULL, '2018-10-06 14:04:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (561, 1, 1, 1, 42, NULL, '2018-10-06 14:04:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (562, 1, 1, 1, 42, NULL, '2018-10-06 14:04:46', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (563, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (564, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (565, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (566, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (567, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (568, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (569, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (570, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (571, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (572, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (573, 1, 1, 1, 42, NULL, '2018-10-06 14:04:47', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (574, 1, 1, 1, 42, NULL, '2018-10-06 14:04:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (575, 1, 1, 1, 42, NULL, '2018-10-06 14:04:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (576, 1, 1, 1, 42, NULL, '2018-10-06 14:04:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (577, 1, 1, 1, 42, NULL, '2018-10-06 14:04:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (578, 1, 1, 1, 42, NULL, '2018-10-06 14:04:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `cms_info` VALUES (579, 1, 1, 1, 42, NULL, '2018-10-06 14:04:48', NULL, 0, '0', 0, 0, 0, 0, 0, 0, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for cms_info_attribute
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_attribute`;
CREATE TABLE `cms_info_attribute`  (
  `f_info_id` int(11) NOT NULL COMMENT '文档',
  `f_attribute_id` int(11) NOT NULL COMMENT '属性',
  `f_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性图片',
  INDEX `fk_cms_infoattr_attribute`(`f_attribute_id`) USING BTREE,
  INDEX `fk_cms_infoattr_info`(`f_info_id`) USING BTREE,
  CONSTRAINT `fk_cms_infoattr_attribute` FOREIGN KEY (`f_attribute_id`) REFERENCES `cms_attribute` (`f_attribute_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_infoattr_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档与属性关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_attribute
-- ----------------------------
INSERT INTO `cms_info_attribute` VALUES (99, 2, NULL);
INSERT INTO `cms_info_attribute` VALUES (35, 2, NULL);
INSERT INTO `cms_info_attribute` VALUES (128, 5, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140406112839_t51ev5.jpg');
INSERT INTO `cms_info_attribute` VALUES (126, 2, NULL);
INSERT INTO `cms_info_attribute` VALUES (32, 2, NULL);
INSERT INTO `cms_info_attribute` VALUES (100, 2, NULL);
INSERT INTO `cms_info_attribute` VALUES (143, 6, 'http://demo.jspxcms.com/uploads/1/image/public/201409/20140929172732_j9o0oqnn2c.jpg');
INSERT INTO `cms_info_attribute` VALUES (151, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201410/20141002211526_iouofove3e.jpg');
INSERT INTO `cms_info_attribute` VALUES (129, 8, 'http://demo.jspxcms.com/uploads/1/image/public/201411/20141117143045_2k8pdv6ke2.jpg');
INSERT INTO `cms_info_attribute` VALUES (150, 9, 'http://demo.jspxcms.com/uploads/1/image/public/201411/20141126104341_820t7k7ni5.jpg');
INSERT INTO `cms_info_attribute` VALUES (164, 6, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209112843_bs0kabf7cu.jpg');
INSERT INTO `cms_info_attribute` VALUES (165, 6, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113405_ryxq84anlk.jpg');
INSERT INTO `cms_info_attribute` VALUES (166, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141212175444_45ewp2o3og.jpg');
INSERT INTO `cms_info_attribute` VALUES (167, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141212172257_qjop1b4iy1.jpg');
INSERT INTO `cms_info_attribute` VALUES (168, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141212173743_kf5xldg5ey.jpg');
INSERT INTO `cms_info_attribute` VALUES (169, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141212173924_qhyubw7vm4.jpg');
INSERT INTO `cms_info_attribute` VALUES (170, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141212174504_w5l14a260w.jpg');
INSERT INTO `cms_info_attribute` VALUES (137, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141216175307_busyg9xjhl.jpg');
INSERT INTO `cms_info_attribute` VALUES (139, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141216180114_mop3wba6kt.jpg');
INSERT INTO `cms_info_attribute` VALUES (138, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141216180547_3pqu2edor6.jpg');
INSERT INTO `cms_info_attribute` VALUES (174, 7, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141217114102_s0eqf9gvnb.jpg');
INSERT INTO `cms_info_attribute` VALUES (131, 8, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141217121217_xygn4sr97r.jpg');
INSERT INTO `cms_info_attribute` VALUES (95, 8, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141217121228_v1xqvymjqm.jpg');
INSERT INTO `cms_info_attribute` VALUES (94, 8, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141217121239_rdsuk10yp3.jpg');
INSERT INTO `cms_info_attribute` VALUES (149, 9, 'http://demo.jspxcms.com/uploads/1/image/public/201501/20150106121017_ddtjahwl4v.jpg');
INSERT INTO `cms_info_attribute` VALUES (148, 9, 'http://demo.jspxcms.com/uploads/1/image/public/201501/20150106121145_0pkk7m2ona.jpg');
INSERT INTO `cms_info_attribute` VALUES (134, 9, 'http://demo.jspxcms.com/uploads/1/image/public/201501/20150106121659_wngcl3a15m.jpg');
INSERT INTO `cms_info_attribute` VALUES (133, 9, 'http://demo.jspxcms.com/uploads/1/image/public/201501/20150106181224_jcbv9dec2s.jpg');
INSERT INTO `cms_info_attribute` VALUES (30, 2, NULL);
INSERT INTO `cms_info_attribute` VALUES (44, 10, 'http://demo.jspxcms.com/uploads/1/image/public/201605/20160523164122_vq0y4w01dc.jpg');
INSERT INTO `cms_info_attribute` VALUES (43, 10, 'http://demo.jspxcms.com/uploads/1/image/public/201605/20160531145609_wfmicbpnwd.jpg');
INSERT INTO `cms_info_attribute` VALUES (73, 10, 'http://demo.jspxcms.com/uploads/1/image/public/201605/20160523163408_u5vnaw9end.jpg');
INSERT INTO `cms_info_attribute` VALUES (32, 12, 'http://demo.jspxcms.com/uploads/1/image/public/201403/20140331113308_hiqudb.jpg');
INSERT INTO `cms_info_attribute` VALUES (78, 12, 'http://demo.jspxcms.com/uploads/1/image/public/201403/20140331150128_ik6otg.jpg');
INSERT INTO `cms_info_attribute` VALUES (141, 12, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140402221553_6ywoe4.jpg');
INSERT INTO `cms_info_attribute` VALUES (46, 12, 'http://demo.jspxcms.com/uploads/1/image/public/201403/20140331153023_s8c98q.jpg');
INSERT INTO `cms_info_attribute` VALUES (44, 12, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072401_15qx9s.jpg');
INSERT INTO `cms_info_attribute` VALUES (43, 12, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319062425_2c9ht9.jpg');

-- ----------------------------
-- Table structure for cms_info_buffer
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_buffer`;
CREATE TABLE `cms_info_buffer`  (
  `f_info_id` int(11) NOT NULL,
  `f_views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `f_downloads` int(11) NOT NULL DEFAULT 0 COMMENT '下载次数',
  `f_comments` int(11) NOT NULL DEFAULT 0 COMMENT '评论次数',
  `f_involveds` int(11) NOT NULL DEFAULT 0 COMMENT '评论参与人数',
  `f_diggs` int(11) NOT NULL DEFAULT 0 COMMENT '顶',
  `f_burys` int(11) NOT NULL DEFAULT 0 COMMENT '踩',
  `f_score` int(11) NOT NULL DEFAULT 0 COMMENT '得分',
  PRIMARY KEY (`f_info_id`) USING BTREE,
  CONSTRAINT `fk_cms_infobuffer_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档缓冲表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_buffer
-- ----------------------------
INSERT INTO `cms_info_buffer` VALUES (24, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (26, 8, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (27, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (28, 2, 0, 0, 0, 0, 0, 2);
INSERT INTO `cms_info_buffer` VALUES (30, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (32, 9, 0, 0, 0, 0, 0, 1);
INSERT INTO `cms_info_buffer` VALUES (33, 6, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (34, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (35, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (36, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (43, 5, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (44, 7, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (45, 8, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (46, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (48, 5, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (49, 8, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (50, 5, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (52, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (53, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (54, 8, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (73, 2, 0, 0, 0, 3, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (78, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (80, 9, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (81, 7, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (83, 7, 0, 0, 0, 0, 1, 0);
INSERT INTO `cms_info_buffer` VALUES (87, 4, 0, 0, 0, 0, 0, 2);
INSERT INTO `cms_info_buffer` VALUES (93, 3, 0, 0, 0, 0, 0, 9);
INSERT INTO `cms_info_buffer` VALUES (94, 7, 0, 0, 0, 0, 0, 9);
INSERT INTO `cms_info_buffer` VALUES (95, 7, 0, 0, 0, 0, 0, 3);
INSERT INTO `cms_info_buffer` VALUES (97, 5, 0, 0, 0, 0, 0, 8);
INSERT INTO `cms_info_buffer` VALUES (98, 7, 0, 0, 0, 0, 0, 2);
INSERT INTO `cms_info_buffer` VALUES (99, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (100, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (117, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (118, 5, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (126, 1, 0, 0, 0, 0, 1, 0);
INSERT INTO `cms_info_buffer` VALUES (127, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (128, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (129, 6, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (130, 6, 0, 0, 0, 0, 0, 9);
INSERT INTO `cms_info_buffer` VALUES (131, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (132, 6, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (133, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (134, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (135, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (136, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (137, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (138, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (139, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (140, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (141, 9, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (142, 9, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (143, 7, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (144, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (145, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (146, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (148, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (149, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (150, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (151, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (162, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (163, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (164, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (165, 7, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (166, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (167, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (168, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (169, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (170, 7, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (172, 6, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (173, 8, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (174, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (180, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (221, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (222, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (223, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (224, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (225, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (226, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (227, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (228, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (229, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (230, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (231, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (232, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (233, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (234, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (235, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (236, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (237, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (238, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (239, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (240, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (241, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (242, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (243, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (244, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (245, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (246, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (247, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (248, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (249, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (250, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (251, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (252, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (253, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (254, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (255, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (256, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (257, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (258, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (259, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (260, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (261, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (262, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (263, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (264, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (265, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (266, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (267, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (268, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (269, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (270, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (271, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (272, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (273, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (274, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (275, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (276, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (277, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (278, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (279, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (280, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (281, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (282, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (283, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (284, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (285, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (286, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (287, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (288, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (289, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (290, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (291, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (292, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (293, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (294, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (295, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (296, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (297, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (298, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (299, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (300, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (301, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (302, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (303, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (304, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (305, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (306, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (307, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (308, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (309, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (310, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (311, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (312, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (313, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (314, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (315, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (316, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (317, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (318, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (319, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (320, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (321, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (322, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (323, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (324, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (325, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (326, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (327, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (328, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (329, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (330, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (331, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (332, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (333, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (334, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (335, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (336, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (337, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (338, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (339, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (340, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (341, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (342, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (343, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (344, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (345, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (346, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (347, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (348, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (349, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (350, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (351, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (352, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (353, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (354, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (355, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (356, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (357, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (358, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (359, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (360, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (361, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (362, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (363, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (364, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (365, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (366, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (367, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (368, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (369, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (370, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (371, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (372, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (373, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (374, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (375, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (376, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (377, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (378, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (379, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (380, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (381, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (382, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (383, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (384, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (385, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (386, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (387, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (388, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (389, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (390, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (391, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (392, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (393, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (394, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (395, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (396, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (397, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (398, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (399, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (400, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (401, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (402, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (403, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (404, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (405, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (406, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (407, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (408, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (409, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (410, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (411, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (412, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (413, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (414, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (415, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (416, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (417, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (418, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (419, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (420, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (421, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (422, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (423, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (424, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (425, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (426, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (427, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (428, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (429, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (430, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (431, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (432, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (433, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (434, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (435, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (436, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (437, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (438, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (439, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (440, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (441, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (442, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (443, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (444, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (445, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (446, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (447, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (448, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (449, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (450, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (451, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (452, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (453, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (454, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (455, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (456, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (457, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (458, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (459, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (460, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (461, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (462, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (463, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (464, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (465, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (466, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (467, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (468, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (469, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (470, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (471, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (472, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (473, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (474, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (475, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (476, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (477, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (478, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (479, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (480, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (481, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (482, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (483, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (484, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (485, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (486, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (487, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (488, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (489, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (490, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (491, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (492, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (493, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (494, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (495, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (496, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (497, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (498, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (499, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (500, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (501, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (502, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (503, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (504, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (505, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (506, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (507, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (508, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (509, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (510, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (511, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (512, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (513, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (514, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (515, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (516, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (517, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (518, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (519, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (520, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (521, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (522, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (523, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (524, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (525, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (526, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (527, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (528, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (529, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (530, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (531, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (532, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (533, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (534, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (535, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (536, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (537, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (538, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (539, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (540, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (541, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (542, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (543, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (544, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (545, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (546, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (547, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (548, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (549, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (550, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (551, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (552, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (553, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (554, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (555, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (556, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (557, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (558, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (559, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (560, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (561, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (562, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (563, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (564, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (565, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (566, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (567, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (568, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (569, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (570, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (571, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (572, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (573, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (574, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (575, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (576, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (577, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (578, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_info_buffer` VALUES (579, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for cms_info_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_clob`;
CREATE TABLE `cms_info_clob`  (
  `f_info_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  INDEX `fk_cms_infoclob_info`(`f_info_id`) USING BTREE,
  CONSTRAINT `fk_cms_infoclob_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档大字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_clob
-- ----------------------------
INSERT INTO `cms_info_clob` VALUES (24, 'text', '<p>&nbsp;</p><p style=\"text-align:center;\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130813071000_kk4cm0.jpg\" style=\"width: 500px; height: 336px; \"/></p><p style=\"text-align:center;\"><span style=\"color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; font-size: 16px; line-height: 28px; \">少林足球</span></p><p>近日，有关登封武校将少林功夫融入足球，培训足球运动员的新鲜事儿在网上流传，引起社会各界的关注。</p><p>8月6日下午，记者电话采访了嵩山少林寺武僧团培训基地总教头释延鲁。释延鲁说，8月2日全国第六届高校足球教练培训研讨会在登封举行，他向与会的70多位国内各高校的足球教练员阐述了他的观点。释延鲁认为，武术和足球两者可&amp;ldquo;强强联合&amp;rdquo;，少林功夫中的腿法如十二路弹腿、桩功和其他拳法，对提高学生的脚法、抗撞击能力和身体协调性有很大帮助，可将这些技能融入足球之中，希望能对提升足球的训练水平有所帮助。</p><p>释延鲁说，他们已经就功夫与足球的结合，做了技术性的研究，并已付诸行动。早在2010年10月，少林寺武僧团培训基地就已开始组建青少年足球队。据介绍，目前少林武僧团培训基地与河南建业集团联合，规划建设少林建业国际足球学校。该项目今年2月26日奠基，计划投资20亿元，包括一个足球学校、一个体育场和两个体育馆等。</p>');
INSERT INTO `cms_info_clob` VALUES (25, 'text', '<p>&nbsp;</p><p>北京警方10日通报，8月7日警方出动300名警力，对藏匿于一栋大厦内侵害公民个人信息的犯罪团伙实施抓捕，299名嫌犯落网，其中刑事拘留95人、行政拘留204人，并缴获数十箱公民个人信息名单。目前，涉案公司总裁仍在逃。</p><p>北京市公安局丰台分局副局长郑威在10日的新闻发布会上介绍说，今年8月初，警方侦查发现，位于北京南三环一栋大厦内的某收藏品文化交流中心，涉嫌非法获取公民个人信息，实施违法犯罪活动。该公司机构庞大、组织严密。</p><p>据侦破此案的警方介绍，该公司拥有400多名员工，下设23个部门，其中技术部被称为公司的核心机密部门，有7名员工，他们每天的任务是通过互联网等途径盗取大量公民个人信息，再经过分析梳理汇总后，输送到公司本部，分发到各个营销部门。为逃避打击，技术部的办公地点远离公司本部。</p><p>警方调查发现，该公司推销的所谓收藏品均是从旧货市场、集币市场、纪念品制造厂家廉价收购的，这些低价的钱币、古玩，经过精美包装，配上公司自制的收藏证书，向客户高价销售。</p><p>该公司招聘的近300名话务员经过培训，按照盗取的公民信息，用掌握的话术技巧虚构藏品价值，诱骗客户购买。每名话务员每天至少拨打200个以上电话进行推销。从查获该公司相关数据显示，其交易量3万余笔，交易额上亿元人民币。</p><p>经审查嫌犯交代，涉案公司总裁为辽宁省人韩某，日常管理由张某等3个副总裁负责。目前，张某及400余名员工正在接受警方调查。警方对在逃的韩某展开抓捕。</p>');
INSERT INTO `cms_info_clob` VALUES (26, 'text', '<p>&nbsp;</p><p>11日凌晨开始，北京雷雨大作，持续一夜，至9时许雨量减弱，天气转阴。北京市气象台发布消息称，11日白天到夜间，北京将有大到暴雨，并伴有雷电。尤其是傍晚至夜间，雨势较大，山区须注意防范地质灾害。</p><p>降雨带来了些许清凉，一解前几日的持续暑热。11日一早，许多市民趁雨停了，纷纷出门采买，但整个京城仍然雾气朦胧，略显闷热。北京市气象台值班室相关人员表示，虽然已经立秋，但是三伏天还没结束，雨后的天气闷热感依旧较明显。</p><p>11日7时35分，北京市气象台发布雷电黄色预警信号称，预计大范围的降雨自午后开始，傍晚到夜间雨势更加明显，最低气温23摄氏度。</p><p>针对降雨可能带来的地质灾害，北京市国土局和气象局9时30分联合发布地质灾害气象风险黄色预警，预计11日白天到12日，北京市房山、门头沟、昌平、延庆、密云、怀柔、平谷等大部分山区，以及丰台、海淀、石景山部分浅山区发生地质灾害的气象风险较高，提示有关部门要加强监测、注意防范。</p><p>北京市防汛办发出重点提示，请市民减少出行，注意交通安全，山区防山洪、滑坡、泥石流地质灾害。</p>');
INSERT INTO `cms_info_clob` VALUES (27, 'text', '<p style=\"text-indent: 2em\">作为淘宝最知名的团购平台，2011年是聚划算的爆发年，而历经反腐门之后，重新出台的聚划算团购服务竞拍规则(俗称“坑位费”)出台至今就重创了不少中小商家。</p><p style=\"text-indent: 2em\">据聚划算官网显示，其竞拍时间为每天上午10：00-11：00，竞拍起拍价为人民币1000元，单次加价幅度为100元及其整数倍，参与聚划算竞拍的卖家应在竞拍前在支付宝账户中冻结1000元保证金。看似门栏低的竞价规则，在一轮轮商家疯狂竞价之后，从几万飙升至几十万，外加聚划算要收的1%到3%不等的佣金，中小商家叫苦不迭。</p><p style=\"text-indent: 2em\">“很多小卖家上了聚划算，但是卖了几十套、几百套的很多，付坑位费还不够。”上海柔仕个人护理用品有限公司王文彬对《投资者报》记者说，“聚划算流量是很大，但是类目细分的很厉害，分配给每个坑位的流量实际是有限的，其次聚划算的消费人群本身对价格敏感，如果价格比平时购买并无优势，消费者是不会买单的。”</p><p style=\"text-indent: 2em\">公开数据显示，2012年聚划算全年交易额207.5亿，是2011年2.03倍，但是分散到各个参与活动卖家却不甚乐观，加上不断上涨的高昂坑位费也影响了单品促销效果。2012年6月，聚划算在上线了品牌团、本地生活，每个品牌团商家平均销售额200万左右/期，最高达到700万(3天)，但品牌团销售额占整个聚划算的30%。</p><p style=\"text-indent: 2em\">而随着参与聚划算平台的卖家利润不断挤压，聚划算早已沦为商家劣质产品集散地。“据我认识的将近500个卖家，为了保持利润，基本都是压缩成本，在材料上偷换。做饰品的，基本都是拿好的去质检，然后</p><p style=\"text-indent: 2em\">用不好的材质去生产，聚划算基本都是问题产品。”义乌市朵拓贸易有限公司电子商务韩姓总监对《投资者报》记者说。</p><p style=\"text-indent: 2em\"><strong>聚划算成清仓专用</strong></p><p style=\"text-indent: 2em\">“现在的聚划算我的理解就是清库存才会去上。要不然有些商家竞价那么高，会愿意出的吗，而且谁也无法知道这个销量能否得到保障。”上海简恋家居用品有限公司电子商务部运营主管陈明顿对《投资者报》记者感叹到。</p><p style=\"text-indent: 2em\">2012年上半年，聚划算从原来免费的模式开始变为竞拍坑位。之前只要跟店小二合作就能开展团购，这导致了一定程度上的内部腐败，之后随着<!--keyword--><a class=\"a-tips-Article-QQ\" href=\"http://stockhtm.finance.qq.com/hk/ggcx/01688.htm\" target=\"_blank\"><!--/keyword--><span style=\"color:#00479d\"><span style=\"font-family:微软雅黑\">阿里巴巴<!--keyword--></span></span></a><!--/keyword-->反腐，把聚划算的游戏规则重新改写。不过，这个改写也屡遭诟病。</p><p style=\"text-indent: 2em\">“以前行贿小二，跟小二商量，比如给一万，再拿几个点的提成，如果销量不好，就不需要付那么多的钱。跟之前比，当然是坑位费成本高，现在搞得跟赌博一样。”上述韩姓总监愤慨到。</p><p style=\"text-indent: 2em\">坑位费的水涨船高，挫败了中小商家，王文斌表示，现在的坑位费导致的是小卖家基本都处于观望的状态，当然对运营能力较强的大卖家而言，几乎没有影响。“过去的坑位费大家都比较盲目，上什么都能赚钱，现在坑位费过高了，必须考虑投入产出，对商品销售做合理的预测。”电子商务观察员鲁振旺对记者解释道。</p><p style=\"text-indent: 2em\">收费竞拍坑位后，中小商家基本上不寄希望能赚钱，只是想处理自己推广不动的商品，而其实如果能做到清库存也不失为一件好事，但即使这样，也未必能如愿。如果上以前去聚划算是为了拉高销量，那现在的情境则完全会让商家绝望。</p><p style=\"text-indent: 2em\">“不是说销量提升，是销量比原来降了三分之一多，个别类目也有降了一半多。”对比竞拍之后的销量变化，上述韩姓总监如此说道。当然他不是最惨的，他认识的一个做化妆品的同行，做聚划算根本没有销量，最后被逼无奈只能自己在十一点刷了五百多单。</p><p style=\"text-indent: 2em\">2011年6月开始在聚划算做的韩总监见证了淘宝卖家在这个平台上的流失。他的一个淘宝卖家群有575个淘宝店主，覆盖将近两千个店面，但现在还依然做聚划算的寥寥无几了，除了清库存以外，卖家基本不会再去做聚划算了，而他负责做的几个店早已对聚划算敬而远之。</p><p style=\"text-indent: 2em\"><strong>平台急于变现堵死中小商家 </strong></p><p style=\"text-indent: 2em\">利用聚划算打造爆款的模式已经过去了，而现在，若想要把库存变现金，聚划算定是好平台，尤其对于有运营能力的卖家，聚划算几乎可以完美解决库存管理难题。</p><p style=\"text-indent: 2em\">目前，在淘宝上能给到的流量最多的入口依然是聚划算，而其他的入口几乎都没能转化那么多的存货，但现在单品销售数量跟以前差距太大，以前能上万销量出现的单品，现在已属罕见。</p><p style=\"text-indent: 2em\">并且昂贵的坑位费，还有三个点的佣金，加上第一次上聚划算还必须要如淘宝仓库发货，而这里比卖家自行合作的快递价格平均一件多2块左右。</p><p style=\"text-indent: 2em\">昂贵的成本，有限的入口，中小卖家生存艰难。“之前聚划算是一个快速回笼资金，打造爆款的平台，大家爱之不及，现在只要有正常商业头脑的中小商家对聚划算也逐渐恢复到了正常的心态吧。”王文斌说。</p><p style=\"text-indent: 2em\">取消坑位费的呼声一直都很高。王文斌认为，“淘宝可以转为提高销售提成的方式，这样卖家定价可以更低，且卖家也不存在上一次聚划算亏一次的情况。”</p>');
INSERT INTO `cms_info_clob` VALUES (28, 'text', '<p>“这是今年最值得向大家推荐观测的流星雨”，北京天文馆馆长朱进前日发微博“推介”即将于13日凌晨迎来极大值的英仙座流星雨，是日恰逢七夕。但天气预报显示，届时北京将以阴雨天气为主，市民能否一睹年度最佳流星雨，还要看天公是否做美。</p><p>据国际流星组织(IMO)估计，今年英仙座流星雨的高峰期将在北京时间8月12日21：15至8月13日早晨9:45之间，极大峰值将出现在13日凌晨2:15至4:45之间，有望迎每小时约100颗流星。</p><p>此次英仙座流星雨大爆发恰逢“中国情人节”七夕当日，而中国正好位于最佳观测区，因此备受网友关注。北京天文馆馆长朱进昨日告诉本报记者，13日凌晨的郊外，是北京观测流星雨的最佳时间和地点，但关键是天气。朱进10日通过看晴天钟预测，北京西北方向、内蒙古中部、宁夏、山西北部、陕西北部等地天气或将不错，观测条件好的话每小时肉眼可看到50颗以上的流星。</p><p>但朱进表示，夏天天气多变，12日后半夜具体何地适合观测，还需根据今天最新的天气预报来判断，一般情况下北京地区总会有相对晴朗的地方可看到星空。</p>');
INSERT INTO `cms_info_clob` VALUES (30, 'text', '<p style=\"text-indent: 2em\">据美联社3月18日报道，瑞典智库斯德哥尔摩国际和平研究所(SIPRI)18日称，中国已取代英国成为世界第五大常规武器出口国。</p><p style=\"text-indent: 2em\">SIPRI在报告中称，中国在过去5年(2008-2012)中武器出口总量增长了163%，国际军火市场占有份额从2%增至5%，同时排名也从之前的第八升至第五。</p><p style=\"text-indent: 2em\">报告称，中国武器的最大买家来自巴基斯坦，其购买量占到中国常规武器总出口量的55%，紧随其后的是缅甸和孟加拉国，在中国武器出口中的占比分别为8%和7%。</p><p style=\"text-indent: 2em\">针对国际社会对近年来中国武器出口的关注，中国国防部发言人耿雁生曾表示，中国在武器出口问题上，一直严格遵循三项原则：一是有助于接收国的正当防卫能力;二是不损害有关地区和世界的和平、安全与稳定;三是不干涉接收国的内政。耿雁生表示，中国严格遵守<span class=\"infoMblog      \">联合国</span>有关决议，建立了一套完备的军品出口管制法规体系，武器出口都是合法的、负责任的。</p>');
INSERT INTO `cms_info_clob` VALUES (32, 'text', '<p>俄南部军区27日起在克拉斯诺达尔边疆区举行空中演习。据悉&#xff0c;在为期两天的时间里&#xff0c;苏&#xff0d;25SM3强击机机 组人员将完成约40架次的飞行&#xff0c;并在无线电干扰的情况下对假想敌进行约50次打击。俄国防部网站消息说&#xff0c;俄东部军区当天也开始了大规模空中演习。演习将在 哈巴罗夫斯克边疆区和滨海边疆区进行&#xff0c;将有超过30架包括苏&#xff0d;27、苏&#xff0d;30在内的战机参与。俄东部军区新闻发言人亚历山大戈尔杰耶夫说&#xff0c;如此多数量战机 参与的演习在该区尚属首次。</p>');
INSERT INTO `cms_info_clob` VALUES (33, 'text', '<p style=\"text-align: center; text-indent: 2em\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130318085043_oos13e.jpg\" /></p>\r\n<p style=\"text-align: center; text-indent: 2em\"><span style=\"font-size: 12px\">事故现场照片（翻拍自案卷</span></p>\r\n<p text-indent:=\"\">在高速上失控撞<a class=\"a-tips-Article-QQ\" href=\"http://data.auto.qq.com/car_serial/186/index.shtml\" target=\"_blank\">捷达</a> ，捷达车内一家四口身亡。司机和死者家属都认为事故系爆胎造成，肇事人月底前将来京申诉；死者家属近期也将起诉锦湖公司索赔。</p>\r\n<p style=\"text-indent: 2em\">此前，司机曾起诉锦湖轮胎公司，并申请鉴定轮胎质量。虽然3份证人证言、5份公检法出具的法律文书均证实爆胎引发车祸，鉴定机构却避开质量问题，推翻生效文书，称&ldquo;车祸导致爆胎&rdquo;，导致司机败诉。</p>\r\n<p style=\"text-indent: 2em\">肇事司机的律师质疑鉴定结论&ldquo;太荒唐&rdquo;。鉴定机构对此回应，&ldquo;对鉴定有异议，让法院来找我&rdquo;。</p>\r\n<p style=\"text-indent: 2em\"><strong>突发祸事出车祸一家四口全部身亡</strong></p>\r\n<p style=\"text-indent: 2em\">2010年8月11日晚上，74岁的胡振兴老人接到电话：大女儿胡彦军一家出车祸了。</p>\r\n<p style=\"text-indent: 2em\">京沈高速上，一辆车失控冲过隔离栏到马路对面，撞上胡彦军的车子，她的捷达车随后起火。44岁的胡彦军、她43岁的丈夫、她20岁的大女儿和17岁的小女儿都被烧死。</p>\r\n<p style=\"text-indent: 2em\">老人在房山区长沟镇东甘池村的家中接受了记者采访。他说，他有四个子女，大女儿一直是他的骄傲。&ldquo;女婿开了个石板厂，经济上挺富裕。夫妻俩感情也好，也孝顺，每周都给我来电话。两个孩子，从小就爱在我身旁撒娇。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">老人说：&ldquo;那些天好难熬。早晨没等起床我就大哭一场，一整天眼泪围着眼眶转。猜测着事故的严重程度，我感觉床周围是万丈深渊，晚上靠安眠药才睡了半宿。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">他把头仰在沙发上，睁大了眼睛叹气。&ldquo;女婿事业心强，想转行做更大的生意。转产之前想去外地放松一下，就去北戴河了。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">&ldquo;俩孩子本来不想去，爹妈说光是大人没兴致，硬拉走了。玩了几天俩孩子觉得没意思，吵着要走，于是提前往回赶。谁承想&hellip;&hellip;&rdquo;</p>\r\n<p style=\"text-indent: 2em\"><strong>追忆经过15分钟行车逆转命运</strong></p>\r\n<p style=\"text-indent: 2em\">肇事司机苏琳是个1985年出生的兰州女孩。维权的不顺利已经让她对外界产生怀疑，坚持要求当面采访。3月8日晚，记者乘机飞抵兰州，次日上午与苏琳会面。</p>\r\n<p style=\"text-indent: 2em\">3月9日是个沙尘天，天色昏暗，路人戴着口罩来去匆匆。下午2点，一个一身黑衣的高个子女孩在朋友的陪同下，来到记者下榻的兰州航空大酒店一楼。这比约定的时间晚了一小时。苏琳不好意思地解释：为了多挣些钱，她周末也在加班，现在是请假出来的。</p>\r\n<p style=\"text-indent: 2em\">采访是在附近一家茶馆里进行的。苏琳拿着厚厚的茶水单看了很久，半天没说话。记者意会，随即主动选了一壶最便宜的茶水，并表示将会买单。苏琳的神色有些尴尬。她自嘲地说，车祸把她的命运逆转，她已经很久没过白领的生活了。</p>\r\n<p style=\"text-indent: 2em\">在北京读完大学，苏琳先在一家公司当白领，之后辞职经商。她说，出事前，她的生意挺红火。</p>\r\n<p style=\"text-indent: 2em\"><img alt=\"事故现场照片（翻拍自案卷\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130318084927_1siuwe.jpg\" /></p>\r\n<p style=\"text-align: center; text-indent: 2em\"><span style=\"font-size: 12px\">事故现场照片（翻拍自案卷</span></p>\r\n<p style=\"text-indent: 2em\">细细地喝了一口茶，她说出了当年的梦想：努力工作多挣钱，将来把兰州的房子卖掉，在北京买房，把父母接过来一起生活。</p>\r\n<p style=\"text-indent: 2em\">命运的转变发生在2010年8月11日。当天上午，苏琳的生意合伙人、东北女孩刘由迪开着她的华晨骏捷回抚顺老家。苏琳的姨家也在抚顺，于是苏琳和父母搭上刘由迪的车去串亲戚。</p>\r\n<p style=\"text-indent: 2em\">苏琳说：&ldquo;我们一路走京沈高速。开到第一个服务站后休息了会儿。之后我说一个人开车太累，就把刘由迪换下来了。结果，开了15分钟就出事了。&rdquo;</p>\r\n<p style=\"text-indent: 2em\"><strong>多方证实接受讯问司机坚称爆胎致祸</strong></p>\r\n<p style=\"text-indent: 2em\">苏琳说，当时自己已有两年驾龄。虽然车不是自己的，但因为刘由迪和自己一起租房生活，自己平时经常开她的车，对性能很熟悉。</p>\r\n<p style=\"text-indent: 2em\">讯问笔录显示，苏琳始终供述是爆胎导致车辆失控。她对警方表示：&ldquo;当时的车速大约是100迈。突然不知道怎么回事，感觉车跑偏了。当时刘由迪喊车偏了，车就撞到左侧护栏上了，之后我就什么都不知道了。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">接受采访时，苏琳再次证实了这一点。</p>\r\n<p style=\"text-indent: 2em\">&ldquo;当时我们都晕过去了。我爸第一个醒过来，把我们救了出去。我妈大腿股骨头粉碎性骨折，我左脚根骨粉碎性骨折、脊椎第三节骨折，胸腔有三根骨头断了。&rdquo;尽管已经时隔几年，但说到这里，苏琳还是有些激动，语速也快了起来。</p>\r\n<p style=\"text-indent: 2em\">苏琳说，大家从车里出来后，发现前面有辆白色捷达着火了。</p>\r\n<p style=\"text-indent: 2em\">&ldquo;我爸打电话报了警。他想拿灭火器救火，但我们的车门已经打不开了。很快，那辆车的火势到了人没法接近的地步。&rdquo;她说。</p>\r\n<p style=\"text-indent: 2em\">苏琳说，她被送进医院、民警向她问话的时候，她才得知是自己的车撞了对方。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES (34, 'text', '<p>6日晚，在昆明市白龙路一自助银行里，来取钱的刘老师站在柜员机前捣鼓了半天&amp;mdash;&amp;mdash;卡插不进去，他在柜员机上随便按了“5000”，谁知50张百元钞票就吐到了他面前。机器出了问题？他又按了“5000”，又有5000元吐到了手里。仔细一查，发现柜员机里原来已有一张银行卡，刘老师忙报了警。经过盘龙公安分局东华派出所民警的寻找，次日找到了卡的主人。</p><p>　　6日当晚10点30分许，刘老师来到自助银行取款。掏出卡往自动存取款机上塞却塞不进。再塞，还是一样。难道柜员机出问题了？他试着输入了5000，按照柜员机提示按下“取款”，随着机器“嗒嗒”的声音，钞票盖打开，一沓钞票就在眼前。这是不是假钞呢？刘老师愣了一会，再试，又出来5000元。难道天上真会掉馅饼，经过一番检查，原来是柜员机里有一张银行卡。取出卡后，他用自己的卡进行了存取款“试验”，发现机器没问题，而是粗心人忘记取走银行卡。</p><p>　　面对这个天上砸下的馅饼，刘老师没有犹豫，直接拨打110报警。当东华派出所民警赶到银行时，他把1万元现金和银行卡一并交给了警察，并请民警一定要找到失主。</p><p>　　次日下午，在昆明开火锅店的刁女士接到东华派出所打来的电话，说她的银行卡和1万元现金被好心人拾到，请到派出所核实领取时，她很惊讶，自己的卡怎么会到了派出所？前一晚，火锅店打烊后，她将银行卡交给两名店员，带着当天的1万元营业款去银行存起来。10点半时，到了白龙路自助银行，一名店员站在旁边玩着手机，另一名数着钱。存款完成后，两人拿了凭条就离开了自助银行。</p><p>　　15日下午，刁女士特地带着一封感谢信和一面锦旗，来到东华派出所，并从民警手中接过现金和银行卡。刁女士说：“银行卡上有近10万元存款，也怪员工太粗心大意了，太感谢刘老师了！”</p>');
INSERT INTO `cms_info_clob` VALUES (35, 'text', '<p>&nbsp;</p><p>31省市男女最理想伴侣地图出炉</p><p>首选嫁京男&nbsp;最爱娶川妹</p><p>超五成的青年择偶时首选本地人；女性最想嫁的外省人中，北京男最受欢迎；男性则最想娶川妹子。</p><p>记者上午获悉，零点指标数据进行2013年七夕主题调查，对全国各地1074位18至45周岁的网民进行随机访问，绘出31省市青年男女最理想伴侣地图。调查还显示，八成人打算庆祝七夕，比例超过西方情人节。</p><p>半数择偶爱“窝边草”</p><p>对“您最想娶/嫁哪个地区的姑娘/男人”选项的统计结果显示，54.5%男性和57.7%女性首选与自己家乡省份相同的人。</p><p>在选择外省人作为理想伴侣的人中，选择南方姑娘和选择北方男人的比例相对较高；地理位置偏远的新疆、西藏、青海、甘肃、宁夏、贵州、广西等省区的女性和男性，被选中的比例最低。</p><p>北京爷们儿成首选老公</p><p>除去同乡人的吸引，最想嫁的男人当中，北京爷们儿排在第一位，并列第一的还有以“小男人”著称的上海男，都有15.2%的女青年首选。</p><p>接下来受欢迎的依次是四川、黑龙江和辽宁男人。</p><p>如果将女青年分成普通女青年和文艺女青年。那么其中，普通女青年偏爱北京爷们儿，占14.8%，文艺女青年更爱上海老公，占13%。</p><p>娶妻偏好“麻辣味”</p><p>男人最想娶的外省女性是四川妹子，占13.6%。</p><p>接下来受欢迎的依次是浙江、江苏的姑娘。</p><p>同属“麻辣味”的重庆姑娘，排名第四，占8.9%；北京姑娘居第五。</p><p>网传旺夫的山东妹子只排到了第11位，占3.3%，竟未进入前十，其受欢迎程度与东北三省中的辽宁姑娘相当。</p><p>怎么过七夕</p><p>八成不满意</p><p>伴侣表现怎么样？</p><p>今天是七夕，此次调查结果显示，超过八成城市居民表示，如果有另一半会共享七夕节，超过选择过2月14日西方情人节75.9%的比例。</p><p>不过，在有共度七夕节经历的情侣或夫妻中，却有高达79.8%的受访者对另一半在往年七夕当天的表现不满意。</p><p>整日陪伴</p><p>最想要什么礼物？</p><p>零点调查发现，七夕情侣间最期待惊喜榜榜首的是“整天时间陪伴在一起”，占18.5%。分列二三位的七夕惊喜是：爱人下厨，占14.8%；一次旅行，占11.6%。</p><p>而最多的惊喜礼物是“亲自下厨”，占20.2%，其次有13.5%的人选择送“衣服/鞋/包”，送“手工礼物”的占11.6%、“旅游”占10.7%。而最受期待的“在一起”并未得到人们的重视，仅有8.6%的人打算整天陪伴爱人。</p><p>文/记者王婷婷</p><p>中国情人节新人领证未见高峰</p><p>上午全市仅千对</p><p>七夕婚登门前“稀”</p><p>本报讯（记者陈斯夜线报道组实习生柯竞）今天是“中国情人节”七夕，恰逢8月13日谐音“不要散”，民政部门按照婚姻登记高峰做准备，却未见新人扎堆儿领证。</p><p>截至上午11点，全市婚登的新人约1000对，不及“2013.1.4”那天。</p><p>昨天下午，朝阳区民政局结婚登记处预计七夕会有500对新人前来领证，特意准备好千张证书，并为了加快新人领证的速度，提前给证书上加盖好婚姻登记专用章，盖好印章的证书堆成了小山。</p><p>今晨7点半，记者来到朝阳区婚姻登记处，已经有14对新人在门外分两队等待，右侧是已经在网上预约登记的，左侧则是未预约直接来的。</p><p>为了应对预计可能出现的登记高峰，工作人员提前一个小时开始办理。但此时在门口等待登记的新人，没有了往日排大队的强大阵容。</p><p>8点05分，第一对办好结婚证的闫先生和刘小姐微笑着携手而出，“我们大概提前半个月在网上预约的，今天早上五点多就来了。感觉特别快，不到2分钟就办完了”。</p><p>不到10分钟，所有排队等候的新人全部拿到了结婚证。</p><p>官方解析</p><p>对传统节日里领证不感冒？</p><p>朝阳区婚姻登记处负责人金先生表示，现在除了情人节、七夕节等传统的结婚登记吉日，5.20、9.9等谐音吉日也越来越受到年轻人的追捧。今年朝阳区在网上预约七夕当天登记结婚的新人有70多对，较往年有所减少。其主要原因是被其他好日子给分流了。</p><p>像上周的8月8日人就比较多，2013.1.4世纪结婚日，零点刚过就开始办理了，当日全市有6000对新人领证。</p>');
INSERT INTO `cms_info_clob` VALUES (36, 'text', '<p>根据中国社科院相关机构进行的“中国公民政治文化”问卷调查：90．03％被调查者对“作为中国人，我很自豪”持赞同态度；72．23％被调查者认同“中国传统文化对个人具有很大的影响”。该调查在全国10个省份进行，获得6159份有效样本。</p>');
INSERT INTO `cms_info_clob` VALUES (43, 'text', '<p style=\"text-align:center\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130319005332_lmwkqx.jpg\" /></p><p>近日&#xff0c;有明星经纪公司爆料&#xff0c;唱遍大小春晚的“农业重金属组合”凤凰传奇&#xff0c;出场费已经涨到了60万/场&#xff0c;若加上代言&#xff0c;2012年约有1亿进账。1亿这个数字也许略有夸张&#xff0c;但实际收入肯定也不会少。网友们一边感叹农业重金属的力量不可小觑&#xff0c;一边又开始琢磨这么多钱他们怎么分呢&#xff1f;凤凰传奇经纪人接受采访时表示&#xff0c;“玲花和曾毅早就签好协议&#xff0c;收入一人一半”&#xff0c;这样一来&#xff0c;网友又有疑问了--负责RAP部分的曾毅除了“嘿、吼、喔、哈、切克闹”就没别的词儿&#xff0c;难道也能分一半&#xff1f;这钱挣得也太轻松了吧&#xff1f;</p>[PageBreak][/PageBreak]<p><br /></p><p>其实在娱乐圈&#xff0c;像凤凰传奇这样的“人气搭档”并不少&#xff0c;有的情比金坚&#xff0c;有的钱字当头&#xff0c;有的好聚好散&#xff0c;也有的老死不再往来。为此&#xff0c;腾讯娱乐采访了多位圈中资深人士&#xff0c;为大家八一八人气搭档“分钱”那点事儿。<br /></p><p><br /></p>[PageBreak][/PageBreak]<p><br /></p><p>至于近几年大火的凤凰传奇&#xff0c;也是五五分成么&#xff1f;按网友的话说&#xff1a;“女的唱得声嘶力竭&#xff0c;男的出来切克闹几句就下去了&#xff0c;如果平分亿元年收入&#xff0c;会不会太不公平&#xff1f;”</p><p> 对此&#xff0c;凤凰传奇经纪公司总经理徐明朝回应称&#xff0c;“从演唱角度看&#xff0c;玲花确实是主唱&#xff0c;但是从组合角度看&#xff0c;这是一个整体&#xff0c;没有主次之分。早在成名之前&#xff0c;他俩就已签好合约&#xff0c;无论将来赚多少都对半分。”</p>');
INSERT INTO `cms_info_clob` VALUES (44, 'text', '<p style=\"text-align:center\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072104_ur3e8y.jpg\" /></p><p style=\"text-align:center\"> </p><p>8月12日&#xff0c;羽泉(微博)(微信号&#xff1a;yuquanweixin )携专辑《拾伍》在京举办粉丝同乐会。而活动第二天“七夕节”恰好是胡海泉(微博)的生日&#xff0c;歌迷们不仅为海泉准备了礼物还送上蛋糕&#xff0c;倍受感动的海泉感慨道<span style=\"font-family:monospace;font-size:medium;white-space:pre-wrap\"><span style=\"font-family:monospace;font-size:medium;white-space:pre-wrap\">&#xff1a;</span></span>“对于羽泉来说&#xff0c;能在各位的陪伴和支持下一起走过的岁月就是最好的礼物。”为了纪念出道15周年&#xff0c;羽泉还现场宣布将于9月7日和21日在泉州和深圳接力开唱&#xff0c;以实际行动回馈每一位歌迷的支持与喜爱。</p><p style=\"margin:0px 0px 29px;padding:0px;font-size:16px;line-height:28px;font-family:, &#39;arial&#39; , sans-serif;text-indent:2em\"><strong>聊high了 哥儿俩抢爆《拾伍》幕后花絮</strong></p><p>现场&#xff0c;羽泉在主持人大鹏的介绍下出场&#xff0c;与大家分享了重唱集《拾伍》制作过程中的心路历程。“老歌新翻&#xff0c;真不是一件容易的事儿&#xff0c;跟制作老师讨论编曲熬通宵变熊猫眼是常事儿”&#xff0c;陈羽凡(微博)调侃道。</p><p>由于专辑里大部分歌曲都是羽泉的老歌&#xff0c;而且几乎首首曾红极一时&#xff0c;所以此次回炉再造&#xff0c;不只是对羽泉&#xff0c;对其他幕后工作人员的压力也不小。机缘巧合下&#xff0c;羽泉在参赛《我是歌手》(观看)期间接触了来自日本的镰田老师&#xff0c;当时简短的交流&#xff0c;却奠定了此次专辑的合作。镰田几乎对羽泉组合进行了一次“大手术”&#xff0c;老歌里嗓音“温润如水”的海泉在这张专辑里嘶吼了起来&#xff0c;而“高亢激进”的羽凡反而展露了嗓音中更为细腻的一面。除镰田老师之外&#xff0c;担任乐手以及后期制作人员也都是日本乐坛数一数二的“老江湖”&#xff0c;很多人都是某一个曲风领域的绝对专家。在这些音乐人的合力之下&#xff0c;羽泉《拾伍》重唱集平衡了两个人的嗓音特点、平衡了原曲应有的风格和气质&#xff0c;所有的编曲也符合当下的音乐潮流&#xff0c;并且让大部分歌曲都焕然一新。而此次专辑是否算作翻新成功&#xff0c;得到了当天全体歌迷的一直认同。</p><p style=\"margin:0px 0px 29px;padding:0px;font-size:16px;line-height:28px;font-family:, &#39;arial&#39; , sans-serif;text-indent:2em\"><strong>玩疯了 与歌迷玩游戏不手软&#xff1a;“吃苦瓜身体好”</strong></p><p>当天同乐会上的重头戏是玩游戏&#xff0c;经过前期活动选拔出来的十五对歌迷与哥俩分别成军大PK。成军十五年来&#xff0c;羽泉两人间的默契和感情一直为外界津津乐道&#xff0c;而此次活动设置的游戏也都是需要队员间默契协作方能完成的。无论是“两人三足”还是以羽泉为环绕点的“比手画脚”再加上行进的很艰难的“终极战车”&#xff0c;现场哥俩带领歌迷们玩疯了&#xff0c;两人对战起来毫不手软&#xff0c;互相放话互相拆台一点不客气&#xff0c;甚至不惜互相拆台以便“打击”对方的气势&#xff0c;比赛火热的同时笑声不断&#xff0c;熟男变“活宝”&#xff0c;最终输的一方接受了全队吃苦瓜的惩罚&#xff0c;“在炎炎夏日&#xff0c;吃个清热解毒去火的绿色食物对身体好!”</p><p>羽泉承诺“不离不弃” 9月将于深圳开唱</p><p>活动第二天是七夕情人节&#xff0c;正好是羽泉成员胡海泉的生日。所以&#xff0c;当天参加同乐会的歌迷也精心准备了礼物和蛋糕带到现场&#xff0c;并在最后的环节突然献上&#xff0c;疯狂的同乐会顿时变成了温馨的庆生会&#xff0c;海泉惊喜的同时也为歌迷的贴心举动感动不已。“对于羽泉来说&#xff0c;能在各位的陪伴和支持下一起走过的岁月就是最好的礼物&#xff0c;现在我们已经顺利地走过了十五年&#xff0c;我们希望&#xff0c;未来的每一个十五年都可以像现在这样走过。”当天&#xff0c;羽泉面对在场的歌迷郑重承诺&#xff1a;“未来&#xff0c;不离不弃&#xff01;”</p><p>在许下了生日的愿望之后&#xff0c;羽泉也为歌迷们送上了更大的“回礼”——9月7日和21日&#xff0c;羽泉将在泉州和深圳接力开唱&#xff0c;以实际行动回馈每一位歌迷的支持与喜爱。“用音乐给各位带来正能量是我们最擅长并会一直做下去的事&#xff0c;下一个十五年&#xff0c;请各位瞧好吧&#xff01;”</p>');
INSERT INTO `cms_info_clob` VALUES (45, 'text', '<p style=\"text-align: left; text-indent: 2em;\"><span style=\"text-indent: 2em;\">“大家好，我是制片人杨幂。”一身干练的黄色风衣，一句霸气外露的自我介绍，升级当了制片人的杨幂果然显现出女强人的气质。昨日，由其担任监制的都市时尚偶像剧《微时代之恋》在沪举行开机发布会，杨幂带着她钦点的男主角余文乐，以及她花费一年选出的八位新人齐齐亮相。腾讯网娱乐中心总监常斌到场助阵，宣布该剧官网正式落户腾讯娱乐。</span><br/></p><p style=\"text-indent: 2em\">在接受腾讯娱乐独家专访时，“杨老板”坦言自己这个初出茅庐的制片，在男友刘恺威(<span class=\"infoMblog\">微博</span>)(<span class=\"infoMblog\">微信号：hawicklaw</span>) 身上学到了很多东西。虽然这次她没有找刘恺威当男一号，但为了给女友的制片处女作保驾护航，刘恺威还全程跟随剧组前往巴厘岛，在片场化身超级助理和替身，打杂跑腿兼打气，让杨幂甜在心里。</p><p style=\"text-indent: 2em\">虽说在事业上越做越大，杨幂却认为，自己离“事业有成”还很远。刘恺威年初已公开今年有迎娶杨幂的计划，她却不着急结婚，还想再谈谈恋爱。</p><p style=\"text-indent: 2em\"><strong>“事业有成”离我很远 今年不着急结婚</strong></p><p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：和林心如 (<span class=\"infoMblog\">微博</span>)、范冰冰(<span class=\"infoMblog\">微博</span>)等圈内“演而优则制”的女演员相比，你算是最年轻的一位女制片，为什么放着舒服的演员不当，要来挑制片重任？</span></p><p style=\"text-indent: 2em\">杨幂：两三年前我没想过自己会拍电影，结果拍了，一年前我从没想过自己会当制片，现在也做了，我感谢每一个不可能的可能性发生在我身上。正好有一个机会摆在我面前，有人问我要不要做，我想，那就做吧。很多东西，我不一定完全有能力去做，好在身边有很多人帮我一起做，大家一起把梦想完成好，这是一个梦想照进现实的过程，我们都在努力！</p><p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：有个情况挺有意思的，去年刘恺威担任制片人，邀请你做女主角的《盛夏晚晴天》去了法国拍，而你就去巴厘岛拍《微时代之恋》，是有心跟男友切磋还是别有苗头？</span></p><p style=\"text-indent: 2em\">杨幂：我没有攀比的心思，正因为有《盛夏晚晴天》的班底和经验，才让我这次担任《微时代之恋》的制片非常顺手。如果他制片人做得成功，我当然为他开心，但我也有我的工作要做。我们在工作上是互相支持鼓励，也是相对独立的。</p><p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：去年由刘恺威担任制片的《盛夏晚晴天》成绩喜人，他还筹备起第二部制片作品《一念向北》，你有向他取经吗？</span></p><p style=\"text-indent: 2em\">杨幂：恺威是个很棒的制片人，我从他上耳濡目染学到了不少当制片人的经验，比如如何跟工作人员沟通，学会观察潜在的问题，现场遇到突发事件如何处理等等。但如果我碰到难题，自己能解决的还是想自己解决，毕竟遇到同一件事情，在别人那儿行得通的方法，在你这儿却未必合适。</p><p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：为什么不找刘恺威主演，如果他演，一定愿意给你“感情价”的？</span></p><p style=\"text-indent: 2em\">杨幂：为什么大家不会认为，他来，我不会给他更高的片酬？（笑）他有他自己的工作，我也会选择合适的人演剧中的角色，这次没有适合他的，等下次有了，我就找他。其实，我们不一定所有的事情都要绑在一起，当然我当制作人，他也会给我鼓励，为我加油。</p><p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：身兼制片人和演员两职，应该挺辛苦吧，男友有没有来慰劳你？</span></p><p style=\"text-indent: 2em\">杨幂：探过班，之前在巴厘岛的时候他有来帮忙。慰劳啊？他有来帮我演了一个后辈，因为有一场戏，和我对戏的演员没有在巴厘岛，我本来要和空气演戏，正好他在，就拉来搭了一场戏，不过还是会把他的镜头剪掉。</p><p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：现在开起了工作室，还当了制片人，可说是“事业有成”了，想过结婚吗？</span></p><p style=\"text-indent: 2em\">杨幂：“事业有成”这个词离我还挺远的，我还有很多东西没做到。我自身还有很多需要学习和补充的地方，还有很多专业知识是我不懂、也没有意识到的。而且，事业有成与结婚没什么关系，我会完全把工作与感情分开。</p><p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：但是年初，刘恺威曾公开表示今年有迎娶你的计划，你今年没意向嫁他？</span></p><p style=\"text-indent: 2em\">杨幂：没有，我想再谈谈恋爱吧，到现在我们其实都没吵过架。我们都希望能再相处一下，等我再成熟一些，但我想如果有一天走到那一步，应该就是这个人了。因为现在大家相处很好，磨合得也越来越有信心。</p>');
INSERT INTO `cms_info_clob` VALUES (46, 'text', '<p>重庆&#xff0c;12日&#xff0c;《一夜惊喜》见面会。女神范冰冰(微博)(微信号&#xff1a;fbbstudio916 )携李治廷空降山城重庆&#xff0c;在重庆各大影院轮番宣传最新电影《一夜惊喜》。电影中范冰冰和李治廷上演了姐弟恋&#xff0c;见面会现场&#xff0c;范爷霸气地将李治廷抱起来秀“恩爱”。当媒体问及范爷七夕怎么过时&#xff0c;范冰冰表示明天将在北京和“那个他”度过&#xff0c;那个他还出在考验期。</p>');
INSERT INTO `cms_info_clob` VALUES (47, 'text', '<p style=\"text-indent: 2em\">在上周六武汉卓尔与北京国安的比赛中，主裁判王迪先后错判国安外援格隆禁区内假摔，接着又漏判给故意踢人的卓尔球员柯钊红牌。中国足协裁委会赛后确认，王迪两次判罚属严重错、漏判。王迪面临停哨3至6场的重罚。据悉，王迪通过抽签获本场比赛执法资格后，足协曾有人提议由经验丰富的老裁判取而代之，但提议未被采纳。抽签定哨能保证裁判选派公平，但由此引发的“昏、嫩哨”现象却屡禁不止，而除了加大失误裁判惩处力度外，中国足协似乎也找不到更好的办法。</p><p style=\"text-indent: 2em\"><strong>足协曾担心王迪成“定时炸弹”</strong></p><p style=\"text-indent: 2em\">新赛季中超开幕前，中国足协技术部、裁委会在香河基地完成了中超前6轮的裁判抽签仪式。按照内部工作流程，足协技术部在每轮联赛之前，都会请职业联赛部门对当轮裁判人选提意见。据了解，足协有关人士曾公开反对王迪执法武汉卓尔与北京国安的比赛，这是因为上赛季国安与辽足、2011赛季国安与深足比赛，王迪都曾漏判给国安点球。足协内部有人形容王迪，有可能成为比赛的“定时炸弹”，但这一建议最终被拒，其理由是，王迪是中国足协7名国际主裁中的一员，也是年轻裁判的佼佼者。而卓尔与国安的比赛是本轮一场重要比赛。一旦更换他，可能会在国内裁判界造成一些不良影响，同时也不利于年轻裁判的培养。然而提议的足协人士不幸言中。</p><p style=\"text-indent: 2em\"><strong>王迪受罚难阻“昏哨”继续现身</strong></p><p style=\"text-indent: 2em\">由于王迪错判造成了不小影响，裁委会昨天就形成了评议意见。一位足协人士透露，王迪判罚格隆禁区内假摔、漏判柯钊红牌都是严重的判罚失误，他将面临最低3 场、最高6场的处罚。王迪并非本赛季首位受内部处罚的裁判。执法中超首轮鲁能与阿尔滨比赛的前国际主裁陶然成、执法富力与辽足比赛的年轻主裁傅明、执法揭幕战恒大与申鑫的国际助理裁判穆宇新、国安与东亚比赛的助理裁判 王峰4 人，都因出现重大错、漏判被停赛3场。今年，裁委会对职业联赛裁判工作提出了新要求，管理制度及上岗考核，较往年也更为严格，国家级裁判张正平就因未通过体测而被直接降级。足协人士指出，“从前两轮中超执法情况看，年龄并不是裁判员犯错误的主要因素。我们感觉裁判错漏判，最大的问题还在于态度。如果准备不足、对执法工作的自律不够，王迪之后很可能还会出现其他&amp;lsquo;昏哨、嫩哨&amp;rsquo;。”</p><p style=\"text-indent: 2em\"><strong>抽签定哨 足协纠结 裁判埋怨</strong></p><p style=\"text-indent: 2em\">一位足协人士指出，王迪出现错漏判表面上看，是缘于裁判自身业务水平和临场应变能力不足，但其背后却反映出“抽签定哨”的呆板。有裁委会人士曾诉苦说，“假球、黑哨丑闻曝出后，中国足协在裁判选用上承受了巨大压力，抽签起码保证了裁判选用公平。”但从2010赛季起至今，类似王迪这样的“嫩哨”不止一个，同样在2010赛季被破格提拔为国际主裁的小张雷就因经不起实践考验，于第二年被取消国际执法资格；另一位争议“嫩哨”马宁也多次被裁委会临时取消中超执法机会。一系列事实证明，这些被中国足协寄予厚望的年轻裁判并未完全得到信任。同时，中国足协抽签后改派的举动反而引起裁判圈的不满。一位裁判专家曾这样抱怨，“安排抽签，却不按抽签结果派裁判，抽中的裁判不用，对裁判自身的心理打击很大。与其如此，还不如按国际惯例，完全指派裁判。”抽签定哨有无必要延续下去，中国足协也的确有必要深思熟虑一番。文/本报记者肖赧(<span class=\"infoMblog\">微博</span>)</p>');
INSERT INTO `cms_info_clob` VALUES (48, 'text', '<p>3月18日体育专电（记者林德韧）NBA(<span class=\"infoMblog  \">微博</span>)官方18日公布了最新一期的实力榜，拿下22连胜的迈阿密热火队当之无愧地继续排在榜首，圣安东尼奥马刺队和俄克拉荷马雷鸣队分居二、三位。</p><p>　　在击败多伦多猛龙队之后，热火队保住了自己的不败金身，东区冠军的位置已经基本锁定，现在剩下的唯一悬念就是热火队的连胜还能持续多久。</p><p>　　此前排名实力榜第三的马刺队在上一周展现了稳定的表现，与此同时也赢得了与俄克拉荷马雷鸣队之间的强强对话，排名超越雷鸣队排在了第二位。状态起起伏伏的雷鸣队下降至第三。</p><p>　　排名本榜单第四至第十位的队伍分别是：掘金队、灰熊队、快船队、步行者队、凯尔特人队、湖人队、网队。</p><p>　　上一周的亮点是湖人队，“紫金军团”在常规赛末段打出高水准，战绩提升至36胜12负，距离西区第七的休斯敦火箭队仅差半场，实力榜排名也从上一期的第十一上升至第九。</p><p>　　休斯敦火箭队在一场关键对决中大比分负于竞争对手金州勇士队，西区前八的位置不再牢靠，实力榜排名从第十下降至第十一。</p><p>　　排名本榜单第十一至第三十位的球队分别是：火箭、尼克斯、老鹰、公牛、小牛、勇士、雄鹿、爵士、奇才、开拓者、猛龙、骑士、森林狼、国王、太阳、76人、黄蜂、活塞、魔术、山猫。</p>');
INSERT INTO `cms_info_clob` VALUES (49, 'text', '<p style=\"text-align:center\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130319011912_nqvbjh.jpg\" /></p><p style=\"text-indent:2em\">在上周六中超联赛卓尔与国安比赛下半时&#xff0c;卓尔球员柯钊暴踢国安外援马季奇的举动在足球界引起了不小反响。中国足协裁判委员会今天也出具报告提请纪律委员会对柯钊追罚。据了解&#xff0c;纪委会很可能将柯钊的犯规定性为暴力行为。由于他及其俱乐部认错态度良好&#xff0c;中国足协将按照底线处罚柯钊&#xff0c;柯钊面临停赛2场、1万元左右的追罚。</p><p style=\"text-indent:2em\">电视慢动作显示&#xff0c;柯钊连续3次踢中马季奇&#xff0c;结果当值主裁王迪仅仅向柯钊出示了1张黄牌。虽然汉军最终饮恨主场&#xff0c;但是俱乐部上下深明大义&#xff0c;俱乐部代表及柯钊本人也都通过微博等渠道向外界及被踢的马季奇道歉。中国足协今天上午在总结上轮职业联赛时&#xff0c;重点提到了此事。据悉&#xff0c;裁判委员会的报告上写明&#xff0c;柯钊的行为属于暴力行为&#xff0c;理应被纪律委员会追加处罚。不过&#xff0c;足协内部有人认为&#xff0c;柯钊并非恶意伤人&#xff0c;只是因为本队比分落后&#xff0c;加之比赛时间所剩无几&#xff0c;他心情急躁&#xff0c;行为失控。</p><p style=\"text-indent:2em\">今晚有消息显示&#xff0c;柯钊将面临停赛4场、罚款2万的处罚&#xff0c;但是从中国足协传来消息显示&#xff0c;纪律委员会今天并没有开会具体商议此事。目前此事还停留在听取各方意见的过程中。但可以肯定的是&#xff0c;柯钊被追罚在所难免。一位足协官员表示&#xff0c;“鉴于柯钊认错态度不错&#xff0c;他也是初犯&#xff0c;协会不会加重处罚他&#xff0c;但这个行为依然性质很严重&#xff0c;被停赛2场的可能性最大。”至于格隆&#xff0c;虽然国安已经上诉&#xff0c;但纪律委员会依据国际惯例维持原判&#xff0c;红牌停赛不变。纪律委员会预计于明后两天内作出最终处罚结果。</p>');
INSERT INTO `cms_info_clob` VALUES (50, 'text', '<p style=\"text-align: center\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130319012259_khrjth.jpg\" style=\"width: 550px; height: 299px\"/></p><p>北京时间3月15日晚，欧足联在瑞士尼翁总部进行了本赛季欧冠(<span class=\"infoMblog\">微博</span> 专题) 1/4决赛对阵形势抽签。杀进八强的三支西甲(<span class=\"infoMblog\">微博</span> 专题) 球队中，皇马(<span class=\"infoMblog\">官方微博</span> 数据) 抽中土超劲旅加拉塔萨雷，巴萨(<span class=\"infoMblog \">官方微博</span> 数据) 遭遇法甲大鳄巴黎圣日耳曼(<span class=\"infoMblog\">微博</span> 数据) ，马拉加(<span class=\"infoMblog\">官方微博</span> 数据) 则要迎接德甲球队多特蒙德的挑战。以下是部分西班牙媒体评论。</p><p>《马卡报》：“皇马的抽签结果相对来说不错，4月3日，主帅穆里尼奥将在伯纳乌球场迎来他的几位老朋友，他们分别是德罗巴(<span class=\"infoMblog\">微博</span>)、斯内德(<span class=\"infoMblog\">微博</span>)和大阿尔滕托普，德罗巴是穆里尼奥执教切尔西(<span class=\"infoMblog   \">官方微博</span> 数据) 期间亲自召入的爱将，斯内德是穆里尼奥率领国际米兰夺取三冠王时的关键球员，大阿尔滕托普也曾在皇马效力，这几人帮助加拉塔萨雷战胜了沙尔克04晋级，但面对皇马，他们的运气恐怕就没这么好了，唯一要小心的是他们的前锋伊尔马兹，这位土耳其人目前和C罗(<span class=\"infoMblog\">微博</span> 数据) 并列欧冠最佳射手。”</p><p>《世界体育报》：“巴塞罗那与巴黎圣日耳曼的较量将是一次王者之争，淘汰赛看实力也要看运气，两支球队曾在1994-95赛季有过交手，当时输球的一方是巴塞罗那，不过在1996-97赛季的欧洲优胜者杯决赛中，巴塞罗那在荷兰鹿特丹战胜了对手捧起冠军奖杯，当时为巴塞罗那进球的是罗纳尔多。”</p>');
INSERT INTO `cms_info_clob` VALUES (52, 'text', '<p style=\"text-indent: 2em\">尚德电力昨日宣布，公司已经收到3%可转债托管人的通知，即2013年3月15日到期的可转债仍有5.41亿<a class=\"a-tips-Article-QQ\" href=\"http://finance.qq.com/money/forex/index.htm\" target=\"_blank\">美元</a>的未支付金额，已经违约并要求尽快付款。该违约事件同时还导致尚德对包括国际金融公司和一些国内银行在内的其他债权人的交叉违约。</p>\r\n<p style=\"text-indent: 2em\">尚德电力也因此成为了中国大陆首家出现公司债务违约的企业。</p>\r\n<p style=\"text-indent: 2em\">公司表示，将继续努力进行重组，提高运营成本效率，保持与现有客户和供应商的良好关系，寻找其他的资金来源，以满足运营和债务偿还资金需求。</p>\r\n<p style=\"text-indent: 2em\">尚德电力的违约将有望引发债券持有人对公司的诉讼。尚德电力在上周宣布获得了63%债券持有人的同意，将把债务偿付时间延长两个月至5月15日，以便管理层着手进行债务重组。部分债权人拒绝接受这个方案，并组成一个团体威胁发起诉讼。</p>\r\n<p style=\"text-indent: 2em\">同时，尚德的声明显示其对国内银行也已出现违约。截至2011年末，尚德银行融资高达17亿美元，国内银行为尚德最主要的债权人，其中<span onmouseover=\"ShowInfo(this,&quot;00939&quot;,&quot;100&quot;,&quot;-1&quot;,event);\">建设银行</span>、国家开发银行、<span onmouseover=\"ShowInfo(this,&quot;03988&quot;,&quot;100&quot;,&quot;-1&quot;,event);\">中国银行</span>、<span onmouseover=\"ShowInfo(this,&quot;01288&quot;,&quot;100&quot;,&quot;-1&quot;,event);\">农业银行</span>等几家大行在尚德贷款较多，且大部分为无抵押的信用贷款。</p>\r\n<p style=\"text-indent: 2em\">据经济参考报(<span class=\"infoMblog\">微博</span>)报道，目前，尚德电力破产已成定局，具体的破产重组方案已获江苏省政府批准，将在20日左右出台。</p>\r\n<p style=\"text-indent: 2em\">从目前的情况来看，&ldquo;国资介入&rdquo;无疑是目前<span onmouseover=\"ShowInfo(this,&quot;STP.N&quot;,&quot;200&quot;,&quot;-1&quot;,event);\">无锡尚德</span>的唯一活路&ldquo;对于尚德电力来说，最好的选择将是为某些资产申请破产保护，并让国有力量进入该企业从而保护特定利益。当然，尚德电力不会全面破产，它的品牌将会一直存在&rdquo;。中国可再生能源协会副理事长孟宪淦指出。</p>\r\n<p style=\"text-indent: 2em\">无锡市国联发展(集团)有限公司(简称&ldquo;无锡国联&rdquo;)将有望接受和主导之后的重组工作，以母公司或者旗下产业投资基金的形式全面接管无锡尚德。据了解，无锡国联成立于1999年5月8日，是无锡市人民政府出资设立并授予国有资产投资主体资格的国有独资企业集团。</p>\r\n<p style=\"text-indent: 2em\">尚德电力由施正荣于 2001年创立，2006年，公司赴美上市，施正荣借此成为中国新首富，并引发了光伏产业一场声势浩大的造富运动。自去年以来，尚德的形势急转直下，截至今年3月份，该公司的负债总额已达到35.82亿美元，资产负债率已高达81.8%，市值从上市之初的49.22亿美元跌到如今的1.49亿美元。</p>\r\n<p style=\"text-indent: 2em\">3月4日，尚德电力发出公告称，施正荣辞去公司董事长职务，由王珊接替公司董事长一职。但是第二天施正荣就发出声明称，董事会撤除其董事长职务是非法无效的，并表示自己以在尚德的股权向银行担保并获取贷款。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES (53, 'text', '<p>上世纪30年代&#xff0c;为利用美国技术建造新型军舰&#xff0c;苏联领导人特批从国库划拨50万美元的“行政经费”(在当时是一笔不小的数目)&#xff0c;供一家苏联外贸公司使用&#xff0c;以便打通美国高层关节。但这笔钱最终打了水漂&#xff0c;并连累不少人获罪&#xff0c;俄罗斯《权力》杂志日前刊文披露了这段秘闻。</p><p>　　1924年&#xff0c;苏联在美国注册成立了阿姆外贸集团公司&#xff0c;专门从事苏美贸易。当时美苏尚未正式建交&#xff0c;阿姆外贸集团公司可以说垄断了两国的贸易活动。到了1933年&#xff0c;在苏联的要求下&#xff0c;同时也是为了迎合热心开拓苏联市场的美国工商界人士&#xff0c;美国新总统罗斯福正式承认苏联的合法性。</p><p>　　当时&#xff0c;美国经济仍然萧条。美国商人都清楚&#xff0c;阿姆外贸集团公司的订单就是苏联政府的订单&#xff0c;意味着苏联政府的财政支持。但从另一个角度看&#xff0c;美国人认为&#xff0c;与这家公司签订合同就意味着与一个最敌对的国家开展贸易活动&#xff0c;所以特别警惕向该公司提供先进敏感的军事技术。鉴于此&#xff0c;莫斯科决定建立一个纯美国式的公司&#xff0c;找一个可靠的代理人。</p><p>　　被选中的人叫卡尔普&#xff0c;一个有俄国血统的美国人。卡尔普出生在沙俄时期一个贫穷的裁缝家庭&#xff0c;1911年移居美国后&#xff0c;做过各种杂工&#xff0c;后做起石油生意。上世纪20年代末经济危机爆发后&#xff0c;卡尔普陷入困境&#xff0c;1933年&#xff0c;他不得不把自己的几个加油站低价处理。随后&#xff0c;他决定去莫斯科&#xff0c;看能否找到“在俄罗斯赚美元”的机会。正是在莫斯科&#xff0c;他结识了苏联对外贸易部官员&#xff0c;并受委托开始帮助苏联采购先进设备。</p><p>　　但有不少人对卡尔普的能力表示怀疑。在1936年8月2日向时任苏联国防人民委员伏罗希洛夫的汇报中&#xff0c;苏联驻美国的军事参赞布尔津尤说&#xff1a;“这个人(指卡尔普)行为举止欠稳妥&#xff0c;令人担忧。譬如&#xff0c;他到任何一个地方都随身携带虽说不是官方正式文件但都涉及我国采购设备的清单&#xff0c;甚至公开给一些有业务联系的企业和转售商看这些文件。这样做严重违反保密条款规定。总之&#xff0c;他一有机会就向人喋喋不休地介绍我国需求情况。”这名参赞还提到卡尔普的特别背景苏联人民委员会主席莫洛托夫妻子热姆丘任娜的弟弟。</p><p>　　尽管有人打了“黑报告”&#xff0c;卡尔普仍得到上面的信任。在与阿姆外贸集团公司达成划分采购权限的协议后&#xff0c;他顺利地完成了一些采购任务。卡尔普一有机会就向人们讲他与莫洛托夫的关系&#xff0c;并散布从苏联高层那儿得到的一些重要采购信息&#xff0c;去找他的客商很快便络绎不绝。卡尔普一下子成了一个“神奇”的商人。</p><p>　　1937年5月14日&#xff0c;阿姆外贸集团公司董事会主席罗佐夫向莫斯科发去一份紧急密码文件。文件称&#xff1a;“卡尔普今日向我报告&#xff0c;美国政府已拟订向我出售配置16英寸火炮系统战列舰以及火炮中央控制器的文件。为获得这份文件他需要50万美元用以补偿相关人士。”莫斯科经过反复研究&#xff0c;决定做这个交易。</p><p>　　苏联方面先划拨了30万美元&#xff0c;后来又增补了20万。这笔汇款的收款人一开始定为美国民主党全国委员会的一个重要人物以及总统的助手。此外&#xff0c;苏联人还想将这笔款项交到美国各部委员会负责军工技术产品审批事项的官员手中。事实上&#xff0c;这笔巨额资金最终到了罗斯福总统的儿子手里&#xff0c;为的是通过他将这笔钱送到罗斯福手中。</p><p>　　没想到&#xff0c;卡尔普所办的事情被新闻界曝光了&#xff0c;连续几天美国各大新闻社、报刊都报道说苏联将在美国采购巨额军事装备&#xff0c;很多报刊不惜笔墨将该事件描绘成已经开始执行的订单。此外&#xff0c;在美国国务院办妥向苏联发运军事装备的批文后&#xff0c;涉及采购战列舰相关技术设备的麻烦越来越多。1937年11月3日&#xff0c;莫斯科接到报告说&#xff1a;“卡尔普拿到的批文对采购战列舰专用的涡轮根本不起作用。通用电气作为海军部供应发动机的主要商家&#xff0c;根本不想接受我们的货物订单&#xff0c;而且还必须得到海军部的正式批文&amp;hellip;&amp;hellip;造船厂在媒体的一阵旋风式报道后&#xff0c;也想从苏联贸易代表处拿到战列舰设计费用&amp;hellip;&amp;hellip;”</p><p>　　据档案记载&#xff0c;莫斯科决定还是让卡尔普去做说客&#xff0c;并由苏联商贸代表特罗扬诺夫斯基约见美国总统。1937年11月27日&#xff0c;特罗扬诺夫斯基见到了罗斯福。据他事后向莫洛托夫报告&#xff0c;他向罗斯福抱怨美国海军部对苏方订单态度冷淡&#xff0c;罗斯福则表示会给负责海军事务的长官下指示&#xff0c;总统还建议直接在美国建船坞&#xff0c;并称会按照美国海军现役军舰标准为苏联设计建造战舰专用装甲钢板。</p><p>　　事实上&#xff0c;这件事没有任何转机&#xff0c;在长时间的摩擦后&#xff0c;苏联人既没有得到驱逐舰&#xff0c;也没得到有关驱逐舰的任何技术设计图纸。经过苦口婆心的工作&#xff0c;美国人最后同意苏方带走有关建造战列舰的技术图纸。但苏联专家鉴定后表示&#xff0c;这些图纸完全不符合苏方的技术要求。</p><p>　　1938年&#xff0c;美国国会成立了一个专门调查反美思潮的机构&#xff0c;卡尔普引起该机构的高度关注。他后来供出使用50万美元的细节&#xff0c;他本人从中擅自扣留了 10万美元。卡尔普的姐姐热姆丘任娜也未能幸免&#xff0c;1939年被控与“人民公敌”合作。1940年&#xff0c;阿姆外贸集团公司董事会主席罗佐夫被捕&#xff0c;被指控从事间谍活动&#xff0c;不断向卡尔普拨付苏共政治局决定的境外行政支出款项。1945年年底&#xff0c;美苏同盟关系名存实亡&#xff0c;这起让苏联人恼火的采购事件也被认为是源头之一。</p>');
INSERT INTO `cms_info_clob` VALUES (54, 'text', '<p style=\"text-indent: 2em\">北京时间3月19日凌晨消息，华尔街日报中国实时报栏目周一文章称，两名经济学家指出，美国房地产市场崩溃之前曾有过的三个警示性信号已经在中国出现，这意味着中国只有非常有限的时间来摆脱困境。</p>\r\n<p style=\"text-indent: 2em\">文章指出，在野村证券于上周六公布的一份报告中，经济学家张智威和陈家瑶指出，物业价格的上涨、杠杆化的快速积累和潜在增长率的下滑都可能导致系统性的危机。</p>\r\n<p style=\"text-indent: 2em\">这份报告引用凯斯席勒房价指数指出，美国的房价在2001年到2006年之间飙升了84%。而作为野村证券经济学家的张智威和陈家瑶对中国的官方指数提出了质疑，并认为这组数据指出的2004年到2012年之间主要大城市房价113%的&ldquo;良性增长&rdquo;并不准确。他们认为，这个数据过于宽泛，包括了全国范围内老旧和低品质的住房。与之相比，近期一份考虑到这种质量差异的学术报告认为，仅2004年到2009年之间，中国房价的涨幅就已经是250%。</p>\r\n<p style=\"text-indent: 2em\">张智威和陈家瑶在报告中写道，&ldquo;中国政府显然已经认识到房地产行业的风险，在过去多年推出了一系列逐渐收紧政策以控制物业价格的措施。市场的模式是，在紧缩政策推出之初下降，然后反弹，这意味着风险并没有得到缓解。&rdquo;依赖出售土地作为主要收入来源的地方政府可能在房地产开发商因为市场崩溃而受打击时遭受同等的重创。这些问题会轻易地在银行系统找到突破口&mdash;&mdash;估算显示，中国银行业14.1%的流通贷款发放给了地方政府的融资平台，6.2%授予了房地产开发商。</p>\r\n<p style=\"text-indent: 2em\">野村证券认为，中国还是有时间来避免系统性的金融危机，只要政府不畏惧马上启动政策紧缩。不过这一做法的代价将是2013年经济增长前景的受压制&mdash;&mdash;虽然最终的实际增长还是有望在2013年上半年达到8.1%，在下半年维持7.3%。报告强调，早期的紧缩可能引发可以控制的债务违约情况。</p>\r\n<p style=\"text-indent: 2em\">报告指出，另一个结果是继续目前的宽松政策，实现超过8%的2013年经济增长，然后面对可能在2014年初就出现了市场崩溃。而这种崩溃将会很快蔓延到整个系统，迫使政府介入对银行和地方政府进行救援，可能需要出售公共资产来解决混乱局面。</p>\r\n<p style=\"text-indent: 2em\">报告认为，最终导致中国出现危机可能性增加的因素是潜在增长率的下降。这并不是一个可以轻松计算的数字，它代表了经济在不产生额外通货膨胀情况下可以实现的最大增长速度。即使是最乐观的分析师也同意野村证券的判断，包括适龄劳动人口数量的萎缩等等因素都造成了这个指标的下降。这使得中国决策者刺激经济增长的回旋余地相比过去大大减少。</p>\r\n<p style=\"text-indent: 2em\">张智威和陈家瑶指出，&ldquo;金融危机通常跟随技术革命和所谓的经济奇迹，因为投资者和决策者开始过高估计经济的潜在增长能力。决策者可能错误解读潜在增长的结构性放缓，将它视作周期性的现象，并试图使用扩张性政策来刺激增长，这实际上为过热和最终痛苦的调整埋下了种子。&rdquo;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES (73, 'text', '<p> </p><p style=\"text-align:center\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130813070348_9dcm1m.jpg\" /></p><p style=\"text-align:center\">杨钰莹</p><p>“女人不是因为美丽而可爱&#xff0c;是因为可爱而美丽。”俄罗斯文学家列夫&amp;middot;托尔斯泰在《战争与和平》中的这句话&#xff0c;用在杨钰莹身上正合适。白裙子&#xff0c;长头发&#xff0c;低声说&#xff0c;轻声笑&#xff0c;杨钰莹完全保留着少女的神态。10多年的岁月&#xff0c;惊涛骇浪的往事&#xff0c;在她身上仿佛没留下痕迹。</p><p>但交谈久了&#xff0c;还是不一样。你会发现&#xff0c;她从前接受采访时那些活泼的小动作&#xff0c;比如扬扬眉、撇撇嘴、甩甩头发&#xff0c;现在全都没有了。以前的她像一幅动态画&#xff0c;现在变成了一幅静物画。</p><p>在离开公众视线长达10年后&#xff0c;这次回归&#xff0c;她闯进了一个全新的领域&amp;mdash;&amp;mdash;主持人。公众和媒体对她的主持人形象充满好感&#xff0c;那些纠缠不放的负面消息也被人们淡忘了。</p><p>很难想象&#xff0c;她是怎么走过低谷和风浪的。她自己的解释是&#xff1a;“生活中不仅有幸福和快乐&#xff0c;更有悲伤和无奈&#xff0c;都要笑纳&#xff0c;因为它们都是生活的组成部分。”</p><p>“柔软”面对批评</p><p>2013年初&#xff0c;杨钰莹正筹备自己的演唱会&#xff0c;突然接到天津卫视新节目《天下无双》(在线观看)邀约&#xff1a;“来给我们做主持人吧。”对她而言&#xff0c;这是机会&#xff0c;也是挑战。考虑了将近一个月&#xff0c;反复看了这档节目的国外原版录像&#xff0c;终于&#xff0c;在节目录制的前一天&#xff0c;杨钰莹答应了。</p><p>谁都没有想到&#xff0c;这一次会反响这么好。第一期节目播出后&#xff0c;获得了全国收视率第四的好成绩。没多久&#xff0c;杨钰莹和主持界的老前辈赵忠祥同台&#xff0c;也没露怯。赵忠祥夸她“水平比央视有些女主持人都要好&#xff0c;可以推荐她去主持春晚了”。杨钰莹庆幸接了这个工作&#xff0c;“为自己打开了新的一扇窗”。</p><p>环球人物杂志&#xff1a;这3个月的节目&#xff0c;看得出你进步很大。有没有请老师来辅导发声、走台这些技巧&#xff1f;</p><p>杨钰莹&#xff1a;没有呀。我每每在电视上看到自己的不足&#xff0c;都会说&#xff1a;“哎呀&#xff01;怎么没有人教我一下呀&#xff01;”(笑)有时候发现自己在节目中又忘了说“硬口”(指主持人必须要讲的话)&#xff0c;就会特别着急。</p><p>环球人物杂志&#xff1a;现在给自己的主持工作打多少分&#xff1f;</p><p>杨钰莹&#xff1a;我还是多鼓励自己吧&#xff0c;打80分。不过&#xff0c;我给自己的态度打100分。任何时候&#xff0c;工作态度永远比工作能力更重要。</p><p>环球人物杂志&#xff1a;也有一些人批评你主持风格“太嗲”&#xff0c;“气质胜过技巧”。</p><p>杨钰莹&#xff1a;其实我这个人一点都不“嗲”&#xff0c;有时候还挺爷们儿的。至于技巧&#xff0c;我就是没有技巧&#xff0c;不过还算有点气质(笑)。</p><p>对于这些批评&#xff0c;我会非常柔软地去面对。我看到那些中肯的意见&#xff0c;会在心底说&#xff1a;“谢谢你&#xff0c;我会努力地改进。”</p><p>环球人物杂志&#xff1a;谁也没有想到你做主持人这么成功&#xff0c;以后还会唱歌吗&#xff1f;</p><p>杨钰莹&#xff1a;当然会。没有歌唱事业做基础&#xff0c;主持也就不必了。我首先还是歌手&#xff0c;而且说话和唱歌相比&#xff0c;我还是唱歌的水平更好。</p>');
INSERT INTO `cms_info_clob` VALUES (83, 'text', '<p>搜狗输入法作为国内汉字拼音输入法的领导者，搜狗输入法率先实现了输入法与互联网的结合。基于搜狗搜索引擎技术，对中文词库有突破性发展，开创了新一代中文输入法。即时高效地更新热门词库，大幅提升了输入效率，让输入速度产生了质的飞跃。在词库的广度、词语的准确度上，搜狗输入法都在行业内遥遥领先。</p>');
INSERT INTO `cms_info_clob` VALUES (93, 'text', '<p><span style=\"line-height: 22px; font-family: tahoma, Arial, 宋体, 微软雅黑; color: rgb(0,0,0)\">免费的即时聊天软件，给上网带来更多沟通乐趣。腾讯QQ2013年度皮肤呈现视觉盛宴，皮肤编辑器实现个性化面板创意；QQ应用盒子全新呈现，丰富应用满足多彩生活；QQ短信首度面世，畅享无处不在的沟通体验；炫彩字体，炫出聊天个性与风采；QQ支持自定义标签，标签顺序随心换。提示：如果您正在运行着腾讯QQ或者TM ,请退出后再进行一键安装。</span></p>');
INSERT INTO `cms_info_clob` VALUES (95, 'packingList', '');
INSERT INTO `cms_info_clob` VALUES (95, 'introduce', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img data-lazyload=\"done\" alt=\"\" id=\"a5693828a3a04b0d877ddd460bf53d88\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1747/1/1374760492/293014/1a379bbe/55e40ff2Neebb04f7.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img data-lazyload=\"done\" alt=\"\" id=\"c4d51a6689164e3dbadd563a223786ea\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1858/144/732419751/380880/dbbf7cc6/56278603N2a5330c0.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/>&nbsp;</p><p style=\"text-align: center;\"><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"2342f7f158c142cd9e728845d838bf84\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1711/224/1305174596/34549/c72fbea9/55e40ff1Nec82627c.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"4ed873071bd2447fbee4b3f3dab9b0be\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1822/167/1254639643/57081/66af1c0f/55e40ff1N3c0a09aa.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"698a373574754e0787bf298c8bce3f9d\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1720/207/1320749389/234778/eaeb703f/55e40ff3N0cfe09b2.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"4749569553af4adc82be75e63a1c6ed7\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1687/5/1334906465/209392/db60181b/55e40ff3N36ead1a6.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"d688008f69ce4387a2591c79469e2b64\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1660/31/1213006365/275884/a6aa7b5/55e40ff3N224dc718.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"2f4fafd11080484783550f9a5673420f\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1465/232/1193538325/301399/20f8d0d0/55e40ff4N9fc26363.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"ca84b367f26f4c6794df5af23d2b9be6\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1732/13/1297420571/216091/2f85644e/55e40ff4Nb9a5e3ea.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"435bd615683c4d018b704d26c58089d7\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1750/222/1320035840/234013/8db26305/55e40ff5Nf4667e39.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"55168fff0dad484ba50410a6ae6ac5f6\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1585/237/1153174124/194654/3b521bc6/55e40ff7N5b7596d8.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"bbd83d4dce5e48958b91d21de7b0c5a4\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1765/301/1220883678/196958/5f371155/55e40ff7N6903fdd9.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"0decaaaebeec4c138ecc2d50530f44e2\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1738/203/1304148672/274054/f87b8cc/55e40ff8N5402be3c.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img data-lazyload=\"done\" alt=\"\" id=\"86a8241acd714509a99918ba5703f35f\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1807/210/1267058754/256679/a1af9431/55e40ff8N3a22f7b9.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img data-lazyload=\"done\" alt=\"\" id=\"096c49821acd4d7ea02f7ba2eb3f1832\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1753/207/1299312810/232077/62834e48/55e40ff9N0bb2c530.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/>&nbsp;</p><p><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"text-align: center;\"><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"29f69787a7a74e6abcae802ec87d26f0\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1852/171/735451624/7840/45313c1a/56278603N7446cf7b.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"ca9ccdb796ab4665bdb14c5f7f710fb9\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2458/148/751567036/325430/4ec242af/56278604Naca09f59.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"344c14a0f0f64c6f866c4dc52e0bce7d\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2449/146/748205277/295252/c1d21f3a/56278604Ne074cb4f.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"c1ceec90bfb041439e9bd736c3316ef9\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2263/179/745449634/396704/3750b068/56278605N2e158391.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"41b48f853bbe473393139040f8838a09\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1867/150/765158623/367775/8b533886/56278605N89257074.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"aa4e3b7f266448869e6feeb38140b4ab\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2296/170/750507266/235562/b6c5ccc0/56278606Na7a4cbad.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"78a7a46230824f72a72f8c6525ecf8ec\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1777/211/2145478187/223967/f1ff1788/56278606Need11bcd.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"7fcd519bada54993967e1e57a724aae8\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1831/38/2151532147/347324/ef960c42/56278606N0bd39ccb.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"295a226bba7a4de9ae0297180f7f097e\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1786/184/2070965537/333458/64135c8c/56278607N7dd7ae04.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"ee4a4d01f82740c98cb693859738bb98\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1987/146/763521873/421265/2ecc8c47/56278607N6cbfed78.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"1f3d639ce86f4463bd8b71116a99c9f9\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1972/141/744585713/415267/4413905a/56278608Na56c31f9.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"a974062f93ad4addbfc9b71a9026373e\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1759/72/2164854068/7956/4fbf8627/56278608N146a1e9b.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"bab4caac25464ed4b413fd024097b07b\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2152/145/739094594/269195/434e09f1/56278609N96b575ac.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"5900dc230f7a4d7ca52788a766db9c67\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2407/154/756029562/339211/fdfbae06/56278609Nc60d0fd5.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"06149f9a31f74321b5010138008b4948\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1948/139/742183358/388001/5f46b68c/5627860aN26fb16ac.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"301fdba933ac4a1da7244085c15843db\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1996/137/746296342/432577/704c98c6/5627860aN82bd64e3.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"7ff6775a64a54e1db15ef24b75389485\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1954/141/720554933/309219/21691b0c/5627860bN4e7aa2f5.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"576c2503190e49ce86fc24d15f13d000\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1906/114/757577286/304887/a12ddbdf/5627860bN687a9a23.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"77f68ab2ce5b4c2cae466778fa6a7d2a\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2236/162/747953070/415370/3de34895/5627860cN2006c076.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"b56cff2df49640efa12b6b3bb403233a\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1891/149/747829170/8947/61d2d76/5627860cNe66cbf78.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"2c991bf43f8d4ba9926153694aac3f11\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2503/145/739347760/272866/efcc166a/5627860cNd1e69000.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"c0dfb488deb24ed9bd8656558986002c\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2191/178/739439528/325184/f03164c4/5627860dN75c90d6f.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"6e77bdef1c9746038b32857277b30eb8\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2221/148/762081824/377956/7b313620/5627860eN596aeb55.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"40b130bee2fd4d1cb5909e90ec79c60e\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2260/162/768897669/368479/4b717288/5627860eN9fe79ea0.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"a21d35cc33b0449697ba96e430c2f60f\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1819/74/2122480230/271938/cb205546/5627860fNf9b2860a.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><img data-lazyload=\"done\" alt=\"\" id=\"d60b927d97bc4fcea301d1023bd200c5\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2062/157/752585558/204739/54f26a01/5627860fN2bb50e64.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img data-lazyload=\"done\" alt=\"\" id=\"c8eb6bb03edd4dc19f1ed01491875484\r\n\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2284/172/761677196/383807/194ac595/5627860fNc35b502e.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (95, 'services', '');
INSERT INTO `cms_info_clob` VALUES (95, 'specification', '');
INSERT INTO `cms_info_clob` VALUES (94, 'introduce', '<p style=\"text-align: center;\"><img data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224141955_cvkonsqa3x.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height: 23px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/></p><p style=\"text-align: center;\"><img data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224142225_djhxuqntku.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p style=\"text-align: center;\"><img data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224142227_3r33u7ul8x.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p style=\"text-align: center;\"><img data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224142231_nysw7hss1x.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p style=\"text-align: center;\"><img data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224142235_sddhjwhpyg.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (94, 'packingList', '<p>显示器x1 底座x1 DVI信号线x1 说明书x1 保修卡x1 合格证x1</p>');
INSERT INTO `cms_info_clob` VALUES (94, 'services', '<p>本产品全国联保，享受三包服务，质保期为：三年质保<br/>如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br/>(注:如厂家在商品介绍中有售后保障的说明,则此商品按照厂家说明执行售后保障服务。) 售后服务电话：400-0099-998</p>');
INSERT INTO `cms_info_clob` VALUES (94, 'specification', '<table cellpadding=\"0\" cellspacing=\"1\" width=\"100%\" class=\"Ptable\"><tbody><tr class=\"firstRow\"><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">主体</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">品牌</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">惠科 HKC</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">型号</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">Q320</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">外观颜色</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">白色</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">颜色</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">银色</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">显示</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">面板类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">AMVA面板</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">面板尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">32英寸</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">宽屏</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">是</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">屏幕比例</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">16:9</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">最佳分辨率</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">2560x1440</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">响应时间</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">GTG 5ms</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">点距</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">0.277mm</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">色数</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">10.7亿色</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">亮度</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">250cd/m2</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">对比度</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">50000000：1（DCR）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">可视角度</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">H：176/V：176</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">LED背光</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">是</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">接口</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">VGA接口</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">有</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">DVI接口</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">有</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">HDMI接口</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">有</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">VGA</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1个</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">DVI</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1个</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">HDMI</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1个</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">规格</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">电源</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">内置</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">729x504x52mm 整机尺寸（不含包装）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">重量</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">8.07kg</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">是否支持壁挂</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">是</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">壁挂规格</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">100x100mm</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">底座</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">普通</td></tr></tbody></table><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (97, 'packingList', 'iPhone 6S Plus*1；具有线控功能和麦克风的 Apple EarPods*1；Lightning to USB 连接线*1；USB 电源适配器*1；资料');
INSERT INTO `cms_info_clob` VALUES (97, 'introduce', '<table width=\"750\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr class=\"firstRow\"><td><img data-lazyload=\"done\" width=\"750\" height=\"2113\" alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224122112_6ibijnem1j.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></td></tr></tbody></table><table width=\"750\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr class=\"firstRow\"><td><img data-lazyload=\"done\" width=\"750\" height=\"2001\" alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224122114_nf2xlg9cnm.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></td></tr></tbody></table><table width=\"750\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr class=\"firstRow\"><td><img data-lazyload=\"done\" width=\"750\" height=\"1824\" border=\"0\" usemap=\"#MapiPhone\" alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224122116_yejoosrut1.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><br/><br/></td></tr></tbody></table><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (97, 'services', '本产品全国联保，享受三包服务，质保期为：一年质保<br/>如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br/>(注:如厂家在商品介绍中有售后保障的说明,则此商品按照厂家说明执行售后保障服务。) 您可以查询本品牌在各地售后服务中心的联系方式，请点击这儿查询......<br/><br/>品牌官方网站：http://www.apple.com.cn/<br/>售后服务电话：4006668800');
INSERT INTO `cms_info_clob` VALUES (97, 'specification', '<table cellpadding=\"0\" cellspacing=\"1\" width=\"100%\" class=\"Ptable\"><tbody><tr class=\"firstRow\"><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">主体</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">品牌</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">Apple</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">型号</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">iPhone 6S Plus</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">颜色</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">玫瑰金色</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">上市年份</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">2015年</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">上市月份</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">9月</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">输入方式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">触控</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">智能机</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">是</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">操作系统</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">苹果（IOS）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">操作系统版本</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">iOS</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">CPU品牌</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">苹果</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">CPU说明</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">64 位架构的 A9 芯片，嵌入式 M9 运动协处理器</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">运营商标志或内容</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">无</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">网络</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">4G网络制式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">移动4G(TD-LTE)/联通4G(FDD-LTE)/电信4G(FDD-LTE)</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">3G网络制式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">移动3G(TD-SCDMA)/联通3G(WCDMA)/电信3G（CDMA2000）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">2G网络制式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">移动2G/联通2G(GSM)/电信2G(CDMA)</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">网络频率</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">FDD-LTE (频段 1, 2, 3, 4, 5, 7, 8, 12, 13, 17, 18, 19, 20, 25, 26, 27, 28, 29)<br/>TD-LTE (频段 38, 39, 40, 41)<br/>TD-SCDMA 1900 (F), 2000 (A)<br/>CDMA EV-DO Rev. A (800, 1700/2100, 1900, 2100 MHz)<br/>UMTS(WCDMA)/HSPA+/DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)<br/>GSM/EDGE (850, 900, 1800, 1900 MHz)</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">存储</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">机身内存</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">64GB ROM</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">储存卡类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">不支持</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">显示</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">屏幕尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">5.5英寸</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">触摸屏</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">具备 3D Touch 技术的 Retina HD 显示屏<br/>1300：1 对比度 (标准)<br/>500 cd/m2 最大亮度 (标准)<br/>全 sRGB 标准<br/>支持广阔视角的双域像素<br/>正面采用防油渍防指纹涂层<br/>支持多种语言文字同时显示<br/>放大显示<br/>便捷访问功能</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">分辨率</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1920 x 1080</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">PPI</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">401</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">感应器</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">GPS模块</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">重力感应</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">光线感应</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">距离感应</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">陀螺仪</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">摄像功能</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">后置摄像头</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1200万像素</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">前置摄像头</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">500万像素</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">闪光灯</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">True Tone 闪光灯</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">自动对焦</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">Focus Pixels 自动对焦</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">其他性能</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">全新 1200 万像素 iSight 摄像头，单个像素尺寸为 1.22 微米<br/>Live Photos<br/>Focus Pixels 自动对焦<br/>光学图像防抖功能 (仅限于 iPhone 6s Plus)<br/>True Tone 闪光灯<br/>全景模式 (高达 6300 万像素)<br/>自动 HDR 照片<br/>曝光控制<br/>连拍快照模式<br/>计时模式<br/>F/2.2 光圈<br/>五镜式镜头<br/>混合红外线滤镜<br/>背照式感光元件<br/>蓝宝石水晶镜头表面<br/>自动图像防抖功能<br/>优化的局部色调映射功能<br/>优化的降噪功能<br/>面部识别功能<br/>照片地理标记功能</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">娱乐功能</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">音乐播放</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">AAC (8 至 320 Kbps)、Protected AAC (来自 iTunes Store)、HE-AAC、MP3 (8 至 320 Kbps)、MP3 VBR、Audible (格式 2、3、4，Audible Enhanced Audio、AAX 与 AAX+)、Apple Lossless、AIFF 与 WAV</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">视频播放</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">H.264 视频，最高可达 1080p，60 fps；High Profile level 4.2 和 AAC-LC 音频，最高可达 160 Kbps，48kHz；立体声音频，文件格式为 .m4v、.mp4 和 .mov；MPEG-4 视频，最高可达 2.5 Mbps，640 x 480 像素，30 fps；Simple Profile 和 AAC-LC 音频，每声道最高可达 160 Kbps，48kHz，立体声音频，文件格式为 .m4v, .mp4 和 .mov；Motion JPEG (M-JPEG)，最高可达 35 Mbps，1280 x 720 像素，30 fps；ulaw 音频和 PCM 立体声音频，文件格式为 .avi</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">传输功能</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">Wi-Fi</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">蓝牙</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">NFC(近场通讯)</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">WIFI热点</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">其他</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">SIM卡尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">Nano SIM卡</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">电池类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">锂电池</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">电池容量（mAh）</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">理论待机时间长达16天</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">电池更换</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">不支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">理论通话时间（小时）</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">使用 3G 网络时长达 24 小时</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">理论待机时间（小时）</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">长达 16 天 (384 小时)</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">数据线</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">Lightning</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">耳机接口</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">3.5mm</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">机身尺寸（mm）</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">158.2*77.9*7.3</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">机身重量（g）</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">192</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">其他</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">* 要识别你的 iPhone 的型号，请参阅 http：//support.apple.com/kb/HT3939。4G LTE Advanced 和 4G LTE 功能适用于特定国家或地区的特定运营商。有关 4G LTE 支持的详情，请联系你的运营商并查看 www.apple.com/iphone/LTE/。<br/>1. 1GB = 10 亿字节； 内置主内存容量 16GB / 64GB/ 128GB (依所购机型而定)；格式化之后的实际容量可能较小。<br/>2. 实际尺寸和重量依配置和制造工艺的不同可能有所差异。<br/>3. FaceTime 视频通话要求通话双方使用支持 FaceTime 的设备和无线网络连接。能否通过蜂窝网络使用此功能，取决于运营商政策；可能需要支付数据费用。<br/>4. Siri 可能仅支持部分语言或地区，并且功能可能因地区而异。需使用互联网接入。可能需要支付蜂窝网络数据费用。<br/>5. 所有电池性能信息取决于网络设置和许多其他因素，实际结果可能有所不同。电池充电周期次数有限，最终可能需由 Apple 服务提供商更换。 电池使用时间和充电周期次数依设置和使用情况的不同而可能有所差异。详情请参阅 http：//www.apple.com/cn/batteries/ 和 http：//www.apple.com/cn/iphone/battery.html。<br/>6. 2013 年 9 月 1 日或之后初次激活且符合条件，并兼容 iOS 9 的设备，可从 App Store 免费下载 iMovie、Pages、Numbers 和 Keynote。2014 年 9 月 1 日或之后初次激活且符合条件，并兼容 iOS 9 的设备，可从 App Store 免费下载 GarageBand。请参阅 www.apple.com/cn/ios/whats-new/ 了解兼容 iOS 9 的设备。下载 app 需要使用 Apple ID。<br/>7. 推荐使用无线宽带网络；可能需要付费。<br/>8. 基于接收方和 app 的自定义建议功能不适用于中文 (简体、繁体) 和日语。</td></tr></tbody></table><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (98, 'packingList', '<p>索尼RX100 M2 ×1、NP-BX1锂电池?×1、电源适配器 ×1、Micro USB线 ×1、使用说明书 ×1、保修卡 ×1</p>');
INSERT INTO `cms_info_clob` VALUES (98, 'introduce', '<p style=\"text-align: center;\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224121248_wfr3bbl7c2.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height: 23px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/></p><p style=\"white-space: normal; text-align: center;\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224121623_6guvkxkei5.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p style=\"white-space: normal; text-align: center;\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224121626_4rsrj1sbhg.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p style=\"white-space: normal; text-align: center;\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224121627_2sxs6tcwqv.png\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p style=\"white-space: normal; text-align: center;\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224121635_ioeks5jqwj.png\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (98, 'services', '<p>本产品全国联保，享受三包服务，质保期为：一年质保 品牌官方网站：http://www.sony.com.cn/ 售后服务电话：400-810-9000</p>');
INSERT INTO `cms_info_clob` VALUES (98, 'specification', '<table cellpadding=\"0\" cellspacing=\"1\" width=\"100%\" class=\"Ptable\"><tbody><tr class=\"firstRow\"><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">基本参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">品牌</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">索尼 SONY</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">系列</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">R</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">颜色</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">黑色</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">数码相机类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">卡片机</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">光学变焦倍数</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">0-4倍</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">机身材质</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">合成金属</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">总像素</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1800万以上</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">有效像素</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1400-1599万</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">数码变焦倍数</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">更高</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">操作模式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">全自动</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">传感器类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">CMOS</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">传感器尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">其它</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">短片拍摄</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1920x1080</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">屏幕参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">液晶屏尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">3.0英寸</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">液晶屏比例</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">其它</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">触摸屏</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">不支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">旋转屏</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">镜头参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">镜头类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">伸缩式</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">变焦方式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">光学变焦,数码变焦</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">对焦方式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">自动对焦</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">性能参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">连拍</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">自拍</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">闪光灯参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">机身闪光灯</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">内置闪光灯</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">外接闪光灯</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">存储及连接参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">存储介质</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">SD卡；SDHC卡；SDXC卡</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">附件及电源参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">电池类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">锂电池</td></tr></tbody></table><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (99, 'text', '<p>&nbsp;</p><p>8月12日电 (记者 王欢)美国联邦公报最新公布的数据显示，2013年第二季度放弃美国国籍的人数再创新高，暴增至1131人，比去年同期的189人多出5倍。美国媒体称，美国政府为了增加税收应对拮据的财政状况，准备实施更严格的资产申报规定，使得放弃美国公民身份或绿卡的人数持续增长。</p><p>　　报告显示，2013年到6月为止的3个月里，旅居海外的美国人向使馆申请放弃国籍、同时也放弃了美国政府税单的人数攀升到1131人，虽然在超过600万旅居海外的美国人中只占少数，但这是国税局自1998年开始公布名单以来放弃美国国籍人数最多的一个季度。今年上半年，共有1810人放弃美国国籍，是2008年全年235人的近8倍。照此速度发展，2013年可能成为“告别美国”具有里程碑意义的一年。</p><p>　　据彭博社报道，在经济合作与发展组织中，唯有美国规定无论居住地是何处，美国公民都需向国家缴税。国会数据指出，美国每年因公民逃税造成的损失估计高达一亿美元。致力削减预算赤字的奥巴马政府，希望通过追查纳税人利用海外资产逃税的行为，增加国库收入。</p><p>　　美国2010年通过的《外国账户税收遵从法》(FATCA)一旦实施，资产申报要求将会更严格。按照FATCA的条规，外国金融机构必须向美国税务局提供美国纳税人的资料，包括他们持有的外国公司实质性所有者权益。瑞士和英国等许多主要银行国家，已经同意配合美国政府披露这些资料。未向美国税务局申报足够资料的银行客户，银行可从他们账户中扣减“与美国相关付款”款额的30%。</p><p>　　美国国会税收联合委员会根据这项税务法追税，未来10年估计可为政府增加87亿美元的税收。</p><p>　　“随着2014年7月《外国账户税收遵从法》执行日期的临近，越来越多的美国人开始意识到他们有义务向美国纳税申报。”在瑞士苏黎世工作的美国税务律师马修(Matthew Ledvina)表示，“一旦知道了这一点，他们就会决定放弃美国国籍。”</p><p>　　2012年，共有包括社会名流兼词曲作家丹尼斯&amp;middot;里奇(Denise Rich)以及“脸书”(Facebook)创始人之一爱德华多&amp;middot;萨韦林(Eduardo Saverin)在内的932名美国人放弃了美国国籍。萨韦林搬到了不征收资本利得税的新加坡；而作为亿万富翁前妻的里奇则将节省数百万美元的税费。</p>');
INSERT INTO `cms_info_clob` VALUES (100, 'text', '<p style=\"text-align:center;\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130813080255_pyeqx6.jpg\" style=\"width: 550px; height: 439px; \" /></p>\r\n<p>8月12日电 (记者 周兆军)英国和西班牙围绕直布罗陀的主权争议升级，12日，英国皇家海军的的一支快速反应部队前往地中海进行年度演习，包括&ldquo;光辉&rdquo;号航母在内的多艘军舰将前往直布罗陀海域。</p>\r\n<p>英国国防部宣布，包括&ldquo;光辉&rdquo;号航空母舰、两艘护卫舰和辅助舰只在内的10艘军舰前往地中海进行演习。英国国防部强调这次演习&ldquo;早有计划&rdquo;，属于&ldquo;例行部署&rdquo;，其发言人表示，直布罗陀是英国防卫的战略基地，因此英国海军全年都有军舰前往直布罗陀海域，这属于例行部署的一部分，派出军舰的数量和级别以及海军士兵人数都与以往一样，演习与直布罗陀争端没有关联。</p>\r\n<p>西班牙外交部表示，英方事先曾向西班牙提出申请军舰在直布罗陀海峡附近的罗塔(Rota)海军基地停靠，并获得西班牙的许可。不过，西班牙媒体认为，这次演习是英国的恐吓行为。</p>\r\n<p>在四个月的演习中，英国军舰还会前往葡萄牙、西班牙、土耳其、马耳他等国的港口进行演练，最终目的地是中东海湾地区。</p>\r\n<p>当天，英国首相府发言人表示，西班牙卫兵执行严格的安全检查，导致西班牙与直布罗陀边境交通堵塞，是&ldquo;有政治动机的、完全不适当的行为&rdquo;。卡梅伦首相对西班牙未能取消多余的边境检查感到失望，英国正考虑采取法律行动。</p>\r\n<p>西班牙方面也针锋相对，外交部发言人表示，西班牙正考虑将直布罗陀争议诉至联合国与海牙国际法庭等国际机构，并考虑与阿根廷结成统一阵线。阿根廷与英国在马尔维纳斯群岛(英国称福克兰群岛)存在主权争议。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES (126, 'text', '<p><!-- publish_helper name=\'原始正文\' p_id=\'1\' t_id=\'1\' d_id=\'29757426\' f_id=\'3\' --></p><p>　　每日经济新闻记者 黄俊玲 发自北京</p><p>　　千呼万唤，以房养老保险方案终于要成为现实。</p><p>　　《每日经济新闻》记者昨日(3月20日)获悉，为贯彻落实国务院《关于加快发展养老服务业的若干意见》有关要求，丰富养老保障方式的新途径，保监会决定开展老年人住房反向抵押养老保险试点。</p><p>　　同时，保监会近日还向各家人身保险公司下发了《关于开展老年人住房反向抵押养老保险试点的指导意见(征求意见稿)》(以下简称《征求意见稿》)，并拟在北京、上海、广州和武汉四地率先开展试点，对参与保险的人群和从事该业务的保险公司都有明确的要求。</p><p>　　<strong>从业险企注册资本不低于20亿/</strong></p><p>　　据记者了解，所谓&amp;ldquo;老年人住房反向抵押养老保险&amp;rdquo;，是一种将住房抵押与终身年金相结合的创新型商业养老保险业务，即拥有房屋完全产权的老年人，将其房屋抵押给保险公司，继续拥有房屋居住权，并按照约定条件领取养老金直至身故；老人身故后，保险公司获得抵押房屋处置权，处置所得将优先用于偿付养老保险相关费用。而这项业务的简称，就是通常说的以房养老。</p><p>　　保监会表示，当前我国缺少将社会存量资产转化为养老资源的有效手段。开展试点，盘活老年人房产，有利于丰富老年人的养老选择。据介绍，反向抵押养老保险属于商业保险范畴。开展试点，在不影响老年人既有养老福利的前提下，增加了一种新的养老方式，老年人可根据个人生活状况和养老需求自愿投保。</p><p>　　《征求意见稿》中明确表示，以房养老保险产品的投保人群应为60岁以上拥有房屋完全独立产权的老年人。同时，保险公司参与以房养老试点也是有要求的，即包括开业满5年，同时注册资本不低于20亿元，申请试点时上一年度末及最近季度末的偿付能力充足率不低于120%等。</p><p>　　根据保险公司对于投保人所抵押房屋增值的处理方式不同，试点产品将分为参与型反向抵押养老保险产品和非参与型反向抵押养老保险产品。其中，参与型产品是指保险公司可参与分享房屋增值收益，通过定期评估，对投保人所抵押房屋价值增长部分，依照合同约定在投保人和保险公司之间进行分配。而非参与型产品，则指保险公司不参与分享房屋增值收益，抵押房屋价值增长全部归属于投保人。</p><p>　　有不愿具名的险企人士向《每日经济新闻》记者透露，如果是参与型的话，假如以后房价上涨的话，老人也可以每个月多拿到一定的增值年金。如果是非参与型的话，每个月的领取金额将是固定的，在房产增值之后，其领取金额也不提高，而房产增值部分所带的金额就给到继承人了。非参与型从操作层面可能会更简单，更像一个非固定期限的贷款。对于具体的保险产品来说，各家保险公司可以根据这两个大的框架，来自主来设计产品。</p>[PageBreak][/PageBreak]<p>　　<strong>单笔合同初次贷款不超500万/</strong></p><p>　　此次《征求意见稿》对保险公司参与以房养老业务试点是有总量限制的。该《征求意见稿》要求试点期间，单个保险公司开展试点业务，接受抵押房屋的评估价值合计不得超过：4%&amp;times;上一年末总资产不超过200亿元的部分+0.2%&amp;times;上一年末总资产超过200亿元的部分。单个反向抵押养老保险合同的初次抵押贷款金额不得超过500万元。</p><p>　　若以一家保险公司的总资产为1000亿元为例，其试点以房养老接受抵押房屋的评估价值合计不得超过4%&amp;times;200亿元+0.2%&amp;times;800亿元=9.6亿元。事实上，寿险公司中总资产超过1000亿的公司并不多。</p><p>　　事实上，以房养老的开展作为一项新事务，对客户和保险公司而言，都面临挑战。</p><p>　　在客户层面，首先解决的是观念问题，反向抵押养老保险是一项新生事物，社会认可度和接受度有待提升，能否被老年人及其家人接受是一个重大挑战。为此，保监会要求保险公司在宣传该产品时候一定要如实介绍，明确提示消费者抵押房产的后续评估、管理和处置情况，不得夸大房产增值在提升养老金领取水平方面的作用；不得向不符合相关要求的客户推介业务。房产价值应当聘请具有一级资质房地产估价机构进行评估，费用由保险公司和消费者共同负担。</p><p>　　另外，对于该产品的销售，对保险营销员也有要求，需要持证上岗，经考核通过后才可取得反向抵押养老保险业务销售资格。而为了充分保护客户的&amp;ldquo;反悔权&amp;rdquo;，征求意见特别提出该产品的&amp;ldquo;犹豫期不得短于15个自然日&amp;rdquo;，比一般保险产品10天的犹豫期有所增加。</p><p>　　对于保险公司来说，也面临诸如房价涨跌，70年产权等诸多问题。上述险企人士认为，这个市场总量不是很大，这个业务也是特别复杂的，其面对的也是一些特殊人群。保险公司还需要考虑一些风险的问题，比如房价涨跌的风险等，总的来说，这个业务也不会做得特别大。保险公司这个业务量只要限制在一定的量，其风险还是可控的。</p><p>　　某险企的陈先生在与《每日经济新闻》记者交流时认为，这个业务面临很多风险，如70年产权的问题等等，预计保险公司的做法会比保守的。</p><p style=\"text-align: right;\">(原标题：以房养老保险有望4城市试点 保监会严控市场风险)</p>');
INSERT INTO `cms_info_clob` VALUES (127, 'text', '<p><!-- publish_helper name=\'原始正文\' p_id=\'1\' t_id=\'1\' d_id=\'29757495\' f_id=\'3\' --></p><p>　　依法严惩暴力伤害医务人员犯罪，加大外逃职务犯罪嫌疑人追捕力度</p><p>　　据新华社电 最高检20日召开会议对重大案件公开、打击涉医犯罪、追逃等工作作出要求和部署。会议要求各级检察机关要积极参与维护医疗秩序打击涉医违法犯罪专项行动，依法严惩暴力伤害医务人员犯罪。会议透露，检察机关将加强反腐败国际合作，加大对外逃职务犯罪嫌疑人的追捕力度，并充分运用违法所得没收程序，尽最大努力挽回经济损失。</p><p>　　<strong>逐步实现终结性法律文书统一上网</strong></p><p>　　在20日召开的会议上，最高人民检察院检察长曹建明表示，检察机关将进一步落实新闻发言人制度，及时公开重大案件办理等情况，提高执法办案透明度。</p><p>　　会议指出，检察机关将积极主动推进司法公开进程，构建开放、动态、透明的阳光检察新机制。完善办案信息查询系统，逐步实现检察机关终结性法律文书统一上网，让司法公正成为老百姓看得见、感受得到的公正。落实新闻发言人制度，及时公开重大案件办理等情况，提高执法办案透明度。</p><p>　　<strong>依法打击职业“医闹”寻衅滋事</strong></p><p>　　针对当前反映强烈的涉医犯罪问题，会议要求各级检察机关要积极参与维护医疗秩序打击涉医违法犯罪专项行动，依法严惩暴力伤害医务人员犯罪。</p><p>　　最高检强调，检察机关要主动加强与相关部门沟通协调，加强立案监督，依法严惩暴力伤害医务人员和患者的犯罪活动，依法惩治聚众打砸等扰乱医疗机构正常秩序涉嫌犯罪的行为，依法打击职业&amp;ldquo;医闹&amp;rdquo;故意寻衅滋事、敲诈勒索等犯罪，妥善办理医患纠纷引发的民行申诉案件，保障医疗机构和医护人员合法权益。</p><p>　　<strong>严查以贿赂等手段破坏选举犯罪“”</strong></p><p>　　会议透露，检察机关将加强反腐败国际合作，加大对外逃职务犯罪嫌疑人的追捕力度，并充分运用违法所得没收程序，尽最大努力挽回经济损失。</p><p>　　会议强调，检察机关要坚持有案必查、有腐必惩，让人民群众切实感受到检察机关反腐败的成效。要进一步加大对行贿犯罪的打击力度，进一步完善行贿犯罪档案查询系统，促进社会征信体系建设。严肃查办以贿赂等手段破坏选举、侵犯公民民主权利的犯罪。要更加重视查办渎职侵权犯罪，促进国家工作人员勤政廉政，推动法治政府建设。</p><p>　　<strong>加大对危害药品安全犯罪打击力度</strong></p><p>　　记者从会议上获悉，为加大对危害药品安全犯罪的打击力度，最高检正在会同有关部门研究制定办理危害药品安全刑事案件适用法律若干问题的司法解释，进一步明确入罪和量刑标准，加大处罚力度、提高违法成本。</p><p>　　最高检要求，各级检察机关既要履行批捕、起诉职能，坚持以“零容忍”的态度，依法打击食品药品生产和流通领域制假售假、非法经营等犯罪，依法打击违法偷排、非法采矿、盗伐滥伐林木等破坏生态环境犯罪，又要积极履行监督职能，依法督促行政执法机关移送涉嫌犯罪案件、监督公安机关及时立案侦查，注意发现相关监管、执法、司法人员索贿受贿、徇私枉法等职务犯罪线索，打掉背后的“保护伞”，推动相关部门认真履行监管职责，保障“舌尖上的安全”和“蓝天碧水”。</p><p style=\"text-align: right;\">(原标题：最高检：及时公开重大案件办理情况)</p>');
INSERT INTO `cms_info_clob` VALUES (128, 'text', '<p><!-- publish_helper name=\'原始正文\' p_id=\'1\' t_id=\'1\' d_id=\'29757583\' f_id=\'3\' --></p><p>　　新快报讯 近日，山东省曲阜市出台新规：所有市级领导干部一律取消秘书配备，其事务性活动由各办公室统一协调安排。其中，包括曲阜市委书记、市长在内的10位市级领导秘书配备取消。同时，曲阜市要求，领导外出不得讲求排场，让轻车简从成为常态。</p><p>　　今年3月初，曲阜市通过向群众、网民、人大代表、政协委员等各群体代表征求意见，梳理出了群众不满意的“四风”问题。其中，“脱离群众，‘官气’多、‘民气’少”、“坐车讲高档、进出讲排场”等被列入其中。曲阜市委书记李长胜说，领导干部配备秘书、公车等问题往往会成为群众关注的焦点，在一定程度上影响了干部整体形象，必须率先整改。</p><p>　　紧随其后，曲阜市委市政府果断将包括市委书记、市长在内的10位领导的秘书配备取消，秘书被安排回原岗位例行开展本职工作，如领导有工作需要可灵活安排。“由原来的一对一服务，变成了一对多服务。”曲阜市一相关负责人表示，按照规定，只有省部级以上领导才能够配备专职秘书，秘书的主要职责是协助领导开展日常工作，但因没有明确条文要求省部级以下领导不得配备专职秘书，所以一些县处级单位便跟风也为领导配备专职秘书，这种现象在全国2000多个县区中是广泛存在的。由于秘书队伍素质参差不齐，一些秘书打着领导旗号办私事的现象也出现过。</p><p>　　“目前，中央正在开展反‘四风’活动，曲阜取消领导秘书的根本目的也在于此。”曲阜市委书记李长胜说，取消专职秘书后，要求领导必须要身体力行，只有自己做得多了才能保证工作更好地开展。(据《齐鲁晚报》)</p><p style=\"text-align: right;\">(原标题：山东曲阜出台新规：市级领导不配秘书)</p>');
INSERT INTO `cms_info_clob` VALUES (129, 'introduce', '<p style=\"text-align: center;\"><img data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224122450_e4mc64ckbn.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height: 23px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/></p>');
INSERT INTO `cms_info_clob` VALUES (129, 'specification', '<table cellpadding=\"0\" cellspacing=\"1\" width=\"100%\" class=\"Ptable\"><tbody><tr class=\"firstRow\"><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">主体</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">系列</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">T 系列</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">型号</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">(20CKA00DCD)</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">颜色</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">黑色</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">平台</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">Intel</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">操作系统</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">操作系统</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">Windows 7 专业版</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">处理器</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">CPU类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">酷睿双核i7处理器</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">CPU速度</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">2.6GHz~3.2GHz</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">三级缓存</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">4M</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">核心</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">双核</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">内存</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">内存容量</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">8GB</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">内存类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">DDR3L-1600MHz</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">插槽数量</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">2 x SO-DIMM</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">硬盘</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">固态硬盘</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">256GB SSD</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">显卡</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">独立显卡</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">显示芯片</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">NVIDIA GeForce 940M</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">显存容量</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">独立1GB</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">双显卡</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">光驱</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">光驱类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">无光驱</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">显示器</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">屏幕规格</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">15.6英寸</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">显示比例</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">宽屏16：9</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">物理分辨率</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">2880x1620</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">屏幕类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">LED背光</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">通信</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">内置蓝牙</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">蓝牙4.0</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">局域网</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">10/100/1000Mbps</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">无线局域网</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">有</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">端口</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">音频端口</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">耳机、麦克风二合一接口</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">显示端口</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">VGA x 1/ mini DP x 1</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">RJ45</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1个</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">USB3.0</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">3个</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">音效系统</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">扬声器</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">内置扬声器</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">杜比音效</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">内置麦克风</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">有</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">输入设备</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">键盘</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">全尺寸键盘</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">触摸板</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">多点触控</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">指点杆</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">有</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">其它设备</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">网络摄像头</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">有</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">摄像头像素</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">720P</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">指纹识别</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">无</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">读卡器</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">四合一读卡器</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">电源</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">电池</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">其它</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">续航时间</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">2-3小时, 具体时间视使用环境而定</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">电源适配器</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">100-240V自适应交流电源适配器</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">机器规格</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">380mm*252mm*22mm</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">净重</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">2.04kg</td></tr></tbody></table><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (129, 'services', '<p>本产品全国联保，享受三包服务，质保期为：一年质保<br/>您可以查询本品牌在各地售后服务中心的联系方式，请点击这儿查询......<br/><br/>品牌官方网站：http://think.lenovo.com.cn<br/>售后服务电话：400-100-6000</p>');
INSERT INTO `cms_info_clob` VALUES (129, 'packingList', '<p>笔记本 × 1 电池 × 1 电源适配器 × 1 装箱清单 × 1 产品保修卡 × 1</p>');
INSERT INTO `cms_info_clob` VALUES (130, 'introduce', '<table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"210\" width=\"190\"><p><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"120\" border=\"0\" width=\"180\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120606_2d4f6ferhd.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td><td height=\"210\" width=\"560\" style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-style: dashed;\"><p>画质 - 新开发的全画幅CMOS图像感应器兼具高像素与低噪点</p><p oldoldoldoldoldclass=\"STYLE1\">●约2230万像素全画幅CMOS图像感应器的表现力&nbsp;<br/>●高性能DIGIC 5 数字影像处理器支持相机内多项复杂<br/>●图像处理&nbsp;<br/>●常用感光度高达ISO 25600，扩展时最高ISO 102400<br/>●高感光度也能实现清晰美丽的画质</p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"212\" width=\"190\"><p><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"120\" border=\"0\" width=\"180\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120606_jjei2p2dtf.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td><td height=\"212\" width=\"560\" style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-style: dashed;\"><p>对焦 - 61点自动对焦。高精度自动对焦系统实现强大的被摄体捕捉能力</p><p>●搭载先进的高性能自动对焦感应器和<br/>●人工智能伺服自动对焦III代&nbsp;<br/>●61点高密度网状阵列自动对焦感应器带来多样化的<br/>●自动对焦点选择模式&nbsp;<br/>●61个自动对焦点中41点采用十字型自动对焦感应器&nbsp;<br/>●搭载先进的人工智能伺服自动对焦III代的新自动对焦系统<br/></p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"210\" width=\"190\"><p><img alt=\"\" data-lazyload=\"done\" target=\"_blank\" height=\"120\" border=\"0\" width=\"180\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120606_55c58lblcc.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td><td height=\"210\" width=\"560\" style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-style: dashed;\"><p>智慧 - 先进的自动曝光系统带来高精度曝光控制</p><p>●iFCL智能综合测光系统与63区双层测光感应器带来<br/>●高精度曝光控制&nbsp;<br/>●搭载EOS场景分析系统实现进化的全自动模式&nbsp;<br/>●强化的图像处理功能实现画质的提高&nbsp;<br/>●镜头像差校正有效抑制像差的影响&nbsp;<br/></p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"210\" width=\"190\"><p><img alt=\"\" data-lazyload=\"done\" target=\"_blank\" height=\"120\" border=\"0\" width=\"180\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120606_tbge13q9vf.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td><td height=\"210\" width=\"560\" style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-style: dashed;\"><p>机械 - 追求耐久性与操作性的高性能机身</p><p>●重视高级感、质感、操作性的设计&nbsp;<br/>●在严酷环境也能发挥威力的高坚固性&nbsp;<br/>●兼顾耐久性和高反应的快门单元&nbsp;<br/>●对应CF卡和SD卡两种存储卡的双卡槽<br/></p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"210\" width=\"190\"><p><img alt=\"\" data-lazyload=\"done\" target=\"_blank\" height=\"120\" border=\"0\" width=\"180\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120606_ac2llnaiyl.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td><td height=\"210\" width=\"560\" style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-style: dashed;\"><p>操作 - 搭载视野率约100%光学取景器和约104万点的大型液晶监视器&nbsp;<br/></p><p>●根据拍摄设置变换显示内容的智能信息显示光学取景器&nbsp;<br/>●活用高精细背面液晶监视器的多功能实时显示拍摄&nbsp;<br/>●辅助拍摄后工作的图像回放、管理功能&nbsp;<br/></p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"210\" width=\"190\"><p><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"120\" border=\"0\" width=\"180\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120606_b81yiovgks.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td><td height=\"210\" width=\"560\" style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-style: dashed;\"><p>创意 - 多重曝光和HDR拍摄模式等激发创作欲望的多种功能&nbsp;<br/></p><p oldoldoldoldoldclass=\"STYLE2\">●实现戏剧性视觉效果的HDR（高动态范围）拍摄模式&nbsp;<br/>●拓展表现力的多重曝光功能&nbsp;<br/>●享受长宽比带来的视觉效果的多种长宽比功能&nbsp;<br/>●根据拍摄目的分别使用多种记录画质</p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"210\" width=\"190\"><p><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"120\" border=\"0\" width=\"180\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120606_7741q8r3dw.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td><td height=\"210\" width=\"560\" style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-style: dashed;\"><p>短片 - 全画幅CMOS图像感应器的卓越短片表现</p><p oldoldoldoldoldclass=\"STYLE2\">●不断进化的EOS数码单反相机系列短片拍摄功能&nbsp;<br/>●进化了短片拍摄功能的基本性能&nbsp;<br/>●满足专业影像摄影师要求的高操作性</p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"210\" width=\"190\"><p><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"120\" border=\"0\" width=\"180\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120606_jk231ucu95.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td><td height=\"210\" width=\"560\" style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-style: dashed;\"><p>扩展 - 搭配EOS 5D Mark III的高性能附件&nbsp;<br/></p><p oldoldoldoldoldclass=\"STYLE1\">●提高被摄体对应力拓展照片表现力的EOS 5D Mark III附件&nbsp;<br/>●多功能的附带软件支持影像表现&nbsp;<br/>●丰富的EF镜头阵容</p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td width=\"414\" style=\"word-break: break-all;\"><img data-lazyload=\"done\" alt=\"\" height=\"276\" width=\"414\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120502_wk0uc1bg6v.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></td><td width=\"336\"><img data-lazyload=\"done\" alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120502_8xll83918a.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td><br/></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td width=\"414\"><img data-lazyload=\"done\" alt=\"\" height=\"276\" width=\"414\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120502_cbplksbors.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></td><td width=\"336\"><img data-lazyload=\"done\" alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120503_8sx49nb22m.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td><br/></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td><img data-lazyload=\"done\" alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120504_o06hnjk2ye.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></td><td><img data-lazyload=\"done\" alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120504_wedy4a98f6.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td><br/></td></tr></tbody></table><p><br/></p><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td><img data-lazyload=\"done\" alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120504_2tw8yebpgu.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></td><td><img data-lazyload=\"done\" alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120505_v3f655iaca.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><br/><br/></td></tr></tbody></table><p><br/></p><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"270\" width=\"750\"><p style=\"text-align:center;\"><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"320\" border=\"0\" width=\"529\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120524_d48i4h2pom.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"270\" width=\"750\"><p style=\"text-align:center;\"><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"390\" border=\"0\" width=\"529\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120524_mvo0ppg2q9.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"270\" width=\"750\"><p style=\"text-align:center;\"><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"310\" border=\"0\" width=\"529\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120524_k9r8cbxfpk.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"270\" width=\"750\"><p style=\"text-align:center;\"><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"270\" border=\"0\" width=\"529\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120524_57i49iwbs8.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"233\" width=\"750\"><p style=\"text-align:center;\"><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"300\" border=\"0\" width=\"529\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120524_59nimw8ch5.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td></tr></tbody></table><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td height=\"233\" width=\"750\"><p style=\"text-align:center;\"><img data-lazyload=\"done\" target=\"_blank\" alt=\"\" height=\"290\" border=\"0\" width=\"529\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120524_u38i1rta5t.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p></td></tr></tbody></table><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (130, 'specification', '<table cellpadding=\"0\" cellspacing=\"1\" width=\"100%\" class=\"Ptable\"><tbody><tr class=\"firstRow\"><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">基本参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">品牌</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">佳能 Canon</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">型号</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">EOS 5D Mark III</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">相机类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">全画幅数码单反相机</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">总像素</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">约2340万</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">有效像素</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">约2230万像素</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">传感器类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">CMOS</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">传感器尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">约36x24mm</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">传感器描述</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">自动、手动、添加除尘数据</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">图像处理系统</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">DIGIC 5+</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">短片拍摄功能</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1920x1080 （30p/25p/24p）/IPB ：约235MB/分钟1920x1080 （30p/25p/24p）/ALL-I ：约685MB/分钟1280x720 （60p/50p）/IPB ：约205MB/分钟1280x720 （60p/50p）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">对焦系统</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">61点（最多41个十字型对焦点）* 可利用的自动对焦点和十字型对焦点数量根据镜头而不同。</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">屏幕参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">液晶屏尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">3.2英寸</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">液晶屏像素</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">约104万点</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">取景器类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">眼平五棱镜</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">液晶屏比例</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">3：2</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">屈光度条件及范围</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">约-3.0 - +1.0 m-1（dpt）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">取景器描述</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">具备景深预览</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">镜头参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">镜头类型</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">标准变焦镜头</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">镜头描述</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">EF 24-105mm f/4L IS USM镜头</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">焦距</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">24-105mm</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">滤镜直径</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">77mm</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">镜头特性</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">F4恒定光圈标准变焦L镜头。使用了1片超级超低色散(超级UD)镜片和3片非球面镜片，能有效控制畸变和色差。内置影像稳定器</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">套机镜头防抖</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">IS光学防抖</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">曝光控制</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">曝光模式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">程序自动曝光（场景智能自动、程序）、快门优先自动曝光、光圈优先自动曝光、手动曝光、B门曝光</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">曝光补偿</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">手动： 在±5级间以1/3或1/2级为单位调节自动包围曝光：在±3级间以1/3或1/2级为单位调节（可与手动曝光补偿组合使用）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">测光方式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">63区TTL全开光圈测光评价测光（与所有自动对焦点联动）局部测光（取景器中央约6.2%的面积）点测光（取景器中央约1.5%的面积）中央重点平均测光</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">ISO感光度</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">场景智能自动：在ISO 100 - 12800之间自动设置P、Tv、Av、M、B：自动ISO、ISO 100 - 25600（以1/3级或整级为单位）、或ISO感光度扩展到L（相当于ISO 50）、H1 （相当于ISO 51200）、H2 （相当于ISO 102400）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">白平衡模式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">可使用自动、预设（日光、阴影、阴天、钨丝灯、白色荧光灯、闪光灯）、用户自定义、色温设置 （约2500 - 10000K）白平衡矫正和白平衡包围曝光* 支持闪光色温信息传输</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">模式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">HDR拍摄模式</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">曝光特性</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">自动曝光锁自动：在使用评价测光的单次自动对焦模式下合焦时应用手动：通过自动曝光锁定按钮</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">性能参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">快门</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">1/8000秒至1/60秒（场景智能自动模式）、闪光同步速度为1/200秒*.使用广角镜头时，快门速度可能为1/60秒或更慢。1/8000至30秒、B门（总快门速度范围。可用范围随拍摄模式各异。）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">遥控功能</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">支持</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">连拍</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">单拍、高速连拍、低速连拍、静音单拍、静音连拍、</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">自拍</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">10秒自拍/遥控、2秒自拍/遥控</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">连拍速度</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">高速连拍：最高约6张/秒 低速连拍：最高约3张/秒 静音连拍：最高约3张/秒</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">闪光灯参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">闪光灯</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">外接闪光灯</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">外接闪光灯</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">EX系列闪光灯</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">闪光灯特性</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">E-TTL II自动闪光</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">存储及连接参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">存储介质</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">CF卡;SD卡</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">拍摄格式</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">照片格式：JPEG、RAW （14位佳能原创）、可以同时记录RAW+JPEG短片格式：MOV（MPEG-4 AVC/H.264记录压缩）音频格式：线性PCM</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">拍摄分辨率</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">L （大） ：约2210万像素（5760 x 3840）M （中） ：约980万像素（3840 x 2560）S1 （小1） ：约550万像素（2880 x 1920）</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">数据接口</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">音频/视频输出/数码端子、HDMI mini 输出端子、外接麦克风输入端子、耳机端子、遥控端子、无线遥控</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">电源参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">电池</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">LP-E6</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">电池续航时间</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">使用取景器拍摄：23℃/73 ℉时约950张、0℃/32 ℉时约850张</td></tr><tr><th class=\"tdTitle\" colspan=\"2\" style=\"text-align: center; padding-right: 5px; padding-left: 5px; width: 110px; background: rgb(245, 250, 254);\">外观参数</th></tr><tr><td><br/></td><td><br/></td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">颜色</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">黑色</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">尺寸</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">约152.0 x 116.4 x 76.4mm</td></tr><tr><td class=\"tdTitle\" style=\"padding: 2px 5px; text-align: right; background: rgb(245, 250, 254);\" width=\"110\">重量</td><td style=\"padding: 2px 5px; background: rgb(255, 255, 255);\">约950g（CIPA方针），约860g（仅机身）</td></tr></tbody></table><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (130, 'services', '本产品全国联保，享受三包服务，质保期为：一年质保<br/>如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br/>(注:如厂家在商品介绍中有售后保障的说明,则此商品按照厂家说明执行售后保障服务。) 您可以查询本品牌在各地售后服务中心的联系方式，请点击这儿查询......<br/><br/>品牌官方网站：http://www.canon.com.cn/<br/>售后服务电话：4006-222-666');
INSERT INTO `cms_info_clob` VALUES (130, 'packingList', 'A. EOS 5D Mark III机身 B. 锂电池 LP-E6 C. 电池充电器 LC-E6E（含电源线） D. USB接口连接线IFC-200U E. 立体声视频连接线 AVC-DC400ST F. 相机宽背带 EW-EOS5D MKIII G. 镜头软包 LP1219 H. EF 24-105mm f/4L IS USM I. 佳能镜头遮光罩 EW-83H ※另含相机使用说明书以及EOS数码解决方案光盘（EOS DIGITAL Solution Disk）');
INSERT INTO `cms_info_clob` VALUES (131, 'introduce', '<p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\" \" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145411_ju5gq1subq.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145411_05kq7q6cbj.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145412_n5cxlj98ig.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145414_k2b7ayx8em.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145415_j7sn66pou3.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145417_sc4buyr6ca.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145417_txwq6ubkbt.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145418_2gq4y0oyri.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145419_5fd5i611do.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145421_tswepj5937.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145422_6hgndl74vl.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145424_dwc8ypq9af.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145425_arbwtdencv.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145426_h7d2hwu918.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145428_c1hq3iyx57.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145429_l7sx80lnm7.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" data-lazyload=\"done\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145430_advuer2vsm.jpg\" class=\"\" style=\"border: 0px none; vertical-align: middle; margin: 0px; padding: 0px;\"/></p><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (131, 'specification', '');
INSERT INTO `cms_info_clob` VALUES (131, 'services', '');
INSERT INTO `cms_info_clob` VALUES (131, 'packingList', '');
INSERT INTO `cms_info_clob` VALUES (132, 'introduce', '<p style=\"text-align: center;\"><img alt=\"\" data-lazyload=\"done\" src=\"http://img30.360buyimg.com/popWaterMark/g10/M00/01/0B/rBEQWFEF724IAAAAAAC_NHzk3wkAAARLgCUu34AAL9M334.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; font-size: small;\"/>&nbsp; &nbsp;&nbsp;<br/></p><p style=\"text-align: center;\">&nbsp;</p><p style=\"text-align: center;\"><br/>&nbsp; &nbsp;&nbsp;<img alt=\"\" data-lazyload=\"done\" src=\"http://img30.360buyimg.com/popWaterMark/g10/M00/01/0B/rBEQWVEF72kIAAAAAADBUXye6RgAAARLgFA8Z8AAMFp177.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; font-size: small;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px;\"><img alt=\"\" data-lazyload=\"done\" src=\"http://img30.360buyimg.com/popWaterMark/g10/M00/01/0B/rBEQWVEF73oIAAAAAACaeqTcpZwAAARLgI2ZCYAAJqS705.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px;\"><br/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px;\"><br/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\"><br/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px;\"><br/><br/><img alt=\"\" data-lazyload=\"done\" src=\"http://img30.360buyimg.com/popWaterMark/g10/M00/01/0B/rBEQWFEF75cIAAAAAACWI-GDt74AAARLgNbxbEAAJY7509.jpg\" class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><br/></p><p style=\"text-align: center;\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2407/301/1685884117/845350/85e733ac/566914daN6bbab797.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t1993/108/1607721477/499530/70eda2fa/566914dbN63731dfd.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2131/161/1611434292/613388/529aeee3/566914dcNcbe318b0.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2152/2/1096247202/697732/4610f2ec/566914ddN5adfe66f.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2263/44/1733747474/273756/a883f440/56692a8fN7344d2d3.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2497/115/1664251927/388261/a099f777/56692a92N10dce920.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2458/326/1711675499/688548/7d6073b7/56692a96N95daaf8c.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2188/6/1619639445/716986/3229252c/56692a99N97b81a45.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t1849/117/1655443679/504348/a854f70b/56692a9cN73dee406.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2551/329/784608418/447977/ef122f49/56692b3cNc7b6745f.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2278/280/1583296790/615380/69da20e1/56692b40N8fa40ba0.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2257/9/1645545756/1004566/849bb109/56692b45Nca5f97c0.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (132, 'specification', '');
INSERT INTO `cms_info_clob` VALUES (132, 'services', '<p>1、购买米莱珠宝，即顺丰发货，全程保险承保！ 2、戒指尺寸不合适，我们免费为顾客修改，直到满意为止！商家承担快递费用！ 3、在收到商品无损坏的情况下，支持7天无条件退货，顾客承担退货费用！</p>');
INSERT INTO `cms_info_clob` VALUES (132, 'packingList', '<p>商品*1 珠宝盒*1 权威证书*1</p>');
INSERT INTO `cms_info_clob` VALUES (133, 'text', 'WPS Office是由金山软件股份有限公司自主研发的一款办公软件套装，可以实现办公软件最常用的文字、表格、演示等多种功能。具有内存占用低、运行速度快、体积小巧、强大插件平台支持、免费提供海量在线存储空间及文档模板、支持阅读和输出PDF文件、全面兼容微软Office97-2010格式（doc/docx/xls/xlsx/ppt/pptx等）独特优势。覆盖Windows、Linux、Android、iOS等多个平台。');
INSERT INTO `cms_info_clob` VALUES (134, 'text', '<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">好压压缩软件(HaoZip)是强大的压缩文件管理器，是完全免费的新一代压缩软件，相比其它压缩软件占用更少的系统资源用，有更好的兼容性，压缩率高！好压压缩软件(HaoZip)的功能包括强力压缩、分卷、加密、自解压模块、智能图片转换、智能媒体文件合并等功能。完美支持鼠标拖放及外壳扩展！</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153437_8fa5s6j2yl.jpg\" style=\"border: 0px; display: block;\"/></p><p class=\"introTit\" style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; clear: both; font-family: 宋体, arial; color: rgb(51, 51, 51); position: relative; white-space: normal; background: url(http://www.pc6.com/style/css/images/ddd.gif) 0% 50% repeat-x rgb(255, 255, 255);\"><span style=\"padding: 0px 10px 0px 0px; font-weight: bold; font-family: 微软雅黑, arial; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">功能介绍</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">支持rar5<br/>国内独家支持对rar5格式的解压</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153437_kmhqt3p61e.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">永久免费<br/>传统压缩软件的共享版、试用期、购买许可、修正版，我们忍够了！2345好压对所有个人用户和企业用户永久免费，请放心使用！<br/>兼容性好<br/>国内独家完美支持包括Win8、Win7、Vista、WinXP和Win2003在内的所有WINDOWS系统，并且比传统压缩软件支持更多的压缩格式。只需安装一款软件，即可轻松解压超过50种常见压缩格式。最新完美支持ZIPX和ALZ格式解压，能够压缩LZH格式。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153437_xhmt6mfcs2.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">虚拟光驱<br/>小巧精悍的交互界面，提供多种加载入口，操作简单。支持挂载ISO、MDS、MDF、CCD、CUE、IMG、UDF、URG等通用光盘镜像为虚拟光驱，方便娱乐和学习光盘的读取。<br/>丰富扩展<br/>首创无需解压即可查看包内图片功能，提供MD5校验、批量替换字符、批量修改文件名等多种实用小工具，满足您的各种需求！</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153437_nd4q2g7buh.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153437_nwfwu5nr22.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">好压压缩软件(HaoZip)提供了对ZIP、7Z和TAR文件的完整支持，能解压RAR、JAR、XPI、BZ2、BZIP2、TBZ2、TBZ、GZ、GZIP、TGZ、TPZ、LZMA、Z、TAZ、LZH、LZA、WIM、SWM、CPIO、CAB、ISO、ARJ、XAR、RPM、DEB、DMG、HFS等多达45种格式文件，这是同类软件无法比拟的！</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153438_dphuht0mc2.jpg\" style=\"border: 0px; display: block;\"/></p><p class=\"introTit\" style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; clear: both; font-family: 宋体, arial; color: rgb(51, 51, 51); position: relative; white-space: normal; background: url(http://www.pc6.com/style/css/images/ddd.gif) 0% 50% repeat-x rgb(255, 255, 255);\"><span style=\"padding: 0px 10px 0px 0px; font-weight: bold; font-family: 微软雅黑, arial; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">使用方法</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>1、什么是解压缩</strong><br/>解压缩就是将一个通过软件压缩的文档、文件等各种东西恢复到压缩之前的样子。<br/><strong>2.如何解压缩</strong><br/>方法一：通过右键菜单解压文件<br/>鼠标右键单击选中的一个或多个压缩文件，在弹出的右键菜单中，选择【解压文件…】，在新弹出的【解压文件】窗口中，设置好解压选项，点击【确定】即可进行解压操作。如果解压之后的文件保存在当前文件夹，也可通过选择【解压到当前文件夹】，实现快捷操作。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153438_9r6rvm3kv3.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">方法二：在2345好压软件界面解压文件<br/>打开2345好压，找到希望解压的压缩文件，点击选中后，点击软件主界面左上第二个【解压到】图标，并在新弹出的窗口中设置解压缩选项后，点击【确定】即可对文件进行解压。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153438_9e1d3gcy8e.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>3.测试压缩文件</strong><br/>压缩一个文件时，在【压缩文件】界面，点击【密码】标签，然后输入密码即可。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153438_uhok79n0nq.jpg\" style=\"border: 0px; display: block;\"/></p><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (135, 'text', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma, Simsun; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>PotPlayer播放器中文版</strong>是一款优秀的<strong>高清播放器</strong>，它的前身是著名的KMPlayer。它可以播放大多数主流的视频、音频文件，并不需要额外安装第三方解码器。它强大的定制性与扩展能力让它成为播放高清影片的不二之选。<br/><strong>PotPlayer播放器中文版</strong>是kmplayer的原作者姜龙喜先生进入daum公司后的新一代作品,目前正在全力开发中.由于采用delphi编译程序kmplayer的一些弊端，姜龙喜先生为改进播放器本身的一些性能而重新用vc++进行构架.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma, Simsun; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>PotPlayer绿色纯净版</strong>，由PotPlayer论坛版主”闻雷”专注维护，完善简体中文语言，精简Live相关文件、安装临时文件及一些无用的多余文件。</p><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (136, 'text', '<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><span style=\"color: rgb(255, 0, 0);\">Adobe Reader X 11.0.6 官方中文版</span></strong>下载，支持打开和使用 Adobe PDF 的工具，可查看、打印和管理 PDF。<span style=\"color: rgb(255, 0, 0);\">若已经安装过之前的版本，请先卸载后再安装此版本！</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">在 Reader 中打开 PDF 后，可以使用多种工具快速查找信息。<br/>如果您收到一个 PDF 表单，则可以在线填写并以电子方式提交。<br/>如果收到审阅 PDF 的邀请，则可使用注释和标记工具为其添加批注。<br/>使用 Reader 的多媒体工具可以播放 PDF 中的视频和音乐。<br/>如果 PDF 包含敏感信息，则可利用数字身份证对文档进行签名或验证。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152623_5kfuecb6p6.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(255, 0, 0);\">Adobe Reader XI新功能：<br/></span>新增了“评论”功能，所有用户都可以使用即时贴和高亮工具；<br/>移动设备也可以读取PDF文件了，Adobe面向Android、Windows Phone 7和黑莓Tablet OS均发布了免费的Reader X；<br/>采用了新的Protected Mode安全功能，保障用户浏览PDF文件的安全性；<br/>行业领先的安全性<br/>充分利用 Reader 中的受保护模式的安全性，它有助于保护计算机软件和数据免受恶意代码的侵扰。<br/>简化的用户界面<br/>更精确、高效地查看信息。选择阅读模式可在屏幕上显示更多内容，或选择双联模式查看跨页。在浏览器中使用打印、缩放和查找等键盘快捷键。</p><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (148, 'text', 'Mozilla Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器，使用Gecko引擎（非ie内核），支持多种操作系统如Windows、Mac和linux。');
INSERT INTO `cms_info_clob` VALUES (149, 'text', '<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">经过近9个月的研发，迅雷今天首度公开了7.9新版。迅雷7.9加快了启动速度，新增了一键立即下载、在开始前完成、批量任务分组、智能任务分类等功能，下面具体来看一下：</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152012_yw0xxdjobo.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　——加快启动速度<br/>　　启动速度慢的罪魁祸首是“频繁、大量进行硬盘读写”，迅雷7.9从基础设计上追求最少、最精明的进行硬盘读写。<br/>　　——确保运行顺畅<br/>　　迅雷7.9避免了使用插件，并且极力推行了模块之间的异步协作。<br/>　　——从源头避免“卡顿”<br/>　　迅雷7.9加入了自我性能分析工具。深入剖析迅雷启动、运行过程中每个步骤的性能表现。任何可能导致“卡顿”的问题发生时，都能从根源上锁定并解决问题。<br/>　　——一键立即下载<br/>　　在迅雷7.9中，以往的复杂操作不复存在，即便是通过手动输入下载地址的方式建立任务，迅雷7.9也能让你一键立即下载！</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152012_tbr5vluwwx.png\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　——在开始前完成<br/>　　迅雷7.9在你点击“立即下载”前，便已经开始下载，甚至下载完成。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152012_tltxdx81br.png\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　——批量任务分组<br/>　　迅雷7.9增加的“任务组”功能，可以将批量任务归纳为1个任务，即便再多批量任务，也能一目了然！</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152012_31499ev791.png\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　——智能任务分类<br/>　　在迅雷7.9中，你不再需要亲自将任务归类了，当下载完成，迅雷7.9会根据文件类型自动分类。<br/>　　——探索下载奥秘<br/>　　迅雷是如何进行下载的？下载时发生了什么？迅雷7.9内置的“任务详情页”，让你清楚看到下载时的细节和事件。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152012_mmijco2j3x.png\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　——全新风格的界面设计，别出心裁的操作动画。迅雷7.9还提供了多款的动态皮肤。</p><p class=\"introTit\" style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; clear: both; font-family: 宋体, arial; color: rgb(51, 51, 51); position: relative; white-space: normal; background: url(http://www.pc6.com/style/css/images/ddd.gif) 0% 50% repeat-x rgb(255, 255, 255);\"><span style=\"padding: 0px 10px 0px 0px; font-weight: bold; font-family: 微软雅黑, arial; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">使用方法</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>如何在浏览器中增加“使用迅雷下载”？</strong><br/>　　【解决方法】<br/>　　可以通过右上角的小工具---选择“浏览器支持”；</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152012_ici7ncfwcg.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/>　　根据实际使用的浏览器，启动对应浏览器的支持，然后重新打开浏览器即可。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152012_ayskx5pwel.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>如何设置迅雷7最大任务数？</strong><br/>　　打开迅雷7 =》系统设置=》任务管理里面进行设置即可。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152012_ifpto2mo4h.jpg\" style=\"border: 0px; display: block;\"/></p><p class=\"introTit\" style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; clear: both; font-family: 宋体, arial; color: rgb(51, 51, 51); position: relative; white-space: normal; background: url(http://www.pc6.com/style/css/images/ddd.gif) 0% 50% repeat-x rgb(255, 255, 255);\"><span style=\"padding: 0px 10px 0px 0px; font-weight: bold; font-family: 微软雅黑, arial; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">更新日志</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　功能变化：<br/>　　“系统设置”面板中“监视浏览器”选项改为可按浏览器单独设置<br/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img title=\"\" border=\"0\" hspace=\"0\" vspace=\"0\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152013_np95o5nsfs.png\" width=\"406\" height=\"57\" style=\"border: 0px; display: block; width: 406px; height: 57px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　细节改进：<br/>　　优化登录迅雷账号的响应速度<br/>　　当迅雷不处于窗口最前端时双击悬浮窗，迅雷将置于窗口最前端显示<br/>　　增加了任务组名称编辑框的宽度<br/>　　安装迅雷时，检测到迅雷正在运行的提示中，将“強”字改为“强”字（关爱处女座在行动！）<br/>　　部分文字按钮不再显示文字提示（关爱阅读障碍患者在行动！）<br/>　　增加“皮肤、主菜单”按钮的文字提示（关爱小学生在行动！）<br/>　　右下角的“右侧栏管理”按钮用鼠标右键点击也能弹出菜单了（关爱鼠标左键坏了的人在行动！）<br/>　　任务详情中的“注释”栏改为可编辑状态（关爱健忘症患者在行动！）<br/>　　任务详情中的各项参数文字已经对齐（关爱强迫症患者在行动！）<br/>　　迅雷账号信息面板在迅雷处于窗口化模式且左侧空间足够时，向左侧展开，不再遮挡任务分类区域<br/>　　迅雷账号信息面板的“成就”部分在没有“成就”时不展示<br/>　　“小工具”菜单中的“速度测试”改名为“宽带测速器”<br/>　　下载模式菜单中的“更多设置”更名为“网速保护设置”<br/>　　问题修正：<br/>　　修正开启主界面透明效果时，搜索栏显示异常的问题<br/>　　修正某些情况下，打开网页时会误触发下载请求的问题<br/>　　修正在BT任务文件列表中，展开或收起文件夹时，文件列表自动滚动至顶部的问题<br/>　　修正删除正在使用的代理时，代理设置无法同步生效的问题<br/>　　修正英文版Win10中IE浏览器的迅雷下载支持扩展名称显示乱码的问题<br/>　　修正某些情况下电驴任务名显示乱码的问题<br/>　　修正将“私人空间”任务拖动到“正在下载”时，无法正常拖动图标的问题</p><p class=\"introTit\" style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; clear: both; font-family: 宋体, arial; color: rgb(51, 51, 51); position: relative; white-space: normal; background: url(http://www.pc6.com/style/css/images/ddd.gif) 0% 50% repeat-x rgb(255, 255, 255);\"><span style=\"padding: 0px 10px 0px 0px; font-weight: bold; font-family: 微软雅黑, arial; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">安装载图</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152013_3xf33rrv37.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152013_hxkiongwl0.jpg\" style=\"border: 0px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; line-height: 24px; clear: both; color: rgb(102, 102, 102); font-family: 宋体, 微软雅黑, arial; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152013_pscittllvb.jpg\" style=\"border: 0px; display: block;\"/></p><p><br/></p>');
INSERT INTO `cms_info_clob` VALUES (150, 'text', '<p><strong>360浏览器</strong>是一款小巧、快速、安全、功能强大的多窗口浏览器，它是完全免费，没有任何功能限制的绿色软件，最全的恶意网址库，最新的云安全引擎，“安全红绿灯”全面拦截木马病毒网站;“搜索引擎保护”自动标识搜索结果页中的风险网站，网必通是360极速浏览器推出的新功能，解决个别海外科技类网站打不开的问题。当开启网必通功能后，当访问此类网站时，网必通会绕开封锁加速打开。我们希望网必通是送给广大程序员、大学生的礼物，希望大家通过它学习国外最新技术。</p><p><img alt=\"360极速浏览器2015下载\" src=\"http://www.3987.com/uploadfile/2014/1115/20141115085031526.jpg\" style=\"width: 500px; height: 337px;\"/></p><p><strong>360极速浏览器功能如下：</strong></p><p>1、基础最扎实：极速浏览器功能全面而又不繁杂;双核切换最智能(得益于海量用户和长期数据运营);稳定性最好(专门团队负责崩溃、卡死、用户反馈等)。而国内其他同行要不为了升核功能简陋，要不功能繁杂胡乱创新，要不稳定性极差。</p><p>2、升核动作快：这是我们的优良传统，难得的是在我们这么大体量的情况下(功能多、稳定性要求高)还能快速升核，就是让大象快跑!这个得益于专业、成熟的团队和一致的目标!</p><p>3、界面最精致：界面审美虽然仁者见仁，但从皮肤的精致程度来说，国内绝对数一数二，真正要做到好看、耐看!最关键的是我们换壁纸就可以实现效果华丽丽的整体换肤，这个经过长期调教优化，加上新标签页的配合，效果绝对一流!既能让浏览器千变万化彰显个性，又能保证易用性。这要归功于成熟的设计师和精益求精的工程师，在长期的配合下，他们知道好的浏览器界面应该是什么样的，避免了同行们要么很浮夸要么不够精致的问题。</p><p><strong>360极速浏览器 v8.1.0.374 更新：</strong></p><p>优化：</p><p>优化新建下载窗口出现时的动画效果。</p><p>优化广告过滤加载策略，提升启动速度。</p><p>优化flash加载策略，npflash不可用时使用ppflash。</p><p>修复：</p><p>解决QQ空间中动画显示异常的问题。</p><p>解决部分flash上不能输入中文的问题。</p>');
INSERT INTO `cms_info_clob` VALUES (180, 'text', '<p>　　【环球时报记者 赵倩】针对日前有报道称“中国中兴通讯股份有限公司在蒙古承建项目时涉嫌行贿，其管理人员已被蒙古国家反贪局逮捕”，中兴公司18日接受《环球时报》记者采访时予以否认。</p><p><br/></p><p>　　该报道称，本月13日，蒙古国家反贪局对中兴公司在当地的办事处、高管住处、私人汽车及车库进行搜查，将搜到的文件资料都带走，并将中兴高管羁押在监狱。</p><p><br/></p><p>　　针对此事，中兴公司18日给《环球时报》发来声明称，作为在中国深港两地上市的国际化通信企业，中兴通讯一直以来秉持守法经营的理念。中兴通讯在蒙古的业务开展，与其他国家一样，完全符合行业国际惯例要求和所在国法律的规定。目前，我们的业务遍及全球140 多个国家的500多个运营商，有着近30年良好的行业经历。</p><p><br/></p>');

-- ----------------------------
-- Table structure for cms_info_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_custom`;
CREATE TABLE `cms_info_custom`  (
  `f_info_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_cms_infocustom_info`(`f_info_id`) USING BTREE,
  CONSTRAINT `fk_cms_infocustom_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档自定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_custom
-- ----------------------------
INSERT INTO `cms_info_custom` VALUES (83, 'system', 'winxp,win7,win8,win2003');
INSERT INTO `cms_info_custom` VALUES (93, 'system', 'winxp,win7,win8,win2003');
INSERT INTO `cms_info_custom` VALUES (94, 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES (95, 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES (97, 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES (98, 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES (117, 'location', '南昌');
INSERT INTO `cms_info_custom` VALUES (117, 'salary', '面议');
INSERT INTO `cms_info_custom` VALUES (117, 'number', '5');
INSERT INTO `cms_info_custom` VALUES (117, 'company', '南昌蓝智科技有限公司');
INSERT INTO `cms_info_custom` VALUES (117, 'qualifications', '1.二年以上Java开发经验，Java基础知识扎实。\r\n2.熟悉JS，CSS，掌握常用的js框架，如JQuery，HTML。\r\n3.有企业级web应用开发经验，熟练掌握Web应用程序的开发调试技术。\r\n4.熟悉java开源框架，如spring，jpa，shiro等\r\n5.熟悉常用的设计模式、面向对象的分析和设计技术。\r\n6.学习能力强，沟通和表达能力良好，能迅速理解需求并给出解决方案。');
INSERT INTO `cms_info_custom` VALUES (117, 'responsibilities', '1.根据项目的需求，负责子模块或功能的设计与开发，以及后期的升级和维护工作。\r\n2.根据开发规范与流程独立完成模块的设计、编码、测试以及相关文档。');
INSERT INTO `cms_info_custom` VALUES (117, 'dept', '研发部');
INSERT INTO `cms_info_custom` VALUES (118, 'location', '南昌');
INSERT INTO `cms_info_custom` VALUES (118, 'salary', '面议');
INSERT INTO `cms_info_custom` VALUES (118, 'number', '4');
INSERT INTO `cms_info_custom` VALUES (118, 'company', '南昌蓝智科技有限公司');
INSERT INTO `cms_info_custom` VALUES (118, 'qualifications', '1、一年以上网页设计或UI设计经验；熟练使用photoshop、Dreamweaver、Flash网页设计软件，并能结合项目需求设计、制作与维护商业、企业网站；\r\n2、熟练掌握DIV+CSS；\r\n3、有扎实的美术功底、良好的创意思维和理解能力，能及时把握客户需求；\r\n4、能独立负责网站作品的设计及程序制作。\r\n5、善于沟通、有良好的团队合作精神和高度的责任感、能够承受压力、对设计充满激情。');
INSERT INTO `cms_info_custom` VALUES (118, 'responsibilities', '1、与客户进行充分沟通,进行网站视觉效果设计,并向客户进行提案取得客户认可；\r\n2、与客户建立良好关系；\r\n3、根据设计经理或组长的分配，完成其他设计任务。');
INSERT INTO `cms_info_custom` VALUES (118, 'dept', '设计部');
INSERT INTO `cms_info_custom` VALUES (129, 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES (129, 'marketPrice', '12000.00');
INSERT INTO `cms_info_custom` VALUES (129, 'price', '6249.00');
INSERT INTO `cms_info_custom` VALUES (94, 'marketPrice', '2999');
INSERT INTO `cms_info_custom` VALUES (94, 'price', '1999');
INSERT INTO `cms_info_custom` VALUES (98, 'marketPrice', '4500.00');
INSERT INTO `cms_info_custom` VALUES (98, 'price', '3899.00');
INSERT INTO `cms_info_custom` VALUES (130, 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES (130, 'marketPrice', '25880.00');
INSERT INTO `cms_info_custom` VALUES (130, 'price', '22599.00');
INSERT INTO `cms_info_custom` VALUES (97, 'marketPrice', '8888.00');
INSERT INTO `cms_info_custom` VALUES (97, 'price', '6666.00');
INSERT INTO `cms_info_custom` VALUES (95, 'marketPrice', '599.00');
INSERT INTO `cms_info_custom` VALUES (95, 'price', '179.00');
INSERT INTO `cms_info_custom` VALUES (131, 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES (131, 'marketPrice', '1499.00');
INSERT INTO `cms_info_custom` VALUES (131, 'price', '681.00 ');
INSERT INTO `cms_info_custom` VALUES (132, 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES (132, 'marketPrice', '25880.00');
INSERT INTO `cms_info_custom` VALUES (132, 'price', '13999.00');
INSERT INTO `cms_info_custom` VALUES (144, 'responsibilities', '1、负责安卓客户端软件的产品开发和维护； \r\n2、独立完成客户端软件需求的整理和软件设计、开发、调试、发布； \r\n3、根据系统中具体难点问题，有针对性的进行技术攻关； \r\n4、按照项目计划，撰写规范技术文档，按时提交高质量代码，完成开发任务； \r\n5、参与整体技术架构讨论，提供建设性意见。 ');
INSERT INTO `cms_info_custom` VALUES (144, 'number', '4');
INSERT INTO `cms_info_custom` VALUES (144, 'dept', '开发部');
INSERT INTO `cms_info_custom` VALUES (144, 'location', '南昌');
INSERT INTO `cms_info_custom` VALUES (144, 'salary', '面议');
INSERT INTO `cms_info_custom` VALUES (144, 'qualifications', '1、2年以上Android开发工作经验，大专或以上学历，计算机、通信或信息技术相关专业； \r\n2、了解SQLlite，熟悉基本的数据库操作； \r\n3、精通Java开发,对面向对象设计有深入的理解； \r\n4、精通Android开发平台的框架原理，能够熟练使用Android SDK，对Android应用结构有深刻的认识 ； \r\n5、熟悉各大Android智能手机平台的差异性，并有机型适配调优的经验； \r\n6、丰富的手机UI设计经验，熟悉网络编程、多线程、图形界面编程； \r\n7、有良好的代码习惯，要求结构清晰，命名规范，逻辑性强，代码冗余率低； \r\n8、已在安卓应用商店上发布应用或有安卓开发成功案例者优先； \r\n9、对技术热衷，勇于创新，工作认真负责，时间管理能力强，能承受较强工作压力，善于沟通协作，具备良好的团队合作精神。');
INSERT INTO `cms_info_custom` VALUES (144, 'company', '南昌蓝智科技有限公司');
INSERT INTO `cms_info_custom` VALUES (145, 'location', '南昌');
INSERT INTO `cms_info_custom` VALUES (145, 'qualifications', '1.本科以上学历，2年以上UI设计经验；\r\n2.具备良好的沟通能力，能清晰理解用户需求，熟悉网络用户审美趋向和界面使用习惯，并了解当前互联网发展趋势；\r\n3.具备良好的创意设计表现能力，能准确把握网站和软件界面的整体风格、页面布局、色彩等视觉表现，熟练掌握W3C相关互联网规范；\r\n4.能承受一定的工作强度和压力；\r\n5.具备了解Web2.0网站制作规范或有移动终端设计经验者优先。');
INSERT INTO `cms_info_custom` VALUES (145, 'responsibilities', '1.负责根据用户需求，与项目经理、产品经理共同定义网站和软件界面的整体风格；\r\n2.负责结合产品或项目需求，完成网站和软件界面主体设计，并完成banner、icon等设计；\r\n3.负责产品部门GUI设计工作，以及项目组实施GUI设计工作；\r\n4.协助开发人员完成UI产品实现；\r\n5.参与用户研究，参与设计体验，交互的呈现；\r\n6.参与设计流程的规范制定；');
INSERT INTO `cms_info_custom` VALUES (145, 'number', '3');
INSERT INTO `cms_info_custom` VALUES (145, 'dept', '设计部');
INSERT INTO `cms_info_custom` VALUES (145, 'salary', '面议');
INSERT INTO `cms_info_custom` VALUES (145, 'company', '南昌蓝智科技有限公司');
INSERT INTO `cms_info_custom` VALUES (146, 'location', '南昌');
INSERT INTO `cms_info_custom` VALUES (146, 'qualifications', '1、热爱软件测试工作，有一定的软件测试经验。\r\n2、熟悉测试的流程、步骤及规范，能够独立设计测试方案，编写测试计划和测试报告；\r\n3、分析问题所在并进行准确定位和验证，按照标准格式填写并提交Bug报告，跟踪并验证Bug，并确认问题得以解决；\r\n4、能够熟练使用测试需求、测试用例的管理工具及bug的管理工具；\r\n5、具备独立工作能力及团队合作精神，具有强烈的责任心和事业心，积极、主动、进取；\r\n6、良好的学习能力，较强的表达，性格积极主动具有良好的沟通能力（书面和口头）；\r\n7、流利的英文沟通能力优先\r\n8、有Andorid测试经验，有软件开发经验者优先考虑。');
INSERT INTO `cms_info_custom` VALUES (146, 'responsibilities', '1、根据需求和软件功能编写测试用例，编写测试计划\r\n2、执行软件测试，包括性能测试、功能测试和验收测试。\r\n3、Bug的提交和跟踪，编写测试报告。');
INSERT INTO `cms_info_custom` VALUES (146, 'number', '3');
INSERT INTO `cms_info_custom` VALUES (146, 'dept', '测试部');
INSERT INTO `cms_info_custom` VALUES (146, 'salary', '面议');
INSERT INTO `cms_info_custom` VALUES (146, 'company', '南昌蓝智科技有限公司');
INSERT INTO `cms_info_custom` VALUES (148, 'system', 'winxp,win7,win8,win2003');
INSERT INTO `cms_info_custom` VALUES (149, 'system', 'winxp,win7,win8,win2003');
INSERT INTO `cms_info_custom` VALUES (146, 'education', '大专');
INSERT INTO `cms_info_custom` VALUES (146, 'experience', '不限');
INSERT INTO `cms_info_custom` VALUES (145, 'education', '大专');
INSERT INTO `cms_info_custom` VALUES (145, 'experience', '1年以上');
INSERT INTO `cms_info_custom` VALUES (144, 'education', '本科');
INSERT INTO `cms_info_custom` VALUES (144, 'experience', '1年以上');
INSERT INTO `cms_info_custom` VALUES (118, 'education', '大专');
INSERT INTO `cms_info_custom` VALUES (118, 'experience', '1年以上');
INSERT INTO `cms_info_custom` VALUES (117, 'education', '本科');
INSERT INTO `cms_info_custom` VALUES (117, 'experience', '1年以上');
INSERT INTO `cms_info_custom` VALUES (146, 'jobtype', '全职');
INSERT INTO `cms_info_custom` VALUES (145, 'jobtype', '全职');
INSERT INTO `cms_info_custom` VALUES (144, 'jobtype', '全职');
INSERT INTO `cms_info_custom` VALUES (118, 'jobtype', '全职');
INSERT INTO `cms_info_custom` VALUES (117, 'jobtype', '全职');
INSERT INTO `cms_info_custom` VALUES (166, 'flashaddr', 'http://player.video.qiyi.com/b2fd6fdd4933034d1b306995452f1c0d/0/0/v_19rrn7jmi0.swf-albumId=333180100-tvId=333180100-isPurchase=0-cnId=13');
INSERT INTO `cms_info_custom` VALUES (168, 'flashaddr', 'http://player.video.qiyi.com/0d5f2406ef9b2b9347fdb2f3e80682c8/0/0/v_19rrn8kuv0.swf-albumId=330590800-tvId=330590800-isPurchase=2-cnId=1');
INSERT INTO `cms_info_custom` VALUES (170, 'flashaddr', 'http://player.video.qiyi.com/8993dc5f5d0aee1981107b4597b3d644/0/0/v_19rrn6nkuc.swf-albumId=202324801-tvId=333634600-isPurchase=0-cnId=4');
INSERT INTO `cms_info_custom` VALUES (167, 'flashaddr', 'http://player.video.qiyi.com/bc918848fe4a610e893d146ecb155657/0/0/v_19rrn6itu4.swf-albumId=333528800-tvId=333528800-isPurchase=0-cnId=6');
INSERT INTO `cms_info_custom` VALUES (151, 'flashaddr', 'http://player.video.qiyi.com/32af11f16ca09aad9fbe9c8e1cb4b428/0/0/v_19rrnbefw0.swf-albumId=310131100-tvId=310131100-isPurchase=0-cnId=13');
INSERT INTO `cms_info_custom` VALUES (169, 'flashaddr', 'http://player.video.qiyi.com/38cc04e1a4c14f9798051dfa7035fabf/0/0/v_19rrifwuck.swf-albumId=565556-tvId=700360-isPurchase=0-cnId=1');
INSERT INTO `cms_info_custom` VALUES (140, 'flashaddr', 'http://i7.imgs.letv.com/player/swfPlayer.swf?id=2234148&autoplay=0');
INSERT INTO `cms_info_custom` VALUES (137, 'flashaddr', 'http://player.youku.com/player.php/sid/XNjY2NDcxNDA4/v.swf');
INSERT INTO `cms_info_custom` VALUES (139, 'flashaddr', 'http://player.youku.com/player.php/sid/XNjIwMjMxNTI0/v.swf');
INSERT INTO `cms_info_custom` VALUES (138, 'flashaddr', 'http://player.youku.com/player.php/sid/XNjY4MTIxMTcy/v.swf');
INSERT INTO `cms_info_custom` VALUES (87, 'flashaddr', '');
INSERT INTO `cms_info_custom` VALUES (172, 'flashaddr', '');
INSERT INTO `cms_info_custom` VALUES (173, 'flashaddr', '');
INSERT INTO `cms_info_custom` VALUES (174, 'flashaddr', 'http://player.video.qiyi.com/7198e2513cc561c9e2f8a21e38856d8c/0/0/v_19rrn6478o.swf-albumId=202244001-tvId=334792900-isPurchase=0-cnId=2');
INSERT INTO `cms_info_custom` VALUES (150, 'license', '免费软件');
INSERT INTO `cms_info_custom` VALUES (150, 'system', 'winxp,win7,win8');
INSERT INTO `cms_info_custom` VALUES (150, 'star', '★★★★☆');
INSERT INTO `cms_info_custom` VALUES (150, 'language', '简体中文');
INSERT INTO `cms_info_custom` VALUES (150, 'type', '国产软件');
INSERT INTO `cms_info_custom` VALUES (149, 'license', '免费软件');
INSERT INTO `cms_info_custom` VALUES (149, 'star', '★★★★★');
INSERT INTO `cms_info_custom` VALUES (149, 'language', '简体中文');
INSERT INTO `cms_info_custom` VALUES (149, 'type', '国产软件');
INSERT INTO `cms_info_custom` VALUES (148, 'license', '免费软件');
INSERT INTO `cms_info_custom` VALUES (148, 'star', '★☆☆☆☆');
INSERT INTO `cms_info_custom` VALUES (148, 'language', '简体中文');
INSERT INTO `cms_info_custom` VALUES (148, 'type', '国产软件');
INSERT INTO `cms_info_custom` VALUES (136, 'license', '免费软件');
INSERT INTO `cms_info_custom` VALUES (136, 'star', '★★★☆☆');
INSERT INTO `cms_info_custom` VALUES (136, 'language', '简体中文');
INSERT INTO `cms_info_custom` VALUES (136, 'type', '国产软件');
INSERT INTO `cms_info_custom` VALUES (135, 'license', '免费软件');
INSERT INTO `cms_info_custom` VALUES (135, 'system', 'winxp,win7,win8');
INSERT INTO `cms_info_custom` VALUES (135, 'star', '★★★★☆');
INSERT INTO `cms_info_custom` VALUES (135, 'language', '简体中文');
INSERT INTO `cms_info_custom` VALUES (135, 'type', '国产软件');
INSERT INTO `cms_info_custom` VALUES (136, 'system', 'winxp,win7,win8');
INSERT INTO `cms_info_custom` VALUES (134, 'license', '免费软件');
INSERT INTO `cms_info_custom` VALUES (134, 'system', 'winxp,win7,win8');
INSERT INTO `cms_info_custom` VALUES (134, 'star', '★★★★★');
INSERT INTO `cms_info_custom` VALUES (134, 'language', '简体中文');
INSERT INTO `cms_info_custom` VALUES (134, 'type', '国产软件');
INSERT INTO `cms_info_custom` VALUES (133, 'license', '免费软件');
INSERT INTO `cms_info_custom` VALUES (133, 'system', 'winxp,win7,win8');
INSERT INTO `cms_info_custom` VALUES (133, 'star', '★★★★★');
INSERT INTO `cms_info_custom` VALUES (133, 'language', '简体中文');
INSERT INTO `cms_info_custom` VALUES (133, 'type', '国产软件');
INSERT INTO `cms_info_custom` VALUES (93, 'license', '免费软件');
INSERT INTO `cms_info_custom` VALUES (93, 'star', '★★★★★');
INSERT INTO `cms_info_custom` VALUES (93, 'language', '简体中文');
INSERT INTO `cms_info_custom` VALUES (93, 'type', '国产软件');
INSERT INTO `cms_info_custom` VALUES (83, 'license', '免费软件');
INSERT INTO `cms_info_custom` VALUES (83, 'star', '★★★☆☆');
INSERT INTO `cms_info_custom` VALUES (83, 'language', '简体中文');
INSERT INTO `cms_info_custom` VALUES (83, 'type', '国产软件');
INSERT INTO `cms_info_custom` VALUES (44, 'text_editor_type', 'ueditor');
INSERT INTO `cms_info_custom` VALUES (43, 'text_editor_type', 'ueditor');
INSERT INTO `cms_info_custom` VALUES (73, 'text_editor_type', 'ueditor');
INSERT INTO `cms_info_custom` VALUES (49, 'text_editor_type', 'ueditor');
INSERT INTO `cms_info_custom` VALUES (32, 'text_editor_type', 'ueditor');
INSERT INTO `cms_info_custom` VALUES (46, 'text_editor_type', 'ueditor');
INSERT INTO `cms_info_custom` VALUES (53, 'text_editor_type', 'ueditor');

-- ----------------------------
-- Table structure for cms_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_detail`;
CREATE TABLE `cms_info_detail`  (
  `f_info_id` int(11) NOT NULL,
  `f_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主标题',
  `f_html` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'HTML页面',
  `f_mobile_html` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机端HTML页面',
  `f_subtitle` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `f_full_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完整标题',
  `f_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转向链接',
  `f_is_new_window` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否在新窗口打开',
  `f_color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `f_is_strong` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否粗体',
  `f_is_em` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否斜体',
  `f_info_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档路径',
  `f_info_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档模板',
  `f_meta_description` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'meta描述',
  `f_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `f_source_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源url',
  `f_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `f_small_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图',
  `f_large_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大图',
  `f_video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频url',
  `f_video_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频名称',
  `f_video_length` bigint(20) NULL DEFAULT NULL COMMENT '视频长度',
  `f_video_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频时间',
  `f_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件url',
  `f_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `f_file_length` bigint(20) NULL DEFAULT NULL COMMENT '文件长度',
  `f_doc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文库url',
  `f_doc_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文库名称',
  `f_doc_length` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文库长度',
  `f_doc_pdf` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文库PDF',
  `f_doc_swf` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文库SWF',
  `f_is_weixin_mass` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否微信群发',
  `f_is_allow_comment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许评论',
  `f_step_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核步骤名称',
  PRIMARY KEY (`f_info_id`) USING BTREE,
  CONSTRAINT `fk_cms_infodetail_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档详细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_detail
-- ----------------------------
INSERT INTO `cms_info_detail` VALUES (24, '少林寺欲将功夫融入足球培训运动员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '少林足球近日，有关登封武校将少林功夫融入足球，培训足球运动员的新鲜事儿在网上流传，引起社会各界的关注。8月6日下午，记者电话采访了嵩山少林寺武僧团培训基地总教头释延鲁。释延鲁说，8月2日全国第六届高校足球教练培训研讨会在登封举行，他向与会的70多位国内各高校的足球教练员阐述了他的观点。释延鲁认为，', '南方日报', NULL, '杨春', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (25, '北京警方捣毁侵害公民信息团伙 抓获299人', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, ' 北京警方10日通报，8月7日警方出动300名警力，对藏匿于一栋大厦内侵害公民个人信息的犯罪团伙实施抓捕，299名嫌犯落网，其中刑事拘留95人、行政拘留204人，并缴获数十箱公民个人信息名单。目前，涉案公司总裁仍在逃。北京市公安局丰台分局副局长郑威在10日的新闻发布会上介绍说，今年8月初，警方侦查发', '南方日报', NULL, '杨春', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (26, '北京发布雷电黄色预警 傍晚至夜间将有大到暴雨', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, ' \r\n11日凌晨开始，北京雷雨大作，持续一夜，至9时许雨量减弱，天气转阴。北京市气象台发布消息称，11日白天到夜间，北京将有大到暴雨，并伴有雷电。尤其是傍晚至夜间，雨势较大，山区须注意防范地质灾害。\r\n降雨带来了些许清凉，一解前几日的持续暑热。11日一早，许多市民趁雨停了，纷纷出门采买，但整个京城仍', '中国广播网', NULL, '王军', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (27, '聚划算成清仓专用 问题产品充斥', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '作为淘宝最知名的团购平台，2011年是聚划算的爆发年，而历经反腐门之后，重新出台的聚划算团购服务竞拍规则(俗称“坑位费”)出台至今就重创了不少中小商家。据聚划算官网显示，其竞拍时间为每天上午10：00-11：00，竞拍起拍价为人民币1000元，单次加价幅度为100元及其整数倍，参与聚划算竞拍的卖家应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (28, '七夕前夜英仙座流星雨助兴 我国处于最佳观测区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '“这是今年最值得向大家推荐观测的流星雨”，北京天文馆馆长朱进前日发微博“推介”即将于13日凌晨迎来极大值的英仙座流星雨，是日恰逢七夕。但天气预报显示，届时北京将以阴雨天气为主，市民能否一睹年度最佳流星雨，还要看天公是否做美。据国际流星组织(IMO)估计，今年英仙座流星雨的高峰期将在北京时间8月12日', '京华时报', NULL, '商西', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (30, '报告称中国取代英国成世界第5大常规武器出口国', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '据美联社3月18日报道，瑞典智库斯德哥尔摩国际和平研究所(SIPRI)18日称，中国已取代英国成为世界第五大常规武器出口国。SIPRI在报告中称，中国在过去5年(2008-2012)中武器出口总量增长了163%，国际军火市场占有份额从2%增至5%，同时排名也从之前的第八升至第五。报告称，中国武器的最', '环球时报', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (32, '俄军主力战机集群出动应对乌克兰', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '俄南部军区27日起在克拉斯诺达尔边疆区举行空中演习。据悉，在为期两天的时间里，苏－25SM3强击机机 组人员将完成约40架次的飞行，并在无线电干扰的情况下对假想敌进行约50次打击。俄国防部网站消息说，俄东部军区当天也开始了大规模空中演习。演习将在 哈巴罗夫斯克边疆区和滨海边疆区进行，将有超过30架包', '环球时报', NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140404213603_k0a0bc.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (33, '汽车高速爆胎致车祸 鉴定机构回避轮胎质量问题', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318084854_x4wvqy.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (34, '市民未插卡取款机吐出一万元 不受诱惑忙报警', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '6日晚，在昆明市白龙路一自助银行里，来取钱的刘老师站在柜员机前捣鼓了半天&mdash;&mdash;卡插不进去，他在柜员机上随便按了“5000”，谁知50张百元钞票就吐到了他面前。机器出了问题？他又按了“5000”，又有5000元吐到了手里。仔细一查，发现柜员机里原来已有一张银行卡，刘老师忙报了警。', '春城晚报', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (35, '31省市最理想伴侣地图出炉：男性最想娶川妹子', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '31省市男女最理想伴侣地图出炉\r\n首选嫁京男 最爱娶川妹\r\n超五成的青年择偶时首选本地人；女性最想嫁的外省人中，北京男最受欢迎；男性则最想娶川妹子。\r\n记者上午获悉，零点指标数据进行2013年七夕主题调查，对全国各地1074位18至45周岁的网民进行随机访问，绘出31省市青年男女最理想伴侣地图', '中国新闻网', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (36, '调查称逾九成被调查者对中国人身份感到自豪', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '根据中国社科院相关机构进行的“中国公民政治文化”问卷调查：90．03％被调查者对“作为中国人，我很自豪”持赞同态度；72．23％被调查者认同“中国传统文化对个人具有很大的影响”。该调查在全国10个省份进行，获得6159份有效样本。', '东方网', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (43, '凤凰传奇赚1亿 人气搭档怎么分钱', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '近日，有明星经纪公司爆料，唱遍大小春晚的“农业重金属组合”凤凰传奇，出场费已经涨到了60万/场，若加上代言，2012年约有1亿进账。1亿这个数字也许略有夸张，但实际收入肯定也不会少。网友们一边感叹农业重金属的力量不可小觑，一边又开始琢磨这么多钱他们怎么分呢？凤凰传奇经纪人接受采访时表示，“玲花和曾毅', '腾讯娱乐', NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319005453_gcalyk.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (44, '羽泉同乐会为海泉庆生 9月开唱回馈歌迷', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, ' 8月12日，羽泉(微博)(微信号：yuquanweixin )携专辑《拾伍》在京举办粉丝同乐会。而活动第二天“七夕节”恰好是胡海泉(微博)的生日，歌迷们不仅为海泉准备了礼物还送上蛋糕，倍受感动的海泉感慨道：“对于羽泉来说，能在各位的陪伴和支持下一起走过的岁月就是最好的礼物。”为了纪念出道15周年，', '腾讯娱乐', NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072417_4y837l.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (45, '专访杨幂：“事业有成”离我很远 不着急完婚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '“大家好，我是制片人杨幂。”一身干练的黄色风衣，一句霸气外露的自我介绍，升级当了制片人的杨幂果然显现出女强人的气质。昨日，由其担任监制的都市时尚偶像剧《微时代之恋》在沪举行开机发布会，杨幂带着她钦点的男主角余文乐，以及她花费一年选出的八位新人齐齐亮相。腾讯网娱乐中心总监常斌到场助阵，宣布该剧官网正式', '腾讯娱乐', NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319010624_en4gsf.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (46, '终极格斗激情上演', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '重庆，12日，《一夜惊喜》见面会。女神范冰冰(微博)(微信号：fbbstudio916 )携李治廷空降山城重庆，在重庆各大影院轮番宣传最新电影《一夜惊喜》。电影中范冰冰和李治廷上演了姐弟恋，见面会现场，范爷霸气地将李治廷抱起来秀“恩爱”。当媒体问及范爷七夕怎么过时，范冰冰表示明天将在北京和“那个', '腾讯娱乐', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (47, '足协曾忧王迪成\"定时炸弹\" 两次漏判国安点球', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '在上周六武汉卓尔与北京国安的比赛中，主裁判王迪先后错判国安外援格隆禁区内假摔，接着又漏判给故意踢人的卓尔球员柯钊红牌。中国足协裁委会赛后确认，王迪两次判罚属严重错、漏判。王迪面临停哨3至6场的重罚。据悉，王迪通过抽签获本场比赛执法资格后，足协曾有人提议由经验丰富的老裁判取而代之，但提议未被采纳。抽签', '腾讯体育', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (48, '热火不败继续称霸实力榜 湖人升至第9火箭第11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '3月18日体育专电（记者林德韧）NBA(微博)官方18日公布了最新一期的实力榜，拿下22连胜的迈阿密热火队当之无愧地继续排在榜首，圣安东尼奥马刺队和俄克拉荷马雷鸣队分居二、三位。\r\n　　在击败多伦多猛龙队之后，热火队保住了自己的不败金身，东区冠军的位置已经基本锁定，现在剩下的唯一悬念就是热火队的连胜', '新华网', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (49, '足协或罚武汉暴力后卫停赛2场 格隆停赛不变', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '在上周六中超联赛卓尔与国安比赛下半时，卓尔球员柯钊暴踢国安外援马季奇的举动在足球界引起了不小反响。中国足协裁判委员会今天也出具报告提请纪律委员会对柯钊追罚。据了解，纪委会很可能将柯钊的犯规定性为暴力行为。由于他及其俱乐部认错态度良好，中国足协将按照底线处罚柯钊，柯钊面临停赛2场、1万元左右的追罚。电', '腾讯体育', NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319012002_dsuaw3.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (50, '西媒：巴萨巴黎巅峰对决 皇马上签穆帅会老友', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '北京时间3月15日晚，欧足联在瑞士尼翁总部进行了本赛季欧冠(微博 专题) 1/4决赛对阵形势抽签。杀进八强的三支西甲(微博 专题) 球队中，皇马(官方微博 数据) 抽中土超劲旅加拉塔萨雷，巴萨(官方微博 数据) 遭遇法甲大鳄巴黎圣日耳曼(微博 数据) ，马拉加(官方微博 数据) 则要迎接德甲球队', '腾讯体育', NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140404215630_ielobo.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (52, '尚德宣布可转债违约 成大陆首家公司债违约企业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, '腾讯财经', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (53, '俄媒：苏联为买军火曾贿赂罗斯福', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '上世纪30年代，为利用美国技术建造新型军舰，苏联领导人特批从国库划拨50万美元的“行政经费”(在当时是一笔不小的数目)，供一家苏联外贸公司使用，以便打通美国高层关节。但这笔钱最终打了水漂，并连累不少人获罪，俄罗斯《权力》杂志日前刊文披露了这段秘闻。　　1924年，苏联在美国注册成立了阿姆外贸集团公司', '新华网', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (54, 'WSJ：中国正在重蹈美国金融危机覆辙', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '北京时间3月19日凌晨消息，华尔街日报中国实时报栏目周一文章称，两名经济学家指出，美国房地产市场崩溃之前曾有过的三个警示性信号已经在中国出现，这意味着中国只有非常有限的时间来摆脱困境。\r\n文章指出，在野村证券于上周六公布的一份报告中，经济学家张智威和陈家瑶指出，物业价格的上涨、杠杆化的快速积累和潜在', '东方网', NULL, '李军', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (73, '杨钰莹再谈与赖文峰恋情 面对爱情并不后悔', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, ' 杨钰莹“女人不是因为美丽而可爱，是因为可爱而美丽。”俄罗斯文学家列夫&middot;托尔斯泰在《战争与和平》中的这句话，用在杨钰莹身上正合适。白裙子，长头发，低声说，轻声笑，杨钰莹完全保留着少女的神态。10多年的岁月，惊涛骇浪的往事，在她身上仿佛没留下痕迹。但交谈久了，还是不一样。你会发现，她从前', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130814133153_a6qtv0.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (78, '翘臀美女力挺开拓者 香艳宝贝支持灰熊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '翘臀美女力挺开拓者 香艳宝贝支持灰熊', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140403224743_k5txx2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (80, '第十二届全运会礼仪小姐训练实拍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '第十二届全运会礼仪小姐训练实拍', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140403230102_j1ygy9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (81, '两会上靓丽的礼仪小姐', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '两会上靓丽的礼仪小姐', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140403224051_vro62p.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (83, '搜狗输入法', NULL, NULL, NULL, '搜狗输入法(搜狗拼音) 7.1c', NULL, NULL, NULL, '0', '0', NULL, NULL, '搜狗输入法作为国内汉字拼音输入法的领导者，搜狗输入法率先实现了输入法与互联网的结合。基于搜狗搜索引擎技术，对中文词库有突破性发展，开创了新一代中文输入法。即时高效地更新热门词库，大幅提升了输入效率，让输入速度产生了质的飞跃。在词库的广度、词语的准确度上，搜狗输入法都在行业内遥遥领先。', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401163838_4g7x6o.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224154447_njmwafxvgl.jpg', NULL, NULL, NULL, NULL, 'http://cdn2.ime.sogou.com/1ef422d9c97c66c1769eb774daa8644d/567ba27b/dl/index/1450769272/sogou_pinyin_78j.exe', 'sogou_pinyin_78j.exe', 36194023, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (87, '台南资讯月曾甜热舞', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '台南资讯月曾甜热舞', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141213234730_7ylyoq6qne.jpg', NULL, 'http://demo.jspxcms.com/uploads/1/video/public/201412/20141217105935_9qtt8vp9yj.mp4', '台南资讯月曾甜热舞_超清.mp4', 35252510, '3:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (93, 'QQ7.9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '免费的即时聊天软件，给上网带来更多沟通乐趣。腾讯QQ2013年度皮肤呈现视觉盛宴，皮肤编辑器实现个性化面板创意；QQ应用盒子全新呈现，丰富应用满足多彩生活；QQ短信首度面世，畅享无处不在的沟通体验；炫彩字体，炫出聊天个性与风采；QQ支持自定义标签，标签顺序随心换。提示：如果您正在运行着腾讯QQ或者T', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401163625_s9usmk.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224154307_d6dwqq2yll.jpg', NULL, NULL, NULL, NULL, 'http://dldir1.qq.com/qqfile/qq/QQ7.9/16638/QQ7.9.exe', 'QQ7.9.exe', 59068088, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (94, '惠科（HKC）Q320 32英寸2K高分广视角护眼不闪LED背光液晶显示器', NULL, NULL, NULL, NULL, NULL, NULL, '#FF0000', '0', '0', NULL, NULL, '惠科（HKC）Q320 32英寸2K高分广视角护眼不闪LED背光液晶显示器', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224141639_p5kfadfqal.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224141645_8fnjf4vtop.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (95, '苏醒的乐园 2014春装 新款女装 韩版修身 中长款 风衣外套女 FY164 驼色 M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '苏醒的乐园 2014春装 新款女装 韩版修身 中长款 风衣外套女 FY164 驼色 M', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401151029_uk6wwv.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224144649_90stgfll7g.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (97, '苹果（APPLE）iPhone 6s 64G版 4G手机（金色）WCDMA/GSM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '苹果（APPLE）iPhone 6s 64G版 4G手机（金色）WCDMA/GSM', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401144253_nnavj0.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224122043_yqh1n9nbrd.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (98, '索尼（SONY） DSC-RX100 M2 黑卡数码相机', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '索尼（SONY） DSC-RX100 M2 黑卡数码相机', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401142459_82smxp.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224121205_23l6sjouvm.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (99, '美官方统计：为避税放弃美国国籍人数1年暴增5倍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, ' \r\n8月12日电 (记者 王欢)美国联邦公报最新公布的数据显示，2013年第二季度放弃美国国籍的人数再创新高，暴增至1131人，比去年同期的189人多出5倍。美国媒体称，美国政府为了增加税收应对拮据的财政状况，准备实施更严格的资产申报规定，使得放弃美国公民身份或绿卡的人数持续增长。\r\n　　报告显示', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (100, '英国派军舰赴地中海演习 西班牙称是恐吓行为', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '\r\n8月12日电 (记者 周兆军)英国和西班牙围绕直布罗陀的主权争议升级，12日，英国皇家海军的的一支快速反应部队前往地中海进行年度演习，包括“光辉”号航母在内的多艘军舰将前往直布罗陀海域。\r\n英国国防部宣布，包括“光辉”号航空母舰、两艘护卫舰和辅助舰只在内的10艘军舰前往地中海进行演习。英国国防部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (117, 'Java开发工程师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, 'Java开发工程师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (118, '网页设计师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '网页设计师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (126, '以房养老拟在北上广汉试点 初次贷款不超500万', NULL, NULL, NULL, '以房养老拟在北上广汉试点\r\n初次贷款不超500万', NULL, NULL, NULL, '0', '0', NULL, NULL, '	　　每日经济新闻记者 黄俊玲 发自北京\r\n	　　千呼万唤，以房养老保险方案终于要成为现实。\r\n	　　《每日经济新闻》记者昨日(3月20日)获悉，为贯彻落实国务院《关于加快发展养老服务业的若干意见》有关要求，丰富养老保障方式的新途径，保监会决定开展老年人住房反向抵押养老保险试点。\r\n	　　同时，', '中国新闻网', 'http://www.chinanews.com/gn/2014/05-30/6233523.shtml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (127, '最高检:严查以贿赂等手段破坏选举犯罪', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '	　　依法严惩暴力伤害医务人员犯罪，加大外逃职务犯罪嫌疑人追捕力度\r\n	　　据新华社电 最高检20日召开会议对重大案件公开、打击涉医犯罪、追逃等工作作出要求和部署。会议要求各级检察机关要积极参与维护医疗秩序打击涉医违法犯罪专项行动，依法严惩暴力伤害医务人员犯罪。会议透露，检察机关将加强反腐败国际', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (128, '中方在南印度洋发现疑似MH370黑匣子信号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '	　　新快报讯 近日，山东省曲阜市出台新规：所有市级领导干部一律取消秘书配备，其事务性活动由各办公室统一协调安排。其中，包括曲阜市委书记、市长在内的10位市级领导秘书配备取消。同时，曲阜市要求，领导外出不得讲求排场，让轻车简从成为常态。\r\n	　　今年3月初，曲阜市通过向群众、网民、人大代表、政协', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (129, 'ThinkPad T550(20CKA00QCD) 15.6英寸笔记本电脑 (i7-5600U 8G 256GB 独显1G 蓝牙 指纹 WIN7Pro)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, 'ThinkPad T550(20CKA00QCD) 15.6英寸笔记本电脑 (i7-5600U 8G 256GB 独显1G 蓝牙 指纹 WIN7Pro)', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401141615_kq36r7.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224122723_7i7de3ddcs.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (130, '佳能（Canon） EOS 5D Mark III 单反套机（EF 24-105mm f/4L IS USM 镜头）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '佳能（Canon） EOS 5D Mark III 单反套机（EF 24-105mm f/4L IS USM 镜头）', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401142650_bac6rd.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224120231_65sse24nht.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (131, '乔丹男子新款2015夏季耐磨透气篮球战靴OM3540101鲜红/黑色', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '乔丹男子新款2015夏季耐磨透气篮球战靴OM3540101鲜红/黑色', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145341_9nq3mp9otv.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224145344_89bwi3rykk.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (132, '米莱珠宝 4.27克拉红碧玺戒指 18K白金戒指 结婚戒指 情侣戒指 品位女士首饰【10天定制+证书】', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '米莱珠宝 4.27克拉红碧玺戒指 18K白金戒指 结婚戒指 情侣戒指 品位女士首饰【10天定制+证书】', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401151753_4dd63k.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224144736_ewd1t08u7m.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (133, 'WPS 2013', NULL, NULL, NULL, 'wps office 2013 个人版 9.1.0.4555', NULL, NULL, NULL, '0', '0', NULL, NULL, 'WPS Office是由金山软件股份有限公司自主研发的一款办公软件套装，可以实现办公软件最常用的文字、表格、演示等多种功能。具有内存占用低、运行速度快、体积小巧、强大插件平台支持、免费提供海量在线存储空间及文档模板、支持阅读和输出PDF文件、全面兼容微软Office97-2010格式（doc/doc', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401162441_xft5mm.png', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153817_vdahkda8my.jpg', NULL, NULL, NULL, NULL, 'http://wdl1.cache.wps.cn/wps/download/W.P.S.5400.19.552.exe', 'W.P.S.5400.19.552.exe', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (134, '好压', NULL, NULL, NULL, '2345好压（HaoZip） 正式版 4.2.1.9445', NULL, NULL, NULL, '0', '0', NULL, NULL, '好压压缩软件(HaoZip)是强大的压缩文件管理器，是完全免费的新一代压缩软件，相比其它压缩软件占用更少的系统资源用，有更好的兼容性，压缩率高！好压压缩软件(HaoZip)的功能包括强力压缩、分卷、加密、自解压模块、智能图片转换、智能媒体文件合并等功能。完美支持鼠标拖放及外壳扩展！功能介绍支持rar', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401164223_bnlgl0.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153551_2akebwrxnp.gif', NULL, NULL, NULL, NULL, 'http://dl.2345.com/haozip/haozip_v5.5_jt.multi.exe', 'haozip_v5.5_jt.multi.exe', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (135, 'PotPlayer1.6', NULL, NULL, NULL, 'PotPlayer 正式版 1.6', NULL, NULL, NULL, '0', '0', NULL, NULL, 'PotPlayer播放器中文版是一款优秀的高清播放器，它的前身是著名的KMPlayer。它可以播放大多数主流的视频、音频文件，并不需要额外安装第三方解码器。它强大的定制性与扩展能力让它成为播放高清影片的不二之选。PotPlayer播放器中文版是kmplayer的原作者姜龙喜先生进入daum公司后的新', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223183234_meu89ooh4v.png', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224153038_hlpu3gentd.png', NULL, NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/file/public/201512/20151224164602_edj1kwmpox.exe', 'PotPlayerSetup64.exe', 19892992, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (136, 'Adobe Reader', NULL, NULL, NULL, 'Adobe Reader 11.0.00', NULL, NULL, NULL, '0', '0', NULL, NULL, 'Adobe Reader X 11.0.6 官方中文版下载，支持打开和使用 Adobe PDF 的工具，可查看、打印和管理 PDF。若已经安装过之前的版本，请先卸载后再安装此版本！在 Reader 中打开 PDF 后，可以使用多种工具快速查找信息。如果您收到一个 PDF 表单，则可以在线填写并以电子', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140401164659_g0lhr7.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224152444_6wle3i9xgp.png', NULL, NULL, NULL, NULL, 'http://dlc2.pconline.com.cn/filedown_1322_6950695/Xsx70db2/AdbeRdr11000_zh_CN.exe', 'AdbeRdr11000_zh_CN.exe', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (137, '警察故事2013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '警察故事2013', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141216175409_1302a0rob7.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (138, '私人订制', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '私人订制', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141216180617_rdipnf4txk.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (139, '爸爸去哪儿 第一季', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '爸爸去哪儿 第一季', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141216180232_fgmao9eja0.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (140, '来自星星的你', NULL, NULL, NULL, '来自星星的你 第1集', NULL, NULL, NULL, '0', '0', NULL, NULL, '来自星星的你', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141213234745_y0bl80nkxj.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (141, '哈登参与林书豪与帕森斯的赛前仪式', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '哈登参与林书豪与帕森斯的赛前仪式', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140403225253_hc5wh6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (142, '孤独星球公布世界十大必看奇迹', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '孤独星球公布世界十大必看奇迹', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140403230505_vxnp2f.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (143, '全能锋霸梅西的“七种武器”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '全能锋霸梅西的“七种武器”', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140404215204_mnasf7.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (144, '安卓 ios 软件工程师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '安卓 ios 软件工程师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (145, '软件UI设计师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '软件UI设计师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (146, '软件测试工程师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '软件测试工程师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (148, '火狐浏览器', NULL, NULL, NULL, 'Firefox火狐浏览器 正式版 28.0', NULL, NULL, NULL, '0', '0', NULL, NULL, 'Mozilla Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器，使用Gecko引擎（非ie内核），支持多种操作系统如Windows、Mac和linux。', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140405134003_12my1m.png', 'http://demo.jspxcms.com/uploads/1/image/public/201501/20150112165457_3bbqyk222b.jpg', NULL, NULL, NULL, NULL, 'http://download.firefox.com.cn/releases-sha2/stub/official/zh-CN/Firefox-latest.exe', 'Firefox-latest.exe', 544235, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (149, '迅雷7', NULL, NULL, NULL, '迅雷7 正式版 7.9.20.4754', NULL, NULL, NULL, '0', '0', NULL, NULL, '经过近9个月的研发，迅雷今天首度公开了7.9新版。迅雷7.9加快了启动速度，新增了一键立即下载、在开始前完成、批量任务分组、智能任务分类等功能，下面具体来看一下：　　——加快启动速度　　启动速度慢的罪魁祸首是“频繁、大量进行硬盘读写”，迅雷7.9从基础设计上追求最少、最精明的进行硬盘读写。　　——确', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140405134137_xedtaq.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224151905_wtle7104a4.png', NULL, NULL, NULL, NULL, 'http://down.sandai.net/thunder7/Thunder_dl_7.9.42.5050.exe', 'Thunder_dl_7.9.42.5050.exe', 59068088, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (150, '360浏览器8.1', NULL, NULL, NULL, '360浏览器8.1官方下载 v8.1.0.396 网必通版', NULL, NULL, NULL, '0', '0', NULL, NULL, '360浏览器是一款小巧、快速、安全、功能强大的多窗口浏览器，它是完全免费，没有任何功能限制的绿色软件，最全的恶意网址库，最新的云安全引擎，“安全红绿灯”全面拦截木马病毒网站;“搜索引擎保护”自动标识搜索结果页中的风险网站，网必通是360极速浏览器推出的新功能，解决个别海外科技类网站打不开的问题。当开', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201404/20140405134321_jknrl9.png', 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224150332_8wfoyk10nb.png', NULL, NULL, NULL, NULL, 'http://down.360safe.com/se/360se8.1.1.118.exe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (151, '江湖时尚：郭采洁隔空示爱杨幂', NULL, NULL, '郭采洁隔空示爱杨幂', NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '江湖时尚：郭采洁隔空示爱杨幂', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141213234650_p4hjxsxoka.jpg', NULL, NULL, NULL, NULL, '15:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (162, 'Freemarker参考手册', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, 'Freemarker参考手册', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201501/20150114103540_4hhb9ohttu.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/doc/jspxcms_x.swf', '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (163, 'Jspxcms安装手册', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, 'Jspxcms安装手册', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224155649_y8bm7pb496.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/doc/jspxcms_x.swf', '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (164, '盘点2014年地球上任性的土豪们', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '盘点2014年地球上任性的土豪们', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209112942_fwf3ekao15.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (165, '2014年那些令人难忘的戎装丽人', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '2014年那些令人难忘的戎装丽人', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113650_0lpn6qp59m.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (166, '维多利亚的秘密2014大秀', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '维多利亚的秘密2014大秀', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141213234524_lx9s8ywe4u.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (167, '两岸秘史（一）北平无战事​', NULL, NULL, NULL, '晓松奇谈：两岸秘史（一）北平无战事​', NULL, NULL, NULL, '0', '0', NULL, NULL, '两岸秘史（一）北平无战事​', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141213234634_dpgi7u2xd1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (168, '猩球崛起2：黎明之战', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '猩球崛起2：黎明之战', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141213234558_sgnxtct1sl.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (169, '搞怪3宝：狂飙记', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '搞怪3宝：狂飙记', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141213234703_t3r1hgrv7x.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (170, '妖怪名单：灵异校园中的恋情', NULL, NULL, NULL, '妖怪名单', NULL, NULL, NULL, '0', '0', NULL, NULL, '妖怪名单：灵异校园中的恋情', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141213234616_h5kn46mysu.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (172, '台南资讯月XL ARMY热舞', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '台南资讯月XL ARMY热舞', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141217112855_w1e3qpt2iq.jpg', NULL, 'http://demo.jspxcms.com/uploads/1/video/public/201412/20141217110506_muad4rbmwk.mp4', '台南资讯月XL ARMY热舞_超清.mp4', 30131589, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (173, '台南资讯月钢管舞', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '台南资讯月钢管舞', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141217113441_vsk6khemr3.jpg', NULL, 'http://demo.jspxcms.com/uploads/1/video/public/201412/20141217110855_uvsybihp4c.mp4', '台南资讯月钢管舞_超清.mp4', 36169477, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (174, '四十九日祭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '四十九日祭', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141217114138_ucs3sshpc4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (180, '传中兴管理人员被蒙古国反贪局逮捕 公司否认', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '　　【环球时报记者 赵倩】针对日前有报道称“中国中兴通讯股份有限公司在蒙古承建项目时涉嫌行贿，其管理人员已被蒙古国家反贪局逮捕”，中兴公司18日接受《环球时报》记者采访时予以否认。　　该报道称，本月13日，蒙古国家反贪局对中兴公司在当地的办事处、高管住处、私人汽车及车库进行搜查，将搜到的文件资料都带', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (221, '600对2000就打不过？贸易战不是数量对比那么简单', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (222, '今年夏天有多热？18个省级电网负荷达历史极值', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (223, '哈尔滨一道路突然塌陷 奥迪和速腾开着开着掉坑里', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (224, '福建德化女子持剪刀扎伤路人 1女子与2名儿童受伤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (225, '邯郸市委原常委王社群涉严重违纪违法 已投案自首', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (226, '银行主任骗贷200万后失踪 逃亡生活太苦投案自首', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (227, '这场听证会 让人看清白宫一直不愿面对的4个事实', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (228, '王毅会见澳外长:中方从不干涉别国内政 也不搞渗透', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (229, '王毅当面向日本NHK指出报道错误：一定要搞准确了', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (230, '国家医保局：新一轮抗癌药医保准入谈判下月完成', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (231, '坚挺6年后 中国人最喜欢买房的这个国家终于降了', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (232, '侠客岛:贸易战升级 中国600亿如何应对美国2000亿', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (233, '有文章称特朗普说只有他才能帮北京脱困 真的吗？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (234, '广东陆丰警方悬赏2600万通缉130人 看到快报警', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (235, '一艘江苏籍渔船在浙江海域遇险 3人获救11人失联', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (236, '军委联合参谋部副参谋长邵元明晋升中将', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (237, '驻联合国军事参谋团团长华波 八一前晋升少将军衔', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (238, '金门供水工程正式通水的历史性时刻 刘结一这样讲', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (239, '中央气象台：东北华北退烧 南方高温还将持续一周', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (240, '蔡英文有了袭击福建广东的大杀器？专家:弱不禁风', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (241, '乘客滞留机舱4小时强开应急舱门被拘 海航道歉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (242, '江苏籍渔船在浙江海域倾覆 11人下落不明', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (243, '民政部党组成员詹成付出任副部长(图/简历)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (244, '曾写下4封遗书的“铁血政委”晋升集团军首长', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (245, '台积电三大基地疑遭勒索软件攻击停摆 正逐步恢复', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (246, '河北省委督查室两名干部因事影响恶劣 被调离省委', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (247, '经济日报连发五文 深度解读当前经济形势', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (248, '胡锡进：读《作为中产 我对国家有哪些不满》有感', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (249, '湖南临澧青山灌渠发生一起3学生意外溺亡事故', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (250, '刘惟云大校任火箭军驻黄山某部队政治工作部主任', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (251, '常拿罐罐茶和村民碰杯的辅警救灾牺牲 被称活地图', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (252, '卫健委派调查组赴陕西核查儿童接种过期疫苗问题', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (253, '上海“杀妻藏尸冰柜案”将于23日再次开庭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (254, '高铁到底为啥不能等人？总工程师这么回答', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (255, '詹成付任民政部副部长(图|简历)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (256, '常州武进区澄清“化工厂毒气泄露”谣言:废酸泄露', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (257, '专家调研：北京通州地下水污染主要来自面源污染', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (258, '北京双胞胎姐妹在青岛失踪 已发现第二具遗体', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (259, '第三十批护航编队从青岛起航 赴亚丁湾执行护航', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (260, '市委书记贿选副省 副市长“赞助”百万', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (261, '新党赴陆委会抗议通水:应改名“两岸不通委员会”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (262, '西安开发商无证售房状告业主欲收回房产 业主败诉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (263, '辽宁畜牧局:做好非洲猪瘟防治工作 尚无有效疫苗', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (264, '新京报评南宋佛像毁容式修复:别把文物搞成奶奶庙', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (265, '易炼红任江西代省长 江西现任主官均邻省工作多年', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (266, '上海公布销售食品药品严重违法的19人“黑名单”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (267, '“毒糖案”李锦莲家属：未能就国赔金额达成一致', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (268, '四川雅安发生山体塌方 3辆车被压道路禁止通行', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (269, '公司董事长涉债7亿失联 三只昂贵名犬等待被领养', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (270, '中工国际工程股份有限公司原副总经理胡伟被查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (271, '张馨予丈夫被评中级反恐特殊人才 有这些过人之处', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (272, '临汾市长再被约谈 当地国控空气监测曾被人为干扰', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (273, '私生活混乱的院长 曾被绑架吊打后劫走10万', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (274, '多地探索受处分干部管理新规:影响期满可重新提拔', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (275, '福建一党员未劝阻且参与违规出殡祭祀活动 被警告', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (276, '驻登巴萨总领馆:39名印尼震后被困中国公民已撤离', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (277, '北京双胞胎青岛溺亡海滩非正规浴场 宽度窄水流急', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (278, '昆山工厂爆炸致70多人死？网警辟谣：为4年前旧闻', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (279, '华北东北内蒙古等地有较强降水 今起北方高温结束', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (280, '山东潍坊回应市民办事遭工作人员踢皮球:调查追责', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (281, '网游花千骨含色情低俗内容被查 涉案公司被罚3万', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (282, '沈阳升级楼市调控政策：限购范围扩大至全市', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (283, '派出所长击毙杀人逃犯却牺牲 有人妄言“死得好”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (284, '关于免疫和疫苗安全的问答', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (285, '百白破你真的了解吗？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (286, '航母部队原副司令员吴宏志任海军福建基地司令员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (287, '邯郸市委书记率团送行“邯郸舰”：带去慰问金', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (288, '接过森林防火职责后 应急管理部立赴黑龙江调研', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (289, '湖北菜简称鄂菜还是楚菜？省政府办公厅发文确认', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (290, '辽宁畜牧局下发紧急通知：全面监测 严防疫情扩散', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (291, '青海副书记刘宁出任省政府党组书记(图/简历)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (292, '准点寻欢作乐的市委常委 涉案金额上亿', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (293, '人民日报：电竞可以替游戏正名 却不能为游戏冠名', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (294, '北京市公安局三人拟任新职 衡晓帆拟任常务副局长', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (295, '“医学界钱学森”苏鸿熙逝世 99岁在轮椅上入党', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (296, '茅台集团习酒公司党委书记董事长换人', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (297, '6月进口车市场巨降87.1% 中汽协称“历史少见”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (298, '河南家长疑孩子高考答题卡被调包:存多处修改痕迹', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (299, '上半年居民消费榜出炉 这个城市的人比北京还能花', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (300, '中纪委机关报评女星嫁军人:慧眼识英雄为军嫂点赞', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (301, '一个月暴涨58倍 扑尔敏400元涨到23300元是谁捣鬼', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (302, '目击泰国沉船事故的孩子现身说法：危险就在身边', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (303, '“作文不是我写的” 河南家长质疑孩子高考答题卡被调包', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (304, '成都人社局:社保掌上通APP未经官方授权 谨防泄露', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (305, '又一名水利部老同事出任省政府一把手 这次是他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (306, '这两区向秦岭违建别墅“宣战”:党政一把手齐上阵', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (307, '新京报评双胞胎溺亡:指责母亲玩手机不如警醒自身', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (308, '最后一名轰炸广岛美军老兵:至今不后悔投下原子弹', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (309, '半月谈：上亿青年狂刷短视频 主流信息不能缺席', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (310, '半月谈评论：莫让“读书无用论”在网络空间复活', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (311, '14位中候补职务变动 31省份政府“一把手”全配齐', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (312, '国务院国资委新任命一位女副主任 她的履历不一般', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (313, '光明网评河南考生答题卡疑被调包:揭盖子一查到底', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (314, '湖南纪委原副书记李政科涉受贿巨额财产不明被诉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (315, '故意伤害案发回重审21年才开庭 真凶多年前已获刑', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (316, '内蒙古司法鉴定出错仍被采纳 二审法官否认被威胁', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (317, '国家税务总局及各省市县税务局党组改设党委', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (318, '农业农村部紧急会议：坚决扑灭 尽快根除非洲猪瘟', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (319, '“张志超奸杀案”再审 律师:法院再延长3个月审限', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (320, '退休干部驾车撞学生泄私愤致1死11伤 今被执死刑', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (321, '河南一公安局长收受贿赂 为涉黄赌毒场所当保护伞', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (322, '河南2名保安暴打6旬环卫工 被顶格处理治安拘留', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (323, '涉李春城案商人邓鸿回应:出事后公司被拉十车资料', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (324, '天津原副市长退休5年后被处分 曾被评优秀企业家', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (325, '这两位专家型老同事都当省长 仕途也多有相似之处', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (326, '正部级挂帅的公安局 将迎常务副局长', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (327, '驻中央统战部纪检组长换人:中纪委委员周小莹接替', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (328, '广东英德原书记汪耿东被双开：贪欲膨胀 道德败坏', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (329, '上海警方成功抓获“联璧金融”案主要犯罪嫌疑人', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (330, '北京一写字楼没空调室温30度:多人中暑数十人离职', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (331, '赵薇退出龙薇传媒经营层不再任高管 仍为最大股东', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (332, '河南首虎曾主政地又有官员落马:焦作副市长上周投案', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (333, '湖南安化一村民持柴刀铁锤致6人受伤 已被刑拘', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (334, '河南招办回应高考答题卡疑被掉包:反复核实成绩无误', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (335, '直升机迫降致4伤 涉事公司北京地区暂被停飞', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (336, '民警工作疏忽致男子两次被错抓 郑州警方回应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (337, '山东书记:企业家到山东投资会有专人对接解决问题', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (338, '男子卷入3死系列投毒案遭错关六百余天 警方道歉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (339, '安徽75后博士区长因个人原因辞职 28岁兼大学教授', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (340, '江西殡改被拆棺木流入家具市场？当地:商贩已被查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (341, '台湾航空公司改“中华民国”为“台湾” 台媒惊了', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (342, '临汾环境数据或早有问题 环境部官员认为贻误多年', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (343, '在逃人员小区内砍杀狱警 一审判死缓后重审判死刑', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (344, '两部门发布接种长春长生狂犬病疫苗续种补种方案', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (345, '自动投案 河南焦作副市长魏超杰涉嫌违纪违法被查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (346, '国家卫健委:开展长春长生狂犬病疫苗补种工作检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (347, '上海拿户口“抢人”点名要北大清华 被指有失公平', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (348, '西部战区陆军原政委徐忠波中将履新联勤保障部队', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (349, '中纪委女委员履新统战部 曾这样谈美女和职女', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (350, '天津副部退休5年后降为副厅 曾在80年代名噪一时', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (351, '狂犬病暴露后如何跟踪观察 国家卫健委发文解答', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (352, '人民日报将刊发“宣言”文章:风雨无阻创造美好生活', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (353, '特级飞行员王洪勋空军大校已跻身副军级军官之列', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (354, '正军级少将刘志辉转入火箭军 曾在国防大学任职', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (355, '互联网领军企业小米落子上海 李强应勇会见雷军', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (356, '范冰冰名字从电影《大轰炸》海报中“消失”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (357, '陕西成立工作组处理商洛疫苗事件 梁桂为组长', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (358, '常州储罐泄漏30吨废酸流入雨水管道 官方：未外流', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (359, '报告：中国等国正制造一场5G海啸 想跟上不可能', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (360, '英媒称经济压力致中国人生育意愿低:养孩花费过高', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (361, '抗癌药或再降价 9月底前完成18种抗癌药医保谈判', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (362, '北京海淀等3区发布雷电黄色预警 多地有雷阵雨', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (363, '京津城际时速350公里开跑 北京到天津仅需30分钟', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (364, '两部委向四川内蒙古下拨2.5亿元救灾款', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (365, '外媒：美宣布23日起对价值160亿美元中国商品征税', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (366, '美23日起将对160亿美元进口中国产品征收额外关税', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (367, '北京发布地质灾害气象风险蓝色预警', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (368, '澳总理外长同一天对华示好 释放“解冻”信号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (369, '国家卫健委发布狂犬病疫苗续种补种答问', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (370, '银保监会：严防涉黑涉恶组织和个人进入银保业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (371, '外交部:中方赞赏澳总理对华政策讲话中积极表态', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (372, '甘肃原省委书记王三运等3人被公诉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (373, '江西宜春人大常委会原副主任应勤进对抗组织审查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (374, '美国5G建设落后于中国 基站不足中国十分之一', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (375, '谁在占领印手机市场 日媒:除了三星全都来自中国', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (376, '中国再度出手 最大看点就在这五个关键词上', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (377, '专家:中国核心力量在于日渐成长的“消费社会”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (378, '日本学台湾了:台“电信诈骗祖师爷”成山口组教官', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (379, '热带扰动将影响华南南部 华北东北等地有较强降水', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (380, '心有不甘?赖清德当面抱怨金门县长没帮台当局说话', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (381, '金门终于喝上大陆的水 台当局：先交4.9万营业税', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (382, '香港尖沙咀外币兑换店千万港币被抢 或有内鬼报信', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (383, '消费喜好改变?日韩品牌在中国化妆品市场打败法国', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (384, '中国向印尼地震灾区提供援助 中国游客已顺利撤离', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (385, '广东检察机关依法对钟小平 陈阳提起公诉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (386, '青岛一家饭店加工9斤螃蟹收900元 官方：责令停业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (387, '应急管理部挂牌督办贵州盘州致13死煤矿事故', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (388, '党中央 国务院邀请优秀专家人才代表北戴河休假纪实', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (389, '打了长生狂犬疫苗怎么办?这八个疑问有了官方回答', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (390, '欧盟通过新法对抗美对伊制裁 外媒：考虑中国因素', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (391, '没想到 日本木材正以“世纪之最”的增速流向中国', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (392, '台湾新北万豪旗下酒店WiFi画面 已经挂上五星红旗', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (393, '媒体：赖清德 世人早已看穿你的“台独”表演', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (394, '加时耗尽 美国三大航企“还在改”涉台标注', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (395, '泰机场说“你好”以努力迎回中国游客 会奏效么？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (396, 'MH370调查报告遭质疑 家属要求公开全部数据', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (397, '高管患癌后月薪由2.5万降至1200 律师：符合规定', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (398, '杨鑫任新疆维吾尔自治区党委常委 纪委书记', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (399, '投资的P2P平台踩雷咋办？江苏警方发了份维权攻略', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (400, '解放军今日起至13日将在黄海进行重大军事活动', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (401, '阿里山便宜旅社破旧又肮脏 台网友：倒贴钱也不住', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (402, '甘肃白银强降雨引山洪多辆车冲入黄河 致8人死亡', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (403, '检察机关依法分别对尉永久罗福来 孙艳军提起公诉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (404, '台湾歌手唱“轰炸辽宁舰”还黑解放军 网友：恶心', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (405, '西安734家无证照培训机构被叫停 并妥善分流学生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (406, '张家界处置一群体事件:500多人聚集 有人借机打砸', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (407, '蔡奇到北京通州调研:老城区提升要抓这些重要节点', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (408, '未来四天雷阵雨频繁光顾北京 今天局地暴雨伴雷电', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (409, '麻省理工校长：中国不是那种国家 美对华政策犯错', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (410, '爱存钱的中国人 为何家庭负债率越来越高？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (411, '17户“精神残疾”住公租房遭抵制:不考虑其他地方', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (412, '李登辉又发媚日症 想拿全台百姓健康为安倍换面子', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (413, '美欧日可能达成零关税：中国怎么办？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (414, '西安将秦岭拆违摆上擂台 市委书记：确保整彻底', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (415, '教育部：师范免费教育变公费教育 保证每人有岗编', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (416, '贵阳2岁儿童感染艾滋 贵州省级核查组通报情况', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (417, '长春长生问题狂犬病疫苗续种补种 要不要补怎么补', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (418, '中国之声批部分企业用AV女优做代言:不以耻反为荣', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (419, '李登辉又攻击蔡英文了？李办急澄清:他不是那意思', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (420, '韩媒：中国黄海重大军事活动或调动首艘国产航母', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (421, '这个大动作与你的养老有关 办法将推向全国', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (422, '渔民突发脑溢血 南海上这次生死营救上了新闻联播', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (423, '持续百年 让中美欧花数百亿美元的大搜索在找啥？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (424, '甘肃白银强降雨引发山洪：9人遇难3人失联', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (425, '29省市公布高温津贴发放标准 按天计算天津发最多', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (426, '重庆一男子将前妻等4人刺伤1人已死亡 被警方抓获', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (427, '中国6次警告闯南海岛礁美军机 美媒:中国地位牢固', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (428, '“以房养老”试点四年不足百户参与 为何推向全国', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (429, '陕西商洛环境执法工作人员被围困攻击 打人者被拘', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (430, '河北张家口一家饭店发生液化气燃爆事故 致1死8伤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (431, '这位退休老书记的一记耳光 打醒多少麻木的心？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (432, '邱树春获任香港廉政公署副廉政专员 升执行处首长', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (433, '通辽现疑似牛炭疽疫情 科尔沁下达“疫区封锁令”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (434, '财政部：前7月全国财政收入超12万亿 同比增10%', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (435, '贸易战下中产阶级消费靠不靠得住?外媒也十分关注', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (436, '贪污受贿卖官渔色 面对下级和百姓他们被称一霸手', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (437, '“慰安妇”题材片大寒在南京放映 94岁老人这样说', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (438, '菲律宾网络博彩中国中介停止招聘 在接受警方询问', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (439, '异烟肼式私刑 无奈之举还是涉嫌犯罪？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (440, '里拉暴跌后土耳其成购物天堂 中国游客忙“扫货”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (441, '朝鲜海鲜吸引大批中国吃货：新鲜好吃 便宜得离谱', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (442, '云南通海发生地震瞬间 护士用身体护住婴儿避难', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (443, '彩钢板“逼停”京沪线 高铁沿线有多少安全盲区？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (444, '中国尼泊尔9月将再次军演 印媒这次又格外上心', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (445, '人民日报谈粉丝集资追星：平台履责 推进账目透明', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (446, '八旬老妪获刑两年半欲保外就医被拒 河北监狱回应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (447, '肝癌患者代购救命药被拘后情绪低落:我主要是救人', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (448, '国办：年底前出台基础设施和公共服务领域PPP条例', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (449, '中央政治局常委会召开会议 听取长生疫苗问题调查报告', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (450, '新华社：机构为争房源哄抬租金 推高部分地区租金', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (451, '应急管理部开视频调度会 部署防台风应急救援工作', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (452, '体育总局：失信被执行人等8类人列体育市场黑名单', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (453, '中国学者：特朗普把刀架我们脖子上 我们绝不屈服', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (454, '这个台湾的“邦交国” 正在经历一片萧条', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (455, '联合国前秘书长安南去世 外交部：中方深表哀悼', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (456, '朝韩离散家属团聚活动今天重启 中方就此评论', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (457, '你肯定想不到中国援非医生都经历了什么', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (458, '京秦高速北京段正式通车 北京高速“断头路”清零', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (459, '非洲很穷还不起中国人的债?是时候消除这些误解了', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (460, '国务委员兼国防部长魏凤和将访问印度', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (461, '专访马来西亚总理：阐述应对保护主义等话题(图)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (462, '大连遭暴雨袭击内涝严重 超百个航班延误或取消', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (463, '王沪宁同越共中央书记处常务书记陈国旺举行会谈', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (464, '绍兴通报“义峰山矿区事件”:放射水平未明显升高', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (465, '民航局通报在马尼拉偏出跑道事件 厦航董事长致歉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (466, '旧城改造“五证”皆无成烂尾 拆迁户7年无家可归', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (467, '“断交”民进党真急了 恼羞成怒喊“换不来统一”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (468, '水害兰新线多处塌陷 中铁兰州局近百客货列车晚点', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (469, '内蒙古广播电视台台长赵春涛被查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (470, '萨尔瓦多：把在台学生全部送往大陆 确保其安全', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (471, '蔡英文不听劝致“断交” 马英九:快回“九二共识\"', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (472, '台湾核一厂除役后将清除8.2万吨废弃物 引发疑虑', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (473, '台男子重操旧业偷电挖矿比特币 800多台矿机被查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (474, '外交部：马哈蒂尔访华取得多项成果', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (475, '湖南湘潭市委原副书记赵文彬被决定逮捕', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (476, '刚“断交”就狂黑 台媒:萨尔瓦多政府腐败治安差', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (477, '台方面称中萨建交是大陆“金元外交” 外交部回应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (478, '胡春华：拓展东北和俄远东及贝加尔地区合作深度', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (479, '王岐山会见萨尔瓦多代表团', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (480, '蔡英文\"出访\"就\"断交\" 台学者喊话：拜托别出去了', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (481, '“港独”分子致信特朗普提奇葩要求 他能办到吗？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (482, '银保监会为何要特别鼓励这个9万亿的市场？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (483, '蔡英文的“出访庆功会”被紧急取消 民调也被收回', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (484, '中美欲在11月习特会前结束贸易争端？中方回应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (485, '国台办：再次奉劝民进党 逆潮流而动注定是徒劳的', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (486, '蔡英文首次“访问”NASA是重大突破？买票就能进', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (487, '马来西亚取消东海岸铁路和油气管道计划 中方回应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (488, '厦航客机冲出跑道致机场瘫痪 菲律宾索赔', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (489, '飞往武汉全日空客机折返成田机场：发现漏油痕迹', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (490, '国家煤监局：对12个省区开展煤矿安全生产督查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (491, '中央军委党的建设会议再提醒全军:我们为什么出发', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (492, '中美差距究竟有多大？这40个指标全面透析', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (493, '王毅:中非合作论坛已成引领国际对非合作一面旗帜', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (494, '王毅谈中非合作论坛北京峰会的成果设想', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (495, '王毅：中非合作论坛北京峰会将于9月3日至4日举行', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (496, '中国北极无人冰站顺利布放:观测迈入“无人时代”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (497, '专家:国产航母第二次海试不会进行舰载机起降训练', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (498, '国务院办公厅:校外培训内容不得超出国家课程标准', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (499, '胡春华在辽宁调研时强调:适应更高水平的开放要求', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (500, '首任中国驻多米尼加大使张润递交国书', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (501, '台当局被“断交” 陈水扁:是谁砍断勇弟的狗腿？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (502, '哈尔滨太阳岛景区酒店火灾 107名消防员进场救援', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (503, '哈尔滨北龙汤泉休闲酒店火灾已清理出16具遗体', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (504, '哈尔滨北龙温泉休闲酒店发生火灾 现场18死19伤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (505, '环球时报单仁平：维权不能脱离理性与合法的轨道', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (506, '哈尔滨北龙温泉酒店发生火灾 遇难人数已升至19人', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (507, '洞朗对峙解除近一年后 中印防长终于做了这些决定', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (508, '美媒：中国七大军工企业跻身全球20强', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (509, '职务犯罪外逃者逾期不归从严惩处 公告时限出炉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (510, '“间谍 洗脑” 港媒:美质疑孔子学院属于极端偏执', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (511, '党报谈年轻人一言不合就裸辞:不修内功 难成大器', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (512, '2018中国网络媒体论坛将于9月6日在宁波举行', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (513, '2018中国网络媒体论坛议程公布', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (514, '河南尉氏县靠抓阄来确定贫困户 2名村干部被撤职', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (515, '北京一高校化粪池爆炸污染饮用水致腹泻?校方辟谣', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (516, '教师节家长为孩子花式求关注 六成受访者称受困扰', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (517, '搜李逵出李鬼 百度竞价广告屡次触碰底线没得治？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (518, '人民日报评90后干部贪腐：不论大小 坚决一查到底', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (519, '科技日报：室内污染多严重？标准“说话”才靠谱', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (520, '陕西西安雁塔区官网现“奇葩回复” 这三人被处理', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (521, '福建:拟将存在行贿记录的企业个人列入“黑名单”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (522, '年轻人不想生急也没用 娱乐一代不婚不等于不同居', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (523, '国家超级计算深圳中心主任:超算不是为先进而先进', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (524, '湖北：937名涉黑涉恶违法人员迫于压力投案自首', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (525, '上海浦东：调研不是走多少地方 而是解决多少问题', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (526, '这个村主任被指是“土皇帝” 上任前曾是监狱常客', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (527, '中纪委机关报:地方形象不是靠一两个景观撑起来的', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (528, '党报刊文：从强国兴衰规律看我国面临的外部挑战', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (529, '中纪委机关报批抓阄扶贫：不担当 乱作为问题突出', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (530, '辽宁举报涉黑犯罪最高奖50万 重大涉黑案异地调警', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (531, '肃清苏荣案余毒 江西对43名党员干部依纪严肃处理', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (532, '黑老大获刑24年：19岁开始混社会 在当地称霸一方', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (533, '自如：首次出租房源须空气合格 空置30天才可上架', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (534, '86岁台湾政治学者胡佛逝世 曾称否定中国是缺德', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (535, '明尼苏达大学校报怒怼校方:在刘强东案中逃避责任', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (536, '机关作风大整顿活动刚作部署 吉林纪委副书记被查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (537, '人民日报评遛狗母女与孕妇冲突:法律面前没有网红', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (538, '广电总局公布职能配置 内设机构和人员编制规定', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (539, '光明网：批滴滴自如 不是为了回到黑车黑中介时代', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (540, '新组建的自然资源部“三定”方案公布', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (541, '37年最重大变化 “计划生育”四个字从这里消失', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (542, '南昌大学材料科学与工程学院院长王雨去世', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (543, '江苏大剧院：因舞台技术原因 德《人民公敌》退票', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (544, '非中合作对双方都有利', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (545, '台湾希望避免“零邦交国” 却出错了这张牌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (546, '中美面临的真正威胁其实是它 并不是关税', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (547, '俄媒：中美在非洲展开一场较量 中方胜算更大', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (548, '中央广播电视总台与今日俄罗斯通讯社签署协议', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (549, '中国教授在坦桑尼亚教农民种地：当地水资源丰富', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (550, '10月1日起 全军将再次响起嘹亮的军号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (551, '脚踹台湾慰安妇铜像日本人辩称脚麻 这么不要脸？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (552, '西方追着黑中国的这件事 刚刚被西方人自己打脸了', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (553, '学习贯彻习近平全国宣传思想工作会议重要讲话精神', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (554, '港媒：不为慰安妇出头 蔡英文当局成箭靶', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (555, '中国第四批维和步兵营高标准通过联合国装备核查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (556, '台湾前行政高官林益世贪腐获刑 月底将入监', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (557, '中国将寻求WTO支持对美制裁：美拒不执行世贸裁决', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (558, '财政部：全国入库PPP项目投资额超11万亿', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (559, '澳门出台《网络安全法》 建议手机预付卡实名制', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (560, '俄基金将与中国进行非美元交易 首笔业务明年展开', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (561, '网传陕西米脂县致9死案凶手被执死刑？警方：不实', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (562, '民进党称居住证是“统战”国台办:抹黑是他们本性', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (563, '国台办:台湾同胞可同大陆同胞享受一样的就业环境', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (564, '“台独推奥运正名公投”已达联署门槛?国台办回应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (565, '大陆通过居住证收集台湾居民个人资料?国台办回应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (566, '居住证推出后台胞证功能被弱化？国台办回应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (567, '国台办：居住证受台胞欢迎 已有超2.2万人申领', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (568, '斯威士兰大概率“抛弃台湾”？国台办：大势所趋', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (569, '国台办：台湾同胞在海外遇困难 祖国都是坚强后盾', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (570, '美在中萨建交后采取所谓“挺台”措施 国台办回应', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (571, '国民党大佬郝伯村夫人病逝 子郝龙斌望低调办后事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (572, '网秦创始人与董事长隔空互怼 绑架到底有没有？', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (573, '日方代表脚踹慰安妇铜像引公愤 国台办:跳梁小丑', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (574, '央视台长吐槽俄酒店肥皂：太粗糙 可从中国进口', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (575, '中国4艘海警船进入钓鱼岛领海巡航 遭到日方监视', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (576, '著名表演艺术家朱旭去世 享年88岁', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (577, '滴滴恢复深夜出行第一夜：新司机被刷 考核遭吐槽', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (578, '台北捷运传歹徒持刀刺人 女子胸口被划伤15厘米', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `cms_info_detail` VALUES (579, '瑞媒称中国游客事件或由中方故意导演 中使馆驳斥', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);

-- ----------------------------
-- Table structure for cms_info_file
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_file`;
CREATE TABLE `cms_info_file`  (
  `f_info_id` int(11) NOT NULL,
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `f_length` bigint(20) NOT NULL DEFAULT 0 COMMENT '文件长度',
  `f_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件地址',
  `f_index` int(11) NOT NULL DEFAULT 0 COMMENT '文件序号',
  `f_downloads` int(11) NOT NULL DEFAULT 0 COMMENT '下载次数',
  INDEX `fk_cms_infofile_info`(`f_info_id`) USING BTREE,
  CONSTRAINT `fk_cms_infofile_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档附件集表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_info_image
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_image`;
CREATE TABLE `cms_info_image`  (
  `f_info_id` int(11) NOT NULL,
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `f_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `f_index` int(11) NOT NULL DEFAULT 0 COMMENT '图片序号',
  `f_text` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片正文',
  INDEX `fk_cms_infoimage_info`(`f_info_id`) USING BTREE,
  CONSTRAINT `fk_cms_infoimage_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档图片集表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_image
-- ----------------------------
INSERT INTO `cms_info_image` VALUES (78, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223174012_3ivdak9qaj.jpg', 0, NULL);
INSERT INTO `cms_info_image` VALUES (78, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223174012_h2v3qs5y5h.jpg', 1, NULL);
INSERT INTO `cms_info_image` VALUES (80, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813063704_4gflo6.jpg', 0, '8月11日，第十二届全运会（十二运）礼仪引导志愿者封闭训练。当日，在沈阳体育学院开放十二运礼仪引导志愿者媒体开放日活动。第十二届全运会将于2013年8月31日至9月12日在辽宁举行，历时13天。');
INSERT INTO `cms_info_image` VALUES (80, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813064757_oppd1r.jpg', 1, '8月11日，第十二届全运会（十二运）礼仪引导志愿者封闭训练。');
INSERT INTO `cms_info_image` VALUES (80, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813064842_iey6ge.jpg', 2, '8月11日，第十二届全运会（十二运）礼仪引导志愿者封闭训练。');
INSERT INTO `cms_info_image` VALUES (81, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223212828_4947knmw65.jpg', 0, NULL);
INSERT INTO `cms_info_image` VALUES (81, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223212828_10wbkq7qnq.jpg', 1, NULL);
INSERT INTO `cms_info_image` VALUES (164, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209115711_jftrfmqw5c.jpg', 0, '盘点2014年地球上任性的土豪们');
INSERT INTO `cms_info_image` VALUES (164, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209115712_bxg9djal0l.jpg', 1, '【中东地区的土豪】中东土豪为12只鹰买机票【中东地区的土豪】中东土豪为12只鹰买机票 卡萨布兰卡飞阿布扎比的航班上，一个阿拉伯长袍男给他的12只老鹰买了票，坐经济舱，主人自己却坐在了头等舱。网友喊话：敢来中国，上飞机的是十二只鹰，下飞机的是12份鸡煲');
INSERT INTO `cms_info_image` VALUES (164, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209115712_gipro2llj6.jpg', 2, '【美国土豪】搬家后烧掉自家370平米豪宅据《每日邮报》报道，美国德克萨斯州一对夫妇烧掉了自己372平米的豪宅，这座豪宅坐落在75英尺(约合23米)的峭壁边。大约两周前，房屋的主人举家搬迁，并把所有能带走的东西全部带走，他联系了当地的工程部门，咨询了处置这处房屋的最佳方案。');
INSERT INTO `cms_info_image` VALUES (164, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209115712_7ep64uj61j.jpg', 3, '【印度土豪】印度土豪130万定制4公斤重纯金上衣庆祝生日据《印度时报》报道，45岁的印度企业家潘卡伊·帕拉科（Pankaj Parakh）近日定制了一件4公斤重的纯金上衣，作为自己的生日礼物。');
INSERT INTO `cms_info_image` VALUES (164, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209115712_xa3hnn6qwo.jpg', 4, '【俄罗斯土豪】一百万颗水晶打造“水晶大奔”据《每日邮报》报道，伦敦西部的骑士桥街道是著名的国际中心，每天停在这里的豪车都吸引很多人的目光。近日，一位俄罗斯美女Daria Radionova将自己的奔驰车身上镶嵌了100万颗施华洛水晶。网友喊话：不怕被人抠吗？');
INSERT INTO `cms_info_image` VALUES (164, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209115712_247h3r62j7.jpg', 5, '【土耳其土豪】珠宝商7.8万块金片制低胸短裙 已卖八件据外媒报道，土耳其珠宝商阿塔坎(Ahmet Atakan)设计出一款纯金打造的低胸背心短裙，短裙耗费7.8万块金片缝制，设计简约，在灯光照射下非常夺目。据报道，该短裙设计极为简约，短袖与低胸设计能让穿着者在舞会中吸引众人眼光。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113549_st9mhlec4n.jpg', 0, '当地时间2014年5月7日，俄罗斯圣彼得堡，俄罗斯警察学院的女学员们正在进行阅兵演练，为即将举行的抗击纳粹胜利纪念日做准备。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113549_alq9g5niv1.jpg', 1, '图为当地时间2014年9月15日，伊拉克库尔吉克市西北50公里外的底比斯镇，一名库尔德斯坦自由党的伊朗籍库尔德女兵在镜头前留影。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113550_kqw9c337dx.jpg', 2, '当地时间2014年4月5日，巴勒斯坦西岸的耶利哥，25名巴勒斯坦女兵组成的总统护卫队正在接受训练。她们是首批入选总统护卫队的女兵，总统护卫队共有士兵2600名，他们都是巴勒斯坦部队的精英份子。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113550_r3od8ni3ju.jpg', 3, '5月15日，中国国家主席习近平在北京人民大会堂东门外广场举行仪式欢迎葡萄牙总统席尔瓦访华期间，解放军三军仪仗队女仪仗兵一展风采。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113550_poq1s013lw.jpg', 4, '当地时间2014年5月7日，越南奠边府市，越南的退伍军人，政党领导以及外交大使们出席奠边府战役胜利60周年，图为越南女兵身着军装在纪念仪式上进行阅兵展示。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113551_eh8tc6wyax.jpg', 5, '9月12日，解放军某特战旅女子特战队员们在野外特训。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113551_9trjftyh6i.jpg', 6, '当地时间2014年4月6日，巴勒斯坦西岸城市耶利哥，巴勒斯坦总统护卫队的女兵正在观看训练课程。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113552_16dqpddo9r.jpg', 7, '当地时间2014年5月29日，以色列基布兹斯德博克附近的内盖夫沙漠，以色列“狞猫营”的士兵们刚完成一次20公里的比赛。“狞猫”营成立于2001年，是以色列军队仅有的一支男女混编的步兵营，其中女兵占总人数的70%。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113552_bsodmncdlp.jpg', 8, '当地时间2014年12月1日，罗马尼亚首府布加勒斯特，一队罗马尼亚女兵为参加罗马尼亚国庆阅兵做准备。她们冒着严寒，面带微笑。');
INSERT INTO `cms_info_image` VALUES (165, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201412/20141209113553_berjmcbpmn.jpg', 9, '当地时间2014年5月28日，泰国曼谷，一名女兵和战友在胜利纪念碑前站岗。5月22日，泰国军方陆军总司令巴育·占奥差发动军事政变，他与军方官员通过电视向全国宣布接管政府。并向公众宣布，他的军事集团已经监禁前总理英拉及其多位家人，但他们会被善待。');
INSERT INTO `cms_info_image` VALUES (143, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223173420_049xocsg6y.jpg', 0, NULL);
INSERT INTO `cms_info_image` VALUES (143, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223173420_2i93y1uyed.jpg', 1, NULL);
INSERT INTO `cms_info_image` VALUES (143, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223173421_qur7bdmuj1.jpg', 2, NULL);
INSERT INTO `cms_info_image` VALUES (143, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223173421_le6dcs65fv.jpg', 3, NULL);
INSERT INTO `cms_info_image` VALUES (143, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223173422_wpg8hjbm0k.jpg', 4, NULL);
INSERT INTO `cms_info_image` VALUES (78, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223174011_muwkqsdgq4.jpg', 2, NULL);
INSERT INTO `cms_info_image` VALUES (78, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223174011_b0nfmrmf8x.jpg', 3, NULL);
INSERT INTO `cms_info_image` VALUES (78, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223174010_75e0xyhrfi.jpg', 4, NULL);
INSERT INTO `cms_info_image` VALUES (78, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223174011_pqlqyh8ye6.jpg', 5, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175840_8j58oihs4t.jpg', 0, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175844_6r3k9ot7s3.jpg', 1, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175839_71g880fxd8.jpg', 2, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175840_4brgfv8vbq.jpg', 3, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175843_cr45dc9tpl.jpg', 4, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175841_ttklfuq7i0.jpg', 5, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175841_35qnii2sbt.jpg', 6, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175843_6v6lrpc8yp.jpg', 7, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175841_xcj2e7kv64.jpg', 8, NULL);
INSERT INTO `cms_info_image` VALUES (141, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223175840_13yidjxqxg.jpg', 9, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211125_97q8mau5l8.jpg', 0, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211125_s49ca7d5ci.jpg', 1, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211126_k8c0bmguak.jpg', 2, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211126_x2tlg2bw2t.jpg', 3, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211126_moj3xt6tg2.jpg', 4, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211126_9q1k7us2gq.jpg', 5, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211127_9gb5tt1dne.jpg', 6, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211127_s9a4gtmnjq.jpg', 7, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211128_y3iojjppsb.jpg', 8, NULL);
INSERT INTO `cms_info_image` VALUES (142, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223211128_n6kwcner3u.jpg', 9, NULL);
INSERT INTO `cms_info_image` VALUES (81, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223212829_vyo79ru5fl.jpg', 2, NULL);
INSERT INTO `cms_info_image` VALUES (81, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223212829_s9umb80qtt.jpg', 3, NULL);
INSERT INTO `cms_info_image` VALUES (81, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223212829_lo0pmry8fs.jpg', 4, NULL);
INSERT INTO `cms_info_image` VALUES (81, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151223212830_yqc3a9h3q4.jpg', 5, NULL);

-- ----------------------------
-- Table structure for cms_info_membergroup
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_membergroup`;
CREATE TABLE `cms_info_membergroup`  (
  `f_membergroup_id` int(11) NOT NULL,
  `f_info_id` int(11) NOT NULL,
  `f_is_view_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否有浏览权限',
  INDEX `fk_cms_infomgroup_info`(`f_info_id`) USING BTREE,
  INDEX `fk_cms_infomgroup_mgroup`(`f_membergroup_id`) USING BTREE,
  CONSTRAINT `fk_cms_infomgroup_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_infomgroup_mgroup` FOREIGN KEY (`f_membergroup_id`) REFERENCES `cms_member_group` (`f_membergroup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档与会员组权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_membergroup
-- ----------------------------
INSERT INTO `cms_info_membergroup` VALUES (0, 93, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 93, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 83, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 83, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 117, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 117, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 118, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 118, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 126, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 126, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 127, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 127, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 128, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 128, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 32, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 32, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 78, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 78, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 81, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 81, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 46, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 46, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 54, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 54, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 48, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 48, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 129, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 129, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 94, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 94, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 98, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 98, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 130, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 130, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 97, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 97, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 95, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 95, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 131, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 131, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 132, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 132, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 133, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 133, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 134, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 134, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 135, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 135, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 136, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 136, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 87, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 87, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 137, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 137, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 138, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 138, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 139, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 139, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 140, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 140, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 99, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 99, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 35, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 35, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 141, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 141, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 80, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 80, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 142, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 142, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 143, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 143, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 26, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 26, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 50, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 50, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 144, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 144, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 145, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 145, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 146, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 146, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 148, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 148, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 149, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 149, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 150, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 150, '0');
INSERT INTO `cms_info_membergroup` VALUES (0, 100, '0');
INSERT INTO `cms_info_membergroup` VALUES (1, 100, '0');

-- ----------------------------
-- Table structure for cms_info_node
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_node`;
CREATE TABLE `cms_info_node`  (
  `f_info_id` int(11) NOT NULL COMMENT '文档',
  `f_node_id` int(11) NOT NULL COMMENT '栏目',
  `f_node_index` int(11) NULL DEFAULT 0 COMMENT '栏目顺序',
  INDEX `fk_cms_infonode_info`(`f_info_id`) USING BTREE,
  INDEX `fk_cms_infonode_node`(`f_node_id`) USING BTREE,
  CONSTRAINT `fk_cms_infonode_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_infonode_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档与栏目关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_node
-- ----------------------------
INSERT INTO `cms_info_node` VALUES (47, 40, 0);
INSERT INTO `cms_info_node` VALUES (28, 42, 0);
INSERT INTO `cms_info_node` VALUES (25, 42, 0);
INSERT INTO `cms_info_node` VALUES (24, 42, 0);
INSERT INTO `cms_info_node` VALUES (30, 44, 0);
INSERT INTO `cms_info_node` VALUES (44, 38, 0);
INSERT INTO `cms_info_node` VALUES (43, 38, 0);
INSERT INTO `cms_info_node` VALUES (73, 38, 0);
INSERT INTO `cms_info_node` VALUES (45, 38, 0);
INSERT INTO `cms_info_node` VALUES (49, 40, 0);
INSERT INTO `cms_info_node` VALUES (117, 69, 0);
INSERT INTO `cms_info_node` VALUES (118, 69, 0);
INSERT INTO `cms_info_node` VALUES (52, 42, 0);
INSERT INTO `cms_info_node` VALUES (27, 42, 0);
INSERT INTO `cms_info_node` VALUES (36, 42, 0);
INSERT INTO `cms_info_node` VALUES (33, 42, 0);
INSERT INTO `cms_info_node` VALUES (34, 42, 0);
INSERT INTO `cms_info_node` VALUES (46, 38, 0);
INSERT INTO `cms_info_node` VALUES (54, 42, 0);
INSERT INTO `cms_info_node` VALUES (48, 40, 0);
INSERT INTO `cms_info_node` VALUES (135, 77, 0);
INSERT INTO `cms_info_node` VALUES (134, 79, 0);
INSERT INTO `cms_info_node` VALUES (133, 79, 0);
INSERT INTO `cms_info_node` VALUES (93, 78, 0);
INSERT INTO `cms_info_node` VALUES (83, 79, 0);
INSERT INTO `cms_info_node` VALUES (137, 80, 0);
INSERT INTO `cms_info_node` VALUES (138, 80, 0);
INSERT INTO `cms_info_node` VALUES (127, 42, 0);
INSERT INTO `cms_info_node` VALUES (99, 44, 0);
INSERT INTO `cms_info_node` VALUES (35, 42, 0);
INSERT INTO `cms_info_node` VALUES (140, 81, 0);
INSERT INTO `cms_info_node` VALUES (139, 81, 0);
INSERT INTO `cms_info_node` VALUES (26, 40, 0);
INSERT INTO `cms_info_node` VALUES (50, 40, 0);
INSERT INTO `cms_info_node` VALUES (144, 69, 0);
INSERT INTO `cms_info_node` VALUES (145, 69, 0);
INSERT INTO `cms_info_node` VALUES (146, 69, 0);
INSERT INTO `cms_info_node` VALUES (148, 78, 0);
INSERT INTO `cms_info_node` VALUES (149, 78, 0);
INSERT INTO `cms_info_node` VALUES (150, 79, 0);
INSERT INTO `cms_info_node` VALUES (128, 42, 0);
INSERT INTO `cms_info_node` VALUES (126, 42, 0);
INSERT INTO `cms_info_node` VALUES (32, 44, 0);
INSERT INTO `cms_info_node` VALUES (100, 44, 0);
INSERT INTO `cms_info_node` VALUES (143, 88, 0);
INSERT INTO `cms_info_node` VALUES (142, 87, 0);
INSERT INTO `cms_info_node` VALUES (78, 88, 0);
INSERT INTO `cms_info_node` VALUES (141, 88, 0);
INSERT INTO `cms_info_node` VALUES (81, 90, 0);
INSERT INTO `cms_info_node` VALUES (87, 82, 0);
INSERT INTO `cms_info_node` VALUES (130, 83, 0);
INSERT INTO `cms_info_node` VALUES (95, 85, 0);
INSERT INTO `cms_info_node` VALUES (98, 83, 0);
INSERT INTO `cms_info_node` VALUES (97, 83, 0);
INSERT INTO `cms_info_node` VALUES (163, 94, 0);
INSERT INTO `cms_info_node` VALUES (166, 82, 0);
INSERT INTO `cms_info_node` VALUES (167, 82, 0);
INSERT INTO `cms_info_node` VALUES (168, 80, 0);
INSERT INTO `cms_info_node` VALUES (169, 80, 0);
INSERT INTO `cms_info_node` VALUES (165, 88, 0);
INSERT INTO `cms_info_node` VALUES (151, 82, 0);
INSERT INTO `cms_info_node` VALUES (170, 81, 0);
INSERT INTO `cms_info_node` VALUES (172, 82, 0);
INSERT INTO `cms_info_node` VALUES (173, 82, 0);
INSERT INTO `cms_info_node` VALUES (174, 81, 0);
INSERT INTO `cms_info_node` VALUES (180, 44, 0);
INSERT INTO `cms_info_node` VALUES (80, 90, 0);
INSERT INTO `cms_info_node` VALUES (164, 87, 0);
INSERT INTO `cms_info_node` VALUES (129, 84, 0);
INSERT INTO `cms_info_node` VALUES (131, 96, 0);
INSERT INTO `cms_info_node` VALUES (132, 95, 0);
INSERT INTO `cms_info_node` VALUES (94, 84, 0);
INSERT INTO `cms_info_node` VALUES (136, 77, 0);
INSERT INTO `cms_info_node` VALUES (162, 93, 0);
INSERT INTO `cms_info_node` VALUES (53, 44, 0);
INSERT INTO `cms_info_node` VALUES (221, 42, 0);
INSERT INTO `cms_info_node` VALUES (222, 42, 0);
INSERT INTO `cms_info_node` VALUES (223, 42, 0);
INSERT INTO `cms_info_node` VALUES (224, 42, 0);
INSERT INTO `cms_info_node` VALUES (225, 42, 0);
INSERT INTO `cms_info_node` VALUES (226, 42, 0);
INSERT INTO `cms_info_node` VALUES (227, 42, 0);
INSERT INTO `cms_info_node` VALUES (228, 42, 0);
INSERT INTO `cms_info_node` VALUES (229, 42, 0);
INSERT INTO `cms_info_node` VALUES (230, 42, 0);
INSERT INTO `cms_info_node` VALUES (231, 42, 0);
INSERT INTO `cms_info_node` VALUES (232, 42, 0);
INSERT INTO `cms_info_node` VALUES (233, 42, 0);
INSERT INTO `cms_info_node` VALUES (234, 42, 0);
INSERT INTO `cms_info_node` VALUES (235, 42, 0);
INSERT INTO `cms_info_node` VALUES (236, 42, 0);
INSERT INTO `cms_info_node` VALUES (237, 42, 0);
INSERT INTO `cms_info_node` VALUES (238, 42, 0);
INSERT INTO `cms_info_node` VALUES (239, 42, 0);
INSERT INTO `cms_info_node` VALUES (240, 42, 0);
INSERT INTO `cms_info_node` VALUES (241, 42, 0);
INSERT INTO `cms_info_node` VALUES (242, 42, 0);
INSERT INTO `cms_info_node` VALUES (243, 42, 0);
INSERT INTO `cms_info_node` VALUES (244, 42, 0);
INSERT INTO `cms_info_node` VALUES (245, 42, 0);
INSERT INTO `cms_info_node` VALUES (246, 42, 0);
INSERT INTO `cms_info_node` VALUES (247, 42, 0);
INSERT INTO `cms_info_node` VALUES (248, 42, 0);
INSERT INTO `cms_info_node` VALUES (249, 42, 0);
INSERT INTO `cms_info_node` VALUES (250, 42, 0);
INSERT INTO `cms_info_node` VALUES (251, 42, 0);
INSERT INTO `cms_info_node` VALUES (252, 42, 0);
INSERT INTO `cms_info_node` VALUES (253, 42, 0);
INSERT INTO `cms_info_node` VALUES (254, 42, 0);
INSERT INTO `cms_info_node` VALUES (255, 42, 0);
INSERT INTO `cms_info_node` VALUES (256, 42, 0);
INSERT INTO `cms_info_node` VALUES (257, 42, 0);
INSERT INTO `cms_info_node` VALUES (258, 42, 0);
INSERT INTO `cms_info_node` VALUES (259, 42, 0);
INSERT INTO `cms_info_node` VALUES (260, 42, 0);
INSERT INTO `cms_info_node` VALUES (261, 42, 0);
INSERT INTO `cms_info_node` VALUES (262, 42, 0);
INSERT INTO `cms_info_node` VALUES (263, 42, 0);
INSERT INTO `cms_info_node` VALUES (264, 42, 0);
INSERT INTO `cms_info_node` VALUES (265, 42, 0);
INSERT INTO `cms_info_node` VALUES (266, 42, 0);
INSERT INTO `cms_info_node` VALUES (267, 42, 0);
INSERT INTO `cms_info_node` VALUES (268, 42, 0);
INSERT INTO `cms_info_node` VALUES (269, 42, 0);
INSERT INTO `cms_info_node` VALUES (270, 42, 0);
INSERT INTO `cms_info_node` VALUES (271, 42, 0);
INSERT INTO `cms_info_node` VALUES (272, 42, 0);
INSERT INTO `cms_info_node` VALUES (273, 42, 0);
INSERT INTO `cms_info_node` VALUES (274, 42, 0);
INSERT INTO `cms_info_node` VALUES (275, 42, 0);
INSERT INTO `cms_info_node` VALUES (276, 42, 0);
INSERT INTO `cms_info_node` VALUES (277, 42, 0);
INSERT INTO `cms_info_node` VALUES (278, 42, 0);
INSERT INTO `cms_info_node` VALUES (279, 42, 0);
INSERT INTO `cms_info_node` VALUES (280, 42, 0);
INSERT INTO `cms_info_node` VALUES (281, 42, 0);
INSERT INTO `cms_info_node` VALUES (282, 42, 0);
INSERT INTO `cms_info_node` VALUES (283, 42, 0);
INSERT INTO `cms_info_node` VALUES (284, 42, 0);
INSERT INTO `cms_info_node` VALUES (285, 42, 0);
INSERT INTO `cms_info_node` VALUES (286, 42, 0);
INSERT INTO `cms_info_node` VALUES (287, 42, 0);
INSERT INTO `cms_info_node` VALUES (288, 42, 0);
INSERT INTO `cms_info_node` VALUES (289, 42, 0);
INSERT INTO `cms_info_node` VALUES (290, 42, 0);
INSERT INTO `cms_info_node` VALUES (291, 42, 0);
INSERT INTO `cms_info_node` VALUES (292, 42, 0);
INSERT INTO `cms_info_node` VALUES (293, 42, 0);
INSERT INTO `cms_info_node` VALUES (294, 42, 0);
INSERT INTO `cms_info_node` VALUES (295, 42, 0);
INSERT INTO `cms_info_node` VALUES (296, 42, 0);
INSERT INTO `cms_info_node` VALUES (297, 42, 0);
INSERT INTO `cms_info_node` VALUES (298, 42, 0);
INSERT INTO `cms_info_node` VALUES (299, 42, 0);
INSERT INTO `cms_info_node` VALUES (300, 42, 0);
INSERT INTO `cms_info_node` VALUES (301, 42, 0);
INSERT INTO `cms_info_node` VALUES (302, 42, 0);
INSERT INTO `cms_info_node` VALUES (303, 42, 0);
INSERT INTO `cms_info_node` VALUES (304, 42, 0);
INSERT INTO `cms_info_node` VALUES (305, 42, 0);
INSERT INTO `cms_info_node` VALUES (306, 42, 0);
INSERT INTO `cms_info_node` VALUES (307, 42, 0);
INSERT INTO `cms_info_node` VALUES (308, 42, 0);
INSERT INTO `cms_info_node` VALUES (309, 42, 0);
INSERT INTO `cms_info_node` VALUES (310, 42, 0);
INSERT INTO `cms_info_node` VALUES (311, 42, 0);
INSERT INTO `cms_info_node` VALUES (312, 42, 0);
INSERT INTO `cms_info_node` VALUES (313, 42, 0);
INSERT INTO `cms_info_node` VALUES (314, 42, 0);
INSERT INTO `cms_info_node` VALUES (315, 42, 0);
INSERT INTO `cms_info_node` VALUES (316, 42, 0);
INSERT INTO `cms_info_node` VALUES (317, 42, 0);
INSERT INTO `cms_info_node` VALUES (318, 42, 0);
INSERT INTO `cms_info_node` VALUES (319, 42, 0);
INSERT INTO `cms_info_node` VALUES (320, 42, 0);
INSERT INTO `cms_info_node` VALUES (321, 42, 0);
INSERT INTO `cms_info_node` VALUES (322, 42, 0);
INSERT INTO `cms_info_node` VALUES (323, 42, 0);
INSERT INTO `cms_info_node` VALUES (324, 42, 0);
INSERT INTO `cms_info_node` VALUES (325, 42, 0);
INSERT INTO `cms_info_node` VALUES (326, 42, 0);
INSERT INTO `cms_info_node` VALUES (327, 42, 0);
INSERT INTO `cms_info_node` VALUES (328, 42, 0);
INSERT INTO `cms_info_node` VALUES (329, 42, 0);
INSERT INTO `cms_info_node` VALUES (330, 42, 0);
INSERT INTO `cms_info_node` VALUES (331, 42, 0);
INSERT INTO `cms_info_node` VALUES (332, 42, 0);
INSERT INTO `cms_info_node` VALUES (333, 42, 0);
INSERT INTO `cms_info_node` VALUES (334, 42, 0);
INSERT INTO `cms_info_node` VALUES (335, 42, 0);
INSERT INTO `cms_info_node` VALUES (336, 42, 0);
INSERT INTO `cms_info_node` VALUES (337, 42, 0);
INSERT INTO `cms_info_node` VALUES (338, 42, 0);
INSERT INTO `cms_info_node` VALUES (339, 42, 0);
INSERT INTO `cms_info_node` VALUES (340, 42, 0);
INSERT INTO `cms_info_node` VALUES (341, 42, 0);
INSERT INTO `cms_info_node` VALUES (342, 42, 0);
INSERT INTO `cms_info_node` VALUES (343, 42, 0);
INSERT INTO `cms_info_node` VALUES (344, 42, 0);
INSERT INTO `cms_info_node` VALUES (345, 42, 0);
INSERT INTO `cms_info_node` VALUES (346, 42, 0);
INSERT INTO `cms_info_node` VALUES (347, 42, 0);
INSERT INTO `cms_info_node` VALUES (348, 42, 0);
INSERT INTO `cms_info_node` VALUES (349, 42, 0);
INSERT INTO `cms_info_node` VALUES (350, 42, 0);
INSERT INTO `cms_info_node` VALUES (351, 42, 0);
INSERT INTO `cms_info_node` VALUES (352, 42, 0);
INSERT INTO `cms_info_node` VALUES (353, 42, 0);
INSERT INTO `cms_info_node` VALUES (354, 42, 0);
INSERT INTO `cms_info_node` VALUES (355, 42, 0);
INSERT INTO `cms_info_node` VALUES (356, 42, 0);
INSERT INTO `cms_info_node` VALUES (357, 42, 0);
INSERT INTO `cms_info_node` VALUES (358, 42, 0);
INSERT INTO `cms_info_node` VALUES (359, 42, 0);
INSERT INTO `cms_info_node` VALUES (360, 42, 0);
INSERT INTO `cms_info_node` VALUES (361, 42, 0);
INSERT INTO `cms_info_node` VALUES (362, 42, 0);
INSERT INTO `cms_info_node` VALUES (363, 42, 0);
INSERT INTO `cms_info_node` VALUES (364, 42, 0);
INSERT INTO `cms_info_node` VALUES (365, 42, 0);
INSERT INTO `cms_info_node` VALUES (366, 42, 0);
INSERT INTO `cms_info_node` VALUES (367, 42, 0);
INSERT INTO `cms_info_node` VALUES (368, 42, 0);
INSERT INTO `cms_info_node` VALUES (369, 42, 0);
INSERT INTO `cms_info_node` VALUES (370, 42, 0);
INSERT INTO `cms_info_node` VALUES (371, 42, 0);
INSERT INTO `cms_info_node` VALUES (372, 42, 0);
INSERT INTO `cms_info_node` VALUES (373, 42, 0);
INSERT INTO `cms_info_node` VALUES (374, 42, 0);
INSERT INTO `cms_info_node` VALUES (375, 42, 0);
INSERT INTO `cms_info_node` VALUES (376, 42, 0);
INSERT INTO `cms_info_node` VALUES (377, 42, 0);
INSERT INTO `cms_info_node` VALUES (378, 42, 0);
INSERT INTO `cms_info_node` VALUES (379, 42, 0);
INSERT INTO `cms_info_node` VALUES (380, 42, 0);
INSERT INTO `cms_info_node` VALUES (381, 42, 0);
INSERT INTO `cms_info_node` VALUES (382, 42, 0);
INSERT INTO `cms_info_node` VALUES (383, 42, 0);
INSERT INTO `cms_info_node` VALUES (384, 42, 0);
INSERT INTO `cms_info_node` VALUES (385, 42, 0);
INSERT INTO `cms_info_node` VALUES (386, 42, 0);
INSERT INTO `cms_info_node` VALUES (387, 42, 0);
INSERT INTO `cms_info_node` VALUES (388, 42, 0);
INSERT INTO `cms_info_node` VALUES (389, 42, 0);
INSERT INTO `cms_info_node` VALUES (390, 42, 0);
INSERT INTO `cms_info_node` VALUES (391, 42, 0);
INSERT INTO `cms_info_node` VALUES (392, 42, 0);
INSERT INTO `cms_info_node` VALUES (393, 42, 0);
INSERT INTO `cms_info_node` VALUES (394, 42, 0);
INSERT INTO `cms_info_node` VALUES (395, 42, 0);
INSERT INTO `cms_info_node` VALUES (396, 42, 0);
INSERT INTO `cms_info_node` VALUES (397, 42, 0);
INSERT INTO `cms_info_node` VALUES (398, 42, 0);
INSERT INTO `cms_info_node` VALUES (399, 42, 0);
INSERT INTO `cms_info_node` VALUES (400, 42, 0);
INSERT INTO `cms_info_node` VALUES (401, 42, 0);
INSERT INTO `cms_info_node` VALUES (402, 42, 0);
INSERT INTO `cms_info_node` VALUES (403, 42, 0);
INSERT INTO `cms_info_node` VALUES (404, 42, 0);
INSERT INTO `cms_info_node` VALUES (405, 42, 0);
INSERT INTO `cms_info_node` VALUES (406, 42, 0);
INSERT INTO `cms_info_node` VALUES (407, 42, 0);
INSERT INTO `cms_info_node` VALUES (408, 42, 0);
INSERT INTO `cms_info_node` VALUES (409, 42, 0);
INSERT INTO `cms_info_node` VALUES (410, 42, 0);
INSERT INTO `cms_info_node` VALUES (411, 42, 0);
INSERT INTO `cms_info_node` VALUES (412, 42, 0);
INSERT INTO `cms_info_node` VALUES (413, 42, 0);
INSERT INTO `cms_info_node` VALUES (414, 42, 0);
INSERT INTO `cms_info_node` VALUES (415, 42, 0);
INSERT INTO `cms_info_node` VALUES (416, 42, 0);
INSERT INTO `cms_info_node` VALUES (417, 42, 0);
INSERT INTO `cms_info_node` VALUES (418, 42, 0);
INSERT INTO `cms_info_node` VALUES (419, 42, 0);
INSERT INTO `cms_info_node` VALUES (420, 42, 0);
INSERT INTO `cms_info_node` VALUES (421, 42, 0);
INSERT INTO `cms_info_node` VALUES (422, 42, 0);
INSERT INTO `cms_info_node` VALUES (423, 42, 0);
INSERT INTO `cms_info_node` VALUES (424, 42, 0);
INSERT INTO `cms_info_node` VALUES (425, 42, 0);
INSERT INTO `cms_info_node` VALUES (426, 42, 0);
INSERT INTO `cms_info_node` VALUES (427, 42, 0);
INSERT INTO `cms_info_node` VALUES (428, 42, 0);
INSERT INTO `cms_info_node` VALUES (429, 42, 0);
INSERT INTO `cms_info_node` VALUES (430, 42, 0);
INSERT INTO `cms_info_node` VALUES (431, 42, 0);
INSERT INTO `cms_info_node` VALUES (432, 42, 0);
INSERT INTO `cms_info_node` VALUES (433, 42, 0);
INSERT INTO `cms_info_node` VALUES (434, 42, 0);
INSERT INTO `cms_info_node` VALUES (435, 42, 0);
INSERT INTO `cms_info_node` VALUES (436, 42, 0);
INSERT INTO `cms_info_node` VALUES (437, 42, 0);
INSERT INTO `cms_info_node` VALUES (438, 42, 0);
INSERT INTO `cms_info_node` VALUES (439, 42, 0);
INSERT INTO `cms_info_node` VALUES (440, 42, 0);
INSERT INTO `cms_info_node` VALUES (441, 42, 0);
INSERT INTO `cms_info_node` VALUES (442, 42, 0);
INSERT INTO `cms_info_node` VALUES (443, 42, 0);
INSERT INTO `cms_info_node` VALUES (444, 42, 0);
INSERT INTO `cms_info_node` VALUES (445, 42, 0);
INSERT INTO `cms_info_node` VALUES (446, 42, 0);
INSERT INTO `cms_info_node` VALUES (447, 42, 0);
INSERT INTO `cms_info_node` VALUES (448, 42, 0);
INSERT INTO `cms_info_node` VALUES (449, 42, 0);
INSERT INTO `cms_info_node` VALUES (450, 42, 0);
INSERT INTO `cms_info_node` VALUES (451, 42, 0);
INSERT INTO `cms_info_node` VALUES (452, 42, 0);
INSERT INTO `cms_info_node` VALUES (453, 42, 0);
INSERT INTO `cms_info_node` VALUES (454, 42, 0);
INSERT INTO `cms_info_node` VALUES (455, 42, 0);
INSERT INTO `cms_info_node` VALUES (456, 42, 0);
INSERT INTO `cms_info_node` VALUES (457, 42, 0);
INSERT INTO `cms_info_node` VALUES (458, 42, 0);
INSERT INTO `cms_info_node` VALUES (459, 42, 0);
INSERT INTO `cms_info_node` VALUES (460, 42, 0);
INSERT INTO `cms_info_node` VALUES (461, 42, 0);
INSERT INTO `cms_info_node` VALUES (462, 42, 0);
INSERT INTO `cms_info_node` VALUES (463, 42, 0);
INSERT INTO `cms_info_node` VALUES (464, 42, 0);
INSERT INTO `cms_info_node` VALUES (465, 42, 0);
INSERT INTO `cms_info_node` VALUES (466, 42, 0);
INSERT INTO `cms_info_node` VALUES (467, 42, 0);
INSERT INTO `cms_info_node` VALUES (468, 42, 0);
INSERT INTO `cms_info_node` VALUES (469, 42, 0);
INSERT INTO `cms_info_node` VALUES (470, 42, 0);
INSERT INTO `cms_info_node` VALUES (471, 42, 0);
INSERT INTO `cms_info_node` VALUES (472, 42, 0);
INSERT INTO `cms_info_node` VALUES (473, 42, 0);
INSERT INTO `cms_info_node` VALUES (474, 42, 0);
INSERT INTO `cms_info_node` VALUES (475, 42, 0);
INSERT INTO `cms_info_node` VALUES (476, 42, 0);
INSERT INTO `cms_info_node` VALUES (477, 42, 0);
INSERT INTO `cms_info_node` VALUES (478, 42, 0);
INSERT INTO `cms_info_node` VALUES (479, 42, 0);
INSERT INTO `cms_info_node` VALUES (480, 42, 0);
INSERT INTO `cms_info_node` VALUES (481, 42, 0);
INSERT INTO `cms_info_node` VALUES (482, 42, 0);
INSERT INTO `cms_info_node` VALUES (483, 42, 0);
INSERT INTO `cms_info_node` VALUES (484, 42, 0);
INSERT INTO `cms_info_node` VALUES (485, 42, 0);
INSERT INTO `cms_info_node` VALUES (486, 42, 0);
INSERT INTO `cms_info_node` VALUES (487, 42, 0);
INSERT INTO `cms_info_node` VALUES (488, 42, 0);
INSERT INTO `cms_info_node` VALUES (489, 42, 0);
INSERT INTO `cms_info_node` VALUES (490, 42, 0);
INSERT INTO `cms_info_node` VALUES (491, 42, 0);
INSERT INTO `cms_info_node` VALUES (492, 42, 0);
INSERT INTO `cms_info_node` VALUES (493, 42, 0);
INSERT INTO `cms_info_node` VALUES (494, 42, 0);
INSERT INTO `cms_info_node` VALUES (495, 42, 0);
INSERT INTO `cms_info_node` VALUES (496, 42, 0);
INSERT INTO `cms_info_node` VALUES (497, 42, 0);
INSERT INTO `cms_info_node` VALUES (498, 42, 0);
INSERT INTO `cms_info_node` VALUES (499, 42, 0);
INSERT INTO `cms_info_node` VALUES (500, 42, 0);
INSERT INTO `cms_info_node` VALUES (501, 42, 0);
INSERT INTO `cms_info_node` VALUES (502, 42, 0);
INSERT INTO `cms_info_node` VALUES (503, 42, 0);
INSERT INTO `cms_info_node` VALUES (504, 42, 0);
INSERT INTO `cms_info_node` VALUES (505, 42, 0);
INSERT INTO `cms_info_node` VALUES (506, 42, 0);
INSERT INTO `cms_info_node` VALUES (507, 42, 0);
INSERT INTO `cms_info_node` VALUES (508, 42, 0);
INSERT INTO `cms_info_node` VALUES (509, 42, 0);
INSERT INTO `cms_info_node` VALUES (510, 42, 0);
INSERT INTO `cms_info_node` VALUES (511, 42, 0);
INSERT INTO `cms_info_node` VALUES (512, 42, 0);
INSERT INTO `cms_info_node` VALUES (513, 42, 0);
INSERT INTO `cms_info_node` VALUES (514, 42, 0);
INSERT INTO `cms_info_node` VALUES (515, 42, 0);
INSERT INTO `cms_info_node` VALUES (516, 42, 0);
INSERT INTO `cms_info_node` VALUES (517, 42, 0);
INSERT INTO `cms_info_node` VALUES (518, 42, 0);
INSERT INTO `cms_info_node` VALUES (519, 42, 0);
INSERT INTO `cms_info_node` VALUES (520, 42, 0);
INSERT INTO `cms_info_node` VALUES (521, 42, 0);
INSERT INTO `cms_info_node` VALUES (522, 42, 0);
INSERT INTO `cms_info_node` VALUES (523, 42, 0);
INSERT INTO `cms_info_node` VALUES (524, 42, 0);
INSERT INTO `cms_info_node` VALUES (525, 42, 0);
INSERT INTO `cms_info_node` VALUES (526, 42, 0);
INSERT INTO `cms_info_node` VALUES (527, 42, 0);
INSERT INTO `cms_info_node` VALUES (528, 42, 0);
INSERT INTO `cms_info_node` VALUES (529, 42, 0);
INSERT INTO `cms_info_node` VALUES (530, 42, 0);
INSERT INTO `cms_info_node` VALUES (531, 42, 0);
INSERT INTO `cms_info_node` VALUES (532, 42, 0);
INSERT INTO `cms_info_node` VALUES (533, 42, 0);
INSERT INTO `cms_info_node` VALUES (534, 42, 0);
INSERT INTO `cms_info_node` VALUES (535, 42, 0);
INSERT INTO `cms_info_node` VALUES (536, 42, 0);
INSERT INTO `cms_info_node` VALUES (537, 42, 0);
INSERT INTO `cms_info_node` VALUES (538, 42, 0);
INSERT INTO `cms_info_node` VALUES (539, 42, 0);
INSERT INTO `cms_info_node` VALUES (540, 42, 0);
INSERT INTO `cms_info_node` VALUES (541, 42, 0);
INSERT INTO `cms_info_node` VALUES (542, 42, 0);
INSERT INTO `cms_info_node` VALUES (543, 42, 0);
INSERT INTO `cms_info_node` VALUES (544, 42, 0);
INSERT INTO `cms_info_node` VALUES (545, 42, 0);
INSERT INTO `cms_info_node` VALUES (546, 42, 0);
INSERT INTO `cms_info_node` VALUES (547, 42, 0);
INSERT INTO `cms_info_node` VALUES (548, 42, 0);
INSERT INTO `cms_info_node` VALUES (549, 42, 0);
INSERT INTO `cms_info_node` VALUES (550, 42, 0);
INSERT INTO `cms_info_node` VALUES (551, 42, 0);
INSERT INTO `cms_info_node` VALUES (552, 42, 0);
INSERT INTO `cms_info_node` VALUES (553, 42, 0);
INSERT INTO `cms_info_node` VALUES (554, 42, 0);
INSERT INTO `cms_info_node` VALUES (555, 42, 0);
INSERT INTO `cms_info_node` VALUES (556, 42, 0);
INSERT INTO `cms_info_node` VALUES (557, 42, 0);
INSERT INTO `cms_info_node` VALUES (558, 42, 0);
INSERT INTO `cms_info_node` VALUES (559, 42, 0);
INSERT INTO `cms_info_node` VALUES (560, 42, 0);
INSERT INTO `cms_info_node` VALUES (561, 42, 0);
INSERT INTO `cms_info_node` VALUES (562, 42, 0);
INSERT INTO `cms_info_node` VALUES (563, 42, 0);
INSERT INTO `cms_info_node` VALUES (564, 42, 0);
INSERT INTO `cms_info_node` VALUES (565, 42, 0);
INSERT INTO `cms_info_node` VALUES (566, 42, 0);
INSERT INTO `cms_info_node` VALUES (567, 42, 0);
INSERT INTO `cms_info_node` VALUES (568, 42, 0);
INSERT INTO `cms_info_node` VALUES (569, 42, 0);
INSERT INTO `cms_info_node` VALUES (570, 42, 0);
INSERT INTO `cms_info_node` VALUES (571, 42, 0);
INSERT INTO `cms_info_node` VALUES (572, 42, 0);
INSERT INTO `cms_info_node` VALUES (573, 42, 0);
INSERT INTO `cms_info_node` VALUES (574, 42, 0);
INSERT INTO `cms_info_node` VALUES (575, 42, 0);
INSERT INTO `cms_info_node` VALUES (576, 42, 0);
INSERT INTO `cms_info_node` VALUES (577, 42, 0);
INSERT INTO `cms_info_node` VALUES (578, 42, 0);
INSERT INTO `cms_info_node` VALUES (579, 42, 0);

-- ----------------------------
-- Table structure for cms_info_org
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_org`;
CREATE TABLE `cms_info_org`  (
  `f_info_id` int(11) NOT NULL,
  `f_org_id` int(11) NOT NULL,
  `f_is_view_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否有浏览权限',
  INDEX `fk_cms_infoorg_info`(`f_info_id`) USING BTREE,
  INDEX `fk_cms_infoorg_org`(`f_org_id`) USING BTREE,
  CONSTRAINT `fk_cms_infoorg_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_infoorg_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档与组织权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_org
-- ----------------------------
INSERT INTO `cms_info_org` VALUES (93, 1, '0');
INSERT INTO `cms_info_org` VALUES (83, 1, '0');
INSERT INTO `cms_info_org` VALUES (117, 1, '0');
INSERT INTO `cms_info_org` VALUES (118, 1, '0');
INSERT INTO `cms_info_org` VALUES (126, 1, '0');
INSERT INTO `cms_info_org` VALUES (127, 1, '0');
INSERT INTO `cms_info_org` VALUES (128, 1, '0');
INSERT INTO `cms_info_org` VALUES (32, 1, '0');
INSERT INTO `cms_info_org` VALUES (78, 1, '0');
INSERT INTO `cms_info_org` VALUES (81, 1, '0');
INSERT INTO `cms_info_org` VALUES (46, 1, '0');
INSERT INTO `cms_info_org` VALUES (54, 1, '0');
INSERT INTO `cms_info_org` VALUES (48, 1, '0');
INSERT INTO `cms_info_org` VALUES (129, 1, '0');
INSERT INTO `cms_info_org` VALUES (94, 1, '0');
INSERT INTO `cms_info_org` VALUES (98, 1, '0');
INSERT INTO `cms_info_org` VALUES (130, 1, '0');
INSERT INTO `cms_info_org` VALUES (97, 1, '0');
INSERT INTO `cms_info_org` VALUES (95, 1, '0');
INSERT INTO `cms_info_org` VALUES (131, 1, '0');
INSERT INTO `cms_info_org` VALUES (132, 1, '0');
INSERT INTO `cms_info_org` VALUES (133, 1, '0');
INSERT INTO `cms_info_org` VALUES (134, 1, '0');
INSERT INTO `cms_info_org` VALUES (135, 1, '0');
INSERT INTO `cms_info_org` VALUES (136, 1, '0');
INSERT INTO `cms_info_org` VALUES (87, 1, '0');
INSERT INTO `cms_info_org` VALUES (137, 1, '0');
INSERT INTO `cms_info_org` VALUES (138, 1, '0');
INSERT INTO `cms_info_org` VALUES (139, 1, '0');
INSERT INTO `cms_info_org` VALUES (140, 1, '0');
INSERT INTO `cms_info_org` VALUES (99, 1, '0');
INSERT INTO `cms_info_org` VALUES (35, 1, '0');
INSERT INTO `cms_info_org` VALUES (141, 1, '0');
INSERT INTO `cms_info_org` VALUES (80, 1, '0');
INSERT INTO `cms_info_org` VALUES (142, 1, '0');
INSERT INTO `cms_info_org` VALUES (143, 1, '0');
INSERT INTO `cms_info_org` VALUES (26, 1, '0');
INSERT INTO `cms_info_org` VALUES (50, 1, '0');
INSERT INTO `cms_info_org` VALUES (144, 1, '0');
INSERT INTO `cms_info_org` VALUES (145, 1, '0');
INSERT INTO `cms_info_org` VALUES (146, 1, '0');
INSERT INTO `cms_info_org` VALUES (148, 1, '0');
INSERT INTO `cms_info_org` VALUES (149, 1, '0');
INSERT INTO `cms_info_org` VALUES (150, 1, '0');
INSERT INTO `cms_info_org` VALUES (100, 1, '0');

-- ----------------------------
-- Table structure for cms_info_push
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_push`;
CREATE TABLE `cms_info_push`  (
  `infopush_id_` int(11) NOT NULL,
  `info_id_` int(11) NOT NULL COMMENT '推送文档',
  `from_site_id_` int(11) NOT NULL COMMENT '推送源站点',
  `to_site_id_` int(11) NOT NULL COMMENT '推送目标站点',
  `user_id_` int(11) NOT NULL COMMENT '推送人',
  `created_` datetime(0) NOT NULL COMMENT '推送时间',
  PRIMARY KEY (`infopush_id_`) USING BTREE,
  INDEX `fk_cms_infopush_info`(`info_id_`) USING BTREE,
  INDEX `fk_cms_infopush_site_from`(`from_site_id_`) USING BTREE,
  INDEX `fk_cms_infopush_site_to`(`to_site_id_`) USING BTREE,
  INDEX `fk_cms_infopush_user`(`user_id_`) USING BTREE,
  CONSTRAINT `fk_cms_infopush_info` FOREIGN KEY (`info_id_`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_infopush_site_from` FOREIGN KEY (`from_site_id_`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_infopush_site_to` FOREIGN KEY (`to_site_id_`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_infopush_user` FOREIGN KEY (`user_id_`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档推送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_info_special
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_special`;
CREATE TABLE `cms_info_special`  (
  `f_info_id` int(11) NOT NULL COMMENT '文档',
  `f_special_id` int(11) NOT NULL COMMENT '专题',
  `f_special_index` int(11) NULL DEFAULT 0 COMMENT '专题序号',
  INDEX `fk_cms_infospecial_info`(`f_info_id`) USING BTREE,
  INDEX `fk_cms_infospecial_special`(`f_special_id`) USING BTREE,
  CONSTRAINT `fk_cms_infospecial_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_infospecial_special` FOREIGN KEY (`f_special_id`) REFERENCES `cms_special` (`f_special_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档与专题关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_special
-- ----------------------------
INSERT INTO `cms_info_special` VALUES (32, 11, 0);
INSERT INTO `cms_info_special` VALUES (49, 8, 0);
INSERT INTO `cms_info_special` VALUES (50, 8, 0);
INSERT INTO `cms_info_special` VALUES (48, 8, 0);
INSERT INTO `cms_info_special` VALUES (47, 8, 0);
INSERT INTO `cms_info_special` VALUES (30, 10, 0);
INSERT INTO `cms_info_special` VALUES (44, 2, 0);
INSERT INTO `cms_info_special` VALUES (43, 2, 0);
INSERT INTO `cms_info_special` VALUES (73, 2, 0);
INSERT INTO `cms_info_special` VALUES (45, 2, 0);
INSERT INTO `cms_info_special` VALUES (128, 13, 0);
INSERT INTO `cms_info_special` VALUES (53, 11, 0);
INSERT INTO `cms_info_special` VALUES (24, 8, 0);
INSERT INTO `cms_info_special` VALUES (25, 12, 0);
INSERT INTO `cms_info_special` VALUES (34, 10, 0);
INSERT INTO `cms_info_special` VALUES (127, 10, 0);
INSERT INTO `cms_info_special` VALUES (35, 2, 0);
INSERT INTO `cms_info_special` VALUES (28, 12, 0);
INSERT INTO `cms_info_special` VALUES (36, 10, 0);
INSERT INTO `cms_info_special` VALUES (27, 13, 0);
INSERT INTO `cms_info_special` VALUES (126, 10, 0);
INSERT INTO `cms_info_special` VALUES (99, 10, 0);
INSERT INTO `cms_info_special` VALUES (26, 12, 0);

-- ----------------------------
-- Table structure for cms_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_tag`;
CREATE TABLE `cms_info_tag`  (
  `f_info_id` int(11) NOT NULL COMMENT '文档',
  `f_tag_id` int(11) NOT NULL COMMENT 'tag',
  `f_tag_index` int(11) NULL DEFAULT 0 COMMENT 'tag序号',
  INDEX `fk_cms_infotag_info`(`f_info_id`) USING BTREE,
  INDEX `fk_cms_infotag_tag`(`f_tag_id`) USING BTREE,
  CONSTRAINT `fk_cms_infotag_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_infotag_tag` FOREIGN KEY (`f_tag_id`) REFERENCES `cms_tag` (`f_tag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档与tag关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_info_tag
-- ----------------------------
INSERT INTO `cms_info_tag` VALUES (30, 56, 0);
INSERT INTO `cms_info_tag` VALUES (30, 71, 1);
INSERT INTO `cms_info_tag` VALUES (30, 72, 2);
INSERT INTO `cms_info_tag` VALUES (30, 73, 3);
INSERT INTO `cms_info_tag` VALUES (53, 63, 0);
INSERT INTO `cms_info_tag` VALUES (53, 64, 1);
INSERT INTO `cms_info_tag` VALUES (53, 65, 2);
INSERT INTO `cms_info_tag` VALUES (53, 66, 3);
INSERT INTO `cms_info_tag` VALUES (52, 67, 0);
INSERT INTO `cms_info_tag` VALUES (52, 68, 1);
INSERT INTO `cms_info_tag` VALUES (52, 69, 2);
INSERT INTO `cms_info_tag` VALUES (52, 70, 3);
INSERT INTO `cms_info_tag` VALUES (54, 56, 0);
INSERT INTO `cms_info_tag` VALUES (54, 57, 1);
INSERT INTO `cms_info_tag` VALUES (54, 62, 2);
INSERT INTO `cms_info_tag` VALUES (78, 78, 0);
INSERT INTO `cms_info_tag` VALUES (78, 79, 1);
INSERT INTO `cms_info_tag` VALUES (78, 80, 2);
INSERT INTO `cms_info_tag` VALUES (128, 81, 0);
INSERT INTO `cms_info_tag` VALUES (128, 82, 1);
INSERT INTO `cms_info_tag` VALUES (128, 83, 2);
INSERT INTO `cms_info_tag` VALUES (166, 84, 0);
INSERT INTO `cms_info_tag` VALUES (168, 84, 0);
INSERT INTO `cms_info_tag` VALUES (170, 84, 0);
INSERT INTO `cms_info_tag` VALUES (167, 84, 0);
INSERT INTO `cms_info_tag` VALUES (151, 84, 0);
INSERT INTO `cms_info_tag` VALUES (169, 84, 0);
INSERT INTO `cms_info_tag` VALUES (87, 84, 0);
INSERT INTO `cms_info_tag` VALUES (140, 84, 0);
INSERT INTO `cms_info_tag` VALUES (137, 84, 0);
INSERT INTO `cms_info_tag` VALUES (139, 84, 0);
INSERT INTO `cms_info_tag` VALUES (138, 84, 0);
INSERT INTO `cms_info_tag` VALUES (174, 84, 0);
INSERT INTO `cms_info_tag` VALUES (173, 84, 0);
INSERT INTO `cms_info_tag` VALUES (172, 84, 0);

-- ----------------------------
-- Table structure for cms_mail_inbox
-- ----------------------------
DROP TABLE IF EXISTS `cms_mail_inbox`;
CREATE TABLE `cms_mail_inbox`  (
  `mailinbox_id_` int(11) NOT NULL,
  `mailoutbox_id_` int(11) NOT NULL,
  `mailtext_id_` int(11) NOT NULL,
  `sender_id_` int(11) NULL DEFAULT NULL COMMENT '发件人',
  `receiver_id_` int(11) NOT NULL COMMENT '接收人',
  `receive_time_` datetime(0) NOT NULL COMMENT '接收时间',
  `is_unread_` int(11) NOT NULL DEFAULT 1 COMMENT '是否未读',
  PRIMARY KEY (`mailinbox_id_`) USING BTREE,
  INDEX `fk_cms_mailinbox_outbox`(`mailoutbox_id_`) USING BTREE,
  INDEX `fk_cms_mailinbox_receiver`(`receiver_id_`) USING BTREE,
  INDEX `fk_cms_mailinbox_sender`(`sender_id_`) USING BTREE,
  INDEX `fk_cms_mailinbox_text`(`mailtext_id_`) USING BTREE,
  CONSTRAINT `fk_cms_mailinbox_outbox` FOREIGN KEY (`mailoutbox_id_`) REFERENCES `cms_mail_outbox` (`mailoutbox_id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_mailinbox_receiver` FOREIGN KEY (`receiver_id_`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_mailinbox_sender` FOREIGN KEY (`sender_id_`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_mailinbox_text` FOREIGN KEY (`mailtext_id_`) REFERENCES `cms_mail_text` (`mailtext_id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统消息收件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_mail_outbox
-- ----------------------------
DROP TABLE IF EXISTS `cms_mail_outbox`;
CREATE TABLE `cms_mail_outbox`  (
  `mailoutbox_id_` int(11) NOT NULL,
  `mailtext_id_` int(11) NOT NULL,
  `sender_id_` int(11) NULL DEFAULT NULL COMMENT '发送人',
  `send_time_` datetime(0) NOT NULL COMMENT '发送时间',
  `receiver_number_` int(11) NOT NULL COMMENT '接收人数',
  `read_number_` int(11) NOT NULL COMMENT '已读人数',
  PRIMARY KEY (`mailoutbox_id_`) USING BTREE,
  INDEX `fk_cms_mailoutbox_sender`(`sender_id_`) USING BTREE,
  INDEX `fk_cms_mailoutbox_text`(`mailtext_id_`) USING BTREE,
  CONSTRAINT `fk_cms_mailoutbox_sender` FOREIGN KEY (`sender_id_`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_mailoutbox_text` FOREIGN KEY (`mailtext_id_`) REFERENCES `cms_mail_text` (`mailtext_id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统消息发件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_mail_text
-- ----------------------------
DROP TABLE IF EXISTS `cms_mail_text`;
CREATE TABLE `cms_mail_text`  (
  `mailtext_id_` int(11) NOT NULL,
  `subject_` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `text_` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`mailtext_id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统消息正文表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_member_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_group`;
CREATE TABLE `cms_member_group`  (
  `f_membergroup_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `f_ip` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IP',
  `f_type` int(11) NOT NULL DEFAULT 0 COMMENT '类型(0:普通组,1:游客组,2:IP组,3:待验证组)',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  PRIMARY KEY (`f_membergroup_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_member_group
-- ----------------------------
INSERT INTO `cms_member_group` VALUES (0, '游客组', NULL, NULL, 1, 0);
INSERT INTO `cms_member_group` VALUES (1, '普通会员', NULL, NULL, 0, 2147483647);

-- ----------------------------
-- Table structure for cms_message
-- ----------------------------
DROP TABLE IF EXISTS `cms_message`;
CREATE TABLE `cms_message`  (
  `message_id_` int(11) NOT NULL COMMENT '私信',
  `sender_id_` int(11) NOT NULL COMMENT '发送人',
  `receiver_id_` int(11) NOT NULL COMMENT '收件人',
  `send_time_` datetime(0) NOT NULL COMMENT '发送时间',
  `deletion_flag_` int(11) NOT NULL DEFAULT 0 COMMENT '删除标志(0:正常;1:发件人删除;2:收件人删除;)',
  `is_unread_` int(11) NOT NULL DEFAULT 1 COMMENT '是否未读',
  PRIMARY KEY (`message_id_`) USING BTREE,
  INDEX `fk_cms_message_receiver`(`receiver_id_`) USING BTREE,
  INDEX `fk_cms_message_sender`(`sender_id_`) USING BTREE,
  CONSTRAINT `fk_cms_message_receiver` FOREIGN KEY (`receiver_id_`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_message_sender` FOREIGN KEY (`sender_id_`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '私信表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_message_text
-- ----------------------------
DROP TABLE IF EXISTS `cms_message_text`;
CREATE TABLE `cms_message_text`  (
  `message_id_` int(11) NOT NULL COMMENT '私信',
  `subject_` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `text_` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`message_id_`) USING BTREE,
  CONSTRAINT `fk_cms_messagetext_message` FOREIGN KEY (`message_id_`) REFERENCES `cms_message` (`message_id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '私信正文表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_model
-- ----------------------------
DROP TABLE IF EXISTS `cms_model`;
CREATE TABLE `cms_model`  (
  `f_model_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型(info:文档,node:栏目,node_home:首页;special:专题)',
  `f_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代码',
  `f_seq` int(11) NOT NULL DEFAULT 10 COMMENT '顺序',
  PRIMARY KEY (`f_model_id`) USING BTREE,
  INDEX `fk_cms_model_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_model_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_model
-- ----------------------------
INSERT INTO `cms_model` VALUES (1, 1, 'node_home', '首页', NULL, 0);
INSERT INTO `cms_model` VALUES (2, 1, 'info', '新闻', NULL, 0);
INSERT INTO `cms_model` VALUES (3, 1, 'node', '新闻', NULL, 0);
INSERT INTO `cms_model` VALUES (4, 1, 'node', '图集', NULL, 1);
INSERT INTO `cms_model` VALUES (5, 1, 'info', '图集', NULL, 1);
INSERT INTO `cms_model` VALUES (6, 1, 'node', '下载', NULL, 2);
INSERT INTO `cms_model` VALUES (7, 1, 'info', '下载', NULL, 2);
INSERT INTO `cms_model` VALUES (8, 1, 'node', '视频', NULL, 3);
INSERT INTO `cms_model` VALUES (9, 1, 'info', '视频(电影)', NULL, 3);
INSERT INTO `cms_model` VALUES (10, 1, 'node', '产品', NULL, 4);
INSERT INTO `cms_model` VALUES (11, 1, 'info', '产品(服饰/内衣)', NULL, 7);
INSERT INTO `cms_model` VALUES (12, 1, 'site', '站点模型', NULL, 2147483647);
INSERT INTO `cms_model` VALUES (13, 1, 'node', '招聘', NULL, 6);
INSERT INTO `cms_model` VALUES (15, 1, 'global', '系统', NULL, 2147483647);
INSERT INTO `cms_model` VALUES (16, 1, 'node', '转向链接', NULL, 7);
INSERT INTO `cms_model` VALUES (17, 1, 'special', '专题', NULL, 10);
INSERT INTO `cms_model` VALUES (19, 1, 'node', '文库', 'doc', 5);
INSERT INTO `cms_model` VALUES (20, 1, 'info', '文库', 'doc', 10);
INSERT INTO `cms_model` VALUES (21, 1, 'info', '招聘', NULL, 11);
INSERT INTO `cms_model` VALUES (23, 1, 'info', '视频(综艺)', NULL, 4);
INSERT INTO `cms_model` VALUES (24, 1, 'info', '产品(手机数码)', NULL, 5);
INSERT INTO `cms_model` VALUES (25, 1, 'info', '产品(电脑办公)', NULL, 6);
INSERT INTO `cms_model` VALUES (26, 1, 'info', '产品(图书/音像)', NULL, 8);
INSERT INTO `cms_model` VALUES (27, 1, 'info', '产品(家用电器)', NULL, 9);

-- ----------------------------
-- Table structure for cms_model_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_model_custom`;
CREATE TABLE `cms_model_custom`  (
  `f_model_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_cms_modelcustom_model`(`f_model_id`) USING BTREE,
  CONSTRAINT `fk_cms_modelcustom_model` FOREIGN KEY (`f_model_id`) REFERENCES `cms_model` (`f_model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型自定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_model_custom
-- ----------------------------
INSERT INTO `cms_model_custom` VALUES (2, 'template', '/info_news.html');
INSERT INTO `cms_model_custom` VALUES (3, 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES (3, 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (3, 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES (3, 'listTemplate', '/list_news.html');
INSERT INTO `cms_model_custom` VALUES (3, 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES (3, 'coverTemplate', '/cover_news.html');
INSERT INTO `cms_model_custom` VALUES (3, 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES (3, 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES (3, 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES (3, 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (3, 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES (1, 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (1, 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES (1, 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES (1, 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (1, 'template', '/index.html');
INSERT INTO `cms_model_custom` VALUES (1, 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES (1, 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES (1, 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES (1, 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES (1, 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES (4, 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES (4, 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (4, 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES (4, 'listTemplate', '/list_photo.html');
INSERT INTO `cms_model_custom` VALUES (4, 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES (4, 'coverTemplate', '/cover_photo.html');
INSERT INTO `cms_model_custom` VALUES (4, 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES (4, 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES (4, 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES (4, 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (4, 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES (5, 'template', '/info_photo.html');
INSERT INTO `cms_model_custom` VALUES (6, 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES (6, 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (6, 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES (6, 'listTemplate', '/list_download.html');
INSERT INTO `cms_model_custom` VALUES (6, 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES (6, 'coverTemplate', '/cover_download.html');
INSERT INTO `cms_model_custom` VALUES (6, 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES (6, 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES (6, 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES (6, 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (6, 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES (7, 'template', '/info_download.html');
INSERT INTO `cms_model_custom` VALUES (8, 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES (8, 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (8, 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES (8, 'listTemplate', '/list_video.html');
INSERT INTO `cms_model_custom` VALUES (8, 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES (8, 'coverTemplate', '/cover_video.html');
INSERT INTO `cms_model_custom` VALUES (8, 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES (8, 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES (8, 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES (8, 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (8, 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES (9, 'template', '/info_video.html');
INSERT INTO `cms_model_custom` VALUES (10, 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES (10, 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (10, 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES (10, 'listTemplate', '/list_product.html');
INSERT INTO `cms_model_custom` VALUES (10, 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES (10, 'coverTemplate', '/cover_product.html');
INSERT INTO `cms_model_custom` VALUES (10, 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES (10, 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES (10, 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES (10, 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (10, 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES (11, 'template', '/info_product.html');
INSERT INTO `cms_model_custom` VALUES (13, 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES (13, 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (13, 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES (13, 'listTemplate', '/list_recruitment.html');
INSERT INTO `cms_model_custom` VALUES (13, 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES (13, 'coverTemplate', '/list_recruitment.html');
INSERT INTO `cms_model_custom` VALUES (13, 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES (13, 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES (13, 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES (13, 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (13, 'staticMethod', '4');
INSERT INTO `cms_model_custom` VALUES (16, 'listTemplate', '');
INSERT INTO `cms_model_custom` VALUES (16, 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES (16, 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES (16, 'coverTemplate', '/list.html');
INSERT INTO `cms_model_custom` VALUES (16, 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES (16, 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (16, 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES (16, 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES (16, 'staticMethod', '4');
INSERT INTO `cms_model_custom` VALUES (16, 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (16, 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES (19, 'listTemplate', '/list_doc.html');
INSERT INTO `cms_model_custom` VALUES (19, 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES (19, 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (19, 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES (19, 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES (19, 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES (19, 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES (19, 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES (19, 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES (19, 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES (19, 'coverTemplate', '/list_doc.html');
INSERT INTO `cms_model_custom` VALUES (20, 'template', '/info_doc.html');
INSERT INTO `cms_model_custom` VALUES (21, 'template', '/info_recruitment.html');
INSERT INTO `cms_model_custom` VALUES (23, 'template', '/info_video.html');
INSERT INTO `cms_model_custom` VALUES (24, 'template', '/info_product.html');
INSERT INTO `cms_model_custom` VALUES (25, 'template', '/info_product.html');
INSERT INTO `cms_model_custom` VALUES (26, 'template', '/info_product.html');
INSERT INTO `cms_model_custom` VALUES (27, 'template', '/info_product.html');
INSERT INTO `cms_model_custom` VALUES (17, 'template', '/sys_special.html');

-- ----------------------------
-- Table structure for cms_model_field
-- ----------------------------
DROP TABLE IF EXISTS `cms_model_field`;
CREATE TABLE `cms_model_field`  (
  `f_modefiel_id` int(11) NOT NULL,
  `f_model_id` int(11) NOT NULL COMMENT '模型',
  `f_type` int(11) NOT NULL COMMENT '输入类型',
  `f_inner_type` int(11) NOT NULL DEFAULT 0 COMMENT '内部类型(0:用户自定义字段;1:系统定义字段;2:预留大文本字段;3:预留可查询字段)',
  `f_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段标签',
  `f_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `f_prompt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示信息',
  `f_def_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `f_is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否必填项',
  `f_seq` int(11) NOT NULL DEFAULT 10 COMMENT '顺序',
  `f_is_dbl_column` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否双列布局',
  `f_is_disabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`f_modefiel_id`) USING BTREE,
  INDEX `fk_cms_modefiel_model`(`f_model_id`) USING BTREE,
  CONSTRAINT `fk_cms_modefiel_model` FOREIGN KEY (`f_model_id`) REFERENCES `cms_model` (`f_model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_model_field
-- ----------------------------
INSERT INTO `cms_model_field` VALUES (1, 1, 1, 2, '名称', 'name', NULL, NULL, '0', 0, '1', '0');
INSERT INTO `cms_model_field` VALUES (2, 1, 1, 2, '编码', 'number', NULL, NULL, '0', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (5, 1, 5, 2, '栏目模型', 'nodeModel', NULL, NULL, '0', 2, '1', '0');
INSERT INTO `cms_model_field` VALUES (6, 1, 5, 2, '文档模型', 'infoModel', NULL, NULL, '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (7, 1, 1, 2, '栏目页模板', 'nodeTemplate', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (8, 1, 1, 2, '文档页模板', 'infoTemplate', NULL, NULL, '0', 5, '1', '0');
INSERT INTO `cms_model_field` VALUES (9, 1, 1, 2, '栏目页静态化', 'generateNode', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (10, 1, 1, 2, '文档页静态化', 'generateInfo', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (11, 1, 5, 2, '静态化方式', 'staticMethod', NULL, NULL, '0', 8, '1', '0');
INSERT INTO `cms_model_field` VALUES (12, 1, 1, 2, '静态化页数', 'staticPage', NULL, '1', '1', 9, '1', '0');
INSERT INTO `cms_model_field` VALUES (199, 4, 1, 2, '所属栏目', 'parent', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (200, 4, 1, 2, '名称', 'name', NULL, NULL, '0', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (201, 4, 1, 2, '编码', 'number', NULL, NULL, '0', 2, '1', '0');
INSERT INTO `cms_model_field` VALUES (202, 4, 1, 2, '转向链接', 'link', NULL, NULL, '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (203, 4, 5, 2, '新窗口打开', 'newWindow', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (216, 4, 5, 2, '栏目模型', 'nodeModel', NULL, NULL, '0', 5, '1', '0');
INSERT INTO `cms_model_field` VALUES (217, 4, 5, 2, '文档模型', 'infoModel', NULL, NULL, '0', 6, '1', '0');
INSERT INTO `cms_model_field` VALUES (235, 2, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '1', '0');
INSERT INTO `cms_model_field` VALUES (237, 2, 1, 2, '专题', 'specials', NULL, NULL, '0', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (239, 2, 1, 2, '颜色', 'color', NULL, NULL, '0', 4, '0', '0');
INSERT INTO `cms_model_field` VALUES (242, 2, 1, 2, '关键词', 'tagKeywords', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (243, 2, 6, 2, '描述', 'metaDescription', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (246, 2, 1, 2, '优先级', 'priority', NULL, NULL, '0', 7, '1', '0');
INSERT INTO `cms_model_field` VALUES (247, 2, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 8, '1', '0');
INSERT INTO `cms_model_field` VALUES (248, 2, 1, 2, '来源', 'source', NULL, NULL, '0', 9, '1', '0');
INSERT INTO `cms_model_field` VALUES (249, 2, 1, 2, '作者', 'author', NULL, NULL, '0', 10, '1', '0');
INSERT INTO `cms_model_field` VALUES (250, 2, 1, 2, '属性', 'attributes', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (255, 2, 50, 2, '正文', 'text', NULL, NULL, '0', 13, '0', '0');
INSERT INTO `cms_model_field` VALUES (256, 3, 1, 2, '所属栏目', 'parent', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (258, 3, 1, 2, '编码', 'number', NULL, NULL, '0', 2, '1', '0');
INSERT INTO `cms_model_field` VALUES (259, 3, 1, 2, '转向链接', 'link', NULL, NULL, '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (260, 3, 5, 2, '新窗口打开', 'newWindow', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (261, 3, 1, 2, '关键词', 'metaKeywords', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (262, 3, 1, 2, '描述', 'metaDescription', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (263, 3, 5, 2, '栏目模型', 'nodeModel', NULL, NULL, '0', 8, '1', '0');
INSERT INTO `cms_model_field` VALUES (264, 3, 5, 2, '文档模型', 'infoModel', NULL, NULL, '0', 9, '1', '0');
INSERT INTO `cms_model_field` VALUES (265, 3, 1, 2, '栏目页模板', 'nodeTemplate', NULL, NULL, '0', 10, '1', '0');
INSERT INTO `cms_model_field` VALUES (266, 3, 1, 2, '文档页模板', 'infoTemplate', NULL, NULL, '0', 11, '1', '0');
INSERT INTO `cms_model_field` VALUES (267, 3, 1, 2, '栏目页静态化', 'generateNode', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (268, 3, 1, 2, '文档页静态化', 'generateInfo', NULL, NULL, '0', 13, '0', '0');
INSERT INTO `cms_model_field` VALUES (269, 3, 5, 2, '静态化方式', 'staticMethod', NULL, NULL, '0', 14, '1', '0');
INSERT INTO `cms_model_field` VALUES (270, 3, 1, 2, '静态化页数', 'staticPage', NULL, '1', '0', 15, '1', '0');
INSERT INTO `cms_model_field` VALUES (273, 1, 1, 2, '关键词', 'metaKeywords', NULL, NULL, '0', 10, '0', '0');
INSERT INTO `cms_model_field` VALUES (274, 1, 1, 2, '描述', 'metaDescription', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (275, 5, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (276, 5, 1, 2, '标题', 'title', NULL, NULL, '0', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (278, 5, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (279, 5, 51, 2, '图片集', 'images', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (281, 5, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (282, 6, 1, 2, '所属栏目', 'parent', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (283, 6, 1, 2, '名称', 'name', NULL, NULL, '0', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (284, 6, 1, 2, '编码', 'number', NULL, NULL, '0', 2, '1', '0');
INSERT INTO `cms_model_field` VALUES (287, 6, 1, 2, '转向链接', 'link', NULL, NULL, '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (288, 6, 5, 2, '新窗口打开', 'newWindow', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (289, 6, 1, 2, '关键词', 'metaKeywords', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (290, 6, 1, 2, '描述', 'metaDescription', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (292, 6, 5, 2, '栏目模型', 'nodeModel', NULL, NULL, '0', 7, '1', '0');
INSERT INTO `cms_model_field` VALUES (293, 6, 5, 2, '文档模型', 'infoModel', NULL, NULL, '0', 8, '1', '0');
INSERT INTO `cms_model_field` VALUES (294, 6, 1, 2, '栏目页模板', 'nodeTemplate', NULL, NULL, '0', 9, '1', '0');
INSERT INTO `cms_model_field` VALUES (295, 6, 1, 2, '文档页模板', 'infoTemplate', NULL, NULL, '0', 10, '1', '0');
INSERT INTO `cms_model_field` VALUES (296, 6, 1, 2, '栏目页静态化', 'generateNode', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (297, 6, 1, 2, '文档页静态化', 'generateInfo', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (298, 6, 5, 2, '静态化方式', 'staticMethod', NULL, NULL, '0', 13, '1', '0');
INSERT INTO `cms_model_field` VALUES (299, 6, 1, 2, '静态化页数', 'staticPage', NULL, '1', '0', 14, '1', '0');
INSERT INTO `cms_model_field` VALUES (303, 7, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (304, 7, 1, 2, '标题', 'title', NULL, NULL, '0', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (305, 7, 50, 2, '软件介绍', 'text', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (306, 7, 4, 0, '软件类型', 'type', NULL, '国产软件', '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (307, 7, 4, 0, '授权方式', 'license', NULL, '免费软件', '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (308, 7, 4, 0, '界面语言', 'language', NULL, '简体中文', '0', 5, '1', '0');
INSERT INTO `cms_model_field` VALUES (311, 7, 9, 2, '下载文件', 'file', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (312, 8, 1, 2, '所属栏目', 'parent', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (313, 8, 1, 2, '名称', 'name', NULL, NULL, '0', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (314, 8, 1, 2, '编码', 'number', NULL, NULL, '0', 2, '1', '0');
INSERT INTO `cms_model_field` VALUES (315, 8, 5, 2, '栏目模型', 'nodeModel', NULL, NULL, '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (316, 8, 5, 2, '文档模型', 'infoModel', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (318, 9, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (319, 9, 1, 2, '标题', 'title', NULL, NULL, '0', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (320, 9, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 7, '1', '0');
INSERT INTO `cms_model_field` VALUES (321, 9, 8, 2, '视频', 'video', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (322, 9, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 9, '0', '0');
INSERT INTO `cms_model_field` VALUES (323, 10, 1, 2, '所属栏目', 'parent', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (324, 10, 1, 2, '名称', 'name', NULL, NULL, '0', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (325, 10, 1, 2, '编码', 'number', NULL, NULL, '0', 2, '1', '0');
INSERT INTO `cms_model_field` VALUES (326, 11, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (327, 11, 1, 2, '标题', 'title', NULL, NULL, '0', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (328, 11, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 8, '0', '0');
INSERT INTO `cms_model_field` VALUES (329, 10, 5, 2, '栏目模型', 'nodeModel', NULL, NULL, '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (330, 10, 5, 2, '文档模型', 'infoModel', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (331, 11, 1, 0, '优惠价', 'price', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (332, 11, 1, 0, '市场价', 'marketPrice', NULL, NULL, '1', 4, '0', '0');
INSERT INTO `cms_model_field` VALUES (334, 11, 4, 0, '商品库存', 'stock', NULL, '有货', '0', 10, '0', '0');
INSERT INTO `cms_model_field` VALUES (335, 11, 50, 1, '商品介绍', 'introduce', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (336, 11, 50, 1, '规格参数', 'specification', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (337, 11, 50, 1, '包装清单', 'packingList', NULL, NULL, '0', 13, '0', '0');
INSERT INTO `cms_model_field` VALUES (338, 11, 50, 1, '售后服务', 'services', NULL, NULL, '0', 14, '0', '0');
INSERT INTO `cms_model_field` VALUES (339, 7, 3, 0, '运行环境', 'system', NULL, 'winxp,win7,win8', '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (340, 7, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 9, '0', '0');
INSERT INTO `cms_model_field` VALUES (343, 3, 5, 2, '审核流程', 'workflow', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (344, 12, 1, 0, '公司名称', 'company', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (345, 12, 1, 0, '备案号', 'icp', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (346, 13, 1, 2, '所属栏目', 'parent', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (347, 13, 1, 2, '名称', 'name', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (348, 13, 1, 2, '编码', 'number', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (349, 13, 1, 2, '关键词', 'metaKeywords', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (350, 13, 1, 2, '描述', 'metaDescription', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (351, 13, 5, 2, '栏目模型', 'nodeModel', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (352, 13, 5, 2, '文档模型', 'infoModel', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (364, 13, 3, 2, '浏览权限', 'viewGroups', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (365, 1, 3, 2, '浏览权限', 'viewGroups', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (366, 15, 1, 0, '版权信息', 'poweredby', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (367, 16, 1, 2, '所属栏目', 'parent', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (368, 16, 1, 2, '名称', 'name', NULL, NULL, '0', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (369, 16, 1, 2, '转向链接', 'link', NULL, NULL, '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (370, 16, 5, 2, '新窗口打开', 'newWindow', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (371, 16, 5, 2, '栏目模型', 'nodeModel', NULL, NULL, '0', 2, '1', '0');
INSERT INTO `cms_model_field` VALUES (372, 17, 1, 2, '标题', 'title', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (373, 17, 1, 2, '关键词', 'metaKeywords', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (374, 17, 6, 2, '描述', 'metaDescription', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (375, 17, 1, 2, '类别', 'category', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (376, 17, 2, 2, '创建日期', 'creationDate', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (377, 17, 5, 2, '模型', 'model', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (378, 17, 1, 2, '独立模版', 'specialTemplate', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (379, 17, 4, 2, '推荐', 'recommend', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (380, 17, 1, 2, '浏览次数', 'views', NULL, NULL, '0', 2147483647, '1', '0');
INSERT INTO `cms_model_field` VALUES (381, 17, 7, 2, '小图', 'smallImage', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (382, 17, 7, 2, '大图', 'largeImage', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (383, 17, 52, 2, '文件集', 'files', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (384, 17, 8, 2, '视频', 'video', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (385, 17, 51, 2, '图片集', 'images', NULL, NULL, '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (386, 5, 1, 2, '属性', 'attributes', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (387, 5, 1, 2, '关键词', 'tagKeywords', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (388, 5, 6, 2, '描述', 'metaDescription', NULL, NULL, '0', 4, '0', '0');
INSERT INTO `cms_model_field` VALUES (389, 11, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (390, 7, 1, 2, '完整标题', 'fullTitle', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (392, 2, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (393, 3, 1, 2, '名称', 'name', NULL, NULL, '1', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (394, 2, 1, 2, '标题', 'title', NULL, NULL, '1', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (395, 4, 5, 2, '审核流程', 'workflow', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (396, 2, 6, 2, '完整标题', 'fullTitle', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (397, 9, 1, 2, '属性', 'attributes', NULL, NULL, '0', 8, '0', '0');
INSERT INTO `cms_model_field` VALUES (399, 11, 1, 2, '属性', 'attributes', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (400, 7, 1, 2, '属性', 'attributes', NULL, NULL, '0', 8, '0', '0');
INSERT INTO `cms_model_field` VALUES (401, 19, 1, 2, '所属栏目', 'parent', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (402, 19, 1, 2, '名称', 'name', NULL, NULL, '1', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (403, 19, 1, 2, '编码', 'number', NULL, NULL, '0', 2, '1', '0');
INSERT INTO `cms_model_field` VALUES (404, 19, 1, 2, '转向链接', 'link', NULL, NULL, '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (405, 19, 5, 2, '新窗口打开', 'newWindow', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (406, 19, 1, 2, '关键词', 'metaKeywords', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (407, 19, 1, 2, '描述', 'metaDescription', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (408, 19, 5, 2, '审核流程', 'workflow', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (409, 19, 5, 2, '栏目模型', 'nodeModel', NULL, NULL, '0', 8, '1', '0');
INSERT INTO `cms_model_field` VALUES (410, 19, 5, 2, '文档模型', 'infoModel', NULL, NULL, '0', 9, '1', '0');
INSERT INTO `cms_model_field` VALUES (411, 19, 1, 2, '栏目页模板', 'nodeTemplate', NULL, NULL, '0', 10, '1', '0');
INSERT INTO `cms_model_field` VALUES (412, 19, 1, 2, '文档页模板', 'infoTemplate', NULL, NULL, '0', 11, '1', '0');
INSERT INTO `cms_model_field` VALUES (413, 19, 1, 2, '栏目页静态化', 'generateNode', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (414, 19, 1, 2, '文档页静态化', 'generateInfo', NULL, NULL, '0', 13, '0', '0');
INSERT INTO `cms_model_field` VALUES (415, 19, 5, 2, '静态化方式', 'staticMethod', NULL, NULL, '0', 14, '1', '0');
INSERT INTO `cms_model_field` VALUES (416, 19, 1, 2, '静态化页数', 'staticPage', NULL, '1', '0', 15, '1', '0');
INSERT INTO `cms_model_field` VALUES (417, 20, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (419, 20, 1, 2, '标题', 'title', NULL, NULL, '1', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (425, 20, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 4, '0', '0');
INSERT INTO `cms_model_field` VALUES (432, 21, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (434, 21, 1, 2, '标题', 'title', NULL, NULL, '1', 1, '1', '0');
INSERT INTO `cms_model_field` VALUES (440, 21, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 2, '1', '0');
INSERT INTO `cms_model_field` VALUES (453, 20, 1, 2, '关键词', 'tagKeywords', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (454, 20, 6, 2, '描述', 'metaDescription', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (455, 20, 10, 2, '文库', 'doc', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (456, 21, 1, 0, '公司名称', 'company', NULL, NULL, '0', 3, '1', '0');
INSERT INTO `cms_model_field` VALUES (457, 21, 1, 0, '部门名称', 'dept', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (458, 21, 1, 0, '招聘人数', 'number', NULL, NULL, '0', 5, '1', '0');
INSERT INTO `cms_model_field` VALUES (459, 21, 1, 0, '薪酬待遇', 'salary', NULL, NULL, '0', 6, '1', '0');
INSERT INTO `cms_model_field` VALUES (460, 21, 1, 0, '工作地点', 'location', NULL, NULL, '0', 9, '1', '0');
INSERT INTO `cms_model_field` VALUES (461, 21, 6, 0, '岗位职责', 'responsibilities', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (462, 21, 6, 0, '岗位要求', 'qualifications', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (463, 21, 1, 0, '工作经验', 'experience', NULL, NULL, '0', 7, '1', '0');
INSERT INTO `cms_model_field` VALUES (464, 21, 1, 0, '最低学历', 'education', NULL, NULL, '0', 8, '1', '0');
INSERT INTO `cms_model_field` VALUES (465, 21, 5, 0, '工作性质', 'jobtype', NULL, NULL, '0', 10, '1', '0');
INSERT INTO `cms_model_field` VALUES (466, 9, 6, 2, '完整标题', 'fullTitle', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (467, 9, 101, 3, '地区', 'p1', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (468, 9, 101, 3, '类型', 'p2', NULL, NULL, '0', 5, '1', '0');
INSERT INTO `cms_model_field` VALUES (469, 9, 101, 3, '年代', 'p3', NULL, NULL, '0', 6, '1', '0');
INSERT INTO `cms_model_field` VALUES (480, 23, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (481, 23, 1, 2, '标题', 'title', NULL, NULL, '0', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (482, 23, 6, 2, '完整标题', 'fullTitle', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (483, 23, 101, 3, '地区', 'p1', NULL, NULL, '0', 4, '1', '0');
INSERT INTO `cms_model_field` VALUES (484, 23, 101, 3, '分类', 'p2', NULL, NULL, '0', 5, '1', '0');
INSERT INTO `cms_model_field` VALUES (487, 23, 1, 2, '属性', 'attributes', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (488, 23, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 8, '0', '0');
INSERT INTO `cms_model_field` VALUES (489, 23, 8, 2, '视频', 'video', NULL, NULL, '0', 10, '0', '0');
INSERT INTO `cms_model_field` VALUES (490, 23, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (491, 9, 1, 2, '关键词', 'tagKeywords', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (492, 23, 1, 2, '关键词', 'tagKeywords', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (493, 9, 1, 0, 'flash地址', 'flashaddr', NULL, NULL, '0', 10, '0', '0');
INSERT INTO `cms_model_field` VALUES (494, 23, 1, 0, 'flash地址', 'flashaddr', NULL, NULL, '0', 9, '0', '0');
INSERT INTO `cms_model_field` VALUES (495, 11, 101, 3, '面料', 'p1', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (496, 11, 101, 3, '适用季节', 'p2', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (498, 24, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (499, 24, 1, 2, '标题', 'title', NULL, NULL, '0', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (500, 24, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (501, 24, 1, 0, '优惠价', 'price', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (502, 24, 1, 0, '市场价', 'marketPrice', NULL, NULL, '1', 4, '0', '0');
INSERT INTO `cms_model_field` VALUES (503, 24, 101, 3, '有效像素', 'p1', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (504, 24, 101, 3, '机身颜色', 'p2', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (505, 24, 1, 2, '属性', 'attributes', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (506, 24, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 8, '0', '0');
INSERT INTO `cms_model_field` VALUES (508, 24, 4, 0, '商品库存', 'stock', NULL, '有货', '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (509, 24, 50, 1, '商品介绍', 'introduce', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (510, 24, 50, 1, '规格参数', 'specification', NULL, NULL, '0', 13, '0', '0');
INSERT INTO `cms_model_field` VALUES (511, 24, 50, 1, '包装清单', 'packingList', NULL, NULL, '0', 14, '0', '0');
INSERT INTO `cms_model_field` VALUES (512, 24, 50, 1, '售后服务', 'services', NULL, NULL, '0', 15, '0', '0');
INSERT INTO `cms_model_field` VALUES (513, 25, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (514, 25, 1, 2, '标题', 'title', NULL, NULL, '0', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (515, 25, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (516, 25, 1, 0, '优惠价', 'price', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (517, 25, 1, 0, '市场价', 'marketPrice', NULL, NULL, '1', 4, '0', '0');
INSERT INTO `cms_model_field` VALUES (518, 25, 101, 3, '尺寸', 'p1', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (519, 25, 101, 3, '处理器', 'p2', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (520, 25, 1, 2, '属性', 'attributes', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (521, 25, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 8, '0', '0');
INSERT INTO `cms_model_field` VALUES (523, 25, 4, 0, '商品库存', 'stock', NULL, '有货', '0', 10, '0', '0');
INSERT INTO `cms_model_field` VALUES (524, 25, 50, 1, '商品介绍', 'introduce', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (525, 25, 50, 1, '规格参数', 'specification', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (526, 25, 50, 1, '包装清单', 'packingList', NULL, NULL, '0', 13, '0', '0');
INSERT INTO `cms_model_field` VALUES (527, 25, 50, 1, '售后服务', 'services', NULL, NULL, '0', 14, '0', '0');
INSERT INTO `cms_model_field` VALUES (528, 26, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (529, 26, 1, 2, '标题', 'title', NULL, NULL, '0', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (530, 26, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (531, 26, 1, 0, '优惠价', 'price', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (532, 26, 1, 0, '市场价', 'marketPrice', NULL, NULL, '1', 4, '0', '0');
INSERT INTO `cms_model_field` VALUES (533, 26, 101, 3, '类别', 'p1', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (535, 26, 1, 2, '属性', 'attributes', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (536, 26, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (538, 26, 4, 0, '商品库存', 'stock', NULL, '有货', '0', 9, '0', '0');
INSERT INTO `cms_model_field` VALUES (539, 26, 50, 1, '商品介绍', 'introduce', NULL, NULL, '0', 10, '0', '0');
INSERT INTO `cms_model_field` VALUES (540, 26, 50, 1, '规格参数', 'specification', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (541, 26, 50, 1, '包装清单', 'packingList', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (542, 26, 50, 1, '售后服务', 'services', NULL, NULL, '0', 13, '0', '0');
INSERT INTO `cms_model_field` VALUES (543, 27, 1, 2, '栏目', 'node', NULL, NULL, '0', 0, '0', '0');
INSERT INTO `cms_model_field` VALUES (544, 27, 1, 2, '标题', 'title', NULL, NULL, '0', 1, '0', '0');
INSERT INTO `cms_model_field` VALUES (545, 27, 2, 2, '发布时间', 'publishDate', NULL, NULL, '0', 2, '0', '0');
INSERT INTO `cms_model_field` VALUES (546, 27, 1, 0, '优惠价', 'price', NULL, NULL, '0', 3, '0', '0');
INSERT INTO `cms_model_field` VALUES (547, 27, 1, 0, '市场价', 'marketPrice', NULL, NULL, '1', 4, '0', '0');
INSERT INTO `cms_model_field` VALUES (548, 27, 101, 3, '尺寸', 'p1', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (549, 27, 101, 3, '分辨率', 'p2', NULL, NULL, '0', 6, '0', '0');
INSERT INTO `cms_model_field` VALUES (550, 27, 1, 2, '属性', 'attributes', NULL, NULL, '0', 7, '0', '0');
INSERT INTO `cms_model_field` VALUES (551, 27, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 8, '0', '0');
INSERT INTO `cms_model_field` VALUES (553, 27, 4, 0, '商品库存', 'stock', NULL, '有货', '0', 10, '0', '0');
INSERT INTO `cms_model_field` VALUES (554, 27, 50, 1, '商品介绍', 'introduce', NULL, NULL, '0', 11, '0', '0');
INSERT INTO `cms_model_field` VALUES (555, 27, 50, 1, '规格参数', 'specification', NULL, NULL, '0', 12, '0', '0');
INSERT INTO `cms_model_field` VALUES (556, 27, 50, 1, '包装清单', 'packingList', NULL, NULL, '0', 13, '0', '0');
INSERT INTO `cms_model_field` VALUES (557, 27, 50, 1, '售后服务', 'services', NULL, NULL, '0', 14, '0', '0');
INSERT INTO `cms_model_field` VALUES (558, 24, 7, 2, '正文图', 'largeImage', NULL, NULL, '0', 9, '0', '0');
INSERT INTO `cms_model_field` VALUES (559, 7, 5, 0, '推荐星级', 'star', NULL, '★★★★★', '0', 6, '1', '0');
INSERT INTO `cms_model_field` VALUES (560, 7, 7, 2, '正文图', 'largeImage', NULL, NULL, '0', 10, '0', '0');
INSERT INTO `cms_model_field` VALUES (561, 20, 7, 2, '标题图', 'smallImage', NULL, NULL, '0', 5, '0', '0');
INSERT INTO `cms_model_field` VALUES (562, 15, 5, 0, '第三方登录', 'oauth', NULL, '0', '0', 2147483647, '0', '0');
INSERT INTO `cms_model_field` VALUES (563, 25, 7, 2, '正文图', 'largeImage', NULL, NULL, '0', 9, '0', '0');
INSERT INTO `cms_model_field` VALUES (564, 11, 7, 2, '正文图', 'largeImage', NULL, NULL, '0', 9, '0', '0');
INSERT INTO `cms_model_field` VALUES (565, 26, 7, 2, '正文图', 'largeImage', NULL, NULL, '0', 8, '0', '0');
INSERT INTO `cms_model_field` VALUES (566, 27, 7, 2, '正文图', 'largeImage', NULL, NULL, '0', 9, '0', '0');

-- ----------------------------
-- Table structure for cms_model_field_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_model_field_custom`;
CREATE TABLE `cms_model_field_custom`  (
  `f_modefiel_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_cms_modfiecus_modefiel`(`f_modefiel_id`) USING BTREE,
  CONSTRAINT `fk_cms_modfiecus_modefiel` FOREIGN KEY (`f_modefiel_id`) REFERENCES `cms_model_field` (`f_modefiel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型字段自定义信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_model_field_custom
-- ----------------------------
INSERT INTO `cms_model_field_custom` VALUES (201, 'datePattern', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'cols', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'rows', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'maxlength', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'editorToolbar', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'options', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (201, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'imageWidth', '');
INSERT INTO `cms_model_field_custom` VALUES (201, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (279, 'thumbnail', 'true');
INSERT INTO `cms_model_field_custom` VALUES (279, 'thumbnailWidth', '130');
INSERT INTO `cms_model_field_custom` VALUES (279, 'imageWatermark', 'true');
INSERT INTO `cms_model_field_custom` VALUES (279, 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES (279, 'imageWidth', '2000');
INSERT INTO `cms_model_field_custom` VALUES (279, 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES (279, 'thumbnailHeight', '80');
INSERT INTO `cms_model_field_custom` VALUES (281, 'imageHeight', '260');
INSERT INTO `cms_model_field_custom` VALUES (281, 'imageWidth', '390');
INSERT INTO `cms_model_field_custom` VALUES (281, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (281, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (306, 'options', '国产软件\r\n国外软件');
INSERT INTO `cms_model_field_custom` VALUES (307, 'options', '免费软件\r\n收费软件');
INSERT INTO `cms_model_field_custom` VALUES (308, 'options', '简体中文\r\n繁体中文\r\n英文');
INSERT INTO `cms_model_field_custom` VALUES (322, 'imageHeight', '180');
INSERT INTO `cms_model_field_custom` VALUES (322, 'imageWidth', '320');
INSERT INTO `cms_model_field_custom` VALUES (322, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (322, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (328, 'imageHeight', '200');
INSERT INTO `cms_model_field_custom` VALUES (328, 'imageWidth', '200');
INSERT INTO `cms_model_field_custom` VALUES (331, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (331, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (331, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (332, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (332, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (332, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (334, 'options', '有货\r\n缺货');
INSERT INTO `cms_model_field_custom` VALUES (335, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (335, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (335, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (336, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (336, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (336, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (337, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (337, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (337, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (338, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (338, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (338, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (328, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (328, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (339, 'options', 'winxp\r\nwin7\r\nwin8\r\nwin2000\r\nwin2003\r\nwin2008\r\nlinux\r\nunix\r\nmac\r\n');
INSERT INTO `cms_model_field_custom` VALUES (340, 'imageHeight', '50');
INSERT INTO `cms_model_field_custom` VALUES (340, 'imageWidth', '50');
INSERT INTO `cms_model_field_custom` VALUES (344, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (344, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (344, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (345, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (345, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (345, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (366, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (366, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (366, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (381, 'imageHeight', '120');
INSERT INTO `cms_model_field_custom` VALUES (381, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (381, 'imageWidth', '180');
INSERT INTO `cms_model_field_custom` VALUES (381, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (382, 'imageHeight', '480');
INSERT INTO `cms_model_field_custom` VALUES (382, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (382, 'imageWidth', '480');
INSERT INTO `cms_model_field_custom` VALUES (382, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (385, 'thumbnail', 'true');
INSERT INTO `cms_model_field_custom` VALUES (385, 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES (385, 'thumbnailHeight', '77');
INSERT INTO `cms_model_field_custom` VALUES (385, 'thumbnailWidth', '116');
INSERT INTO `cms_model_field_custom` VALUES (385, 'imageWidth', '1500');
INSERT INTO `cms_model_field_custom` VALUES (385, 'imageWatermark', 'true');
INSERT INTO `cms_model_field_custom` VALUES (381, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (382, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (385, 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES (385, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (340, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (340, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (340, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (322, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (281, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (392, 'imageHeight', '120');
INSERT INTO `cms_model_field_custom` VALUES (392, 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES (392, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (392, 'imageWidth', '180');
INSERT INTO `cms_model_field_custom` VALUES (392, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (456, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (456, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (456, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (457, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (457, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (457, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (458, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (458, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (458, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (459, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (459, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (459, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (460, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (460, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (460, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (461, 'height', '80');
INSERT INTO `cms_model_field_custom` VALUES (461, 'width', '500');
INSERT INTO `cms_model_field_custom` VALUES (461, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (462, 'height', '80');
INSERT INTO `cms_model_field_custom` VALUES (462, 'width', '500');
INSERT INTO `cms_model_field_custom` VALUES (462, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (434, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (434, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (434, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (463, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (463, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (463, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (464, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (464, 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES (464, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (465, 'width', '120');
INSERT INTO `cms_model_field_custom` VALUES (465, 'options', '全职\r\n兼职');
INSERT INTO `cms_model_field_custom` VALUES (279, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (469, 'options', '100|2015\r\n99|2014\r\n11|2013-2011\r\n10|00年代\r\n9|90年代\r\n8|80年代\r\n7|更早');
INSERT INTO `cms_model_field_custom` VALUES (468, 'options', '0|喜剧\r\n1|悲剧\r\n2|爱情\r\n3|动作\r\n4|枪战\r\n5|犯罪\r\n6|惊悚\r\n7|恐怖\r\n8|悬疑\r\n9|动画\r\n10|家庭\r\n11|奇幻\r\n12|魔幻\r\n13|科幻\r\n14|战争\r\n15|武侠\r\n16|青春\r\n17|功夫\r\n18|灾难');
INSERT INTO `cms_model_field_custom` VALUES (467, 'options', '0|华语\r\n1|美国\r\n2|欧洲\r\n3|韩国\r\n4|日本\r\n5|泰国\r\n6|其它');
INSERT INTO `cms_model_field_custom` VALUES (483, 'options', '0|华语\r\n1|美国\r\n2|欧洲\r\n3|韩国\r\n4|日本\r\n5|泰国\r\n6|其它');
INSERT INTO `cms_model_field_custom` VALUES (484, 'options', '1|自制剧\r\n2|播报\r\n3|访谈\r\n4|搞笑\r\n5|游戏\r\n6|选秀\r\n7|时尚\r\n8|其它\r\n9|情感\r\n10|盛会\r\n11|曲艺\r\n12|粤语\r\n13|美食\r\n14|少儿\r\n15|脱口秀\r\n16|职场\r\n17|相亲\r\n18|歌舞\r\n19|伦理\r\n20|真人秀');
INSERT INTO `cms_model_field_custom` VALUES (488, 'imageWidth', '320');
INSERT INTO `cms_model_field_custom` VALUES (488, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (488, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (488, 'imageHeight', '180');
INSERT INTO `cms_model_field_custom` VALUES (488, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (493, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (493, 'width', '500');
INSERT INTO `cms_model_field_custom` VALUES (493, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (494, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (494, 'width', '500');
INSERT INTO `cms_model_field_custom` VALUES (494, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (495, 'options', '0|聚酯纤维\r\n1|锦纶\r\n2|竹浆纤维面料\r\n3|再生纤维面料\r\n4|棉质面料\r\n5|莫代尔面料\r\n6|真丝面料\r\n7|莱卡面料\r\n8|其它');
INSERT INTO `cms_model_field_custom` VALUES (496, 'options', '0|冬季\r\n1|夏季\r\n2|春秋季\r\n3|春季\r\n4|秋季\r\n5|秋冬季\r\n6|四季');
INSERT INTO `cms_model_field_custom` VALUES (501, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (501, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (501, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (502, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (502, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (502, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (503, 'options', '0|200-499万\r\n1|500-799万\r\n2|800-1200万\r\n3|1200-1599万\r\n4|1600万以上');
INSERT INTO `cms_model_field_custom` VALUES (504, 'options', '0|白色\r\n1|黑色\r\n2|灰色\r\n3|金色\r\n4|银色\r\n5|红色\r\n6|蓝色\r\n7|粉色\r\n8|黄色\r\n9|绿色\r\n10|橙色\r\n11|紫色\r\n12|其它');
INSERT INTO `cms_model_field_custom` VALUES (506, 'imageWidth', '200');
INSERT INTO `cms_model_field_custom` VALUES (506, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (506, 'imageHeight', '200');
INSERT INTO `cms_model_field_custom` VALUES (506, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (508, 'options', '有货\r\n缺货');
INSERT INTO `cms_model_field_custom` VALUES (509, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (509, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (509, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (510, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (510, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (510, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (511, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (511, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (511, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (512, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (512, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (512, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (516, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (516, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (516, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (517, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (517, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (517, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (518, 'options', '0|10.1英寸及以下\r\n1|11英寸\r\n2|12英寸\r\n3|13英寸\r\n4|14英寸\r\n5|15英寸\r\n6|16英寸-17英寸\r\n7|17英寸以上');
INSERT INTO `cms_model_field_custom` VALUES (519, 'options', '0|Intel i3\r\n1|Intel i5\r\n2|Intel i7\r\n3|AMD A6\r\n4|AMD A8\r\n5|AMD A10\r\n6|其他Intel平台\r\n7|其他AMD平台');
INSERT INTO `cms_model_field_custom` VALUES (521, 'imageWidth', '200');
INSERT INTO `cms_model_field_custom` VALUES (521, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (521, 'imageHeight', '200');
INSERT INTO `cms_model_field_custom` VALUES (521, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (523, 'options', '有货\r\n缺货');
INSERT INTO `cms_model_field_custom` VALUES (524, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (524, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (524, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (525, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (525, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (525, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (526, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (526, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (526, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (527, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (527, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (527, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (531, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (531, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (531, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (532, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (532, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (532, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (533, 'options', '0|文学\r\n1|少儿\r\n2|教育\r\n3|管理\r\n4|励志与成功\r\n5|人文社科\r\n6|生活\r\n7|艺术\r\n8|科技\r\n9|计算机与互联网');
INSERT INTO `cms_model_field_custom` VALUES (536, 'imageWidth', '200');
INSERT INTO `cms_model_field_custom` VALUES (536, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (536, 'imageHeight', '200');
INSERT INTO `cms_model_field_custom` VALUES (536, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (538, 'options', '有货\r\n缺货');
INSERT INTO `cms_model_field_custom` VALUES (539, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (539, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (539, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (540, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (540, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (540, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (541, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (541, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (541, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (542, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (542, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (542, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (546, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (546, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (546, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (547, 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES (547, 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES (547, 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES (548, 'options', '0|32英寸及以下\r\n1|32英寸及以下\r\n2|39-40英寸\r\n3|42-43英寸\r\n4|46-49英寸\r\n5|50-52英寸\r\n6|55英寸\r\n7|58-60英寸\r\n8|65英寸及以上\r\n');
INSERT INTO `cms_model_field_custom` VALUES (549, 'options', '0|超高清4K（3840*2160）\r\n1|全高清（1920*1080）\r\n2|高清（1366*768）\r\n3|其它');
INSERT INTO `cms_model_field_custom` VALUES (551, 'imageWidth', '200');
INSERT INTO `cms_model_field_custom` VALUES (551, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (551, 'imageHeight', '200');
INSERT INTO `cms_model_field_custom` VALUES (551, 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES (553, 'options', '有货\r\n缺货');
INSERT INTO `cms_model_field_custom` VALUES (554, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (554, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (554, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (555, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (555, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (555, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (556, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (556, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (556, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (557, 'editorToolbar', 'Standard');
INSERT INTO `cms_model_field_custom` VALUES (557, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (557, 'height', '');
INSERT INTO `cms_model_field_custom` VALUES (558, 'imageWidth', '480');
INSERT INTO `cms_model_field_custom` VALUES (558, 'imageWatermark', 'true');
INSERT INTO `cms_model_field_custom` VALUES (558, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (558, 'imageHeight', '480');
INSERT INTO `cms_model_field_custom` VALUES (558, 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES (559, 'options', '★★★★★\r\n★★★★☆\r\n★★★☆☆\r\n★★☆☆☆\r\n★☆☆☆☆');
INSERT INTO `cms_model_field_custom` VALUES (559, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (560, 'imageWidth', '480');
INSERT INTO `cms_model_field_custom` VALUES (560, 'imageWatermark', 'true');
INSERT INTO `cms_model_field_custom` VALUES (560, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (560, 'imageHeight', '480');
INSERT INTO `cms_model_field_custom` VALUES (560, 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES (561, 'imageWidth', '80');
INSERT INTO `cms_model_field_custom` VALUES (561, 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES (561, 'imageHeight', '113');
INSERT INTO `cms_model_field_custom` VALUES (561, 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES (561, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (562, 'options', '0|关闭\r\n1|未购买\r\n2|未设置\r\n3|开启');
INSERT INTO `cms_model_field_custom` VALUES (562, 'width', '');
INSERT INTO `cms_model_field_custom` VALUES (563, 'imageWidth', '480');
INSERT INTO `cms_model_field_custom` VALUES (563, 'imageWatermark', 'true');
INSERT INTO `cms_model_field_custom` VALUES (563, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (563, 'imageHeight', '480');
INSERT INTO `cms_model_field_custom` VALUES (563, 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES (564, 'imageWidth', '480');
INSERT INTO `cms_model_field_custom` VALUES (564, 'imageWatermark', 'true');
INSERT INTO `cms_model_field_custom` VALUES (564, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (564, 'imageHeight', '480');
INSERT INTO `cms_model_field_custom` VALUES (564, 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES (565, 'imageWidth', '480');
INSERT INTO `cms_model_field_custom` VALUES (565, 'imageWatermark', 'true');
INSERT INTO `cms_model_field_custom` VALUES (565, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (565, 'imageHeight', '480');
INSERT INTO `cms_model_field_custom` VALUES (565, 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES (566, 'imageWidth', '480');
INSERT INTO `cms_model_field_custom` VALUES (566, 'imageWatermark', 'true');
INSERT INTO `cms_model_field_custom` VALUES (566, 'imageExact', 'false');
INSERT INTO `cms_model_field_custom` VALUES (566, 'imageHeight', '480');
INSERT INTO `cms_model_field_custom` VALUES (566, 'imageScale', 'true');

-- ----------------------------
-- Table structure for cms_node
-- ----------------------------
DROP TABLE IF EXISTS `cms_node`;
CREATE TABLE `cms_node`  (
  `f_node_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_parent_id` int(11) NULL DEFAULT NULL COMMENT '栏目点',
  `f_creator_id` int(11) NOT NULL COMMENT '创建者',
  `f_node_model_id` int(11) NOT NULL COMMENT '栏目模型',
  `f_workflow_id` int(11) NULL DEFAULT NULL COMMENT '流程',
  `f_info_model_id` int(11) NULL DEFAULT NULL COMMENT '文档模型',
  `f_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代码',
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_tree_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000' COMMENT '树编码',
  `f_tree_level` int(11) NOT NULL DEFAULT 0 COMMENT '树级别',
  `f_tree_max` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000' COMMENT '树子节点最大编码',
  `f_creation_date` datetime(0) NOT NULL COMMENT '创建时间',
  `f_refers` int(11) NOT NULL DEFAULT 0 COMMENT '文档数量',
  `f_views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览总数',
  `f_is_real_node` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否真实栏目',
  `f_is_hidden` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `f_html_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'HTML状态(0:未开启,1:待生成,2:待更新,3:已生成)',
  `f_p0` tinyint(4) NULL DEFAULT NULL COMMENT '自定义0',
  `f_p1` tinyint(4) NULL DEFAULT NULL COMMENT '自定义1',
  `f_p2` tinyint(4) NULL DEFAULT NULL COMMENT '自定义2',
  `f_p3` tinyint(4) NULL DEFAULT NULL COMMENT '自定义3',
  `f_p4` tinyint(4) NULL DEFAULT NULL COMMENT '自定义4',
  `f_p5` tinyint(4) NULL DEFAULT NULL COMMENT '自定义5',
  `f_p6` tinyint(4) NULL DEFAULT NULL COMMENT '自定义6',
  PRIMARY KEY (`f_node_id`) USING BTREE,
  INDEX `fk_cms_node_model_info`(`f_info_model_id`) USING BTREE,
  INDEX `fk_cms_node_model_node`(`f_node_model_id`) USING BTREE,
  INDEX `fk_cms_node_parent`(`f_parent_id`) USING BTREE,
  INDEX `fk_cms_node_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_node_user_creator`(`f_creator_id`) USING BTREE,
  INDEX `fk_cms_node_workflow`(`f_workflow_id`) USING BTREE,
  CONSTRAINT `fk_cms_node_model_info` FOREIGN KEY (`f_info_model_id`) REFERENCES `cms_model` (`f_model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_node_model_node` FOREIGN KEY (`f_node_model_id`) REFERENCES `cms_model` (`f_model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_node_parent` FOREIGN KEY (`f_parent_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_node_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_node_user_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_node_workflow` FOREIGN KEY (`f_workflow_id`) REFERENCES `cms_workflow` (`f_workflow_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_node
-- ----------------------------
INSERT INTO `cms_node` VALUES (1, 1, NULL, 1, 1, NULL, 2, 'index', '首页', '0000', 0, '000a', '2013-02-21 20:59:27', -43, 140, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (36, 1, 1, 1, 3, NULL, 2, 'news', '新闻', '0000-0000', 1, '0005', '2013-03-04 22:18:36', -9, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (38, 1, 36, 1, 3, NULL, 2, 'yule', '娱乐', '0000-0000-0003', 2, '0000', '2013-03-04 22:18:42', -7, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (40, 1, 36, 1, 3, NULL, 2, 'sport', '体育', '0000-0000-0004', 2, '0000', '2013-03-18 01:27:48', -2, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (42, 1, 36, 1, 3, NULL, 2, 'domestic', '国内', '0000-0000-0000', 2, '0001', '2013-03-18 01:30:03', 352, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (44, 1, 36, 1, 3, NULL, 2, NULL, '国际', '0000-0000-0001', 2, '0000', '2013-03-18 01:33:48', -19, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (48, 1, 1, 1, 4, NULL, 5, 'photo', '图片', '0000-0001', 1, '0003', '2013-08-06 02:11:53', 2, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (49, 1, 1, 1, 6, NULL, 7, 'download', '下载', '0000-0004', 1, '0003', '2013-08-06 08:45:34', 1, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (51, 1, 1, 1, 8, NULL, 9, 'video', '视频', '0000-0002', 1, '0003', '2013-08-08 01:42:51', 0, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (52, 1, 1, 1, 10, NULL, 11, 'product', '产品', '0000-0003', 1, '0005', '2013-08-08 05:56:39', 1, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (67, 1, 1, 1, 16, NULL, NULL, 'guestbook', '留言', '0000-0008', 1, '0000', '2013-08-09 08:44:10', 0, 0, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (68, 1, 1, 1, 16, NULL, NULL, 'bbs', '论坛', '0000-0009', 1, '0000', '2013-08-14 06:41:58', 0, 0, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (69, 1, 1, 1, 13, NULL, 21, 'jobs', '招聘', '0000-0007', 1, '0000', '2014-03-18 14:13:23', 5, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (74, 1, 1, 1, 16, NULL, NULL, NULL, '专题', '0000-0006', 1, '0000', '2014-03-26 11:56:45', 0, 0, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (77, 1, 49, 1, 6, NULL, 7, NULL, '媒体软件', '0000-0004-0000', 2, '0000', '2014-04-01 16:58:31', 2, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (78, 1, 49, 1, 6, NULL, 7, NULL, '网络软件', '0000-0004-0001', 2, '0000', '2014-04-01 16:59:19', 3, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (79, 1, 49, 1, 6, NULL, 7, NULL, '系统工具', '0000-0004-0002', 2, '0000', '2014-04-01 16:59:24', 4, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (80, 1, 51, 1, 8, NULL, 9, NULL, '电影', '0000-0002-0000', 2, '0000', '2014-04-02 16:54:36', 4, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (81, 1, 51, 1, 8, NULL, 9, NULL, '电视剧', '0000-0002-0001', 2, '0000', '2014-04-02 16:54:42', 4, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (82, 1, 51, 1, 8, NULL, 23, NULL, '综艺', '0000-0002-0002', 2, '0000', '2014-04-02 16:56:04', 6, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (83, 1, 52, 1, 10, NULL, 24, NULL, '手机/数码', '0000-0003-0000', 2, '0000', '2014-04-02 16:59:26', 3, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (84, 1, 52, 1, 10, NULL, 25, NULL, '电脑办公', '0000-0003-0001', 2, '0000', '2014-04-02 17:02:14', 2, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (85, 1, 52, 1, 10, NULL, 11, NULL, '服饰/内衣', '0000-0003-0002', 2, '0000', '2014-04-02 17:02:26', 1, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (87, 1, 48, 1, 4, NULL, 5, NULL, '自然景观', '0000-0001-0002', 2, '0000', '2014-06-01 18:54:54', 2, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (88, 1, 48, 1, 4, NULL, 5, NULL, '人物图库', '0000-0001-0000', 2, '0000', '2014-06-01 18:55:10', 4, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (90, 1, 48, 1, 4, NULL, 5, NULL, '旅游摄影', '0000-0001-0001', 2, '0000', '2014-06-01 18:58:27', 2, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (92, 1, 1, 1, 19, NULL, 20, 'doc', '文库', '0000-0005', 1, '0002', '2014-06-01 19:01:26', 0, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (93, 1, 92, 1, 19, NULL, 20, NULL, '教育文库', '0000-0005-0000', 2, '0000', '2014-06-01 19:02:34', 1, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (94, 1, 92, 1, 19, NULL, 20, NULL, '专业资料', '0000-0005-0001', 2, '0000', '2014-06-01 19:02:48', 1, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (95, 1, 52, 1, 10, NULL, 26, NULL, '图书/音像', '0000-0003-0003', 2, '0000', '2014-12-17 12:01:36', 1, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node` VALUES (96, 1, 52, 1, 10, NULL, 27, NULL, '家用电器', '0000-0003-0004', 2, '0000', '2014-12-17 12:02:24', 1, 0, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_node_buffer
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_buffer`;
CREATE TABLE `cms_node_buffer`  (
  `f_node_id` int(11) NOT NULL,
  `f_views` int(11) NOT NULL COMMENT '浏览次数',
  PRIMARY KEY (`f_node_id`) USING BTREE,
  CONSTRAINT `fk_cms_nodebuffer_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目缓冲表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_node_buffer
-- ----------------------------
INSERT INTO `cms_node_buffer` VALUES (1, 7);
INSERT INTO `cms_node_buffer` VALUES (38, 5);
INSERT INTO `cms_node_buffer` VALUES (42, 1);
INSERT INTO `cms_node_buffer` VALUES (44, 2);
INSERT INTO `cms_node_buffer` VALUES (48, 0);
INSERT INTO `cms_node_buffer` VALUES (49, 0);
INSERT INTO `cms_node_buffer` VALUES (51, 0);
INSERT INTO `cms_node_buffer` VALUES (52, 0);
INSERT INTO `cms_node_buffer` VALUES (67, 0);
INSERT INTO `cms_node_buffer` VALUES (68, 0);
INSERT INTO `cms_node_buffer` VALUES (69, 0);
INSERT INTO `cms_node_buffer` VALUES (74, 0);
INSERT INTO `cms_node_buffer` VALUES (77, 0);
INSERT INTO `cms_node_buffer` VALUES (78, 0);
INSERT INTO `cms_node_buffer` VALUES (79, 0);
INSERT INTO `cms_node_buffer` VALUES (80, 0);
INSERT INTO `cms_node_buffer` VALUES (81, 0);
INSERT INTO `cms_node_buffer` VALUES (82, 0);
INSERT INTO `cms_node_buffer` VALUES (83, 0);
INSERT INTO `cms_node_buffer` VALUES (84, 0);
INSERT INTO `cms_node_buffer` VALUES (85, 0);
INSERT INTO `cms_node_buffer` VALUES (87, 0);
INSERT INTO `cms_node_buffer` VALUES (88, 0);
INSERT INTO `cms_node_buffer` VALUES (90, 0);
INSERT INTO `cms_node_buffer` VALUES (92, 0);
INSERT INTO `cms_node_buffer` VALUES (93, 0);
INSERT INTO `cms_node_buffer` VALUES (94, 0);
INSERT INTO `cms_node_buffer` VALUES (95, 0);
INSERT INTO `cms_node_buffer` VALUES (96, 0);

-- ----------------------------
-- Table structure for cms_node_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_clob`;
CREATE TABLE `cms_node_clob`  (
  `f_node_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  INDEX `fk_cms_nodeclob_node`(`f_node_id`) USING BTREE,
  CONSTRAINT `fk_cms_nodeclob_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目大字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_node_clob
-- ----------------------------
INSERT INTO `cms_node_clob` VALUES (49, 'text', '');

-- ----------------------------
-- Table structure for cms_node_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_custom`;
CREATE TABLE `cms_node_custom`  (
  `f_node_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_cms_nodecustom_node`(`f_node_id`) USING BTREE,
  CONSTRAINT `fk_cms_nodecustom_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目自定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_node_detail
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_detail`;
CREATE TABLE `cms_node_detail`  (
  `f_node_id` int(11) NOT NULL,
  `f_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转向链接',
  `f_html` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'HTML页面',
  `f_mobile_html` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机端HTML页面',
  `f_meta_keywords` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `f_meta_description` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_is_new_window` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否在新窗口打开',
  `f_node_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目模板',
  `f_info_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档模板',
  `f_is_generate_node` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否生成栏目页',
  `f_is_generate_info` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否生成文档页',
  `f_node_extension` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目页扩展名',
  `f_info_extension` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档页扩展名',
  `f_node_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目路径',
  `f_info_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档路径',
  `f_is_def_page` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否默认页',
  `f_static_method` int(11) NULL DEFAULT NULL COMMENT '静态页生成方式(0:手动生成;1:自动生成栏目页;2:自动生成文档页及栏目页;3:自动生成文档页、栏目页、父栏目页、首页)',
  `f_static_page` int(11) NULL DEFAULT NULL COMMENT '栏目列表静态化页数',
  `f_small_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图',
  `f_large_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大图',
  PRIMARY KEY (`f_node_id`) USING BTREE,
  CONSTRAINT `fk_cms_nodedetail_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目详细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_node_detail
-- ----------------------------
INSERT INTO `cms_node_detail` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/index', '/{node_number}/{info_id}', '1', NULL, 1, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '.html', '.html', '/news/{node_number}/index', '/news/{node_number}/{info_id}', '1', 4, 1, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (67, '/guestbook', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (68, 'http://www.jspxcms.com/jspbb/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (74, '/special_category', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_node_detail` VALUES (96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_node_membergroup
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_membergroup`;
CREATE TABLE `cms_node_membergroup`  (
  `f_node_id` int(11) NOT NULL,
  `f_membergroup_id` int(11) NOT NULL,
  `f_is_view_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否有浏览权限',
  `f_is_contri_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否有投稿权限',
  `f_is_comment_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否有评论权限',
  INDEX `fk_cms_nodemgroup_group`(`f_membergroup_id`) USING BTREE,
  INDEX `fk_cms_nodemgroup_node`(`f_node_id`) USING BTREE,
  CONSTRAINT `fk_cms_nodemgroup_group` FOREIGN KEY (`f_membergroup_id`) REFERENCES `cms_member_group` (`f_membergroup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_nodemgroup_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目与用户组权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_node_membergroup
-- ----------------------------
INSERT INTO `cms_node_membergroup` VALUES (1, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (36, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (42, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (44, 1, '1', '1', '0');
INSERT INTO `cms_node_membergroup` VALUES (48, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (51, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (38, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (40, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (52, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (49, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (68, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (67, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (1, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (36, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (42, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (44, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (48, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (51, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (38, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (40, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (52, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (49, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (68, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (67, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (69, 0, '1', '0', '0');
INSERT INTO `cms_node_membergroup` VALUES (69, 1, '1', '0', '0');
INSERT INTO `cms_node_membergroup` VALUES (74, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (74, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (77, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (77, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (78, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (78, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (79, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (79, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (80, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (80, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (81, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (81, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (82, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (82, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (83, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (83, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (84, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (84, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (85, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (85, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (87, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (87, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (88, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (88, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (90, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (90, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (92, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (92, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (93, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (93, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (94, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (94, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (95, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (95, 1, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (96, 0, '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES (96, 1, '1', '1', '1');

-- ----------------------------
-- Table structure for cms_node_org
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_org`;
CREATE TABLE `cms_node_org`  (
  `f_org_id` int(11) NOT NULL,
  `f_node_id` int(11) NOT NULL,
  `f_is_view_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否有浏览权限',
  INDEX `fk_cms_nodeorg_node`(`f_node_id`) USING BTREE,
  INDEX `fk_cms_nodeorg_org`(`f_org_id`) USING BTREE,
  CONSTRAINT `fk_cms_nodeorg_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_nodeorg_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目与组织权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_node_org
-- ----------------------------
INSERT INTO `cms_node_org` VALUES (1, 69, '0');
INSERT INTO `cms_node_org` VALUES (1, 67, '0');
INSERT INTO `cms_node_org` VALUES (1, 68, '0');
INSERT INTO `cms_node_org` VALUES (1, 48, '0');
INSERT INTO `cms_node_org` VALUES (1, 74, '0');
INSERT INTO `cms_node_org` VALUES (1, 77, '0');
INSERT INTO `cms_node_org` VALUES (1, 78, '0');
INSERT INTO `cms_node_org` VALUES (1, 79, '0');
INSERT INTO `cms_node_org` VALUES (1, 80, '0');
INSERT INTO `cms_node_org` VALUES (1, 81, '0');
INSERT INTO `cms_node_org` VALUES (1, 82, '0');
INSERT INTO `cms_node_org` VALUES (1, 83, '0');
INSERT INTO `cms_node_org` VALUES (1, 84, '0');
INSERT INTO `cms_node_org` VALUES (1, 85, '0');
INSERT INTO `cms_node_org` VALUES (1, 1, '0');

-- ----------------------------
-- Table structure for cms_node_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_role`;
CREATE TABLE `cms_node_role`  (
  `f_node_id` int(11) NOT NULL,
  `f_role_id` int(11) NOT NULL,
  `f_is_node_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '栏目权限',
  `f_is_info_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '文档权限',
  INDEX `fk_cms_noderole_node`(`f_node_id`) USING BTREE,
  INDEX `fk_cms_noderole_role`(`f_role_id`) USING BTREE,
  CONSTRAINT `fk_cms_noderole_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_noderole_role` FOREIGN KEY (`f_role_id`) REFERENCES `cms_role` (`f_role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目与角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_node_role
-- ----------------------------
INSERT INTO `cms_node_role` VALUES (1, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (36, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (42, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (44, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (48, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (51, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (38, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (40, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (52, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (49, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (68, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (67, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (69, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (74, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (77, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (78, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (79, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (80, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (81, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (82, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (83, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (84, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (85, 1, '1', '1');
INSERT INTO `cms_node_role` VALUES (87, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (88, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (90, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (92, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (93, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (94, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (95, 1, '0', '0');
INSERT INTO `cms_node_role` VALUES (96, 1, '0', '0');

-- ----------------------------
-- Table structure for cms_notification
-- ----------------------------
DROP TABLE IF EXISTS `cms_notification`;
CREATE TABLE `cms_notification`  (
  `notification_id_` int(11) NOT NULL,
  `receiver_id_` int(11) NOT NULL COMMENT '接收者',
  `type_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别',
  `key_` int(11) NOT NULL COMMENT 'KEY',
  `qty_` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  `url_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `backend_url_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后端URL',
  `text_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知正文',
  `send_time_` datetime(0) NOT NULL COMMENT '通知时间',
  PRIMARY KEY (`notification_id_`) USING BTREE,
  INDEX `fk_cms_notification_receiver`(`receiver_id_`) USING BTREE,
  CONSTRAINT `fk_cms_notification_receiver` FOREIGN KEY (`receiver_id_`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_notification_source
-- ----------------------------
DROP TABLE IF EXISTS `cms_notification_source`;
CREATE TABLE `cms_notification_source`  (
  `notification_id_` int(11) NOT NULL,
  `source_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `source_order_` int(11) NOT NULL,
  INDEX `fk_cms_notificationkey_notifi`(`notification_id_`) USING BTREE,
  CONSTRAINT `fk_cms_notificationkey_notifi` FOREIGN KEY (`notification_id_`) REFERENCES `cms_notification` (`notification_id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知来源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_operation_log`;
CREATE TABLE `cms_operation_log`  (
  `f_operation_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL COMMENT '操作人',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_data_id` int(11) NULL DEFAULT NULL COMMENT '数据ID',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_text` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `f_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP',
  `f_country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `f_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `f_time` datetime(0) NOT NULL COMMENT '时间',
  `f_type` int(11) NOT NULL DEFAULT 1 COMMENT '类型(1:操作日志,2:登录日志,3:登录失败)',
  PRIMARY KEY (`f_operation_id`) USING BTREE,
  INDEX `fk_cms_operationlog_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_operationlog_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_operationlog_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_operationlog_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_operation_log
-- ----------------------------
INSERT INTO `cms_operation_log` VALUES (1927, 0, 1, 'login.failure', NULL, 'sysadmin:111111', NULL, '0:0:0:0:0:0:0:1', 'LAN', 'LAN', '2018-10-06 14:00:26', 2);
INSERT INTO `cms_operation_log` VALUES (1928, 0, 1, 'login.failure', NULL, 'sysadmin:', NULL, '0:0:0:0:0:0:0:1', 'LAN', 'LAN', '2018-10-06 14:00:29', 2);
INSERT INTO `cms_operation_log` VALUES (1929, 0, 1, 'login.failure', NULL, 'sysadmin:111111', NULL, '0:0:0:0:0:0:0:1', 'LAN', 'LAN', '2018-10-06 14:00:30', 2);
INSERT INTO `cms_operation_log` VALUES (1930, 1, 1, 'login.success', NULL, NULL, NULL, '0:0:0:0:0:0:0:1', 'LAN', 'LAN', '2018-10-06 14:00:41', 2);
INSERT INTO `cms_operation_log` VALUES (1931, 1, 1, 'opr.friendlink.edit', 7, 'JSPXCMS官方', NULL, '0:0:0:0:0:0:0:1', 'LAN', 'LAN', '2018-10-06 14:00:56', 1);
INSERT INTO `cms_operation_log` VALUES (1932, 1, 1, 'opr.collect.start', 1, '新浪新闻', NULL, '0:0:0:0:0:0:0:1', 'LAN', 'LAN', '2018-10-06 14:03:35', 1);
INSERT INTO `cms_operation_log` VALUES (1937, 1, 1, 'login.success', NULL, NULL, NULL, '0:0:0:0:0:0:0:1', 'LAN', 'LAN', '2018-10-06 22:54:02', 2);

-- ----------------------------
-- Table structure for cms_org
-- ----------------------------
DROP TABLE IF EXISTS `cms_org`;
CREATE TABLE `cms_org`  (
  `f_org_id` int(11) NOT NULL,
  `f_parent_id` int(11) NULL DEFAULT NULL COMMENT '上级组织',
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_full_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全称',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_contacts` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `f_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `f_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `f_fax` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `f_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `f_tree_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000' COMMENT '树编码',
  `f_tree_level` int(11) NOT NULL DEFAULT 0 COMMENT '树级别',
  `f_tree_max` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000' COMMENT '树子节点最大编码',
  PRIMARY KEY (`f_org_id`) USING BTREE,
  INDEX `fk_cms_org_parent`(`f_parent_id`) USING BTREE,
  CONSTRAINT `fk_cms_org_parent` FOREIGN KEY (`f_parent_id`) REFERENCES `cms_org` (`f_org_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_org
-- ----------------------------
INSERT INTO `cms_org` VALUES (1, NULL, '集团总部', NULL, NULL, NULL, '000', NULL, NULL, NULL, '0000', 0, '0002');

-- ----------------------------
-- Table structure for cms_publish_point
-- ----------------------------
DROP TABLE IF EXISTS `cms_publish_point`;
CREATE TABLE `cms_publish_point`  (
  `f_publishpoint_id` int(11) NOT NULL,
  `f_global_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_store_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存路径',
  `f_display_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示路径',
  `f_ftp_hostname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ftp服务器',
  `f_ftp_port` int(11) NULL DEFAULT NULL COMMENT 'ftp端口',
  `f_ftp_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ftp用户名',
  `f_ftp_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ftp密码',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排列顺序',
  `f_method` int(11) NOT NULL DEFAULT 1 COMMENT '方式(1:文件系统,2:FTP)',
  `f_type` int(11) NOT NULL DEFAULT 1 COMMENT '类型(1:HTML发布,2:附件发布)',
  PRIMARY KEY (`f_publishpoint_id`) USING BTREE,
  INDEX `fk_cms_publishpoint_global`(`f_global_id`) USING BTREE,
  CONSTRAINT `fk_cms_publishpoint_global` FOREIGN KEY (`f_global_id`) REFERENCES `cms_global` (`f_global_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发布点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_publish_point
-- ----------------------------
INSERT INTO `cms_publish_point` VALUES (1, 1, '附件默认发布点', NULL, '/uploads', '/uploads', NULL, NULL, NULL, NULL, 2147483647, 1, 2);
INSERT INTO `cms_publish_point` VALUES (2, 1, 'HTML默认发布点', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2147483647, 1, 1);

-- ----------------------------
-- Table structure for cms_question
-- ----------------------------
DROP TABLE IF EXISTS `cms_question`;
CREATE TABLE `cms_question`  (
  `f_question_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点ID',
  `f_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_begin_date` datetime(0) NULL DEFAULT NULL COMMENT '开始日期',
  `f_end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束日期',
  `f_creation_date` datetime(0) NOT NULL COMMENT '创建日期',
  `f_mode` int(11) NOT NULL DEFAULT 1 COMMENT '模式(1:独立访客,2:独立IP,3:独立用户)',
  `f_interval` int(11) NOT NULL DEFAULT 0 COMMENT '间隔时间（天）',
  `f_total` int(11) NOT NULL DEFAULT 0 COMMENT '总票数',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:启用,1:禁用)',
  PRIMARY KEY (`f_question_id`) USING BTREE,
  INDEX `fk_cms_question_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_question_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调查问卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_question
-- ----------------------------
INSERT INTO `cms_question` VALUES (1, 1, '广州恒大再夺亚冠，你怎么看', '在刚刚结束的2015赛季亚冠决赛次回合比赛中，广州恒大凭借埃尔克森的进球， 1-0战胜迪拜阿赫利，总比分1-0获得本赛季亚冠联赛冠军，同时这也是恒大3年内两夺亚冠。', NULL, NULL, '2015-12-05 22:32:54', 1, 0, 4, 0);
INSERT INTO `cms_question` VALUES (2, 1, '南方供暖已成各界共识，你对江西供暖怎么看？', '近年来，每逢供暖期，呼吁“南方集中供暖”的话题都会成为热点。清华大学建筑节能研究中心的调研报告显示，并非所有南方城市有供暖需求，真正需要的是国家划定的“夏热冬冷”地区，包括上海、重庆、湖北、湖南、安徽、江西、江苏、浙江、四川等。这些省份冬季室温远低于北方城市集中供热时的室内温度。作为一个江西人，你对江西供暖怎么看？', NULL, NULL, '2015-12-01 16:38:50', 1, 0, 0, 0);

-- ----------------------------
-- Table structure for cms_question_item
-- ----------------------------
DROP TABLE IF EXISTS `cms_question_item`;
CREATE TABLE `cms_question_item`  (
  `f_questionitem_id` int(11) NOT NULL,
  `f_question_id` int(11) NOT NULL,
  `f_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_max_selected` int(11) NOT NULL DEFAULT 1 COMMENT '最多可选几项(0不限制)',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  `f_is_essay` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否问答题',
  PRIMARY KEY (`f_questionitem_id`) USING BTREE,
  INDEX `fk_cms_questionitem_question`(`f_question_id`) USING BTREE,
  CONSTRAINT `fk_cms_questionitem_question` FOREIGN KEY (`f_question_id`) REFERENCES `cms_question` (`f_question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调查问卷项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_question_item
-- ----------------------------
INSERT INTO `cms_question_item` VALUES (1, 1, '广州恒大再夺亚冠主要原因是什么?', 0, 0, '0');
INSERT INTO `cms_question_item` VALUES (2, 1, '恒大本场决赛最佳球员是谁?', 1, 1, '0');
INSERT INTO `cms_question_item` VALUES (4, 2, '你支持江西供暖吗？', 1, 0, '0');
INSERT INTO `cms_question_item` VALUES (5, 2, '你觉得“集中供暖”和“分散供暖”哪个模式比较好？', 1, 1, '0');
INSERT INTO `cms_question_item` VALUES (6, 2, '如果采取供暖，你比较担心以下哪些问题？', 1, 2, '0');
INSERT INTO `cms_question_item` VALUES (7, 2, '您有什么建议？', 1, 3, '1');

-- ----------------------------
-- Table structure for cms_question_item_rec
-- ----------------------------
DROP TABLE IF EXISTS `cms_question_item_rec`;
CREATE TABLE `cms_question_item_rec`  (
  `f_questionrecord_id` int(11) NOT NULL,
  `f_questionitem_id` int(11) NOT NULL,
  `f_answer` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回答',
  INDEX `fk_cms_questionitemrec_item`(`f_questionitem_id`) USING BTREE,
  INDEX `fk_cms_questionitemrec_rec`(`f_questionrecord_id`) USING BTREE,
  CONSTRAINT `fk_cms_questionitemrec_item` FOREIGN KEY (`f_questionitem_id`) REFERENCES `cms_question_item` (`f_questionitem_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_questionitemrec_rec` FOREIGN KEY (`f_questionrecord_id`) REFERENCES `cms_question_record` (`f_questionrecord_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调查问卷项与调查问卷记录关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_question_opt_rec
-- ----------------------------
DROP TABLE IF EXISTS `cms_question_opt_rec`;
CREATE TABLE `cms_question_opt_rec`  (
  `f_questionrecord_id` int(11) NOT NULL,
  `f_questionoption_id` int(11) NOT NULL,
  INDEX `fk_cms_questionoptrec_opt`(`f_questionoption_id`) USING BTREE,
  INDEX `fk_cms_questionoptrec_rec`(`f_questionrecord_id`) USING BTREE,
  CONSTRAINT `fk_cms_questionoptrec_opt` FOREIGN KEY (`f_questionoption_id`) REFERENCES `cms_question_option` (`f_questionoption_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_questionoptrec_rec` FOREIGN KEY (`f_questionrecord_id`) REFERENCES `cms_question_record` (`f_questionrecord_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调查问卷选项与调查问卷记录关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_question_opt_rec
-- ----------------------------
INSERT INTO `cms_question_opt_rec` VALUES (3, 1);
INSERT INTO `cms_question_opt_rec` VALUES (3, 2);
INSERT INTO `cms_question_opt_rec` VALUES (3, 7);
INSERT INTO `cms_question_opt_rec` VALUES (4, 5);
INSERT INTO `cms_question_opt_rec` VALUES (4, 7);

-- ----------------------------
-- Table structure for cms_question_option
-- ----------------------------
DROP TABLE IF EXISTS `cms_question_option`;
CREATE TABLE `cms_question_option`  (
  `f_questionoption_id` int(11) NOT NULL,
  `f_questionitem_id` int(11) NOT NULL,
  `f_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `f_is_input` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否输入框',
  `f_count` int(11) NOT NULL DEFAULT 0 COMMENT '得票数',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  PRIMARY KEY (`f_questionoption_id`) USING BTREE,
  INDEX `fk_cms_questionoption_item`(`f_questionitem_id`) USING BTREE,
  CONSTRAINT `fk_cms_questionoption_item` FOREIGN KEY (`f_questionitem_id`) REFERENCES `cms_question_item` (`f_questionitem_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调查问卷选项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_question_option
-- ----------------------------
INSERT INTO `cms_question_option` VALUES (1, 1, '斯科拉里中途上任，对球队调教有方', '0', 1, 0);
INSERT INTO `cms_question_option` VALUES (2, 1, '高拉特、保利尼奥加盟，成功补强球队', '0', 1, 1);
INSERT INTO `cms_question_option` VALUES (3, 2, '埃尔克森', '0', 1, 0);
INSERT INTO `cms_question_option` VALUES (4, 2, '郑龙', '0', 0, 1);
INSERT INTO `cms_question_option` VALUES (5, 1, '郑智、黄博文、冯潇霆等国内球员给力', '0', 2, 2);
INSERT INTO `cms_question_option` VALUES (6, 1, '其他', '0', 0, 3);
INSERT INTO `cms_question_option` VALUES (7, 2, '金英权', '0', 2, 2);
INSERT INTO `cms_question_option` VALUES (8, 2, '其他', '0', 1, 3);
INSERT INTO `cms_question_option` VALUES (9, 4, '支持', '0', 0, 0);
INSERT INTO `cms_question_option` VALUES (10, 4, '不支持', '0', 0, 1);
INSERT INTO `cms_question_option` VALUES (11, 4, '无所谓', '0', 0, 2);
INSERT INTO `cms_question_option` VALUES (12, 5, '集中供暖比较好', '0', 0, 0);
INSERT INTO `cms_question_option` VALUES (13, 5, '分散供暖比较好', '0', 0, 1);
INSERT INTO `cms_question_option` VALUES (14, 5, '无所谓', '0', 0, 2);
INSERT INTO `cms_question_option` VALUES (15, 6, '花销', '0', 0, 0);
INSERT INTO `cms_question_option` VALUES (16, 6, '环境污染', '0', 0, 1);
INSERT INTO `cms_question_option` VALUES (17, 6, '冷热不均', '0', 0, 2);
INSERT INTO `cms_question_option` VALUES (18, 6, '生活习惯改变引起身体不适', '0', 0, 3);

-- ----------------------------
-- Table structure for cms_question_record
-- ----------------------------
DROP TABLE IF EXISTS `cms_question_record`;
CREATE TABLE `cms_question_record`  (
  `f_questionrecord_id` int(11) NOT NULL,
  `f_user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `f_question_id` int(11) NOT NULL COMMENT '调查问卷ID',
  `f_date` datetime(0) NOT NULL COMMENT '日期',
  `f_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP',
  `f_cookie` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Cookie',
  PRIMARY KEY (`f_questionrecord_id`) USING BTREE,
  INDEX `fk_cms_questionrecord_question`(`f_question_id`) USING BTREE,
  INDEX `fk_cms_questionrecord_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_questionrecord_question` FOREIGN KEY (`f_question_id`) REFERENCES `cms_question` (`f_question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_questionrecord_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调查问卷记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_question_record
-- ----------------------------
INSERT INTO `cms_question_record` VALUES (3, 1, 1, '2015-12-08 16:12:28', '127.0.0.1', '2dde68cd95f54781b2fde279de89cb2d');
INSERT INTO `cms_question_record` VALUES (4, NULL, 1, '2016-03-22 17:39:56', '127.0.0.1', 'c76e26ec3ed749e0b9bf4782ae50e4f5');

-- ----------------------------
-- Table structure for cms_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_role`;
CREATE TABLE `cms_role`  (
  `f_role_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_rank` int(11) NOT NULL DEFAULT 999 COMMENT '等级',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  `f_perms` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '功能权限',
  `f_is_all_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否拥有所有功能权限',
  `f_is_all_info_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否拥有所有文档权限',
  `f_is_all_node_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否拥有所有栏目权限',
  `f_is_info_final_perm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否拥有文档终审权限',
  `f_info_perm_type` int(11) NOT NULL DEFAULT 1 COMMENT '文档权限类型(1:所有;2:组织;3:自身)',
  PRIMARY KEY (`f_role_id`) USING BTREE,
  INDEX `fk_cms_role_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_role_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_role
-- ----------------------------
INSERT INTO `cms_role` VALUES (1, 1, '管理员', NULL, 1, 2147483647, NULL, '1', '1', '1', '1', 1);

-- ----------------------------
-- Table structure for cms_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `cms_schedule_job`;
CREATE TABLE `cms_schedule_job`  (
  `f_schedulejob_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `f_group` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组',
  `f_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务代码',
  `f_data` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任务数据',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `f_cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Cron表达式',
  `f_start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `f_end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `f_start_delay` bigint(20) NULL DEFAULT NULL COMMENT '首次延迟时间(分钟)',
  `f_repeat_interval` bigint(20) NULL DEFAULT NULL COMMENT '间隔时间',
  `f_unit` int(11) NULL DEFAULT NULL COMMENT '时间单位(1:毫秒,2:秒,3:分,4:时,5:天,6:周,7:月,8:年)',
  `f_cycle` int(11) NOT NULL DEFAULT 1 COMMENT '执行周期(1:cron,2:simple)',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:启用;1:禁用)',
  PRIMARY KEY (`f_schedulejob_id`) USING BTREE,
  INDEX `fk_cms_schedulejob_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_schedulejob_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_schedulejob_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_schedulejob_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_score_board
-- ----------------------------
DROP TABLE IF EXISTS `cms_score_board`;
CREATE TABLE `cms_score_board`  (
  `f_scoreboard_id` int(11) NOT NULL,
  `f_scoreitem_id` int(11) NOT NULL COMMENT '记分项',
  `f_ftype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外表标识',
  `f_fid` int(11) NOT NULL COMMENT '外表ID',
  `f_votes` int(11) NOT NULL DEFAULT 0 COMMENT '投票次数',
  PRIMARY KEY (`f_scoreboard_id`) USING BTREE,
  INDEX `fk_cms_scoreboard_scoreitem`(`f_scoreitem_id`) USING BTREE,
  CONSTRAINT `fk_cms_scoreboard_scoreitem` FOREIGN KEY (`f_scoreitem_id`) REFERENCES `cms_score_item` (`f_scoreitem_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计分牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_score_board
-- ----------------------------
INSERT INTO `cms_score_board` VALUES (1, 1, 'InfoScore', 97, 1);
INSERT INTO `cms_score_board` VALUES (2, 1, 'InfoScore', 28, 1);
INSERT INTO `cms_score_board` VALUES (3, 13, 'InfoScore', 94, 4);
INSERT INTO `cms_score_board` VALUES (4, 11, 'InfoScore', 95, 1);
INSERT INTO `cms_score_board` VALUES (5, 13, 'InfoScore', 93, 1);
INSERT INTO `cms_score_board` VALUES (6, 2, 'InfoScore', 55, 1);
INSERT INTO `cms_score_board` VALUES (7, 12, 'InfoScore', 93, 1);
INSERT INTO `cms_score_board` VALUES (8, 10, 'InfoScore', 98, 1);
INSERT INTO `cms_score_board` VALUES (9, 13, 'InfoScore', 97, 1);
INSERT INTO `cms_score_board` VALUES (10, 3, 'InfoScore', 87, 1);
INSERT INTO `cms_score_board` VALUES (11, 4, 'InfoScore', 87, 1);
INSERT INTO `cms_score_board` VALUES (12, 5, 'InfoScore', 28, 1);
INSERT INTO `cms_score_board` VALUES (13, 8, 'InfoScore', 126, 1);
INSERT INTO `cms_score_board` VALUES (14, 2, 'InfoScore', 32, 1);
INSERT INTO `cms_score_board` VALUES (15, 10, 'InfoScore', 94, 3);
INSERT INTO `cms_score_board` VALUES (16, 9, 'InfoScore', 94, 16);
INSERT INTO `cms_score_board` VALUES (17, 12, 'InfoScore', 94, 2);
INSERT INTO `cms_score_board` VALUES (18, 11, 'InfoScore', 94, 2);
INSERT INTO `cms_score_board` VALUES (19, 12, 'InfoScore', 130, 1);
INSERT INTO `cms_score_board` VALUES (20, 13, 'InfoScore', 130, 1);
INSERT INTO `cms_score_board` VALUES (21, 10, 'InfoScore', 97, 1);
INSERT INTO `cms_score_board` VALUES (22, 6, 'InfoScore', 126, 1);
INSERT INTO `cms_score_board` VALUES (23, 6, 'InfoScore', 127, 3);
INSERT INTO `cms_score_board` VALUES (24, 5, 'InfoScore', 127, 3);
INSERT INTO `cms_score_board` VALUES (25, 4, 'InfoScore', 127, 1);
INSERT INTO `cms_score_board` VALUES (26, 7, 'InfoScore', 127, 1);
INSERT INTO `cms_score_board` VALUES (27, 11, 'InfoScore', 132, 1);

-- ----------------------------
-- Table structure for cms_score_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_score_group`;
CREATE TABLE `cms_score_group`  (
  `f_scoregroup_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代码',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  PRIMARY KEY (`f_scoregroup_id`) USING BTREE,
  INDEX `fk_cms_scoregroup_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_scoregroup_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_score_group
-- ----------------------------
INSERT INTO `cms_score_group` VALUES (1, 1, '心情评分', 'mood', NULL, 0);
INSERT INTO `cms_score_group` VALUES (2, 1, '星级评分', 'star', NULL, 1);

-- ----------------------------
-- Table structure for cms_score_item
-- ----------------------------
DROP TABLE IF EXISTS `cms_score_item`;
CREATE TABLE `cms_score_item`  (
  `f_scoreitem_id` int(11) NOT NULL,
  `f_scoregroup_id` int(11) NOT NULL COMMENT '计分组',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_score` int(11) NOT NULL DEFAULT 1 COMMENT '分值',
  `f_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  PRIMARY KEY (`f_scoreitem_id`) USING BTREE,
  INDEX `fk_cms_scoreitem_scoregroup`(`f_scoregroup_id`) USING BTREE,
  INDEX `fk_cms_scoreitem_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_scoreitem_scoregroup` FOREIGN KEY (`f_scoregroup_id`) REFERENCES `cms_score_group` (`f_scoregroup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_scoreitem_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计分项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_score_item
-- ----------------------------
INSERT INTO `cms_score_item` VALUES (1, 1, 1, '感动', 1, '/mood/0.gif', 0);
INSERT INTO `cms_score_item` VALUES (2, 1, 1, '路过', 1, '/mood/1.gif', 1);
INSERT INTO `cms_score_item` VALUES (3, 1, 1, '高兴', 1, '/mood/2.gif', 2);
INSERT INTO `cms_score_item` VALUES (4, 1, 1, '难过', 1, '/mood/3.gif', 3);
INSERT INTO `cms_score_item` VALUES (5, 1, 1, '搞笑', 1, '/mood/4.gif', 4);
INSERT INTO `cms_score_item` VALUES (6, 1, 1, '无聊', 1, '/mood/5.gif', 5);
INSERT INTO `cms_score_item` VALUES (7, 1, 1, '愤怒', 1, '/mood/6.gif', 6);
INSERT INTO `cms_score_item` VALUES (8, 1, 1, '同情', 1, '/mood/7.gif', 7);
INSERT INTO `cms_score_item` VALUES (9, 2, 1, '一星', 1, NULL, 0);
INSERT INTO `cms_score_item` VALUES (10, 2, 1, '二星', 2, NULL, 1);
INSERT INTO `cms_score_item` VALUES (11, 2, 1, '三星', 3, NULL, 2);
INSERT INTO `cms_score_item` VALUES (12, 2, 1, '四星', 4, NULL, 3);
INSERT INTO `cms_score_item` VALUES (13, 2, 1, '五星', 5, NULL, 4);

-- ----------------------------
-- Table structure for cms_sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `cms_sensitive_word`;
CREATE TABLE `cms_sensitive_word`  (
  `f_sensitiveword_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '敏感词',
  `f_replacement` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '替换词',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:启用,1:禁用)',
  PRIMARY KEY (`f_sensitiveword_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敏感词表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site`  (
  `f_site_id` int(11) NOT NULL,
  `f_global_id` int(11) NOT NULL COMMENT '全局',
  `f_org_id` int(11) NOT NULL COMMENT '组织',
  `f_html_publishpoint_id` int(11) NOT NULL COMMENT 'HTML发布点',
  `f_mobile_publishpoint_id` int(11) NULL DEFAULT NULL COMMENT '手机端发布点',
  `f_parent_id` int(11) NULL DEFAULT NULL COMMENT '上级站点',
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `f_full_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完整名称',
  `f_no_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/img/no_picture.jpg' COMMENT '暂无图片',
  `f_template_theme` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default' COMMENT '模板主题',
  `f_domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'localhost' COMMENT '域名',
  `f_is_identify_domain` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否识别域名',
  `f_is_static_home` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否静态首页',
  `f_mobile_theme` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'default' COMMENT '手机端模板主题',
  `f_mobile_domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机端域名',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:正常,1:禁用)',
  `f_tree_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000' COMMENT '树编码',
  `f_tree_level` int(11) NOT NULL DEFAULT 0 COMMENT '树级别',
  `f_tree_max` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000' COMMENT '树子节点最大编码',
  PRIMARY KEY (`f_site_id`) USING BTREE,
  UNIQUE INDEX `ak_number`(`f_number`) USING BTREE,
  INDEX `fk_cms_site_global`(`f_global_id`) USING BTREE,
  INDEX `fk_cms_site_org`(`f_org_id`) USING BTREE,
  INDEX `fk_cms_site_parent`(`f_parent_id`) USING BTREE,
  INDEX `fk_cms_site_publishpoint`(`f_html_publishpoint_id`) USING BTREE,
  INDEX `fk_cms_site_publishpoint_m`(`f_mobile_publishpoint_id`) USING BTREE,
  CONSTRAINT `fk_cms_site_global` FOREIGN KEY (`f_global_id`) REFERENCES `cms_global` (`f_global_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_site_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_site_parent` FOREIGN KEY (`f_parent_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_site_publishpoint` FOREIGN KEY (`f_html_publishpoint_id`) REFERENCES `cms_publish_point` (`f_publishpoint_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_site_publishpoint_m` FOREIGN KEY (`f_mobile_publishpoint_id`) REFERENCES `cms_publish_point` (`f_publishpoint_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_site
-- ----------------------------
INSERT INTO `cms_site` VALUES (1, 1, 1, 2, 2, NULL, 'Jspxcms演示主站', '1', 'Jspxcms演示主站', '/img/nopic.jpg', 'default', 'localhost', '0', '0', 'm', 'localhost', 0, '0000', 0, '0000');

-- ----------------------------
-- Table structure for cms_site_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_clob`;
CREATE TABLE `cms_site_clob`  (
  `f_site_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  INDEX `fk_cms_siteclob_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_siteclob_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点大字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_site_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_custom`;
CREATE TABLE `cms_site_custom`  (
  `f_site_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_cms_sitecustom_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_sitecustom_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点自定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_site_custom
-- ----------------------------
INSERT INTO `cms_site_custom` VALUES (1, 'company', '南昌蓝智科技有限公司');
INSERT INTO `cms_site_custom` VALUES (1, 'icp', '赣ICP备12001124号');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_watermark_mode', '1');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_watermark_alpha', '50');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_watermark_padding_x', '20');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_watermark_image', '/img/watermark.png');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_watermark_min_height', '300');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_watermark_padding_y', '20');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_watermark_position', '9');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_watermark_min_width', '300');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_comment_captchaMode', '3');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_comment_auditMode', '0');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_comment_maxLength', '2147483647');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_comment_mode', '1');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_guestbook_mode', '1');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_guestbook_auditMode', '0');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_guestbook_captchaMode', '3');
INSERT INTO `cms_site_custom` VALUES (1, 'sys_guestbook_maxLength', '2147483647');

-- ----------------------------
-- Table structure for cms_special
-- ----------------------------
DROP TABLE IF EXISTS `cms_special`;
CREATE TABLE `cms_special`  (
  `f_special_id` int(11) NOT NULL,
  `f_creator_id` int(11) NOT NULL COMMENT '创建者',
  `f_model_id` int(11) NOT NULL COMMENT '模型',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_speccate_id` int(11) NOT NULL COMMENT '专题类别',
  `f_creation_date` datetime(0) NOT NULL COMMENT '创建日期',
  `f_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `f_meta_keywords` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `f_meta_description` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_special_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题模板',
  `f_small_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图',
  `f_large_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大图',
  `f_video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频',
  `f_video_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频名称',
  `f_video_length` bigint(20) NULL DEFAULT NULL COMMENT '视频长度',
  `f_video_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频时间',
  `f_refers` int(11) NOT NULL DEFAULT 0 COMMENT '文档数量',
  `f_views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览总数',
  `f_is_with_image` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否有图片',
  `f_is_recommend` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`f_special_id`) USING BTREE,
  INDEX `fk_cms_special_creator`(`f_creator_id`) USING BTREE,
  INDEX `fk_cms_special_model`(`f_model_id`) USING BTREE,
  INDEX `fk_cms_special_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_special_speccate`(`f_speccate_id`) USING BTREE,
  CONSTRAINT `fk_cms_special_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_special_model` FOREIGN KEY (`f_model_id`) REFERENCES `cms_model` (`f_model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_special_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_special_speccate` FOREIGN KEY (`f_speccate_id`) REFERENCES `cms_special_category` (`f_speccate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_special
-- ----------------------------
INSERT INTO `cms_special` VALUES (2, 1, 17, 1, 5, '2013-02-27 17:10:53', '文章姚笛出轨被曝', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, '0', '1');
INSERT INTO `cms_special` VALUES (8, 1, 17, 1, 2, '2014-03-31 10:46:17', '2014索契冬奥会', '冬奥会, 2014冬奥会,索契冬奥会,2014索契冬奥会, 第22届冬奥会, 冬季奥林匹克运动会', '第22届冬季奥林匹克运动会于2014年2月7日～23日召开', NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201403/20140331105551_obxbxw.jpg', NULL, NULL, NULL, NULL, NULL, 5, 1, '1', '1');
INSERT INTO `cms_special` VALUES (10, 1, 17, 1, 1, '2013-03-19 02:58:35', '美国网络监控“棱镜”项目曝光', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224161821_1fftmaayvv.jpg', NULL, NULL, NULL, NULL, NULL, 6, 0, '1', '1');
INSERT INTO `cms_special` VALUES (11, 1, 17, 1, 6, '2013-03-19 03:00:11', '乌克兰局势动荡', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224161637_b6hopxqp3l.jpg', NULL, NULL, NULL, NULL, NULL, 2, 0, '1', '1');
INSERT INTO `cms_special` VALUES (12, 1, 17, 1, 1, '2013-03-19 03:00:39', '央视暗拍曝光东莞色情业', NULL, NULL, NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201512/20151224161539_509ekqycst.jpg', NULL, NULL, NULL, NULL, NULL, 3, 0, '1', '1');
INSERT INTO `cms_special` VALUES (13, 1, 17, 1, 2, '2014-03-18 00:00:02', '马航客机失联', '马航客机失联,MH370,马来西亚,飞机,北京,失联', '马来西亚航空公司8日凌晨，与一架载有239人的飞机失去联系。这架航班上共载227名乘客，含154名中国人。客机系波音777-200型号，计划于北京时间6：30分抵达北京。', NULL, 'http://demo.jspxcms.com/uploads/1/image/public/201403/20140330221351_nkb5c4.jpg', 'http://demo.jspxcms.com/uploads/1/image/public/201403/20140330221023_nrob4d.jpg', NULL, NULL, NULL, NULL, 2, 0, '1', '1');

-- ----------------------------
-- Table structure for cms_special_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_category`;
CREATE TABLE `cms_special_category`  (
  `f_speccate_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  `f_views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览总数',
  `f_meta_keywords` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `f_meta_description` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_creation_date` datetime(0) NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`f_speccate_id`) USING BTREE,
  INDEX `fk_cms_speccategory_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_speccategory_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_special_category
-- ----------------------------
INSERT INTO `cms_special_category` VALUES (1, 1, '国内', 0, 0, NULL, NULL, '2013-02-28 17:09:49');
INSERT INTO `cms_special_category` VALUES (2, 1, '国际', 1, 0, NULL, NULL, '2013-03-18 02:22:45');
INSERT INTO `cms_special_category` VALUES (5, 1, '娱乐', 2147483647, 0, NULL, NULL, '2014-11-27 20:47:03');
INSERT INTO `cms_special_category` VALUES (6, 1, '体育', 2147483647, 0, NULL, NULL, '2014-11-27 20:47:09');

-- ----------------------------
-- Table structure for cms_special_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_clob`;
CREATE TABLE `cms_special_clob`  (
  `f_special_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  INDEX `fk_cms_specialclob_special`(`f_special_id`) USING BTREE,
  CONSTRAINT `fk_cms_specialclob_special` FOREIGN KEY (`f_special_id`) REFERENCES `cms_special` (`f_special_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题大字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_special_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_custom`;
CREATE TABLE `cms_special_custom`  (
  `f_special_id` int(11) NOT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '键',
  `f_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_cms_specialcustom_special`(`f_special_id`) USING BTREE,
  CONSTRAINT `fk_cms_specialcustom_special` FOREIGN KEY (`f_special_id`) REFERENCES `cms_special` (`f_special_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题自定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_special_file
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_file`;
CREATE TABLE `cms_special_file`  (
  `f_special_id` int(11) NOT NULL,
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `f_length` bigint(20) NOT NULL DEFAULT 0 COMMENT '文件长度',
  `f_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件地址',
  `f_index` int(11) NOT NULL DEFAULT 0 COMMENT '文件序号',
  `f_downloads` int(11) NOT NULL DEFAULT 0 COMMENT '下载次数',
  INDEX `fk_cms_specialfile_special`(`f_special_id`) USING BTREE,
  CONSTRAINT `fk_cms_specialfile_special` FOREIGN KEY (`f_special_id`) REFERENCES `cms_special` (`f_special_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题附件集表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_special_image
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_image`;
CREATE TABLE `cms_special_image`  (
  `f_special_id` int(11) NOT NULL,
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `f_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `f_index` int(11) NOT NULL DEFAULT 0 COMMENT '图片序号',
  `f_text` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片正文',
  INDEX `fk_cms_specialimage_special`(`f_special_id`) USING BTREE,
  CONSTRAINT `fk_cms_specialimage_special` FOREIGN KEY (`f_special_id`) REFERENCES `cms_special` (`f_special_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题图片集表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag`  (
  `f_tag_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_creation_date` datetime(0) NOT NULL COMMENT '创建日期',
  `f_refers` int(11) NOT NULL DEFAULT 0 COMMENT '文档数量',
  PRIMARY KEY (`f_tag_id`) USING BTREE,
  INDEX `fk_cms_tag_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_tag_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'TAG表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
INSERT INTO `cms_tag` VALUES (56, 1, '中国', '2013-03-11 12:00:12', 3);
INSERT INTO `cms_tag` VALUES (57, 1, '美国', '2013-03-11 12:00:12', 1);
INSERT INTO `cms_tag` VALUES (58, 1, '中兴', '2013-03-19 02:08:21', 1);
INSERT INTO `cms_tag` VALUES (59, 1, '蒙古国', '2013-03-19 02:08:21', 1);
INSERT INTO `cms_tag` VALUES (60, 1, '反贪局', '2013-03-19 02:08:21', 1);
INSERT INTO `cms_tag` VALUES (61, 1, '逮捕', '2013-03-19 02:08:21', 1);
INSERT INTO `cms_tag` VALUES (62, 1, '金融危机', '2013-03-19 02:08:58', 1);
INSERT INTO `cms_tag` VALUES (63, 1, '苏联', '2013-03-19 02:09:23', 1);
INSERT INTO `cms_tag` VALUES (64, 1, '军火', '2013-03-19 02:09:23', 1);
INSERT INTO `cms_tag` VALUES (65, 1, '贿赂', '2013-03-19 02:09:23', 1);
INSERT INTO `cms_tag` VALUES (66, 1, '罗斯福', '2013-03-19 02:09:23', 1);
INSERT INTO `cms_tag` VALUES (67, 1, '可转债', '2013-03-19 02:10:00', 1);
INSERT INTO `cms_tag` VALUES (68, 1, '违约', '2013-03-19 02:10:00', 1);
INSERT INTO `cms_tag` VALUES (69, 1, '首家', '2013-03-19 02:10:00', 1);
INSERT INTO `cms_tag` VALUES (70, 1, '公司债', '2013-03-19 02:10:00', 1);
INSERT INTO `cms_tag` VALUES (71, 1, '英国', '2013-03-19 02:27:44', 1);
INSERT INTO `cms_tag` VALUES (72, 1, '常规武器', '2013-03-19 02:27:44', 1);
INSERT INTO `cms_tag` VALUES (73, 1, '出口国', '2013-03-19 02:27:44', 1);
INSERT INTO `cms_tag` VALUES (78, 1, '美女', '2014-03-31 15:03:17', 1);
INSERT INTO `cms_tag` VALUES (79, 1, '宝贝', '2014-03-31 15:03:17', 1);
INSERT INTO `cms_tag` VALUES (80, 1, '灰熊', '2014-03-31 15:03:18', 1);
INSERT INTO `cms_tag` VALUES (81, 1, '南印度洋', '2014-06-14 10:27:25', 1);
INSERT INTO `cms_tag` VALUES (82, 1, 'MH370', '2014-06-14 10:27:26', 1);
INSERT INTO `cms_tag` VALUES (83, 1, '黑匣子', '2014-06-14 10:27:26', 1);
INSERT INTO `cms_tag` VALUES (84, 1, '视频', '2014-12-16 15:25:53', 14);

-- ----------------------------
-- Table structure for cms_task
-- ----------------------------
DROP TABLE IF EXISTS `cms_task`;
CREATE TABLE `cms_task`  (
  `f_task_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_description` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `f_begin_time` datetime(0) NOT NULL COMMENT '开始时间',
  `f_end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `f_total` int(11) NOT NULL DEFAULT 0 COMMENT '总完成数量',
  `f_type` int(11) NOT NULL DEFAULT 1 COMMENT '类型(1:栏目HTML生成,2:文档HTML生成,3:全文索引生成)',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:运行中,1:完成,2:中止,3:停止)',
  PRIMARY KEY (`f_task_id`) USING BTREE,
  INDEX `fk_cms_task_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_task_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_task_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_task_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user`  (
  `f_user_id` int(11) NOT NULL,
  `f_org_id` int(11) NOT NULL COMMENT '组织',
  `f_membergroup_id` int(11) NOT NULL COMMENT '会员组',
  `f_global_id` int(11) NOT NULL COMMENT '全局',
  `f_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `f_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `f_salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密混淆码',
  `f_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `f_mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `f_real_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户实名',
  `f_gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `f_birth_date` datetime(0) NULL DEFAULT NULL COMMENT '出生年月',
  `f_validation_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证类型(用户激活,重置密码,邮箱激活)',
  `f_validation_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证KEY',
  `f_rank` int(11) NOT NULL DEFAULT 99999 COMMENT '等级',
  `f_type` int(11) NOT NULL DEFAULT 0 COMMENT '类型(0:会员,1:管理员)',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:正常,1:锁定,2:待验证)',
  `f_qq_openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq openid',
  `f_weibo_uid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'weibo uid',
  `f_weixin_openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'weixin openid',
  PRIMARY KEY (`f_user_id`) USING BTREE,
  UNIQUE INDEX `ak_username`(`f_username`) USING BTREE,
  INDEX `fk_cms_user_global`(`f_global_id`) USING BTREE,
  INDEX `fk_cms_user_membergroup`(`f_membergroup_id`) USING BTREE,
  INDEX `fk_cms_user_org`(`f_org_id`) USING BTREE,
  CONSTRAINT `fk_cms_user_global` FOREIGN KEY (`f_global_id`) REFERENCES `cms_global` (`f_global_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_user_membergroup` FOREIGN KEY (`f_membergroup_id`) REFERENCES `cms_member_group` (`f_membergroup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_user_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES (0, 1, 1, 1, 'anonymous', NULL, NULL, NULL, NULL, NULL, 'M', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `cms_user` VALUES (1, 1, 1, 1, 'admin', NULL, NULL, NULL, NULL, '管理员', NULL, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_user_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_clob`;
CREATE TABLE `cms_user_clob`  (
  `f_user_id` int(11) NULL DEFAULT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  INDEX `fk_cms_userclob_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_userclob_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户大字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_user_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_custom`;
CREATE TABLE `cms_user_custom`  (
  `f_user_id` int(11) NULL DEFAULT NULL,
  `f_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
  `f_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_cms_usercustom_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_usercustom_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户自定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_detail`;
CREATE TABLE `cms_user_detail`  (
  `f_user_id` int(11) NOT NULL,
  `f_validation_date` datetime(0) NULL DEFAULT NULL COMMENT '验证生成时间',
  `f_login_error_date` datetime(0) NULL DEFAULT NULL COMMENT '登录错误时间',
  `f_login_error_count` int(11) NOT NULL DEFAULT 0 COMMENT '登录错误次数',
  `f_prev_login_date` datetime(0) NULL DEFAULT NULL COMMENT '上次登录日期',
  `f_prev_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录IP',
  `f_last_login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录日期',
  `f_last_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `f_creation_date` datetime(0) NOT NULL COMMENT '加入日期',
  `f_creation_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加入IP',
  `f_logins` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `f_is_with_avatar` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否有头像',
  `f_bio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自我介绍',
  `f_come_from` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来自',
  `f_qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `f_msn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MSN',
  `f_weixin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  PRIMARY KEY (`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_userdetail_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_user_detail
-- ----------------------------
INSERT INTO `cms_user_detail` VALUES (0, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2013-03-09 22:18:56', '127.0.0.1', 0, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_user_detail` VALUES (1, '2015-04-12 10:27:43', NULL, 0, '2018-10-06 14:00:41', '0:0:0:0:0:0:0:1', '2018-10-06 22:54:02', '0:0:0:0:0:0:0:1', '2013-02-21 20:59:27', '127.0.0.1', 683, '1', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_user_membergroup
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_membergroup`;
CREATE TABLE `cms_user_membergroup`  (
  `f_user_id` int(11) NOT NULL,
  `f_membergroup_id` int(11) NOT NULL,
  `f_group_index` int(11) NULL DEFAULT 0 COMMENT '会员组排列顺序',
  INDEX `fk_cms_usermgroup_mgroup`(`f_membergroup_id`) USING BTREE,
  INDEX `fk_cms_usermgroup_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_usermgroup_mgroup` FOREIGN KEY (`f_membergroup_id`) REFERENCES `cms_member_group` (`f_membergroup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_usermgroup_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与会员组关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_user_membergroup
-- ----------------------------
INSERT INTO `cms_user_membergroup` VALUES (1, 1, 0);
INSERT INTO `cms_user_membergroup` VALUES (0, 1, 0);

-- ----------------------------
-- Table structure for cms_user_org
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_org`;
CREATE TABLE `cms_user_org`  (
  `f_user_id` int(11) NOT NULL,
  `f_org_id` int(11) NOT NULL,
  `f_org_index` int(11) NULL DEFAULT 0 COMMENT '组织顺序',
  INDEX `fk_cms_userorg_org`(`f_org_id`) USING BTREE,
  INDEX `fk_cms_userorg_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_userorg_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_userorg_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与组织关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_user_org
-- ----------------------------
INSERT INTO `cms_user_org` VALUES (1, 1, 0);
INSERT INTO `cms_user_org` VALUES (0, 1, 0);

-- ----------------------------
-- Table structure for cms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_role`;
CREATE TABLE `cms_user_role`  (
  `f_user_id` int(11) NOT NULL,
  `f_role_id` int(11) NOT NULL,
  `f_role_index` int(11) NULL DEFAULT 0 COMMENT '角色顺序',
  INDEX `fk_cms_userrole_role`(`f_role_id`) USING BTREE,
  INDEX `fk_cms_userrole_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_userrole_role` FOREIGN KEY (`f_role_id`) REFERENCES `cms_role` (`f_role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_userrole_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_user_role
-- ----------------------------
INSERT INTO `cms_user_role` VALUES (1, 1, 0);

-- ----------------------------
-- Table structure for cms_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_visit_log`;
CREATE TABLE `cms_visit_log`  (
  `f_visitlog_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_user_id` int(11) NULL DEFAULT NULL COMMENT '访问用户',
  `f_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页面URL',
  `f_referrer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源URL',
  `f_source` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源域名',
  `f_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `f_cookie` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'COOKIE值',
  `f_user_agent` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `f_browser` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `f_os` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `f_device` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备(COMPUTER,MOBILE,TABLET,等)',
  `f_country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `f_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `f_time_string` char(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问时间（字符串格式yyyyMMddHHmmss）',
  `f_time` datetime(0) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`f_visitlog_id`) USING BTREE,
  INDEX `fk_cms_visitlog_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_visitlog_user`(`f_user_id`) USING BTREE,
  CONSTRAINT `fk_cms_visitlog_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_visitlog_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '访问日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_visit_log
-- ----------------------------
INSERT INTO `cms_visit_log` VALUES (4576, 1, NULL, 'http://localhost:8080/', 'https://gitee.com/jspxcms/Jspxcms', 'https://gitee.com', '0:0:0:0:0:0:0:1', 'a7c69fc7cd754e04a32dbe1a7f95ceb5', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'CHROME', 'WINDOWS_10', 'COMPUTER', 'LAN', 'LAN', '20181006135852', '2018-10-06 13:58:52');
INSERT INTO `cms_visit_log` VALUES (4577, 1, NULL, 'http://localhost:8080/node/52', 'http://localhost:8080/', 'DIRECT', '0:0:0:0:0:0:0:1', 'a7c69fc7cd754e04a32dbe1a7f95ceb5', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'CHROME', 'WINDOWS_10', 'COMPUTER', 'LAN', 'LAN', '20181006135900', '2018-10-06 13:59:01');
INSERT INTO `cms_visit_log` VALUES (4578, 1, NULL, 'http://localhost:8080/', 'https://gitee.com/jspxcms/Jspxcms', 'https://gitee.com', '0:0:0:0:0:0:0:1', 'a7c69fc7cd754e04a32dbe1a7f95ceb5', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'CHROME', 'WINDOWS_10', 'COMPUTER', 'LAN', 'LAN', '20181006140009', '2018-10-06 14:00:09');
INSERT INTO `cms_visit_log` VALUES (4579, 1, 1, 'http://localhost:8080/', '', 'DIRECT', '0:0:0:0:0:0:0:1', 'a7c69fc7cd754e04a32dbe1a7f95ceb5', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'CHROME', 'WINDOWS_10', 'COMPUTER', 'LAN', 'LAN', '20181006140254', '2018-10-06 14:02:54');
INSERT INTO `cms_visit_log` VALUES (4580, 1, 1, 'http://localhost:8080/node/49', 'http://localhost:8080/', 'DIRECT', '0:0:0:0:0:0:0:1', 'a7c69fc7cd754e04a32dbe1a7f95ceb5', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'CHROME', 'WINDOWS_10', 'COMPUTER', 'LAN', 'LAN', '20181006140256', '2018-10-06 14:02:56');
INSERT INTO `cms_visit_log` VALUES (4581, 1, 1, 'http://localhost:8080/info/136', 'http://localhost:8080/node/49', 'DIRECT', '0:0:0:0:0:0:0:1', 'a7c69fc7cd754e04a32dbe1a7f95ceb5', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'CHROME', 'WINDOWS_10', 'COMPUTER', 'LAN', 'LAN', '20181006140257', '2018-10-06 14:02:58');
INSERT INTO `cms_visit_log` VALUES (4582, 1, 1, 'http://localhost:8080/', 'http://localhost:8080/node/49', 'DIRECT', '0:0:0:0:0:0:0:1', 'a7c69fc7cd754e04a32dbe1a7f95ceb5', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'CHROME', 'WINDOWS_10', 'COMPUTER', 'LAN', 'LAN', '20181006140319', '2018-10-06 14:03:19');
INSERT INTO `cms_visit_log` VALUES (4626, 1, NULL, 'http://localhost:8080/', '', 'DIRECT', '0:0:0:0:0:0:0:1', 'a7c69fc7cd754e04a32dbe1a7f95ceb5', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'CHROME', 'WINDOWS_10', 'COMPUTER', 'LAN', 'LAN', '20181006225321', '2018-10-06 22:53:22');

-- ----------------------------
-- Table structure for cms_vote
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote`;
CREATE TABLE `cms_vote`  (
  `f_vote_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `f_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代码',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_creation_date` datetime(0) NOT NULL COMMENT '创建时间',
  `f_begin_date` datetime(0) NULL DEFAULT NULL COMMENT '开始日期',
  `f_end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束日期',
  `f_interval` int(11) NOT NULL DEFAULT 0 COMMENT '间隔时间（天）',
  `f_max_selected` int(11) NOT NULL DEFAULT 1 COMMENT '最多可选几项(0不限制)',
  `f_mode` int(11) NOT NULL DEFAULT 1 COMMENT '模式(1:独立访客,2:独立IP,3:独立用户)',
  `f_total` int(11) NOT NULL DEFAULT 0 COMMENT '总票数',
  `f_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态(0:启用,1:禁用)',
  PRIMARY KEY (`f_vote_id`) USING BTREE,
  INDEX `fk_cms_vote_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_vote_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_vote
-- ----------------------------
INSERT INTO `cms_vote` VALUES (1, 1, '您从哪里知道本网站的', NULL, '当中超进入足彩，你会投注么？中国足球顶级联赛进入彩票的距离，从来没有像今年那样离彩民如此之近。体育总局也多次发文称，支持中超进入竞彩，可以说，中超进入体彩只剩时间问题。', '2017-07-18 11:23:46', NULL, NULL, 0, 1, 1, 6, 0);

-- ----------------------------
-- Table structure for cms_vote_mark
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote_mark`;
CREATE TABLE `cms_vote_mark`  (
  `f_votemark_id` int(11) NOT NULL,
  `f_ftype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外表标识',
  `f_fid` int(11) NOT NULL COMMENT '外表ID',
  `f_date` datetime(0) NOT NULL COMMENT '日期',
  `f_user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `f_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP',
  `f_cookie` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Cookie',
  PRIMARY KEY (`f_votemark_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票标记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_vote_option
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote_option`;
CREATE TABLE `cms_vote_option`  (
  `f_voteoption_id` int(11) NOT NULL,
  `f_vote_id` int(11) NOT NULL,
  `f_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `f_count` int(11) NOT NULL DEFAULT 0 COMMENT '得票数',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  PRIMARY KEY (`f_voteoption_id`) USING BTREE,
  INDEX `fk_cms_voteoption_vote`(`f_vote_id`) USING BTREE,
  CONSTRAINT `fk_cms_voteoption_vote` FOREIGN KEY (`f_vote_id`) REFERENCES `cms_vote` (`f_vote_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_vote_option
-- ----------------------------
INSERT INTO `cms_vote_option` VALUES (1, 1, '朋友或同事介绍的', 0, 0);
INSERT INTO `cms_vote_option` VALUES (2, 1, '在技术网站中看到', 2, 1);
INSERT INTO `cms_vote_option` VALUES (4, 1, '通过搜索引擎', 1, 2);
INSERT INTO `cms_vote_option` VALUES (6, 1, '其它途径', 3, 3);

-- ----------------------------
-- Table structure for cms_workflow
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow`;
CREATE TABLE `cms_workflow`  (
  `f_workflow_id` int(11) NOT NULL,
  `f_workflowgroup_id` int(11) NOT NULL COMMENT '工作流',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  `f_status` int(11) NOT NULL DEFAULT 1 COMMENT '状态(1:启用;2:禁用)',
  PRIMARY KEY (`f_workflow_id`) USING BTREE,
  INDEX `fk_cms_workflow_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_workflow_workflowgroup`(`f_workflowgroup_id`) USING BTREE,
  CONSTRAINT `fk_cms_workflow_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_workflow_workflowgroup` FOREIGN KEY (`f_workflowgroup_id`) REFERENCES `cms_workflow_group` (`f_workflowgroup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作流表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_workflow
-- ----------------------------
INSERT INTO `cms_workflow` VALUES (15, 2, 1, '文档一级审核流程', NULL, 2147483647, 1);

-- ----------------------------
-- Table structure for cms_workflow_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_group`;
CREATE TABLE `cms_workflow_group`  (
  `f_workflowgroup_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  PRIMARY KEY (`f_workflowgroup_id`) USING BTREE,
  INDEX `fk_cms_workflowgroup_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_cms_workflowgroup_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作流组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_workflow_group
-- ----------------------------
INSERT INTO `cms_workflow_group` VALUES (2, 1, '文档审核', NULL, 2147483647);

-- ----------------------------
-- Table structure for cms_workflow_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_log`;
CREATE TABLE `cms_workflow_log`  (
  `f_workflowlog_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL COMMENT '操作人',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_workflowprocess_id` int(11) NOT NULL COMMENT '过程',
  `f_from` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '从哪',
  `f_to` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到哪',
  `f_creation_date` datetime(0) NOT NULL COMMENT '创建时间',
  `f_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '意见',
  `f_type` int(11) NOT NULL COMMENT '类型(1:前进;2后退:;3:原地)',
  PRIMARY KEY (`f_workflowlog_id`) USING BTREE,
  INDEX `fk_cms_workflowlog_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_workflowlog_user`(`f_user_id`) USING BTREE,
  INDEX `fk_cms_workflowlog_wfprocess`(`f_workflowprocess_id`) USING BTREE,
  CONSTRAINT `fk_cms_workflowlog_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_workflowlog_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_workflowlog_wfprocess` FOREIGN KEY (`f_workflowprocess_id`) REFERENCES `cms_workflow_process` (`f_workflowprocess_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作流流程日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_workflow_process
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_process`;
CREATE TABLE `cms_workflow_process`  (
  `f_workflowprocess_id` int(11) NOT NULL,
  `f_workflowstep_id` int(11) NULL DEFAULT NULL COMMENT '步骤',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_workflow_id` int(11) NOT NULL COMMENT '流程',
  `f_user_id` int(11) NOT NULL COMMENT '发起人',
  `f_data_id` int(11) NOT NULL COMMENT '数据ID',
  `f_data_type` int(11) NOT NULL COMMENT '数据类型(1:文档)',
  `f_begin_date` datetime(0) NOT NULL COMMENT '开始时间',
  `f_end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `f_is_rejection` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否退回',
  `f_is_end` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否结束',
  PRIMARY KEY (`f_workflowprocess_id`) USING BTREE,
  INDEX `fk_cms_workflowproc_site`(`f_site_id`) USING BTREE,
  INDEX `fk_cms_workflowproc_user`(`f_user_id`) USING BTREE,
  INDEX `fk_cms_workflowproc_wfstep`(`f_workflowstep_id`) USING BTREE,
  INDEX `fk_cms_workflowproc_workflow`(`f_workflow_id`) USING BTREE,
  CONSTRAINT `fk_cms_workflowproc_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_workflowproc_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_workflowproc_wfstep` FOREIGN KEY (`f_workflowstep_id`) REFERENCES `cms_workflow_step` (`f_workflowstep_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_workflowproc_workflow` FOREIGN KEY (`f_workflow_id`) REFERENCES `cms_workflow` (`f_workflow_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作流过程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_workflow_step
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_step`;
CREATE TABLE `cms_workflow_step`  (
  `f_workflowstep_id` int(11) NOT NULL,
  `f_workflow_id` int(11) NOT NULL COMMENT '工作流',
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `f_seq` int(11) NOT NULL DEFAULT 2147483647 COMMENT '排序',
  PRIMARY KEY (`f_workflowstep_id`) USING BTREE,
  INDEX `fk_cms_workflowstep_workflow`(`f_workflow_id`) USING BTREE,
  CONSTRAINT `fk_cms_workflowstep_workflow` FOREIGN KEY (`f_workflow_id`) REFERENCES `cms_workflow` (`f_workflow_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作流步骤表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_workflowstep_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflowstep_role`;
CREATE TABLE `cms_workflowstep_role`  (
  `f_role_id` int(11) NOT NULL,
  `f_workflowstep_id` int(11) NOT NULL,
  `f_role_index` int(11) NULL DEFAULT 0 COMMENT '角色排列顺序',
  INDEX `fk_cms_wfsteprole_role`(`f_role_id`) USING BTREE,
  INDEX `fk_cms_wfsteprole_wfstep`(`f_workflowstep_id`) USING BTREE,
  CONSTRAINT `fk_cms_wfsteprole_role` FOREIGN KEY (`f_role_id`) REFERENCES `cms_role` (`f_role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cms_wfsteprole_wfstep` FOREIGN KEY (`f_workflowstep_id`) REFERENCES `cms_workflow_step` (`f_workflowstep_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '审核步骤与角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hibernate_sequences
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequences`;
CREATE TABLE `hibernate_sequences`  (
  `sequence_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `next_val` bigint(20) NOT NULL COMMENT 'ID值',
  PRIMARY KEY (`sequence_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主键表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequences
-- ----------------------------
INSERT INTO `hibernate_sequences` VALUES ('cms_ad', 23);
INSERT INTO `hibernate_sequences` VALUES ('cms_ad_slot', 22);
INSERT INTO `hibernate_sequences` VALUES ('cms_attachment', 375);
INSERT INTO `hibernate_sequences` VALUES ('cms_attachment_ref', 277);
INSERT INTO `hibernate_sequences` VALUES ('cms_attribute', 33);
INSERT INTO `hibernate_sequences` VALUES ('cms_collect', 22);
INSERT INTO `hibernate_sequences` VALUES ('cms_collect_field', 25);
INSERT INTO `hibernate_sequences` VALUES ('cms_comment', 52);
INSERT INTO `hibernate_sequences` VALUES ('cms_friendlink', 31);
INSERT INTO `hibernate_sequences` VALUES ('cms_friendlinktype', 24);
INSERT INTO `hibernate_sequences` VALUES ('cms_guestbook', 52);
INSERT INTO `hibernate_sequences` VALUES ('cms_guestbooktype', 29);
INSERT INTO `hibernate_sequences` VALUES ('cms_info', 590);
INSERT INTO `hibernate_sequences` VALUES ('cms_member_group', 22);
INSERT INTO `hibernate_sequences` VALUES ('cms_model', 52);
INSERT INTO `hibernate_sequences` VALUES ('cms_model_field', 632);
INSERT INTO `hibernate_sequences` VALUES ('cms_node', 119);
INSERT INTO `hibernate_sequences` VALUES ('cms_operation_log', 1956);
INSERT INTO `hibernate_sequences` VALUES ('cms_org', 24);
INSERT INTO `hibernate_sequences` VALUES ('cms_publish_point', 33);
INSERT INTO `hibernate_sequences` VALUES ('cms_question', 23);
INSERT INTO `hibernate_sequences` VALUES ('cms_question_item', 28);
INSERT INTO `hibernate_sequences` VALUES ('cms_question_option', 39);
INSERT INTO `hibernate_sequences` VALUES ('cms_question_record', 25);
INSERT INTO `hibernate_sequences` VALUES ('cms_role', 26);
INSERT INTO `hibernate_sequences` VALUES ('cms_rolenode_info', 21);
INSERT INTO `hibernate_sequences` VALUES ('cms_rolenode_node', 21);
INSERT INTO `hibernate_sequences` VALUES ('cms_role_site', 22);
INSERT INTO `hibernate_sequences` VALUES ('cms_schedule_job', 25);
INSERT INTO `hibernate_sequences` VALUES ('cms_scoreboard', 48);
INSERT INTO `hibernate_sequences` VALUES ('cms_scoregroup', 23);
INSERT INTO `hibernate_sequences` VALUES ('cms_scoreitem', 34);
INSERT INTO `hibernate_sequences` VALUES ('cms_site', 24);
INSERT INTO `hibernate_sequences` VALUES ('cms_special', 34);
INSERT INTO `hibernate_sequences` VALUES ('cms_special_category', 27);
INSERT INTO `hibernate_sequences` VALUES ('cms_tag', 105);
INSERT INTO `hibernate_sequences` VALUES ('cms_task', 46);
INSERT INTO `hibernate_sequences` VALUES ('cms_user', 40);
INSERT INTO `hibernate_sequences` VALUES ('cms_visit_log', 4725);
INSERT INTO `hibernate_sequences` VALUES ('cms_vote', 22);
INSERT INTO `hibernate_sequences` VALUES ('cms_vote_mark', 116);
INSERT INTO `hibernate_sequences` VALUES ('cms_vote_option', 27);
INSERT INTO `hibernate_sequences` VALUES ('cms_workflow', 34);
INSERT INTO `hibernate_sequences` VALUES ('cms_workflowprocess_user', 21);
INSERT INTO `hibernate_sequences` VALUES ('cms_workflow_group', 23);
INSERT INTO `hibernate_sequences` VALUES ('cms_workflow_step', 25);
INSERT INTO `hibernate_sequences` VALUES ('plug_resume', 24);

-- ----------------------------
-- Table structure for plug_resume
-- ----------------------------
DROP TABLE IF EXISTS `plug_resume`;
CREATE TABLE `plug_resume`  (
  `f_resume_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `f_post` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应聘职位',
  `f_creation_date` datetime(0) NOT NULL COMMENT '投递日期',
  `f_gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'M' COMMENT '性别',
  `f_birth_date` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `f_mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `f_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `f_expected_salary` int(11) NULL DEFAULT NULL COMMENT '期望薪水',
  `f_education_experience` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '教育经历',
  `f_work_experience` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作经历',
  `f_remark` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`f_resume_id`) USING BTREE,
  INDEX `fk_plug_resume_site`(`f_site_id`) USING BTREE,
  CONSTRAINT `fk_plug_resume_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简历表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plug_resume
-- ----------------------------
INSERT INTO `plug_resume` VALUES (3, 1, '123', '软件UI设计师', '2014-12-08 17:38:37', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_btn
-- ----------------------------
DROP TABLE IF EXISTS `sys_btn`;
CREATE TABLE `sys_btn`  (
  `RID` int(12) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BTN_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_ID` int(12) NOT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 352 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_btn
-- ----------------------------
INSERT INTO `sys_btn` VALUES (1, 'RCRW@BUTTON#1', '新增', '/', 37, '新增');
INSERT INTO `sys_btn` VALUES (3, 'RCRW@BUTTON#3', '删除', '/', 37, '删除');
INSERT INTO `sys_btn` VALUES (4, 'RCRW@BUTTON#4', '批量删除', '/', 37, '批量删除');
INSERT INTO `sys_btn` VALUES (5, 'RCRW@BUTTON#5', '批量导入', '/', 37, '批量导入EXCEL');
INSERT INTO `sys_btn` VALUES (6, 'RCRW@BUTTON#6', '导出', '/', 37, '导出');
INSERT INTO `sys_btn` VALUES (7, 'RCRW@BUTTON#7', '导出WORD', '/', 37, '导出WORD文档');
INSERT INTO `sys_btn` VALUES (8, 'General@Button#1', '新增', '/', 37, '新增');
INSERT INTO `sys_btn` VALUES (9, 'General@Button#2', '修改', '/', 37, '修改');
INSERT INTO `sys_btn` VALUES (10, 'General@Button#4', '查询', '/', 37, '查询');
INSERT INTO `sys_btn` VALUES (11, 'General@Button#3', '删除', '/', 37, '删除');
INSERT INTO `sys_btn` VALUES (12, 'General@Button#6', '导出', '/', 37, '导出');
INSERT INTO `sys_btn` VALUES (13, 'General@Button#7', '生成报表', '/', 37, '生成报表');
INSERT INTO `sys_btn` VALUES (14, 'General@Button#5', '导入', '/', 37, '导入');
INSERT INTO `sys_btn` VALUES (15, 'General@Button#8', '生成WORD', '/', 37, '生成WORD');
INSERT INTO `sys_btn` VALUES (16, 'General@Button#5', '导入', '/', 40, '导入');
INSERT INTO `sys_btn` VALUES (17, 'General@Button#1', '新增', '/', 40, '新增');
INSERT INTO `sys_btn` VALUES (18, 'General@Button#2', '修改', '/', 40, '修改');
INSERT INTO `sys_btn` VALUES (19, 'General@Button#4', '查询', '/', 40, '查询');
INSERT INTO `sys_btn` VALUES (20, 'General@Button#3', '删除', '/', 40, '删除');
INSERT INTO `sys_btn` VALUES (21, 'General@Button#6', '导出', '/', 40, '导出');
INSERT INTO `sys_btn` VALUES (22, 'General@Button#8', '生成WORD', '/', 40, '生成WORD');
INSERT INTO `sys_btn` VALUES (23, 'General@Button#7', '生成报表', '/', 40, '生成报表');
INSERT INTO `sys_btn` VALUES (24, 'General@Button#2', '修改', '/', 34, '修改');
INSERT INTO `sys_btn` VALUES (25, 'General@Button#4', '查询', '/', 34, '查询');
INSERT INTO `sys_btn` VALUES (26, 'General@Button#1', '新增', '/', 34, '新增');
INSERT INTO `sys_btn` VALUES (27, 'General@Button#5', '导入', '/', 34, '导入');
INSERT INTO `sys_btn` VALUES (28, 'General@Button#3', '删除', '/', 34, '删除');
INSERT INTO `sys_btn` VALUES (29, 'General@Button#6', '导出', '/', 34, '导出');
INSERT INTO `sys_btn` VALUES (30, 'General@Button#8', '生成WORD', '/', 34, '生成WORD');
INSERT INTO `sys_btn` VALUES (31, 'General@Button#7', '生成报表', '/', 34, '生成报表');
INSERT INTO `sys_btn` VALUES (32, 'General@Button#1', '新增', '/', 36, '新增');
INSERT INTO `sys_btn` VALUES (33, 'General@Button#2', '修改', '/', 36, '修改');
INSERT INTO `sys_btn` VALUES (34, 'General@Button#3', '删除', '/', 36, '删除');
INSERT INTO `sys_btn` VALUES (35, 'General@Button#4', '查询', '/', 36, '查询');
INSERT INTO `sys_btn` VALUES (36, 'General@Button#5', '导入', '/', 36, '导入');
INSERT INTO `sys_btn` VALUES (37, 'General@Button#6', '导出', '/', 36, '导出');
INSERT INTO `sys_btn` VALUES (38, 'General@Button#7', '生成报表', '/', 36, '生成报表');
INSERT INTO `sys_btn` VALUES (39, 'General@Button#8', '生成WORD', '/', 36, '生成WORD');
INSERT INTO `sys_btn` VALUES (40, 'General@Button#1', '新增', '/', 69, '新增');
INSERT INTO `sys_btn` VALUES (41, 'General@Button#3', '删除', '/', 69, '删除');
INSERT INTO `sys_btn` VALUES (42, 'General@Button#2', '修改', '/', 69, '修改');
INSERT INTO `sys_btn` VALUES (43, 'General@Button#4', '查询', '/', 69, '查询');
INSERT INTO `sys_btn` VALUES (44, 'General@Button#5', '导入', '/', 69, '导入');
INSERT INTO `sys_btn` VALUES (45, 'General@Button#6', '导出', '/', 69, '导出');
INSERT INTO `sys_btn` VALUES (46, 'General@Button#7', '生成报表', '/', 69, '生成报表');
INSERT INTO `sys_btn` VALUES (47, 'General@Button#8', '生成WORD', '/', 69, '生成WORD');
INSERT INTO `sys_btn` VALUES (48, 'General@Button#3', '删除', '/', 73, '删除');
INSERT INTO `sys_btn` VALUES (49, 'General@Button#4', '查询', '/', 73, '查询');
INSERT INTO `sys_btn` VALUES (50, 'General@Button#5', '导入', '/', 73, '导入');
INSERT INTO `sys_btn` VALUES (51, 'General@Button#2', '修改', '/', 73, '修改');
INSERT INTO `sys_btn` VALUES (52, 'General@Button#1', '新增', '/', 73, '新增');
INSERT INTO `sys_btn` VALUES (53, 'General@Button#6', '导出', '/', 73, '导出');
INSERT INTO `sys_btn` VALUES (54, 'General@Button#8', '生成WORD', '/', 73, '生成WORD');
INSERT INTO `sys_btn` VALUES (55, 'General@Button#7', '生成报表', '/', 73, '生成报表');
INSERT INTO `sys_btn` VALUES (56, 'General@Button#3', '删除', '/', 71, '删除');
INSERT INTO `sys_btn` VALUES (57, 'General@Button#2', '修改', '/', 71, '修改');
INSERT INTO `sys_btn` VALUES (58, 'General@Button#1', '新增', '/', 71, '新增');
INSERT INTO `sys_btn` VALUES (59, 'General@Button#4', '查询', '/', 71, '查询');
INSERT INTO `sys_btn` VALUES (60, 'General@Button#5', '导入', '/', 71, '导入');
INSERT INTO `sys_btn` VALUES (61, 'General@Button#6', '导出', '/', 71, '导出');
INSERT INTO `sys_btn` VALUES (62, 'General@Button#7', '生成报表', '/', 71, '生成报表');
INSERT INTO `sys_btn` VALUES (63, 'General@Button#8', '生成WORD', '/', 71, '生成WORD');
INSERT INTO `sys_btn` VALUES (64, 'General@Button#1', '新增', '/', 70, '新增');
INSERT INTO `sys_btn` VALUES (65, 'General@Button#4', '查询', '/', 70, '查询');
INSERT INTO `sys_btn` VALUES (66, 'General@Button#3', '删除', '/', 70, '删除');
INSERT INTO `sys_btn` VALUES (67, 'General@Button#2', '修改', '/', 70, '修改');
INSERT INTO `sys_btn` VALUES (68, 'General@Button#6', '导出', '/', 70, '导出');
INSERT INTO `sys_btn` VALUES (69, 'General@Button#5', '导入', '/', 70, '导入');
INSERT INTO `sys_btn` VALUES (70, 'General@Button#7', '生成报表', '/', 70, '生成报表');
INSERT INTO `sys_btn` VALUES (71, 'General@Button#8', '生成WORD', '/', 70, '生成WORD');
INSERT INTO `sys_btn` VALUES (72, 'General@Button#2', '修改', '/', 72, '修改');
INSERT INTO `sys_btn` VALUES (73, 'General@Button#3', '删除', '/', 72, '删除');
INSERT INTO `sys_btn` VALUES (74, 'General@Button#1', '新增', '/', 72, '新增');
INSERT INTO `sys_btn` VALUES (75, 'General@Button#5', '导入', '/', 72, '导入');
INSERT INTO `sys_btn` VALUES (76, 'General@Button#4', '查询', '/', 72, '查询');
INSERT INTO `sys_btn` VALUES (77, 'General@Button#6', '导出', '/', 72, '导出');
INSERT INTO `sys_btn` VALUES (78, 'General@Button#7', '生成报表', '/', 72, '生成报表');
INSERT INTO `sys_btn` VALUES (79, 'General@Button#8', '生成WORD', '/', 72, '生成WORD');
INSERT INTO `sys_btn` VALUES (80, 'General@Button#2', '修改', '/', 72, '修改');
INSERT INTO `sys_btn` VALUES (81, 'General@Button#1', '新增', '/', 72, '新增');
INSERT INTO `sys_btn` VALUES (82, 'General@Button#3', '删除', '/', 72, '删除');
INSERT INTO `sys_btn` VALUES (83, 'General@Button#4', '查询', '/', 72, '查询');
INSERT INTO `sys_btn` VALUES (84, 'General@Button#5', '导入', '/', 72, '导入');
INSERT INTO `sys_btn` VALUES (85, 'General@Button#6', '导出', '/', 72, '导出');
INSERT INTO `sys_btn` VALUES (86, 'General@Button#8', '生成WORD', '/', 72, '生成WORD');
INSERT INTO `sys_btn` VALUES (87, 'General@Button#7', '生成报表', '/', 72, '生成报表');
INSERT INTO `sys_btn` VALUES (88, 'General@Button#2', '修改', '/', 72, '修改');
INSERT INTO `sys_btn` VALUES (89, 'General@Button#4', '查询', '/', 72, '查询');
INSERT INTO `sys_btn` VALUES (90, 'General@Button#1', '新增', '/', 72, '新增');
INSERT INTO `sys_btn` VALUES (91, 'General@Button#3', '删除', '/', 72, '删除');
INSERT INTO `sys_btn` VALUES (92, 'General@Button#6', '导出', '/', 72, '导出');
INSERT INTO `sys_btn` VALUES (93, 'General@Button#5', '导入', '/', 72, '导入');
INSERT INTO `sys_btn` VALUES (94, 'General@Button#7', '生成报表', '/', 72, '生成报表');
INSERT INTO `sys_btn` VALUES (95, 'General@Button#8', '生成WORD', '/', 72, '生成WORD');
INSERT INTO `sys_btn` VALUES (96, 'General@Button#1', '新增', '/', 72, '新增');
INSERT INTO `sys_btn` VALUES (97, 'General@Button#4', '查询', '/', 72, '查询');
INSERT INTO `sys_btn` VALUES (98, 'General@Button#2', '修改', '/', 72, '修改');
INSERT INTO `sys_btn` VALUES (99, 'General@Button#3', '删除', '/', 72, '删除');
INSERT INTO `sys_btn` VALUES (100, 'General@Button#5', '导入', '/', 72, '导入');
INSERT INTO `sys_btn` VALUES (101, 'General@Button#6', '导出', '/', 72, '导出');
INSERT INTO `sys_btn` VALUES (102, 'General@Button#8', '生成WORD', '/', 72, '生成WORD');
INSERT INTO `sys_btn` VALUES (103, 'General@Button#7', '生成报表', '/', 72, '生成报表');
INSERT INTO `sys_btn` VALUES (104, 'General@Button#4', '查询', '/', 72, '查询');
INSERT INTO `sys_btn` VALUES (105, 'General@Button#1', '新增', '/', 72, '新增');
INSERT INTO `sys_btn` VALUES (106, 'General@Button#2', '修改', '/', 72, '修改');
INSERT INTO `sys_btn` VALUES (107, 'General@Button#3', '删除', '/', 72, '删除');
INSERT INTO `sys_btn` VALUES (108, 'General@Button#6', '导出', '/', 72, '导出');
INSERT INTO `sys_btn` VALUES (109, 'General@Button#5', '导入', '/', 72, '导入');
INSERT INTO `sys_btn` VALUES (110, 'General@Button#7', '生成报表', '/', 72, '生成报表');
INSERT INTO `sys_btn` VALUES (111, 'General@Button#8', '生成WORD', '/', 72, '生成WORD');
INSERT INTO `sys_btn` VALUES (112, 'General@Button#1', '新增', '/', 72, '新增');
INSERT INTO `sys_btn` VALUES (113, 'General@Button#3', '删除', '/', 72, '删除');
INSERT INTO `sys_btn` VALUES (114, 'General@Button#4', '查询', '/', 72, '查询');
INSERT INTO `sys_btn` VALUES (115, 'General@Button#2', '修改', '/', 72, '修改');
INSERT INTO `sys_btn` VALUES (116, 'General@Button#6', '导出', '/', 72, '导出');
INSERT INTO `sys_btn` VALUES (117, 'General@Button#5', '导入', '/', 72, '导入');
INSERT INTO `sys_btn` VALUES (118, 'General@Button#7', '生成报表', '/', 72, '生成报表');
INSERT INTO `sys_btn` VALUES (119, 'General@Button#8', '生成WORD', '/', 72, '生成WORD');
INSERT INTO `sys_btn` VALUES (120, 'General@Button#2', '修改', '/', 72, '修改');
INSERT INTO `sys_btn` VALUES (121, 'General@Button#1', '新增', '/', 72, '新增');
INSERT INTO `sys_btn` VALUES (122, 'General@Button#5', '导入', '/', 72, '导入');
INSERT INTO `sys_btn` VALUES (123, 'General@Button#4', '查询', '/', 72, '查询');
INSERT INTO `sys_btn` VALUES (124, 'General@Button#3', '删除', '/', 72, '删除');
INSERT INTO `sys_btn` VALUES (125, 'General@Button#6', '导出', '/', 72, '导出');
INSERT INTO `sys_btn` VALUES (126, 'General@Button#7', '生成报表', '/', 72, '生成报表');
INSERT INTO `sys_btn` VALUES (127, 'General@Button#8', '生成WORD', '/', 72, '生成WORD');
INSERT INTO `sys_btn` VALUES (128, 'General@Button#2', '修改', '/', 72, '修改');
INSERT INTO `sys_btn` VALUES (129, 'General@Button#1', '新增', '/', 72, '新增');
INSERT INTO `sys_btn` VALUES (130, 'General@Button#3', '删除', '/', 72, '删除');
INSERT INTO `sys_btn` VALUES (131, 'General@Button#4', '查询', '/', 72, '查询');
INSERT INTO `sys_btn` VALUES (132, 'General@Button#5', '导入', '/', 72, '导入');
INSERT INTO `sys_btn` VALUES (133, 'General@Button#6', '导出', '/', 72, '导出');
INSERT INTO `sys_btn` VALUES (134, 'General@Button#7', '生成报表', '/', 72, '生成报表');
INSERT INTO `sys_btn` VALUES (135, 'General@Button#8', '生成WORD', '/', 72, '生成WORD');
INSERT INTO `sys_btn` VALUES (136, 'General@Button#4', '查询', '/', 78, '查询');
INSERT INTO `sys_btn` VALUES (137, 'General@Button#2', '修改', '/', 78, '修改');
INSERT INTO `sys_btn` VALUES (138, 'General@Button#1', '新增', '/', 78, '新增');
INSERT INTO `sys_btn` VALUES (139, 'General@Button#3', '删除', '/', 78, '删除');
INSERT INTO `sys_btn` VALUES (140, 'General@Button#6', '导出', '/', 78, '导出');
INSERT INTO `sys_btn` VALUES (141, 'General@Button#5', '导入', '/', 78, '导入');
INSERT INTO `sys_btn` VALUES (142, 'General@Button#7', '生成报表', '/', 78, '生成报表');
INSERT INTO `sys_btn` VALUES (143, 'General@Button#8', '生成WORD', '/', 78, '生成WORD');
INSERT INTO `sys_btn` VALUES (144, 'General@Button#1', '新增', '/', 39, '新增');
INSERT INTO `sys_btn` VALUES (145, 'General@Button#2', '修改', '/', 39, '修改');
INSERT INTO `sys_btn` VALUES (146, 'General@Button#3', '删除', '/', 39, '删除');
INSERT INTO `sys_btn` VALUES (147, 'General@Button#5', '导入', '/', 39, '导入');
INSERT INTO `sys_btn` VALUES (148, 'General@Button#4', '查询', '/', 39, '查询');
INSERT INTO `sys_btn` VALUES (149, 'General@Button#6', '导出', '/', 39, '导出');
INSERT INTO `sys_btn` VALUES (150, 'General@Button#7', '生成报表', '/', 39, '生成报表');
INSERT INTO `sys_btn` VALUES (151, 'General@Button#8', '生成WORD', '/', 39, '生成WORD');
INSERT INTO `sys_btn` VALUES (152, 'General@Button#3', '删除', '/', 24, '删除');
INSERT INTO `sys_btn` VALUES (153, 'General@Button#2', '修改', '/', 24, '修改');
INSERT INTO `sys_btn` VALUES (154, 'General@Button#1', '新增', '/', 24, '新增');
INSERT INTO `sys_btn` VALUES (155, 'General@Button#4', '查询', '/', 24, '查询');
INSERT INTO `sys_btn` VALUES (156, 'General@Button#5', '导入', '/', 24, '导入');
INSERT INTO `sys_btn` VALUES (157, 'General@Button#6', '导出', '/', 24, '导出');
INSERT INTO `sys_btn` VALUES (158, 'General@Button#7', '生成报表', '/', 24, '生成报表');
INSERT INTO `sys_btn` VALUES (159, 'General@Button#8', '生成WORD', '/', 24, '生成WORD');
INSERT INTO `sys_btn` VALUES (160, 'General@Button#3', '删除', '/', 24, '删除');
INSERT INTO `sys_btn` VALUES (161, 'General@Button#1', '新增', '/', 24, '新增');
INSERT INTO `sys_btn` VALUES (162, 'General@Button#4', '查询', '/', 24, '查询');
INSERT INTO `sys_btn` VALUES (163, 'General@Button#5', '导入', '/', 24, '导入');
INSERT INTO `sys_btn` VALUES (164, 'General@Button#2', '修改', '/', 24, '修改');
INSERT INTO `sys_btn` VALUES (165, 'General@Button#6', '导出', '/', 24, '导出');
INSERT INTO `sys_btn` VALUES (166, 'General@Button#7', '生成报表', '/', 24, '生成报表');
INSERT INTO `sys_btn` VALUES (167, 'General@Button#8', '生成WORD', '/', 24, '生成WORD');
INSERT INTO `sys_btn` VALUES (168, 'General@Button#1', '新增', '/', 78, '新增');
INSERT INTO `sys_btn` VALUES (169, 'General@Button#2', '修改', '/', 78, '修改');
INSERT INTO `sys_btn` VALUES (170, 'General@Button#4', '查询', '/', 78, '查询');
INSERT INTO `sys_btn` VALUES (171, 'General@Button#3', '删除', '/', 78, '删除');
INSERT INTO `sys_btn` VALUES (172, 'General@Button#5', '导入', '/', 78, '导入');
INSERT INTO `sys_btn` VALUES (173, 'General@Button#6', '导出', '/', 78, '导出');
INSERT INTO `sys_btn` VALUES (174, 'General@Button#7', '生成报表', '/', 78, '生成报表');
INSERT INTO `sys_btn` VALUES (175, 'General@Button#8', '生成WORD', '/', 78, '生成WORD');
INSERT INTO `sys_btn` VALUES (176, 'General@Button#5', '导入', '/', 41, '导入');
INSERT INTO `sys_btn` VALUES (177, 'General@Button#3', '删除', '/', 41, '删除');
INSERT INTO `sys_btn` VALUES (178, 'General@Button#2', '修改', '/', 41, '修改');
INSERT INTO `sys_btn` VALUES (179, 'General@Button#6', '导出', '/', 41, '导出');
INSERT INTO `sys_btn` VALUES (180, 'General@Button#1', '新增', '/', 41, '新增');
INSERT INTO `sys_btn` VALUES (181, 'General@Button#4', '查询', '/', 41, '查询');
INSERT INTO `sys_btn` VALUES (182, 'General@Button#8', '生成WORD', '/', 41, '生成WORD');
INSERT INTO `sys_btn` VALUES (183, 'General@Button#7', '生成报表', '/', 41, '生成报表');
INSERT INTO `sys_btn` VALUES (184, 'General@Button#3', '删除', '/', 25, '删除');
INSERT INTO `sys_btn` VALUES (185, 'General@Button#2', '修改', '/', 25, '修改');
INSERT INTO `sys_btn` VALUES (186, 'General@Button#1', '新增', '/', 25, '新增');
INSERT INTO `sys_btn` VALUES (187, 'General@Button#4', '查询', '/', 25, '查询');
INSERT INTO `sys_btn` VALUES (188, 'General@Button#6', '导出', '/', 25, '导出');
INSERT INTO `sys_btn` VALUES (189, 'General@Button#5', '导入', '/', 25, '导入');
INSERT INTO `sys_btn` VALUES (190, 'General@Button#7', '生成报表', '/', 25, '生成报表');
INSERT INTO `sys_btn` VALUES (191, 'General@Button#8', '生成WORD', '/', 25, '生成WORD');
INSERT INTO `sys_btn` VALUES (192, 'General@Button#3', '删除', '/', 28, '删除');
INSERT INTO `sys_btn` VALUES (193, 'General@Button#2', '修改', '/', 28, '修改');
INSERT INTO `sys_btn` VALUES (194, 'General@Button#1', '新增', '/', 28, '新增');
INSERT INTO `sys_btn` VALUES (195, 'General@Button#4', '查询', '/', 28, '查询');
INSERT INTO `sys_btn` VALUES (196, 'General@Button#6', '导出', '/', 28, '导出');
INSERT INTO `sys_btn` VALUES (197, 'General@Button#5', '导入', '/', 28, '导入');
INSERT INTO `sys_btn` VALUES (198, 'General@Button#7', '生成报表', '/', 28, '生成报表');
INSERT INTO `sys_btn` VALUES (199, 'General@Button#8', '生成WORD', '/', 28, '生成WORD');
INSERT INTO `sys_btn` VALUES (200, 'General@Button#2', '修改', '/', 37, '修改');
INSERT INTO `sys_btn` VALUES (201, 'General@Button#6', '导出', '/', 37, '导出');
INSERT INTO `sys_btn` VALUES (202, 'General@Button#4', '查询', '/', 37, '查询');
INSERT INTO `sys_btn` VALUES (203, 'General@Button#5', '导入', '/', 37, '导入');
INSERT INTO `sys_btn` VALUES (204, 'General@Button#3', '删除', '/', 37, '删除');
INSERT INTO `sys_btn` VALUES (205, 'General@Button#1', '新增', '/', 37, '新增');
INSERT INTO `sys_btn` VALUES (206, 'General@Button#7', '生成报表', '/', 37, '生成报表');
INSERT INTO `sys_btn` VALUES (207, 'General@Button#8', '生成WORD', '/', 37, '生成WORD');
INSERT INTO `sys_btn` VALUES (208, 'General@Button#1', '新增', '/', 79, '新增');
INSERT INTO `sys_btn` VALUES (209, 'General@Button#3', '删除', '/', 79, '删除');
INSERT INTO `sys_btn` VALUES (210, 'General@Button#5', '导入', '/', 79, '导入');
INSERT INTO `sys_btn` VALUES (211, 'General@Button#4', '查询', '/', 79, '查询');
INSERT INTO `sys_btn` VALUES (212, 'General@Button#6', '导出', '/', 79, '导出');
INSERT INTO `sys_btn` VALUES (213, 'General@Button#8', '生成WORD', '/', 79, '生成WORD');
INSERT INTO `sys_btn` VALUES (214, 'General@Button#2', '修改', '/', 79, '修改');
INSERT INTO `sys_btn` VALUES (215, 'General@Button#7', '生成报表', '/', 79, '生成报表');
INSERT INTO `sys_btn` VALUES (216, 'General@Button#1', '新增', '/', 93, '新增');
INSERT INTO `sys_btn` VALUES (217, 'General@Button#2', '修改', '/', 93, '修改');
INSERT INTO `sys_btn` VALUES (218, 'General@Button#4', '查询', '/', 93, '查询');
INSERT INTO `sys_btn` VALUES (219, 'General@Button#5', '导入', '/', 93, '导入');
INSERT INTO `sys_btn` VALUES (220, 'General@Button#3', '删除', '/', 93, '删除');
INSERT INTO `sys_btn` VALUES (221, 'General@Button#6', '导出', '/', 93, '导出');
INSERT INTO `sys_btn` VALUES (222, 'General@Button#7', '生成报表', '/', 93, '生成报表');
INSERT INTO `sys_btn` VALUES (223, 'General@Button#8', '生成WORD', '/', 93, '生成WORD');
INSERT INTO `sys_btn` VALUES (224, 'General@Button#3', '删除', '/', 67, '删除');
INSERT INTO `sys_btn` VALUES (225, 'General@Button#5', '导入', '/', 67, '导入');
INSERT INTO `sys_btn` VALUES (226, 'General@Button#2', '修改', '/', 67, '修改');
INSERT INTO `sys_btn` VALUES (227, 'General@Button#4', '查询', '/', 67, '查询');
INSERT INTO `sys_btn` VALUES (228, 'General@Button#1', '新增', '/', 67, '新增');
INSERT INTO `sys_btn` VALUES (229, 'General@Button#6', '导出', '/', 67, '导出');
INSERT INTO `sys_btn` VALUES (230, 'General@Button#8', '生成WORD', '/', 67, '生成WORD');
INSERT INTO `sys_btn` VALUES (231, 'General@Button#7', '生成报表', '/', 67, '生成报表');
INSERT INTO `sys_btn` VALUES (232, 'General@Button#1', '新增', '/', 48, '新增');
INSERT INTO `sys_btn` VALUES (233, 'General@Button#4', '查询', '/', 48, '查询');
INSERT INTO `sys_btn` VALUES (234, 'General@Button#2', '修改', '/', 48, '修改');
INSERT INTO `sys_btn` VALUES (235, 'General@Button#6', '导出', '/', 48, '导出');
INSERT INTO `sys_btn` VALUES (236, 'General@Button#5', '导入', '/', 48, '导入');
INSERT INTO `sys_btn` VALUES (237, 'General@Button#3', '删除', '/', 48, '删除');
INSERT INTO `sys_btn` VALUES (238, 'General@Button#7', '生成报表', '/', 48, '生成报表');
INSERT INTO `sys_btn` VALUES (239, 'General@Button#8', '生成WORD', '/', 48, '生成WORD');
INSERT INTO `sys_btn` VALUES (240, 'General@Button#6', '导出', '/', 39, '导出');
INSERT INTO `sys_btn` VALUES (241, 'General@Button#4', '查询', '/', 39, '查询');
INSERT INTO `sys_btn` VALUES (242, 'General@Button#1', '新增', '/', 39, '新增');
INSERT INTO `sys_btn` VALUES (243, 'General@Button#5', '导入', '/', 39, '导入');
INSERT INTO `sys_btn` VALUES (244, 'General@Button#3', '删除', '/', 39, '删除');
INSERT INTO `sys_btn` VALUES (245, 'General@Button#2', '修改', '/', 39, '修改');
INSERT INTO `sys_btn` VALUES (246, 'General@Button#7', '生成报表', '/', 39, '生成报表');
INSERT INTO `sys_btn` VALUES (247, 'General@Button#8', '生成WORD', '/', 39, '生成WORD');
INSERT INTO `sys_btn` VALUES (248, 'General@Button#2', '修改', '/', 35, '修改');
INSERT INTO `sys_btn` VALUES (249, 'General@Button#3', '删除', '/', 35, '删除');
INSERT INTO `sys_btn` VALUES (250, 'General@Button#1', '新增', '/', 35, '新增');
INSERT INTO `sys_btn` VALUES (251, 'General@Button#4', '查询', '/', 35, '查询');
INSERT INTO `sys_btn` VALUES (252, 'General@Button#5', '导入', '/', 35, '导入');
INSERT INTO `sys_btn` VALUES (253, 'General@Button#6', '导出', '/', 35, '导出');
INSERT INTO `sys_btn` VALUES (254, 'General@Button#7', '生成报表', '/', 35, '生成报表');
INSERT INTO `sys_btn` VALUES (255, 'General@Button#8', '生成WORD', '/', 35, '生成WORD');
INSERT INTO `sys_btn` VALUES (256, 'General@Button#1', '新增', '/', 49, '新增');
INSERT INTO `sys_btn` VALUES (257, 'General@Button#2', '修改', '/', 49, '修改');
INSERT INTO `sys_btn` VALUES (258, 'General@Button#6', '导出', '/', 49, '导出');
INSERT INTO `sys_btn` VALUES (259, 'General@Button#5', '导入', '/', 49, '导入');
INSERT INTO `sys_btn` VALUES (260, 'General@Button#3', '删除', '/', 49, '删除');
INSERT INTO `sys_btn` VALUES (261, 'General@Button#4', '查询', '/', 49, '查询');
INSERT INTO `sys_btn` VALUES (262, 'General@Button#7', '生成报表', '/', 49, '生成报表');
INSERT INTO `sys_btn` VALUES (263, 'General@Button#8', '生成WORD', '/', 49, '生成WORD');
INSERT INTO `sys_btn` VALUES (264, 'General@Button#1', '新增', '/', 37, '新增');
INSERT INTO `sys_btn` VALUES (265, 'General@Button#2', '修改', '/', 37, '修改');
INSERT INTO `sys_btn` VALUES (266, 'General@Button#6', '导出', '/', 37, '导出');
INSERT INTO `sys_btn` VALUES (267, 'General@Button#4', '查询', '/', 37, '查询');
INSERT INTO `sys_btn` VALUES (268, 'General@Button#3', '删除', '/', 37, '删除');
INSERT INTO `sys_btn` VALUES (269, 'General@Button#5', '导入', '/', 37, '导入');
INSERT INTO `sys_btn` VALUES (270, 'General@Button#7', '生成报表', '/', 37, '生成报表');
INSERT INTO `sys_btn` VALUES (271, 'General@Button#8', '生成WORD', '/', 37, '生成WORD');
INSERT INTO `sys_btn` VALUES (272, 'General@Button#2', '修改', '/', 75, '修改');
INSERT INTO `sys_btn` VALUES (273, 'General@Button#4', '查询', '/', 75, '查询');
INSERT INTO `sys_btn` VALUES (274, 'General@Button#3', '删除', '/', 75, '删除');
INSERT INTO `sys_btn` VALUES (275, 'General@Button#5', '导入', '/', 75, '导入');
INSERT INTO `sys_btn` VALUES (277, 'General@Button#8', '生成WORD', '/', 75, '生成WORD');
INSERT INTO `sys_btn` VALUES (278, 'General@Button#7', '生成报表', '/', 75, '生成报表');
INSERT INTO `sys_btn` VALUES (280, 'General@Button#4', '查询', '/', 75, '查询');
INSERT INTO `sys_btn` VALUES (281, 'General@Button#2', '修改', '/', 75, '修改');
INSERT INTO `sys_btn` VALUES (282, 'General@Button#3', '删除', '/', 75, '删除');
INSERT INTO `sys_btn` VALUES (283, 'General@Button#1', '新增', '/', 75, '新增');
INSERT INTO `sys_btn` VALUES (284, 'General@Button#5', '导入', '/', 75, '导入');
INSERT INTO `sys_btn` VALUES (286, 'General@Button#7', '生成报表', '/', 75, '生成报表');
INSERT INTO `sys_btn` VALUES (287, 'General@Button#8', '生成WORD', '/', 75, '生成WORD');
INSERT INTO `sys_btn` VALUES (288, 'General@Button#4', '查询', '/', 39, '查询');
INSERT INTO `sys_btn` VALUES (289, 'General@Button#1', '新增', '/', 39, '新增');
INSERT INTO `sys_btn` VALUES (290, 'General@Button#2', '修改', '/', 39, '修改');
INSERT INTO `sys_btn` VALUES (291, 'General@Button#5', '导入', '/', 39, '导入');
INSERT INTO `sys_btn` VALUES (292, 'General@Button#3', '删除', '/', 39, '删除');
INSERT INTO `sys_btn` VALUES (293, 'General@Button#6', '导出', '/', 39, '导出');
INSERT INTO `sys_btn` VALUES (294, 'General@Button#7', '生成报表', '/', 39, '生成报表');
INSERT INTO `sys_btn` VALUES (295, 'General@Button#8', '生成WORD', '/', 39, '生成WORD');
INSERT INTO `sys_btn` VALUES (296, 'General@Button#4', '查询', '/', 78, '查询');
INSERT INTO `sys_btn` VALUES (297, 'General@Button#3', '删除', '/', 78, '删除');
INSERT INTO `sys_btn` VALUES (298, 'General@Button#1', '新增', '/', 78, '新增');
INSERT INTO `sys_btn` VALUES (299, 'General@Button#5', '导入', '/', 78, '导入');
INSERT INTO `sys_btn` VALUES (300, 'General@Button#6', '导出', '/', 78, '导出');
INSERT INTO `sys_btn` VALUES (301, 'General@Button#2', '修改', '/', 78, '修改');
INSERT INTO `sys_btn` VALUES (302, 'General@Button#8', '生成WORD', '/', 78, '生成WORD');
INSERT INTO `sys_btn` VALUES (303, 'General@Button#7', '生成报表', '/', 78, '生成报表');
INSERT INTO `sys_btn` VALUES (304, 'General@Button#2', '修改', '/', 86, '修改');
INSERT INTO `sys_btn` VALUES (305, 'General@Button#1', '新增', '/', 86, '新增');
INSERT INTO `sys_btn` VALUES (306, 'General@Button#6', '导出', '/', 86, '导出');
INSERT INTO `sys_btn` VALUES (307, 'General@Button#5', '导入', '/', 86, '导入');
INSERT INTO `sys_btn` VALUES (308, 'General@Button#3', '删除', '/', 86, '删除');
INSERT INTO `sys_btn` VALUES (309, 'General@Button#4', '查询', '/', 86, '查询');
INSERT INTO `sys_btn` VALUES (310, 'General@Button#7', '生成报表', '/', 86, '生成报表');
INSERT INTO `sys_btn` VALUES (311, 'General@Button#8', '生成WORD', '/', 86, '生成WORD');
INSERT INTO `sys_btn` VALUES (312, 'General@Button#1', '新增', '/', 86, '新增');
INSERT INTO `sys_btn` VALUES (313, 'General@Button#3', '删除', '/', 86, '删除');
INSERT INTO `sys_btn` VALUES (314, 'General@Button#4', '查询', '/', 86, '查询');
INSERT INTO `sys_btn` VALUES (315, 'General@Button#2', '修改', '/', 86, '修改');
INSERT INTO `sys_btn` VALUES (316, 'General@Button#5', '导入', '/', 86, '导入');
INSERT INTO `sys_btn` VALUES (317, 'General@Button#6', '导出', '/', 86, '导出');
INSERT INTO `sys_btn` VALUES (318, 'General@Button#7', '生成报表', '/', 86, '生成报表');
INSERT INTO `sys_btn` VALUES (319, 'General@Button#8', '生成WORD', '/', 86, '生成WORD');
INSERT INTO `sys_btn` VALUES (320, 'General@Button#1', '新增', '/', 35, '新增');
INSERT INTO `sys_btn` VALUES (321, 'General@Button#6', '导出', '/', 35, '导出');
INSERT INTO `sys_btn` VALUES (322, 'General@Button#4', '查询', '/', 35, '查询');
INSERT INTO `sys_btn` VALUES (323, 'General@Button#5', '导入', '/', 35, '导入');
INSERT INTO `sys_btn` VALUES (324, 'General@Button#3', '删除', '/', 35, '删除');
INSERT INTO `sys_btn` VALUES (325, 'General@Button#2', '修改', '/', 35, '修改');
INSERT INTO `sys_btn` VALUES (326, 'General@Button#7', '生成报表', '/', 35, '生成报表');
INSERT INTO `sys_btn` VALUES (327, 'General@Button#8', '生成WORD', '/', 35, '生成WORD');
INSERT INTO `sys_btn` VALUES (328, 'General@Button#1', '新增', '/', 39, '新增');
INSERT INTO `sys_btn` VALUES (329, 'General@Button#2', '修改', '/', 39, '修改');
INSERT INTO `sys_btn` VALUES (330, 'General@Button#3', '删除', '/', 39, '删除');
INSERT INTO `sys_btn` VALUES (331, 'General@Button#4', '查询', '/', 39, '查询');
INSERT INTO `sys_btn` VALUES (332, 'General@Button#6', '导出', '/', 39, '导出');
INSERT INTO `sys_btn` VALUES (333, 'General@Button#5', '导入', '/', 39, '导入');
INSERT INTO `sys_btn` VALUES (334, 'General@Button#7', '生成报表', '/', 39, '生成报表');
INSERT INTO `sys_btn` VALUES (335, 'General@Button#8', '生成WORD', '/', 39, '生成WORD');
INSERT INTO `sys_btn` VALUES (336, 'General@Button#1', '新增', '/', 71, '新增');
INSERT INTO `sys_btn` VALUES (337, 'General@Button#5', '导入', '/', 71, '导入');
INSERT INTO `sys_btn` VALUES (338, 'General@Button#3', '删除', '/', 71, '删除');
INSERT INTO `sys_btn` VALUES (339, 'General@Button#2', '修改', '/', 71, '修改');
INSERT INTO `sys_btn` VALUES (340, 'General@Button#4', '查询', '/', 71, '查询');
INSERT INTO `sys_btn` VALUES (341, 'General@Button#7', '生成报表', '/', 71, '生成报表');
INSERT INTO `sys_btn` VALUES (342, 'General@Button#6', '导出', '/', 71, '导出');
INSERT INTO `sys_btn` VALUES (343, 'General@Button#8', '生成WORD', '/', 71, '生成WORD');
INSERT INTO `sys_btn` VALUES (344, 'General@Button#2', '修改', '/', 42, '修改');
INSERT INTO `sys_btn` VALUES (345, 'General@Button#3', '删除', '/', 42, '删除');
INSERT INTO `sys_btn` VALUES (346, 'General@Button#4', '查询', '/', 42, '查询');
INSERT INTO `sys_btn` VALUES (347, 'General@Button#1', '新增', '/', 42, '新增');
INSERT INTO `sys_btn` VALUES (348, 'General@Button#5', '导入', '/', 42, '导入');
INSERT INTO `sys_btn` VALUES (349, 'General@Button#8', '生成WORD', '/', 42, '生成WORD');
INSERT INTO `sys_btn` VALUES (350, 'General@Button#6', '导出', '/', 42, '导出');
INSERT INTO `sys_btn` VALUES (351, 'General@Button#7', '生成报表', '/', 42, '生成报表');

-- ----------------------------
-- Table structure for sys_constants
-- ----------------------------
DROP TABLE IF EXISTS `sys_constants`;
CREATE TABLE `sys_constants`  (
  `RID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CODE` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TABLE_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COLUMN_NAME` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_constants
-- ----------------------------
INSERT INTO `sys_constants` VALUES (1, '是', 'Y', 'SYS_USER', 'STATUS');
INSERT INTO `sys_constants` VALUES (2, '否', 'N', 'SYS_USER', 'STATUS');
INSERT INTO `sys_constants` VALUES (3, '男', 'MAN', 'UR_USER_INFO', 'GENDER');
INSERT INTO `sys_constants` VALUES (4, '女', 'WOMAN', 'UR_USER_INFO', 'GENDER');
INSERT INTO `sys_constants` VALUES (5, '有效', '10', 'SYS_ROLE', 'STATUS');
INSERT INTO `sys_constants` VALUES (6, '无效', '11', 'SYS_ROLE', 'STATUS');
INSERT INTO `sys_constants` VALUES (7, '静态页面', 'STATIC', 'SYS_MENU', 'MENU_TYPE');
INSERT INTO `sys_constants` VALUES (8, '动态页面', 'URL', 'SYS_MENU', 'MENU_TYPE');
INSERT INTO `sys_constants` VALUES (9, '模块', 'CATAGORY', 'SYS_MENU', 'MENU_TYPE');
INSERT INTO `sys_constants` VALUES (10, '正常', 'Normal', 'SYS_MENU', 'STATUS');
INSERT INTO `sys_constants` VALUES (16, '逻辑删除', 'Removed', 'SYS_MENU', 'STATUS');
INSERT INTO `sys_constants` VALUES (17, '分类', 'CLASS', 'SYS_MENU', 'MENU_TYPE');
INSERT INTO `sys_constants` VALUES (18, '引导分类', 'INDICATOR', 'SYS_MENU', 'MENU_TYPE');
INSERT INTO `sys_constants` VALUES (19, '业务类', 'BUSI_TYPE', 'SYS_MENU', 'MENU_TYPE');
INSERT INTO `sys_constants` VALUES (20, '机构目录', 'directory', 'SYS_ORGAN', 'ORGAN_TYPE');
INSERT INTO `sys_constants` VALUES (21, '机构', 'organ', 'SYS_ORGAN', 'ORGAN_TYPE');
INSERT INTO `sys_constants` VALUES (22, '单位', 'unit', 'SYS_ORGAN', 'ORGAN_TYPE');
INSERT INTO `sys_constants` VALUES (23, '部门', 'dept', 'SYS_ORGAN', 'ORGAN_TYPE');
INSERT INTO `sys_constants` VALUES (24, '个体经营者', 'person', 'SYS_ORGAN', 'ORGAN_TYPE');
INSERT INTO `sys_constants` VALUES (25, '学校', 'school', 'SYS_ORGAN', 'ORGAN_TYPE');
INSERT INTO `sys_constants` VALUES (26, '社团', 'group', 'SYS_ORGAN', 'ORGAN_TYPE');
INSERT INTO `sys_constants` VALUES (27, '领导', 'leader', 'SYS_ORGAN', 'ORGAN_TYPE');

-- ----------------------------
-- Table structure for sys_label
-- ----------------------------
DROP TABLE IF EXISTS `sys_label`;
CREATE TABLE `sys_label`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_organ_id` bigint(20) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `label_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_label
-- ----------------------------
INSERT INTO `sys_label` VALUES (1, '2018-09-28 21:27:57', NULL, NULL, '2018-09-28 21:28:01', NULL, NULL, 'demo');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `RID` int(12) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PID` int(12) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORD` int(12) NULL DEFAULT NULL,
  `TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `CREATE_USER` int(12) NULL DEFAULT NULL,
  `STATUS` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_USER` int(12) NULL DEFAULT NULL,
  `ICON_CLASS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (24, '', 0, 'PM01', '系统管理', 9, 'CATAGORY', '2018-08-06 22:13:15', '2018-08-09 22:49:59', 1, 'Normal', 1, 'icon-xitongguanli');
INSERT INTO `sys_menu` VALUES (25, '/menu/menu_list', 82, 'CH01', '菜单管理', 11, 'URL', '2018-08-06 22:13:59', '2018-08-09 23:07:47', 1, 'Normal', 1, 'icon-caidanguanli');
INSERT INTO `sys_menu` VALUES (26, '', 82, 'CH02', '权限管理', 12, 'URL', '2018-08-06 22:14:52', '2018-08-09 23:08:06', 1, 'Normal', 1, 'icon-quanxianguanli');
INSERT INTO `sys_menu` VALUES (27, '/role/index', 82, 'CH03', '角色管理', 13, 'URL', '2018-08-06 22:15:16', '2018-09-19 21:25:50', 1, 'Normal', 1, 'icon-role');
INSERT INTO `sys_menu` VALUES (28, '', 82, 'CH04', '用户管理', 14, 'URL', '2018-08-06 22:15:32', '2018-08-09 23:08:28', 1, 'Normal', 1, 'icon-yonghuguanli');
INSERT INTO `sys_menu` VALUES (29, '', 83, 'CH05', '操作日志', 15, 'URL', '2018-08-06 22:16:10', '2018-08-09 23:08:54', 1, 'Normal', 1, 'icon-caozuorizhi-copy');
INSERT INTO `sys_menu` VALUES (30, '', 83, 'CH06', '登陆日志', 16, 'URL', '2018-08-06 22:16:32', '2018-08-09 23:09:11', 1, 'Normal', 1, 'icon-denglurizhi');
INSERT INTO `sys_menu` VALUES (31, '', 82, 'CH07', '图标管理', 17, 'URL', '2018-08-06 22:17:35', '2018-08-09 23:09:51', 1, 'Normal', 1, 'icon-msnui-rightmini');
INSERT INTO `sys_menu` VALUES (32, '/constant/constant', 82, 'CH08', '常量管理', 18, 'URL', '2018-08-06 22:18:40', '2018-08-09 23:09:59', 1, 'Normal', 1, 'icon-shuju');
INSERT INTO `sys_menu` VALUES (34, '', 0, 'PM02', '信息管理', 3, 'CATAGORY', '2018-08-06 22:34:00', '2018-08-09 23:02:04', 1, 'Normal', 1, 'icon-xinxi');
INSERT INTO `sys_menu` VALUES (35, '', 0, 'CH10101', '微信管理', 7, 'CATAGORY', '2018-08-06 22:34:50', '2018-08-09 23:01:05', 1, 'Normal', 1, 'icon-weixin');
INSERT INTO `sys_menu` VALUES (36, '', 0, 'NRGL', '内容管理', 4, 'CATAGORY', '2018-08-06 22:38:48', '2018-08-12 11:28:22', 1, 'Normal', 1, 'icon-lanmujineirong');
INSERT INTO `sys_menu` VALUES (37, '', 0, 'RCRW', '日常任务', 1, 'CATAGORY', '2018-08-06 22:39:11', '2018-08-09 23:02:51', 1, 'Normal', 1, 'icon-richangrenwu');
INSERT INTO `sys_menu` VALUES (38, '', 0, 'DDGL', '调度管理', 6, 'CATAGORY', '2018-08-06 22:40:04', '2018-08-18 10:05:16', 1, 'Normal', 1, 'icon-tiaoduguanli');
INSERT INTO `sys_menu` VALUES (39, '', 0, 'SJCJ', '数据采集', 5, 'CATAGORY', '2018-08-06 22:40:38', '2018-08-09 23:01:40', 1, 'Normal', 1, 'icon-shujucaiji');
INSERT INTO `sys_menu` VALUES (40, '', 0, 'ZHFW', '综合服务', 2, 'CATAGORY', '2018-08-06 22:41:26', '2018-08-09 23:02:34', 1, 'Normal', 1, 'icon-zonghe');
INSERT INTO `sys_menu` VALUES (41, '', 0, 'XTJC', '系统监测', 8, 'CATAGORY', '2018-08-07 23:06:16', '2018-08-09 23:00:52', 1, 'Normal', 1, 'icon-neirongjiance');
INSERT INTO `sys_menu` VALUES (42, '', 41, 'JCLB', '监测类别', 1, 'INDICATOR', '2018-08-07 23:11:00', NULL, 1, 'Normal', NULL, NULL);
INSERT INTO `sys_menu` VALUES (43, '', 42, 'XTBB', '系统报表', 1, 'CLASS', '2018-08-07 23:11:43', '2018-08-09 23:17:51', 1, 'Normal', 1, 'icon-baobiao');
INSERT INTO `sys_menu` VALUES (44, '', 43, 'RCBB', '日常报表', 1, 'URL', '2018-08-07 23:12:02', '2018-08-22 20:02:53', 1, 'Normal', 1, 'icon-baobiao');
INSERT INTO `sys_menu` VALUES (45, '', 43, 'WDBB', 'word报表', 2, 'URL', '2018-08-07 23:12:46', '2018-08-22 20:02:59', 1, 'Normal', 1, 'icon-word');
INSERT INTO `sys_menu` VALUES (46, '', 42, 'YJTX', '邮件提醒', 2, 'CLASS', '2018-08-07 23:13:41', '2018-08-09 23:18:06', 1, 'Normal', 1, 'icon-youxiang');
INSERT INTO `sys_menu` VALUES (47, '', 46, 'ZYYJ', '重要邮件', 1, 'URL', '2018-08-07 23:14:14', '2018-08-12 12:30:04', 1, 'Normal', 1, 'icon-youjian1');
INSERT INTO `sys_menu` VALUES (48, '', 46, 'YBYJ', '一般邮件', 2, 'URL', '2018-08-07 23:14:34', '2018-08-12 12:30:15', 1, 'Normal', 1, 'icon-youjian');
INSERT INTO `sys_menu` VALUES (49, '', 41, 'JCTJ', '监测统计', 2, 'INDICATOR', '2018-08-07 23:15:24', '2018-08-15 22:46:31', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (50, '', 49, 'TABLE', '数据查询', 1, 'URL', '2018-08-07 23:16:00', '2018-08-09 23:19:51', 1, 'Normal', 1, 'icon-plus-datasearch');
INSERT INTO `sys_menu` VALUES (51, '', 49, 'CHART', '图表概况', 2, 'URL', '2018-08-07 23:17:01', '2018-08-09 23:20:06', 1, 'Normal', 1, 'icon-kaohebaobiao');
INSERT INTO `sys_menu` VALUES (52, '', 42, 'MESSAGE', '短信提醒', 3, 'CLASS', '2018-08-07 23:33:30', '2018-08-09 23:18:22', 1, 'Normal', 1, 'icon-duanxin');
INSERT INTO `sys_menu` VALUES (53, '', 52, 'BUSI_TYPE', '业务办理类', 1, 'URL', '2018-08-07 23:34:02', '2018-08-09 23:19:26', 1, 'Normal', 1, 'icon-yewubanli');
INSERT INTO `sys_menu` VALUES (54, '', 52, 'FEETX', '收费提醒', 2, 'URL', '2018-08-07 23:35:10', '2018-08-09 23:19:38', 1, 'Normal', 1, 'icon-shoufeibiaozhun');
INSERT INTO `sys_menu` VALUES (67, '/organ/index', 24, 'CH09', '组织机构', 19, 'URL', '2018-08-08 22:50:05', '2018-08-20 21:09:13', 1, 'Normal', 1, 'icon-zzjg');
INSERT INTO `sys_menu` VALUES (68, '', 24, 'CONF', '系统配置', 20, 'URL', '2018-08-13 19:55:14', '2018-08-13 19:56:03', 1, 'Normal', 1, 'icon-xitongguanli');
INSERT INTO `sys_menu` VALUES (69, '', 37, 'MY_TASK', '我的工作台', 1, 'INDICATOR', '2018-08-13 21:24:13', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (70, '/pages/common/dashborad.html', 69, 'DAIBAN', '我的待办', 1, 'URL', '2018-08-13 21:24:55', '2018-08-13 21:46:26', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (71, '', 69, 'MESSAGE', '我的消息', 2, 'URL', '2018-08-13 21:25:37', '2018-09-21 22:57:50', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (72, '', 69, 'EMAIL', '我的邮件', 3, 'URL', '2018-08-13 21:26:21', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (73, '', 69, 'TOOLS', '常用工具', 4, 'URL', '2018-08-13 21:27:08', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (75, '', 34, 'ACCESS', '接入信息', 1, 'INDICATOR', '2018-08-16 21:16:25', '2018-08-17 23:39:46', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (76, '', 36, 'TPL', '模板管理', 1, 'INDICATOR', '2018-08-16 21:16:46', '2018-08-17 23:41:03', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (77, '', 39, 'WORD', 'WORD导入', 1, 'URL', '2018-08-16 21:17:12', '2018-09-08 16:22:59', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (78, '', 38, 'TASKZP', '任务指派', 1, 'URL', '2018-08-16 21:17:40', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (79, '/', 35, 'SUCAI', '素材管理', 1, 'INDICATOR', '2018-08-16 21:18:06', '2018-08-20 22:18:24', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (81, '', 36, 'CONTENT_MODEL', '内容模型', 2, 'INDICATOR', '2018-08-17 20:19:05', '2018-08-17 23:41:08', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (82, '', 24, 'ADMIN', '管理员', 1, 'INDICATOR', '2018-08-17 23:30:18', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (83, '', 24, 'VIEW_USER', '用户数据', 2, 'INDICATOR', '2018-08-17 23:31:51', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (84, '', 40, 'MYSERVICE', '我的服务', 1, 'INDICATOR', '2018-08-17 23:37:12', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (85, '', 84, 'KAITONG', '已开通', 1, 'URL', '2018-08-17 23:37:35', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (86, '', 84, 'WEIKAITONG', '未开通', 2, 'URL', '2018-08-17 23:37:58', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (87, '', 40, 'ALL_SERVICE', '全部服务', 2, 'INDICATOR', '2018-08-17 23:38:34', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (88, '', 87, 'SYSTEM', '系统服务', 1, 'URL', '2018-08-17 23:39:01', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (89, '', 87, 'WEBSERVICE', '外部服务', 2, 'URL', '2018-08-17 23:39:22', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (90, '', 75, 'PERSON', '个人信息', 1, 'URL', '2018-08-17 23:40:06', '2018-08-22 20:04:29', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (91, '', 75, 'ORGAN', '组织机构', 2, 'URL', '2018-08-17 23:40:31', '2018-08-22 20:05:01', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (92, '', 76, 'HTML', '静态模板', 1, 'URL', '2018-08-17 23:41:41', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (93, '', 81, 'HTML', '静态内容', 1, 'URL', '2018-08-17 23:42:02', NULL, 1, 'Normal', NULL, '');
INSERT INTO `sys_menu` VALUES (94, '', 79, 'PIC_TEXT', '图文素材', 1, 'URL', '2018-08-20 22:15:52', '2018-08-22 20:06:50', 1, 'Normal', 1, '');
INSERT INTO `sys_menu` VALUES (95, '', 79, 'TEXT', '文本素材', 1, 'URL', '2018-08-20 22:16:13', '2018-08-22 20:03:36', 1, 'Normal', 1, '');

-- ----------------------------
-- Table structure for sys_organ
-- ----------------------------
DROP TABLE IF EXISTS `sys_organ`;
CREATE TABLE `sys_organ`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `organ_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organ_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organ_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organ_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(12) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_user` int(12) NULL DEFAULT NULL,
  `update_user` int(12) NULL DEFAULT NULL,
  `is_effect` int(10) NULL DEFAULT NULL,
  `record_state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organ_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organ
-- ----------------------------
INSERT INTO `sys_organ` VALUES (2, '100200300', '安徽省市政府', 'directory', '', '', '', '', '', 0, '2018-08-23 22:26:00', '2018-08-23 22:26:00', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (3, '100200301', '市发展改革委', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (4, '100200302', '市教体局', 'organ', '王', '安徽省合肥市政务区', '05510699698', '', '17855107850', 2, '2018-08-23 23:22:44', '2018-08-23 23:22:52', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (5, '100200303', '市民委', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (6, '100200304', '市民政局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (7, '100200305', '市财政局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (8, '100200306', '市国土资源局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (9, '100200307', '市交通运输局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (10, '100200308', '市水利局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (11, '100200309', '市商务局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (12, '100200310', '市统计局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (13, '100200311', '市卫生计生委', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (14, '100200312', '市质监局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (15, '100200313', '国家税务局合肥市税务局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (16, '100200314', '市安全监管局（安委办）', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (17, '100200315', '市直机关事务管理局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (18, '100200316', '市人防办', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (19, '100200317', '市信访局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (20, '100200318', '市公管局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (21, '100200319', '市地震局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (22, '100200320', '合肥市科技农商行', 'organ', '', '', '', '', '', 2, '2018-08-26 09:17:47', '2018-08-26 09:17:47', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (23, '100200321', '市残联', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (24, '100200322', '市招商局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (25, '100200323', '合肥经开区管委会', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (26, '100200324', '市房管局', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (27, '100200325', '市公积金中心', 'organ', '', '', '', '', '', 2, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (28, '100200326', '市扶贫局', 'organ', '', '', '', '', '', 2, '2018-08-26 09:18:30', '2018-08-26 09:18:30', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (29, '200100100', '市属公共企事业单位', 'directory', '', '', '', '', '', NULL, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (30, '200100101', '市交警支队', 'unit', '', '', '', '', '', 29, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (31, '200100102', '市职工养老保险管理中心', 'unit', '', '', '', '', '', 29, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (32, '200100103', '市运管处', 'unit', '', '', '', '', '', 29, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (33, '200100104', '市政管理处', 'unit', '', '', '', '', '', 29, '2018-08-23 23:50:52', '2018-08-23 23:50:52', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (34, '300100100', '个体经营者', 'person', '', '', '', '', '', NULL, '2018-08-23 23:51:18', '2018-08-23 23:51:18', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (35, '400100100', '教育单位', 'school', '', '', '', '', '', NULL, NULL, NULL, 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (36, '500100100', '社会团体', 'group', '', '', '', '', '', NULL, '2018-09-11 22:48:16', '2018-09-11 22:48:16', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (37, '600100100', '市管理办部（蜀山区分部）', 'dept', '', '', '', '', '', NULL, '2018-08-23 23:56:07', '2018-08-23 23:56:07', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (38, '700100100', '市管理办部（高新区分部）', 'dept', '', '', '', '', '', NULL, '2018-08-23 23:57:05', '2018-08-23 23:57:05', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (39, '800100100', '市管理办部（庐阳区分部）', 'dept', '', '', '', '', '', NULL, '2018-08-23 23:57:22', '2018-08-23 23:57:22', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (40, '900100100', '市管理办部（瑶海区分部）', 'dept', '', '', '', '', '', NULL, '2018-08-23 23:57:46', '2018-08-23 23:57:46', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (41, '900200100', '宿县代表委', 'unit', '', '', '', '', '', NULL, '2018-08-23 23:58:54', '2018-08-23 23:58:54', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (42, '900300100', '巢湖代管办（合肥市）', 'unit', '', '', '', '', '', NULL, '2018-08-23 23:59:54', '2018-08-23 23:59:54', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (43, '900400100', '市公交公司', 'unit', '', '', '', '', '', NULL, '2018-08-24 00:01:28', '2018-08-24 00:01:28', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (44, '900500100', '市供电公司', 'unit', '', '', '', '', '', NULL, '2018-09-11 22:47:44', '2018-09-11 22:47:44', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (45, '900600100', '政府领导', 'directory', '', '', '', '', '', NULL, '2018-08-25 07:29:26', '2018-08-25 07:29:26', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (46, '900600101', '政府领导', 'leader', '', '', '', '', '', 45, '2018-08-25 07:37:38', '2018-08-25 07:37:38', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (47, '900600102', '书记办', 'leader', '', '', '', '', '', 45, '2018-08-25 07:38:38', '2018-08-25 07:38:38', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (48, '900600103', '秘书办', 'leader', '王建', '合肥市政务新区', '05515690866', '秘书办协助领导完成日常事务', '17855107850', 45, '2018-08-26 08:39:53', '2018-08-26 08:39:53', 1, 1, 1, 'Normal', 'http://hf.gov.cn/', '/images/leader.png');
INSERT INTO `sys_organ` VALUES (49, '400100101', '安徽省教育局', 'organ', '', '', '', '', '', 35, '2018-08-25 07:39:59', '2018-08-25 07:39:59', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (50, '400100102', '安徽中医药大学', 'school', '', '', '', '', '', 35, '2018-08-25 07:40:51', '2018-08-25 07:40:51', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (51, '400100103', '中国科学技术大学', 'school', '', '', '', '', '', 35, '2018-08-25 07:41:04', '2018-08-25 07:41:04', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (52, '400100104', '合肥工业大学', 'school', '', '', '', '', '', 35, '2018-08-25 07:41:31', '2018-08-25 07:41:31', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (53, '400100105', '安徽大学', 'school', '', '', '', '', '', 35, '2018-08-25 07:43:02', '2018-08-25 07:43:02', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (54, '400100106', '安徽农业大学', 'school', '', '', '', '', '', 35, '2018-08-25 07:43:39', '2018-08-25 07:43:39', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (55, '400100107', '合肥职业技术学校', 'school', '', '', '', '', '', 35, '2018-08-29 19:43:17', '2018-08-29 19:43:17', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (56, '400100108', '安徽建筑大学', 'school', '', '', '', '', '', 35, '2018-08-25 07:44:21', '2018-08-25 07:44:21', 1, 1, 1, 'Normal', '', '');
INSERT INTO `sys_organ` VALUES (57, '400100109', '安徽工业大学', 'school', '', '', '', '', '', 35, '2018-08-25 07:45:15', '2018-08-25 07:45:15', 1, 1, 1, 'Normal', '', '');

-- ----------------------------
-- Table structure for sys_role_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_organ_id` bigint(20) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `record_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `role_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_info
-- ----------------------------
INSERT INTO `sys_role_info` VALUES (22, '2018-09-18 23:28:03', 36, NULL, 'Normal', '2018-10-02 16:06:20', NULL, 'tzadmin', '团管理员', '团管理员');
INSERT INTO `sys_role_info` VALUES (23, '2018-09-18 23:28:19', 36, NULL, 'Removed', '2018-09-18 23:34:51', NULL, '11211221', '121212', '1212');
INSERT INTO `sys_role_info` VALUES (24, '2018-09-18 23:30:35', 2, NULL, 'Normal', '2018-10-02 16:07:07', NULL, 'sysadmin', '超级管理员拥有所有功能权限', '超级管理员');
INSERT INTO `sys_role_info` VALUES (25, '2018-09-18 23:42:41', 36, NULL, 'Normal', '2018-10-01 10:25:05', NULL, 'user01', '团员张姗姗', 'zhangss');
INSERT INTO `sys_role_info` VALUES (26, '2018-09-21 22:55:41', 36, NULL, 'Normal', '2018-10-04 10:31:36', NULL, 'user02', '怎么了', 'wangsb');
INSERT INTO `sys_role_info` VALUES (27, '2018-09-21 23:02:21', 8, NULL, 'Normal', '2018-09-21 23:02:21', NULL, 'admin', '', '管理员');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `RID` int(12) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`RID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'sysadmin', '超级管理员', '1551e2d97bae39b7f75da0d2fc437f2c', 'Normal', '2018-08-15 21:01:15', '2018-08-15 21:01:17');

SET FOREIGN_KEY_CHECKS = 1;
