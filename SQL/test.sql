/*
 Navicat Premium Data Transfer

 Source Server         : demo
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : pyweb

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 14/05/2019 23:22:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '景区分类标签（主键自增）',
  `position_id` int(11) NOT NULL COMMENT '省分类（外键）',
  `recommend_id` tinyint(1) NOT NULL COMMENT '是否是推荐文章（0，1）',
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章具体内容',
  `user` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户',
  `views` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '文章浏览数',
  `created_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '文章发布时间',
  `url` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储本身地址',
  `position_city_id` int(11) NOT NULL COMMENT '市分类（外键）',
  `position_area_id` int(11) NOT NULL COMMENT '区分类（外键）',
  `detail_area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '具体信息',
  `lon` float NOT NULL DEFAULT 0 COMMENT '纬度',
  `lat` float NOT NULL DEFAULT 0 COMMENT '经度',
  PRIMARY KEY (`article_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `type` (`article_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article_img` (`article_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (1, 1, 1, '第一篇文章：南京', '<p>南京</p><p><img src=\"/media/UeditorImg/佐伊_20190514181958_336.jpg\" title=\"\" alt=\"佐伊.jpg\"/></p>', 'dan', 0000000020, '2019-05-14 20:10:02', '1216 - Cannot add or update a child row: a foreign key constraint fails', 1, 1, '山东省淄博市淄川区第一大街', 0, 0), (2, 2, 0, '第二篇文章----linda', '<p><img src=\"http://api.map.baidu.com/staticimage?center=118.499719,34.87329&zoom=11&width=530&height=340&markers=118.485921,34.874712\" width=\"530\" height=\"340\"/></p><pre class=\"brush:python;toolbar:false\">print(&#39;hello,&nbsp;linda&#39;)</pre><p style=\"text-align: center;\">hello linyi</p><p><img src=\"/media/UeditorImg/Desert-3_20190514181221_539.jpg\" alt=\"Desert-3.jpg\"/></p>', 'dan', 0000000020, '2019-05-14 20:10:59', '1216 - Cannot add or update a child row: a foreign key constraint fails', 3, 5, '江苏省南京市六合区第一大街', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for article_img
-- ----------------------------
DROP TABLE IF EXISTS `article_img`;
CREATE TABLE `article_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `article_id` int(11) NOT NULL COMMENT '文章id，外键',
  `img` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章url',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of article_img
-- ----------------------------
BEGIN;
INSERT INTO `article_img` VALUES (1, 1, 'ArticleImg/2019/05/14/Abstract-3.jpg'), (2, 1, 'ArticleImg/2019/05/14/Abstract-2.jpg'), (3, 1, 'ArticleImg/2019/05/14/Abstract-1.jpg'), (4, 1, 'ArticleImg/2019/05/14/Abstract-4.jpg'), (5, 2, 'ArticleImg/2019/05/14/Chroma-1.jpg'), (6, 2, 'ArticleImg/2019/05/14/佐伊.jpg');
COMMIT;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `text_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片的文本信息',
  `img` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片url信息',
  `link_url` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片链接的url信息',
  `is_use` tinyint(1) UNSIGNED ZEROFILL NOT NULL COMMENT '是否使用此幻灯页面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of banner
-- ----------------------------
BEGIN;
INSERT INTO `banner` VALUES (1, 'banner1', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined', 1), (2, 'banner2', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined', 0), (3, 'banner3', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined', 1), (4, 'banner4', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined', 1);
COMMIT;

-- ----------------------------
-- Table structure for flow
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `article_id` int(11) NOT NULL COMMENT '景点类型id',
  `flow` bigint(20) NOT NULL COMMENT '景点流量数据',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景点名称',
  `max` bigint(20) NOT NULL COMMENT '景点最大客流量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of flow
-- ----------------------------
BEGIN;
INSERT INTO `flow` VALUES (1, 1, 20, 'flow1', 0), (2, 2, 20, 'flow2', 0), (3, 3, 20, 'flow3', 0);
COMMIT;

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `position_id` int(11) NOT NULL COMMENT '酒店省外键',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '酒店名称',
  `position_city_id` int(11) NOT NULL COMMENT '酒店市位置',
  `position_area_id` int(11) NOT NULL COMMENT '酒店区位置',
  `detail_massage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '酒店详细信息',
  `lon` float NOT NULL DEFAULT 0 COMMENT '纬度',
  `lat` float NOT NULL DEFAULT 0 COMMENT '经度',
  PRIMARY KEY (`hotel_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  INDEX `position_city_id`(`position_city_id`) USING BTREE,
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_img` (`hotel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_price` (`hotel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of hotel
-- ----------------------------
BEGIN;
INSERT INTO `hotel` VALUES (1, 1, 'hotel1.2', 1, 2, '山东省淄博市临淄区第一大道', 0, 0), (2, 1, 'hotel1.2', 2, 3, '山东省临沂市兰山区第一大道', 0, 0), (3, 2, 'hotel2.1', 3, 6, '江苏省南京市玄武区第一大道', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for hotel_img
-- ----------------------------
DROP TABLE IF EXISTS `hotel_img`;
CREATE TABLE `hotel_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `hotel_id` int(11) NOT NULL COMMENT '酒店id',
  `img` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '酒店图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of hotel_img
-- ----------------------------
BEGIN;
INSERT INTO `hotel_img` VALUES (1, 1, 'HotelImg/2019/05/14/Mojave_Night.jpg'), (2, 1, 'HotelImg/2019/05/14/Desert-3.jpg'), (3, 2, 'HotelImg/2019/05/14/Flower-2.jpg'), (4, 2, 'HotelImg/2019/05/14/Reflection-3.jpg'), (5, 3, 'HotelImg/2019/05/14/Reflection-4.jpg');
COMMIT;

-- ----------------------------
-- Table structure for hotel_price
-- ----------------------------
DROP TABLE IF EXISTS `hotel_price`;
CREATE TABLE `hotel_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `hotel_id` int(11) NOT NULL COMMENT '酒店id外键',
  `price` float NOT NULL COMMENT '酒店价格',
  `url` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '付费url',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of hotel_price
-- ----------------------------
BEGIN;
INSERT INTO `hotel_price` VALUES (1, 1, 10.98, 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined'), (2, 1, 20.95, 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined'), (3, 1, 30.95, 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=hotel&step_word=&hs=0&pn=1&spn=0&di=88413904810&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2813161980%2C3634788587&os=408956297%2C1679512159&simid=3441846550%2C376037743&adpicid=0&lpn=0&ln=1931&fr=&fmq=1557743387112_R&fm=detail&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F894%2F020%2F778%2F24c900a26d7843eebe82e99b7f1ebd8b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fy57_z%26e3Bvp6tr_z%26e3Bv54AzdH3Fp6wejsfAzdH3F4wswyftw8aaaddAzdH3Fddda8lc_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined'), (4, 2, 40.95, '1216 - Cannot add or update a child row: a foreign key constraint fails'), (5, 3, 50.95, '1216 - Cannot add or update a child row: a foreign key constraint fails');
COMMIT;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '新闻标题',
  `news_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '新闻内容',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id`) REFERENCES `news_img` (`news_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of news
-- ----------------------------
BEGIN;
INSERT INTO `news` VALUES (1, 'news', 'this is a demo of news 1'), (2, 'news2', 'this is a demo of news 2'), (3, 'news3', 'this is a demo');
COMMIT;

-- ----------------------------
-- Table structure for news_img
-- ----------------------------
DROP TABLE IF EXISTS `news_img`;
CREATE TABLE `news_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_id` int(11) NOT NULL COMMENT '新闻id',
  `img` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `news_id`(`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of news_img
-- ----------------------------
BEGIN;
INSERT INTO `news_img` VALUES (1, 1, 'NewsImg/2019/05/14/Desert-2.jpg'), (2, 1, 'NewsImg/2019/05/14/Desert-1.jpg'), (3, 1, 'NewsImg/2019/05/14/Chroma-2.jpg'), (4, 2, 'NewsImg/2019/05/14/Abstract-Shapes-2.jpg'), (5, 2, 'NewsImg/2019/05/14/Abstract-3.jpg'), (6, 3, 'NewsImg/2019/05/14/Abstract-2.jpg'), (7, 3, 'NewsImg/2019/05/14/Abstract-1.jpg');
COMMIT;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `position_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '位置主键，自增',
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '具体地区',
  `province_url` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '具体地区的链接',
  PRIMARY KEY (`position_id`) USING BTREE,
  CONSTRAINT `position_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `position_city` (`position_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of position
-- ----------------------------
BEGIN;
INSERT INTO `position` VALUES (1, '山东省', '1216 - Cannot add or update a child row: a foreign key constraint fails'), (2, '江苏省', '1216 - Cannot add or update a child row: a foreign key constraint fails4');
COMMIT;

-- ----------------------------
-- Table structure for position_area
-- ----------------------------
DROP TABLE IF EXISTS `position_area`;
CREATE TABLE `position_area`  (
  `position_area_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_city_id` int(11) NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lon` float NOT NULL DEFAULT 0 COMMENT '纬度',
  `lat` float NOT NULL DEFAULT 0 COMMENT '经度',
  PRIMARY KEY (`position_area_id`) USING BTREE,
  INDEX `position_city_id`(`position_city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of position_area
-- ----------------------------
BEGIN;
INSERT INTO `position_area` VALUES (1, 1, '淄川区', 0, 0), (2, 1, '临淄区', 0, 0), (3, 2, '兰山区', 0, 0), (4, 2, '罗庄区', 0, 0), (5, 3, '六合区', 0, 0), (6, 3, '玄武区', 0, 0), (7, 4, '锡山区', 0, 0), (8, 4, '新吴区', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for position_city
-- ----------------------------
DROP TABLE IF EXISTS `position_city`;
CREATE TABLE `position_city`  (
  `position_city_id` int(11) NOT NULL COMMENT '主键自增',
  `position_id` int(11) NOT NULL,
  `city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`position_city_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  CONSTRAINT `position_city_ibfk_1` FOREIGN KEY (`position_city_id`) REFERENCES `position_area` (`position_city_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of position_city
-- ----------------------------
BEGIN;
INSERT INTO `position_city` VALUES (1, 1, '淄博市'), (2, 1, '临沂市'), (3, 2, '南京市'), (4, 2, '无锡市');
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `article_id` int(11) NOT NULL COMMENT '外键非空',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景区类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES (1, 1, 'demo1.1'), (2, 1, 'demo1.2'), (3, 2, 'demo2.1'), (4, 2, 'demo2.2');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
