/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 14/05/2019 23:24:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '景区分类标签（主键自增）',
  `position_id` int(11) NOT NULL COMMENT '省分类（外键）',
  `recommend_id` tinyint(1) NOT NULL COMMENT '是否是推荐文章（0，1）',
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章具体内容',
  `user` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户',
  `views` int(10) unsigned zerofill NOT NULL COMMENT '文章浏览数',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '文章发布时间',
  `url` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储本身地址',
  `position_city_id` int(11) NOT NULL COMMENT '市分类（外键）',
  `position_area_id` int(11) NOT NULL COMMENT '区分类（外键）',
  `detail_area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '具体信息',
  `lon` float NOT NULL DEFAULT '0' COMMENT '纬度',
  `lat` float NOT NULL DEFAULT '0' COMMENT '经度',
  PRIMARY KEY (`article_id`) USING BTREE,
  KEY `position_id` (`position_id`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `type` (`article_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article_img` (`article_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for article_img
-- ----------------------------
DROP TABLE IF EXISTS `article_img`;
CREATE TABLE `article_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `article_id` int(11) NOT NULL COMMENT '文章id，外键',
  `img` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章url',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `text_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片的文本信息',
  `img` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片url信息',
  `link_url` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片链接的url信息',
  `is_use` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否使用此幻灯页面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for flow
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `article_id` int(11) NOT NULL COMMENT '景点类型id',
  `flow` bigint(20) NOT NULL COMMENT '景点流量数据',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景点名称',
  `max` bigint(20) NOT NULL COMMENT '景点最大客流量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `position_id` int(11) NOT NULL COMMENT '酒店省外键',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '酒店名称',
  `position_city_id` int(11) NOT NULL COMMENT '酒店市位置',
  `position_area_id` int(11) NOT NULL COMMENT '酒店区位置',
  `detail_massage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '酒店详细信息',
  `lon` float NOT NULL DEFAULT '0' COMMENT '纬度',
  `lat` float NOT NULL DEFAULT '0' COMMENT '经度',
  PRIMARY KEY (`hotel_id`) USING BTREE,
  KEY `position_id` (`position_id`) USING BTREE,
  KEY `position_city_id` (`position_city_id`) USING BTREE,
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_img` (`hotel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_price` (`hotel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for hotel_img
-- ----------------------------
DROP TABLE IF EXISTS `hotel_img`;
CREATE TABLE `hotel_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `hotel_id` int(11) NOT NULL COMMENT '酒店id',
  `img` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '酒店图片',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for hotel_price
-- ----------------------------
DROP TABLE IF EXISTS `hotel_price`;
CREATE TABLE `hotel_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `hotel_id` int(11) NOT NULL COMMENT '酒店id外键',
  `price` float NOT NULL COMMENT '酒店价格',
  `url` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '付费url',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '新闻标题',
  `news_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '新闻内容',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id`) REFERENCES `news_img` (`news_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for news_img
-- ----------------------------
DROP TABLE IF EXISTS `news_img`;
CREATE TABLE `news_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_id` int(11) NOT NULL COMMENT '新闻id',
  `img` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `news_id` (`news_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '位置主键，自增',
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '具体地区',
  `province_url` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '具体地区的链接',
  PRIMARY KEY (`position_id`) USING BTREE,
  CONSTRAINT `position_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `position_city` (`position_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for position_area
-- ----------------------------
DROP TABLE IF EXISTS `position_area`;
CREATE TABLE `position_area` (
  `position_area_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_city_id` int(11) NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lon` float NOT NULL DEFAULT '0' COMMENT '纬度',
  `lat` float NOT NULL DEFAULT '0' COMMENT '经度',
  PRIMARY KEY (`position_area_id`) USING BTREE,
  KEY `position_city_id` (`position_city_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for position_city
-- ----------------------------
DROP TABLE IF EXISTS `position_city`;
CREATE TABLE `position_city` (
  `position_city_id` int(11) NOT NULL COMMENT '主键自增',
  `position_id` int(11) NOT NULL,
  `city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`position_city_id`) USING BTREE,
  KEY `position_id` (`position_id`) USING BTREE,
  CONSTRAINT `position_city_ibfk_1` FOREIGN KEY (`position_city_id`) REFERENCES `position_area` (`position_city_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `article_id` int(11) NOT NULL COMMENT '外键非空',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景区类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
