/*
 Navicat Premium Data Transfer

 Source Server         : demo
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 16/05/2019 19:12:27
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
  `summary` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`article_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `type` (`article_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article_img` (`article_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (1, 1, 1, '第一篇文章：南京', '<p>南京</p><p><img src=\"/media/UeditorImg/佐伊_20190514181958_336.jpg\" title=\"\" alt=\"佐伊.jpg\"/></p>', 'dan', 0000000020, '2019-05-15 20:33:28', '1216 - Cannot add or update a child row: a foreign key constraint fails', 1, 1, '山东省淄博市淄川区第一大街', 0, 0, 'first-南京'), (2, 2, 0, '第二篇文章----linda', '<p><img src=\"http://api.map.baidu.com/staticimage?center=118.499719,34.87329&zoom=11&width=530&height=340&markers=118.485921,34.874712\" width=\"530\" height=\"340\"/></p><pre class=\"brush:python;toolbar:false\">print(&#39;hello,&nbsp;linda&#39;)</pre><p style=\"text-align: center;\">hello linyi</p><p></p>', 'dan', 0000000020, '2019-05-15 20:33:42', '1216 - Cannot add or update a child row: a foreign key constraint fails', 3, 5, '江苏省南京市六合区第一大街', 0, 0, 'second-山东');
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of article_img
-- ----------------------------
BEGIN;
INSERT INTO `article_img` VALUES (1, 1, 'ArticleImg/2019/05/14/Abstract-3.jpg'), (2, 1, 'ArticleImg/2019/05/14/Abstract-2.jpg'), (3, 1, 'ArticleImg/2019/05/14/Abstract-1.jpg'), (4, 1, 'ArticleImg/2019/05/14/Abstract-4.jpg'), (5, 2, 'ArticleImg/2019/05/14/Chroma-1.jpg'), (6, 2, 'ArticleImg/2019/05/14/佐伊.jpg');
COMMIT;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry'), (2, 'Can change log entry', 1, 'change_logentry'), (3, 'Can delete log entry', 1, 'delete_logentry'), (4, 'Can view log entry', 1, 'view_logentry'), (5, 'Can add permission', 2, 'add_permission'), (6, 'Can change permission', 2, 'change_permission'), (7, 'Can delete permission', 2, 'delete_permission'), (8, 'Can view permission', 2, 'view_permission'), (9, 'Can add group', 3, 'add_group'), (10, 'Can change group', 3, 'change_group'), (11, 'Can delete group', 3, 'delete_group'), (12, 'Can view group', 3, 'view_group'), (13, 'Can add user', 4, 'add_user'), (14, 'Can change user', 4, 'change_user'), (15, 'Can delete user', 4, 'delete_user'), (16, 'Can view user', 4, 'view_user'), (17, 'Can add content type', 5, 'add_contenttype'), (18, 'Can change content type', 5, 'change_contenttype'), (19, 'Can delete content type', 5, 'delete_contenttype'), (20, 'Can view content type', 5, 'view_contenttype'), (21, 'Can add session', 6, 'add_session'), (22, 'Can change session', 6, 'change_session'), (23, 'Can delete session', 6, 'delete_session'), (24, 'Can view session', 6, 'view_session');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$8VPyuFEH2IKX$EqS1W3yP/gjzP+hYqOFlsisLLDz2E9UxDH0wypdpzKM=', '2019-05-16 03:43:18.704633', 1, 'admin', '', '', 'jh2310699594@gmail.com', 1, 1, '2019-05-13 22:02:16.108278');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2019-05-14 09:21:32.937627', '7', '7: 新闻3的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (2, '2019-05-14 09:21:46.997054', '6', '6: 新闻3的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (3, '2019-05-14 09:21:53.840251', '5', '5: 新闻2的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (4, '2019-05-14 09:26:36.412657', '6', '6: 文章2的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 7, 1), (5, '2019-05-14 09:26:47.327121', '3', '3: 文章1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 7, 1), (6, '2019-05-14 09:26:55.836406', '2', '2: 文章1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 7, 1), (7, '2019-05-14 09:27:09.756380', '1', '1: 文章1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 7, 1), (8, '2019-05-14 09:27:43.357614', '4', '4: 文章1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 7, 1), (9, '2019-05-14 09:27:54.159678', '5', '5: 文章2的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 7, 1), (10, '2019-05-14 09:28:47.676683', '5', '5: 文章2的图片', 2, '[]', 7, 1), (11, '2019-05-14 09:28:50.876179', '6', '6: 文章2的图片', 2, '[]', 7, 1), (12, '2019-05-14 09:28:54.099980', '4', '4: 文章1的图片', 2, '[]', 7, 1), (13, '2019-05-14 09:28:57.068120', '3', '3: 文章1的图片', 2, '[]', 7, 1), (14, '2019-05-14 09:29:00.598048', '2', '2: 文章1的图片', 2, '[]', 7, 1), (15, '2019-05-14 09:29:07.665424', '3', '3: 文章1的图片', 2, '[]', 7, 1), (16, '2019-05-14 09:29:10.550510', '2', '2: 文章1的图片', 2, '[]', 7, 1), (17, '2019-05-14 09:29:14.830151', '1', '1: 文章1的图片', 2, '[]', 7, 1), (18, '2019-05-14 09:29:17.079671', '6', '6: 文章2的图片', 2, '[]', 7, 1), (19, '2019-05-14 09:29:20.075493', '5', '5: 文章2的图片', 2, '[]', 7, 1), (20, '2019-05-14 09:29:23.068903', '4', '4: 文章1的图片', 2, '[]', 7, 1), (21, '2019-05-14 09:29:25.751932', '3', '3: 文章1的图片', 2, '[]', 7, 1), (22, '2019-05-14 09:29:28.644838', '2', '2: 文章1的图片', 2, '[]', 7, 1), (23, '2019-05-14 09:29:31.417652', '1', '1: 文章1的图片', 2, '[]', 7, 1), (24, '2019-05-14 09:30:27.008208', '7', '7: 新闻3的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (25, '2019-05-14 09:30:35.109199', '6', '6: 新闻3的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (26, '2019-05-14 09:30:48.552796', '5', '5: 新闻2的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (27, '2019-05-14 09:30:57.027947', '4', '4: 新闻2的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (28, '2019-05-14 09:31:05.539787', '3', '3: 新闻1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (29, '2019-05-14 09:31:18.477845', '3', '3: 新闻1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (30, '2019-05-14 09:31:29.019931', '2', '2: 新闻1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (31, '2019-05-14 09:31:37.596942', '1', '1: 新闻1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 1), (32, '2019-05-14 09:31:45.559308', '1', '1: 新闻1的图片', 2, '[]', 16, 1), (33, '2019-05-14 09:33:40.474459', '5', '5: 文章2的图片', 2, '[]', 7, 1), (34, '2019-05-14 09:34:20.236436', '5', '5: 酒店3的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 14, 1), (35, '2019-05-14 09:34:27.461441', '4', '4: 酒店2的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 14, 1), (36, '2019-05-14 09:34:38.140889', '3', '3: 酒店2的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 14, 1), (37, '2019-05-14 09:34:51.618777', '2', '2: 酒店1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 14, 1), (38, '2019-05-14 09:35:00.458146', '1', '1: 酒店1的图片', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 14, 1), (39, '2019-05-14 09:35:47.970946', '2', '2: 酒店1的价格: hotel1.2: 南京', 2, '[{\"changed\": {\"fields\": [\"area\"]}}]', 11, 1), (40, '2019-05-14 09:35:54.947522', '1', '1: 酒店1的价格: hotel1.2: 临沂', 2, '[{\"changed\": {\"fields\": [\"area\"]}}]', 11, 1), (41, '2019-05-14 09:37:26.995743', '2', '2: demo2', 2, '[{\"changed\": {\"fields\": [\"created_time\"]}}]', 8, 1), (42, '2019-05-14 10:00:03.954459', '2', '2: 第二篇文章----苹果壁纸', 2, '[{\"changed\": {\"fields\": [\"title\", \"body\"]}}]', 8, 1), (43, '2019-05-14 10:00:13.624580', '2', '2: 第二篇文章----linda', 2, '[{\"changed\": {\"fields\": [\"title\"]}}]', 8, 1), (44, '2019-05-14 10:12:25.754185', '2', '2: 第二篇文章----linda', 2, '[{\"changed\": {\"fields\": [\"body\"]}}]', 8, 1), (45, '2019-05-14 10:16:14.579098', '1', '1: 第一篇文章：南京', 2, '[{\"changed\": {\"fields\": [\"title\", \"body\", \"created_time\"]}}]', 8, 1), (46, '2019-05-14 10:20:01.396560', '1', '1: 第一篇文章：南京', 2, '[{\"changed\": {\"fields\": [\"body\"]}}]', 8, 1), (47, '2019-05-15 12:02:01.392300', '2', '2: 第二篇文章----linda', 2, '[{\"changed\": {\"fields\": [\"body\", \"created_time\"]}}]', 8, 1), (48, '2019-05-15 12:03:24.054680', '2', '2: 第二篇文章----linda', 2, '[{\"changed\": {\"fields\": [\"body\"]}}]', 8, 1), (49, '2019-05-16 05:25:39.279559', '3', '3: flow3', 2, '[{\"changed\": {\"fields\": [\"max\"]}}]', 9, 1), (50, '2019-05-16 05:25:46.262113', '2', '2: flow2', 2, '[{\"changed\": {\"fields\": [\"max\"]}}]', 9, 1), (51, '2019-05-16 08:52:36.303219', '3', '3: 新闻1的图片: news3', 2, '[{\"changed\": {\"fields\": [\"news_body\"]}}]', 13, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry'), (3, 'auth', 'group'), (2, 'auth', 'permission'), (4, 'auth', 'user'), (5, 'contenttypes', 'contenttype'), (6, 'sessions', 'session'), (8, 'travel', 'article'), (7, 'travel', 'articleimg'), (12, 'travel', 'banner'), (9, 'travel', 'flow'), (17, 'travel', 'hotel'), (14, 'travel', 'hotelimg'), (15, 'travel', 'hotelprice'), (13, 'travel', 'news'), (16, 'travel', 'newsimg'), (11, 'travel', 'position'), (18, 'travel', 'positionarea'), (19, 'travel', 'positioncity'), (10, 'travel', 'type');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-05-13 08:14:14.202824'), (2, 'auth', '0001_initial', '2019-05-13 08:14:14.302284'), (3, 'admin', '0001_initial', '2019-05-13 08:14:14.461644'), (4, 'admin', '0002_logentry_remove_auto_add', '2019-05-13 08:14:14.510129'), (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-05-13 08:14:14.520745'), (6, 'contenttypes', '0002_remove_content_type_name', '2019-05-13 08:14:14.582104'), (7, 'auth', '0002_alter_permission_name_max_length', '2019-05-13 08:14:14.613119'), (8, 'auth', '0003_alter_user_email_max_length', '2019-05-13 08:14:14.634135'), (9, 'auth', '0004_alter_user_username_opts', '2019-05-13 08:14:14.643387'), (10, 'auth', '0005_alter_user_last_login_null', '2019-05-13 08:14:14.675959'), (11, 'auth', '0006_require_contenttypes_0002', '2019-05-13 08:14:14.678188'), (12, 'auth', '0007_alter_validators_add_error_messages', '2019-05-13 08:14:14.692053'), (13, 'auth', '0008_alter_user_username_max_length', '2019-05-13 08:14:14.735295'), (14, 'auth', '0009_alter_user_last_name_max_length', '2019-05-13 08:14:14.767531'), (15, 'auth', '0010_alter_group_name_max_length', '2019-05-13 08:14:14.788301'), (16, 'auth', '0011_update_proxy_permissions', '2019-05-13 08:14:14.799306'), (17, 'sessions', '0001_initial', '2019-05-13 08:14:14.815619');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('b5t6jxwbtd1sjshyb6ks5c6au5g3wwnh', 'ZWEwMmIxMWFiNjIxZWI5NGI4ZmQ4ZmJkZTE1NzZkMzJiMWRhMjhkMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2Q2NGNkOTJkNzA3MjRiMjU3MWZkOTY2YTQ2OTNjNDE3ZDhiNWI5In0=', '2019-05-30 03:43:18.708181'), ('i5vmut5dxatumkhur3uyp2sx8rscxwgv', 'ZWEwMmIxMWFiNjIxZWI5NGI4ZmQ4ZmJkZTE1NzZkMzJiMWRhMjhkMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2Q2NGNkOTJkNzA3MjRiMjU3MWZkOTY2YTQ2OTNjNDE3ZDhiNWI5In0=', '2019-05-29 11:51:33.423518'), ('xwmj1ennq3v0bfbhz4pp4nwaj9phy8go', 'ZWEwMmIxMWFiNjIxZWI5NGI4ZmQ4ZmJkZTE1NzZkMzJiMWRhMjhkMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2Q2NGNkOTJkNzA3MjRiMjU3MWZkOTY2YTQ2OTNjNDE3ZDhiNWI5In0=', '2019-05-27 22:08:00.257507');
COMMIT;

-- ----------------------------
-- Table structure for flow
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `article_id` int(11) NOT NULL COMMENT '景点类型id',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景点名称',
  `max` bigint(20) NOT NULL COMMENT '景点最大客流量',
  `time1_flow` bigint(20) NOT NULL COMMENT '时间1流量',
  `time2_flow` bigint(20) NOT NULL COMMENT '时间2流量',
  `time3_flow` bigint(20) NOT NULL COMMENT '时间3流量',
  `time4_flow` bigint(20) NOT NULL COMMENT '时间4流量',
  `time5_flow` bigint(20) NOT NULL COMMENT '时间5流量',
  `time_6flow` bigint(20) NOT NULL COMMENT '时间6流量',
  `flow_img` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流量生成的图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of flow
-- ----------------------------
BEGIN;
INSERT INTO `flow` VALUES (1, 1, 'flow1', 100, 20, 25, 26, 20, 16, 45, NULL), (2, 2, 'flow2', 100, 78, 86, 76, 54, 45, 44, NULL), (3, 3, 'flow3', 100, 65, 78, 45, 65, 58, 76, NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of news
-- ----------------------------
BEGIN;
INSERT INTO `news` VALUES (1, 'news', 'this is a demo of news 1'), (2, 'news2', 'this is a demo of news 2'), (3, 'news3', '<p>&nbsp; &nbsp; this is a demo</p>');
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
