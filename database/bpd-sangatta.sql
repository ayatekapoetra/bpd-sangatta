/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : bpd-sangatta

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 11/01/2023 22:03:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adonis_schema
-- ----------------------------
DROP TABLE IF EXISTS `adonis_schema`;
CREATE TABLE `adonis_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of adonis_schema
-- ----------------------------
BEGIN;
INSERT INTO `adonis_schema` VALUES (1, '1503248427885_user', 1, '2022-12-11 20:26:50');
INSERT INTO `adonis_schema` VALUES (2, '1503248427886_token', 1, '2022-12-11 20:26:50');
COMMIT;

-- ----------------------------
-- Table structure for bpd_gaji_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `bpd_gaji_pegawai`;
CREATE TABLE `bpd_gaji_pegawai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pegawai_id` int DEFAULT NULL,
  `notif_date` date DEFAULT NULL,
  `eff_date` date DEFAULT NULL,
  `nilai` float(8,0) DEFAULT NULL,
  `golongan` varchar(255) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gaji_pegawai_pegawai_idx` (`pegawai_id`),
  CONSTRAINT `gaji_pegawai_pegawai_idx` FOREIGN KEY (`pegawai_id`) REFERENCES `mas_pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_gaji_pegawai
-- ----------------------------
BEGIN;
INSERT INTO `bpd_gaji_pegawai` VALUES (1, 1, '2019-09-01', '2019-10-01', 3376100, 'IV.b', 'Y', '2022-12-19 22:37:34', '2022-12-19 22:37:34');
INSERT INTO `bpd_gaji_pegawai` VALUES (2, 2, '2017-09-01', '2017-10-01', 3341100, 'IV.a', 'Y', '2022-12-19 22:38:51', '2022-12-19 22:38:51');
INSERT INTO `bpd_gaji_pegawai` VALUES (3, 3, '2021-09-01', '2021-10-01', 3140200, 'IV.a', 'Y', '2022-12-19 22:40:42', '2022-12-19 22:40:42');
INSERT INTO `bpd_gaji_pegawai` VALUES (4, 4, '2019-03-01', '2019-04-01', 3239100, 'IV.a', 'Y', '2022-12-19 22:43:33', '2022-12-19 22:43:33');
INSERT INTO `bpd_gaji_pegawai` VALUES (5, 5, '2023-03-01', '2023-04-01', 2920800, 'III.d', 'Y', '2022-12-19 22:45:46', '2022-12-19 22:45:46');
INSERT INTO `bpd_gaji_pegawai` VALUES (6, 6, '2023-03-01', '2023-04-01', 3044300, 'IV.a', 'Y', '2022-12-19 22:48:42', '2022-12-19 22:48:42');
INSERT INTO `bpd_gaji_pegawai` VALUES (7, 7, '2023-03-01', '2023-04-01', 3044300, 'IV.a', 'Y', '2022-12-19 22:51:05', '2022-12-19 22:51:05');
INSERT INTO `bpd_gaji_pegawai` VALUES (8, 8, '2019-03-01', '2019-04-01', 3239100, 'IV.a', 'Y', '2022-12-19 22:52:54', '2022-12-19 22:52:54');
INSERT INTO `bpd_gaji_pegawai` VALUES (9, 9, '2020-03-01', '2020-04-01', 3107700, 'III.d', 'Y', '2022-12-19 22:54:28', '2022-12-19 22:54:28');
INSERT INTO `bpd_gaji_pegawai` VALUES (10, 10, '2022-12-01', '2023-01-01', 2920800, 'III.d', 'Y', '2022-12-19 22:56:23', '2022-12-19 22:56:23');
INSERT INTO `bpd_gaji_pegawai` VALUES (11, 11, '2021-03-01', '2021-04-01', 3012800, 'III.d', 'Y', '2022-12-19 23:00:47', '2022-12-19 23:00:47');
INSERT INTO `bpd_gaji_pegawai` VALUES (12, 12, '2021-03-01', '2021-04-01', 3012800, 'III.d', 'Y', '2022-12-19 23:02:52', '2022-12-19 23:02:52');
INSERT INTO `bpd_gaji_pegawai` VALUES (13, 13, '2021-03-01', '2021-04-01', 3012800, 'III.d', 'Y', '2022-12-19 23:04:32', '2022-12-19 23:04:32');
INSERT INTO `bpd_gaji_pegawai` VALUES (14, 14, '2023-03-01', '2023-04-01', 2920800, 'III.d', 'Y', '2022-12-19 23:06:26', '2022-12-19 23:06:26');
INSERT INTO `bpd_gaji_pegawai` VALUES (15, 15, '2022-03-01', '2022-04-01', 3012800, 'III.d', 'Y', '2022-12-19 23:08:06', '2022-12-19 23:08:06');
INSERT INTO `bpd_gaji_pegawai` VALUES (16, 16, '2022-03-01', '2022-04-01', 3012800, 'III.d', 'Y', '2022-12-19 23:09:53', '2022-12-19 23:09:53');
INSERT INTO `bpd_gaji_pegawai` VALUES (17, 17, '2022-03-01', '2022-04-01', 2890500, 'III.c', 'Y', '2022-12-19 23:11:22', '2022-12-19 23:11:22');
INSERT INTO `bpd_gaji_pegawai` VALUES (18, 18, '2021-09-01', '2021-10-01', 2890500, 'III.c', 'Y', '2022-12-19 23:12:56', '2022-12-19 23:12:56');
INSERT INTO `bpd_gaji_pegawai` VALUES (19, 19, '2022-03-01', '2022-04-01', 2890500, 'III.c', 'Y', '2022-12-19 23:14:22', '2022-12-19 23:14:22');
INSERT INTO `bpd_gaji_pegawai` VALUES (20, 20, '2020-09-01', '2020-10-01', 2981500, 'III.c', 'Y', '2022-12-19 23:16:11', '2022-12-19 23:16:11');
INSERT INTO `bpd_gaji_pegawai` VALUES (21, 21, '2019-03-01', '2019-04-01', 3107700, 'III.d', 'Y', '2022-12-19 23:25:31', '2022-12-19 23:25:31');
INSERT INTO `bpd_gaji_pegawai` VALUES (22, 22, '2024-03-01', '2024-04-01', 2920800, 'III.d', 'Y', '2022-12-19 23:27:26', '2022-12-19 23:27:26');
INSERT INTO `bpd_gaji_pegawai` VALUES (23, 23, '2022-03-01', '2022-04-01', 3012800, 'III.d', 'Y', '2022-12-19 23:29:04', '2022-12-19 23:29:04');
INSERT INTO `bpd_gaji_pegawai` VALUES (24, 24, '2019-03-01', '2019-04-01', 3107700, 'III.d', 'Y', '2022-12-19 23:30:32', '2022-12-19 23:30:32');
INSERT INTO `bpd_gaji_pegawai` VALUES (25, 25, '2022-03-01', '2022-04-01', 3012800, 'III.d', 'Y', '2022-12-19 23:31:55', '2022-12-19 23:31:55');
INSERT INTO `bpd_gaji_pegawai` VALUES (26, 26, '2021-03-01', '2021-04-01', 3012800, 'III.d', 'Y', '2022-12-19 23:34:00', '2022-12-19 23:34:00');
INSERT INTO `bpd_gaji_pegawai` VALUES (27, 27, '2024-03-01', '2024-04-01', 2920800, 'III.d', 'Y', '2022-12-19 23:35:17', '2022-12-19 23:35:17');
INSERT INTO `bpd_gaji_pegawai` VALUES (28, 28, '2023-03-01', '2023-04-01', 2920800, 'III.d', 'Y', '2022-12-19 23:36:33', '2022-12-19 23:36:33');
INSERT INTO `bpd_gaji_pegawai` VALUES (29, 29, '2023-03-01', '2023-04-01', 2920800, 'III.d', 'Y', '2022-12-19 23:37:51', '2022-12-19 23:37:51');
INSERT INTO `bpd_gaji_pegawai` VALUES (30, 30, '2021-09-01', '2021-10-01', 2890500, 'III.c', 'Y', '2022-12-19 23:39:10', '2022-12-19 23:39:10');
INSERT INTO `bpd_gaji_pegawai` VALUES (31, 31, '2021-09-01', '2021-10-01', 2890500, 'III.c', 'Y', '2022-12-20 13:17:09', '2022-12-20 13:17:09');
INSERT INTO `bpd_gaji_pegawai` VALUES (32, 32, '2024-03-01', '2024-04-01', 2802300, 'III.c', 'Y', '2022-12-20 13:18:36', '2022-12-20 13:18:36');
INSERT INTO `bpd_gaji_pegawai` VALUES (33, 33, '2024-03-01', '2024-04-01', 2802300, 'III.c', 'Y', '2022-12-20 13:20:20', '2022-12-20 13:20:20');
INSERT INTO `bpd_gaji_pegawai` VALUES (34, 34, '2022-03-01', '2022-04-01', 2890500, 'III.c', 'Y', '2022-12-20 13:22:23', '2022-12-20 13:22:23');
INSERT INTO `bpd_gaji_pegawai` VALUES (35, 35, '2021-03-01', '2021-04-01', 2890500, 'III.c', 'Y', '2022-12-20 13:24:04', '2022-12-20 13:24:04');
INSERT INTO `bpd_gaji_pegawai` VALUES (36, 36, '2023-03-01', '2023-04-01', 2802300, 'III.c', 'Y', '2022-12-20 13:25:47', '2022-12-20 13:25:47');
INSERT INTO `bpd_gaji_pegawai` VALUES (37, 37, '2021-09-01', '2021-10-01', 2890500, 'III.c', 'Y', '2022-12-20 13:27:54', '2022-12-20 13:27:54');
INSERT INTO `bpd_gaji_pegawai` VALUES (38, 38, '2021-03-01', '2021-04-01', 2890500, 'III.c', 'Y', '2022-12-20 13:29:33', '2022-12-20 13:29:33');
INSERT INTO `bpd_gaji_pegawai` VALUES (39, 39, '2024-03-01', '2024-04-01', 2802300, 'III.c', 'Y', '2022-12-20 13:30:49', '2022-12-20 13:30:49');
INSERT INTO `bpd_gaji_pegawai` VALUES (40, 40, '2021-03-01', '2021-04-01', 2890500, 'III.c', 'Y', '2022-12-20 13:32:16', '2022-12-20 13:32:16');
INSERT INTO `bpd_gaji_pegawai` VALUES (41, 41, '2012-03-01', '2012-04-01', 3238300, 'III.b', 'Y', '2022-12-20 13:35:30', '2022-12-20 13:35:30');
INSERT INTO `bpd_gaji_pegawai` VALUES (42, 42, '2021-03-01', '2021-04-01', 2773200, 'III.b', 'Y', '2022-12-20 13:37:35', '2022-12-20 13:37:35');
INSERT INTO `bpd_gaji_pegawai` VALUES (43, 43, '2021-03-01', '2021-04-01', 2773200, 'III.b', 'Y', '2022-12-20 13:40:12', '2022-12-20 13:40:12');
INSERT INTO `bpd_gaji_pegawai` VALUES (44, 44, '2021-03-01', '2021-04-01', 2773200, 'III.b', 'Y', '2022-12-20 13:43:33', '2022-12-20 13:43:33');
INSERT INTO `bpd_gaji_pegawai` VALUES (45, 45, '2023-03-01', '2023-04-01', 2688500, 'III.b', 'Y', '2022-12-20 13:45:19', '2022-12-20 13:45:19');
INSERT INTO `bpd_gaji_pegawai` VALUES (46, 46, '2022-03-01', '2022-04-01', 2773200, 'III.b', 'Y', '2022-12-20 13:49:24', '2022-12-20 13:49:24');
INSERT INTO `bpd_gaji_pegawai` VALUES (47, 47, '2022-09-01', '2022-10-01', 2773200, 'III.b', 'Y', '2022-12-20 13:51:04', '2022-12-20 13:51:04');
INSERT INTO `bpd_gaji_pegawai` VALUES (48, 48, '2023-03-01', '2023-04-01', 2688500, 'III.b', 'Y', '2022-12-20 13:53:05', '2022-12-20 13:53:05');
INSERT INTO `bpd_gaji_pegawai` VALUES (49, 49, '2023-03-01', '2023-04-01', 2688500, 'III.b', 'Y', '2022-12-20 13:54:18', '2022-12-20 13:54:18');
INSERT INTO `bpd_gaji_pegawai` VALUES (50, 50, '2021-03-01', '2021-04-01', 2773200, 'III.b', 'Y', '2022-12-20 13:55:28', '2022-12-20 13:55:28');
INSERT INTO `bpd_gaji_pegawai` VALUES (51, 51, '2021-03-01', '2021-04-01', 2773200, 'III.b', 'Y', '2022-12-20 13:58:16', '2022-12-20 13:58:16');
INSERT INTO `bpd_gaji_pegawai` VALUES (52, 52, '2024-03-01', '2024-04-01', 2688500, 'III.b', 'Y', '2022-12-20 14:00:57', '2022-12-20 14:00:57');
INSERT INTO `bpd_gaji_pegawai` VALUES (53, 53, '2024-03-01', '2024-04-01', 2688500, 'III.b', 'Y', '2022-12-20 14:02:40', '2022-12-20 14:02:40');
INSERT INTO `bpd_gaji_pegawai` VALUES (54, 54, '2024-03-01', '2024-04-01', 2688500, 'III.b', 'Y', '2022-12-20 14:04:11', '2022-12-20 14:04:11');
INSERT INTO `bpd_gaji_pegawai` VALUES (55, 55, '2024-03-01', '2024-04-01', 2688500, 'III.b', 'Y', '2022-12-20 14:05:30', '2022-12-20 14:05:30');
INSERT INTO `bpd_gaji_pegawai` VALUES (56, 56, '2020-09-01', '2020-10-01', 2744500, 'III.a', 'Y', '2022-12-20 14:07:03', '2022-12-20 14:07:03');
INSERT INTO `bpd_gaji_pegawai` VALUES (57, 57, '2021-09-01', '2021-10-01', 2660700, 'III.a', 'Y', '2022-12-20 14:09:06', '2022-12-20 14:09:06');
INSERT INTO `bpd_gaji_pegawai` VALUES (58, 58, '2020-09-01', '2020-10-01', 2744500, 'III.a', 'Y', '2022-12-20 14:10:28', '2022-12-20 14:10:28');
INSERT INTO `bpd_gaji_pegawai` VALUES (59, 59, '2022-03-01', '2022-04-01', 2660700, 'III.a', 'Y', '2022-12-20 14:12:04', '2022-12-20 14:12:04');
INSERT INTO `bpd_gaji_pegawai` VALUES (60, 60, '2022-03-01', '2022-04-01', 2660700, 'III.a', 'Y', '2022-12-20 14:13:13', '2022-12-20 14:13:13');
INSERT INTO `bpd_gaji_pegawai` VALUES (61, 61, '2022-03-01', '2022-04-01', 2660700, 'III.a', 'Y', '2022-12-20 14:15:50', '2022-12-20 14:15:50');
INSERT INTO `bpd_gaji_pegawai` VALUES (62, 62, '2023-03-01', '2023-04-01', 2579400, 'III.a', 'Y', '2022-12-20 14:17:14', '2022-12-20 14:17:14');
INSERT INTO `bpd_gaji_pegawai` VALUES (63, 63, '2017-03-01', '2017-04-01', NULL, 'II.d', 'Y', '2022-12-20 14:18:43', '2022-12-20 14:18:43');
INSERT INTO `bpd_gaji_pegawai` VALUES (64, 64, '2021-03-01', '2021-04-01', NULL, 'II.d', 'Y', '2022-12-20 14:20:28', '2022-12-20 14:20:28');
COMMIT;

-- ----------------------------
-- Table structure for bpd_gaji_pokok
-- ----------------------------
DROP TABLE IF EXISTS `bpd_gaji_pokok`;
CREATE TABLE `bpd_gaji_pokok` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mkg` int DEFAULT NULL,
  `I_a` float(8,0) DEFAULT NULL,
  `I_b` float(8,0) DEFAULT NULL,
  `I_c` float(8,0) DEFAULT NULL,
  `I_d` float(8,0) DEFAULT NULL,
  `II_a` float(8,0) DEFAULT NULL,
  `II_b` float(8,0) DEFAULT NULL,
  `II_c` float(8,0) DEFAULT NULL,
  `II_d` float(8,0) DEFAULT NULL,
  `III_a` float(8,0) DEFAULT NULL,
  `III_b` float(8,0) DEFAULT NULL,
  `III_c` float(8,0) DEFAULT NULL,
  `III_d` float(8,0) DEFAULT NULL,
  `IV_a` float(8,0) DEFAULT NULL,
  `IV_b` float(8,0) DEFAULT NULL,
  `IV_c` float(8,0) DEFAULT NULL,
  `IV_d` float(8,0) DEFAULT NULL,
  `IV_e` float(8,0) DEFAULT NULL,
  `aktif` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_gaji_pokok
-- ----------------------------
BEGIN;
INSERT INTO `bpd_gaji_pokok` VALUES (1, 0, 1560800, NULL, NULL, NULL, 2022200, NULL, NULL, NULL, 2579400, 2688500, 2802300, 2920800, 3044300, 3173100, 3307300, 3447200, 3593100, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (2, 1, NULL, NULL, NULL, NULL, 2054100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (3, 2, 1610000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2660700, 2773200, 2890500, 3012800, 3140200, 3273100, 3411500, 3555800, 3706200, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (4, 3, NULL, 1704500, 1776600, 1851800, 2118800, 2208400, 2301800, 2399200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (5, 4, 1660700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2744500, 2860500, 2981500, 3107700, 3239100, 3376100, 3518900, 3667800, 3822900, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (6, 5, NULL, 1758200, 1832600, 1910100, 2185500, 2277900, 2374300, 2474700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (7, 6, 1713000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2830900, 2950600, 3075500, 3205500, 3341100, 3482500, 3629800, 3783300, 3943300, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (8, 7, NULL, 1813600, 1890300, 1970200, 2254300, 2349700, 2449100, 2552700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (9, 8, 1766900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2920100, 3043600, 3172300, 3306500, 3446400, 3592100, 3744100, 3902500, 4067500, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (10, 9, NULL, 1870700, 1949800, 2032300, 2325300, 2423700, 2526200, 2633100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (11, 10, 1822600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3012000, 3139400, 3272200, 3410600, 3554900, 3705300, 3862000, 4025400, 4195700, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (12, 11, NULL, 1929600, 2011200, 2096300, 2398600, 2500000, 2605800, 2716000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (13, 12, 1880000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3106900, 3238300, 3375300, 3518100, 3666900, 3822000, 3983600, 4152200, 4327800, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (14, 13, NULL, 1990400, 2074600, 2162300, 2474100, 2578800, 2687800, 2801500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (15, 14, 1939200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3204700, 3340300, 3481600, 3628900, 3782400, 3942400, 4109100, 4282900, 4464100, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (16, 15, NULL, 2053100, 2139900, 2230400, 2552000, 2660000, 2772500, 2889800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (17, 16, 2000300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3305700, 3445500, 3591200, 3743100, 3901500, 4066500, 4238500, 4417800, 4604700, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (18, 17, NULL, 2117700, 2207300, 2300700, 2632400, 2743800, 2859800, 2980800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (19, 18, 2063300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3409800, 3554000, 3704300, 3861000, 4024400, 4194600, 4372000, 4557000, 4749700, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (20, 19, NULL, 2184400, 2276800, 2373100, 2715300, 2830200, 2949900, 3074700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (21, 20, 2128300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3517200, 3665900, 3621000, 3982600, 4151100, 4326700, 4509700, 4700500, 4899300, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (22, 21, NULL, 2253200, 2348500, 2447900, 2800800, 2919300, 3042800, 3171500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (23, 22, 2195300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3627900, 3781400, 3941400, 4108100, 4281800, 4463000, 4651800, 4848500, 5053600, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (24, 23, NULL, 2324200, 2422500, 2525000, 2889100, 3011300, 3138600, 3271400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (25, 24, 2264400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3742200, 3900500, 4065500, 4237500, 4416700, 4603500, 4798300, 5001200, 5212800, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (26, 25, NULL, 2397400, 2498800, 2604500, 2980000, 3106100, 3237500, 3374400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (27, 26, 2335800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3860100, 4023300, 4193500, 4370900, 4555800, 4748500, 4949400, 5158700, 5377000, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (28, 27, NULL, 2472900, 2577500, 2686500, 3073900, 3203900, 3339400, 3480700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (29, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3981600, 4150100, 4325600, 4508600, 4699300, 4898100, 5105300, 5321200, 5546300, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (30, 29, NULL, NULL, NULL, NULL, 3170700, 3304800, 3444600, 3590300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (31, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4107000, 4280800, 4461800, 4650600, 4847300, 5052300, 5266100, 5488800, 5721000, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (32, 31, NULL, NULL, NULL, NULL, 3270600, 3408900, 3553100, 3703400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (33, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4236400, 4415600, 4602400, 4797000, 5000000, 5211500, 5431900, 5661700, 5901200, 'Y', NULL, NULL);
INSERT INTO `bpd_gaji_pokok` VALUES (34, 33, NULL, NULL, NULL, NULL, 3373600, 3516300, 3665000, 3820000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for bpd_kenaikan_pangkat_reguler
-- ----------------------------
DROP TABLE IF EXISTS `bpd_kenaikan_pangkat_reguler`;
CREATE TABLE `bpd_kenaikan_pangkat_reguler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pegawai_id` int DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `pangkat` varchar(255) DEFAULT NULL,
  `notif_date` date DEFAULT NULL,
  `eff_date` date DEFAULT NULL,
  `createdby` int DEFAULT NULL,
  `aktif` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `naikpangkat_pegawai_idx` (`pegawai_id`),
  CONSTRAINT `naikpangkat_pegawai_idx` FOREIGN KEY (`pegawai_id`) REFERENCES `mas_pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_kenaikan_pangkat_reguler
-- ----------------------------
BEGIN;
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (1, 1, 'Syahfur, S.Sos, M.Si', 'Pembina Tingkat 1', '2021-07-01', '2021-10-01', 1, 'N', '2022-12-19 22:37:34', '2022-12-19 22:37:34');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (2, 2, 'Supianti, S.Sos. M.Si', 'Pembina', '2019-07-01', '2019-10-01', 1, 'N', '2022-12-19 22:38:51', '2022-12-19 22:38:51');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (3, 3, 'Setia Budi, SE', 'Pembina', '2023-07-01', '2023-10-01', 1, 'Y', '2022-12-19 22:40:42', '2022-12-19 22:40:42');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (4, 4, 'Deni Hendi, ST.,M.SI.', 'Pembina', '2021-01-01', '2021-04-01', 1, 'N', '2022-12-19 22:43:33', '2022-12-19 22:43:33');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (5, 5, 'Sundoro Yekti, SE., M.SI.', 'Penata Tingkat 1', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-19 22:45:46', '2022-12-19 22:45:46');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (6, 6, 'Taufiq Rahman, S.Sos., M.AP', 'Pembina', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-19 22:48:42', '2022-12-19 22:48:42');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (7, 7, 'Zonny Ezra, SE, M.Si', 'Pembina', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-19 22:51:05', '2022-12-19 22:51:05');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (8, 8, 'M.Zulkifli, S.Hut, M.Si', 'Pembina', '2021-01-01', '2021-04-01', 1, 'N', '2022-12-19 22:52:54', '2022-12-19 22:52:54');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (9, 9, 'Marlena Markus, SE', 'Penata Tingkat 1', '2022-01-01', '2022-04-01', 1, 'Y', '2022-12-19 22:54:28', '2022-12-19 22:54:28');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (10, 10, 'Achmad Wildan Handany, S.E.', 'Penata Tingkat 1', '2024-10-01', '2025-01-01', 1, 'Y', '2022-12-19 22:56:23', '2022-12-19 22:56:23');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (11, 11, 'Sulistyowati Ariyani, S.Kom', 'Penata Muda Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-19 23:00:47', '2022-12-19 23:00:47');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (12, 12, 'Daryanti, S.E.', 'Penata Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-19 23:02:52', '2022-12-19 23:02:52');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (13, 13, 'Rofiqoh Istiharoh, SP., M.Si', 'Penata Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-19 23:04:32', '2022-12-19 23:04:32');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (14, 14, 'Nina Dwi Arlini, SE, M.E', 'Penata Tingkat 1', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-19 23:06:26', '2022-12-19 23:06:26');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (15, 15, 'Simon Floris. F, SE', 'Penata Tingkat 1', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-19 23:08:06', '2022-12-19 23:08:06');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (16, 16, 'Nirwana, S.E.', 'Penata Tingkat 1', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-19 23:09:53', '2022-12-19 23:09:53');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (17, 17, 'Awang .Edy Sofiyan, S.Sos', 'Penata', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-19 23:11:22', '2022-12-19 23:11:22');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (18, 18, 'Salmiatin, S.Sos', 'Penata', '2023-07-01', '2023-10-01', 1, 'Y', '2022-12-19 23:12:56', '2022-12-19 23:12:56');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (19, 19, 'Nur Ihsan, SE', 'Penata', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-19 23:14:22', '2022-12-19 23:14:22');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (20, 20, 'Riza Andri Safari, SE., MM', 'Penata', '2022-07-01', '2022-10-01', 1, 'Y', '2022-12-19 23:16:11', '2022-12-19 23:16:11');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (21, 21, 'Juhria, S.Sos', 'Penata Tingkat 1', '2021-01-01', '2021-04-01', 1, 'N', '2022-12-19 23:25:31', '2022-12-19 23:25:31');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (22, 22, 'Suhernis, SE., MM', 'Penata Tingkat 1', '2026-01-01', '2026-04-01', 1, 'Y', '2022-12-19 23:27:26', '2022-12-19 23:27:26');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (23, 23, 'Dedi Setia Candra, S.Sos', 'Penata Tingkat 1', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-19 23:29:04', '2022-12-19 23:29:04');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (24, 24, 'Siti Rahmah, SE', 'Penata Tingkat 1', '2021-01-01', '2021-04-01', 1, 'N', '2022-12-19 23:30:32', '2022-12-19 23:30:32');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (25, 25, 'Siti Zubaidah, SE', 'Penata Tingkat 1', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-19 23:31:55', '2022-12-19 23:31:55');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (26, 26, 'Nurlianah, SE', 'Penata Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-19 23:34:00', '2022-12-19 23:34:00');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (27, 27, 'Effendi, SE', 'Penata Tingkat 1', '2026-01-01', '2026-04-01', 1, 'Y', '2022-12-19 23:35:17', '2022-12-19 23:35:17');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (28, 28, 'Madesa Arjum, S.Sos', 'Penata Tingkat 1', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-19 23:36:33', '2022-12-19 23:36:33');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (29, 29, 'Adji Yuni Mustika, SE', 'Penata Tingkat 1', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-19 23:37:51', '2022-12-19 23:37:51');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (30, 30, 'Samiuddin, S.Sos', 'Penata Tingkat 1', '2023-07-01', '2023-10-01', 1, 'Y', '2022-12-19 23:39:10', '2022-12-19 23:39:10');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (31, 31, 'Akhmad Zainuddin, S.Sos', 'Penata', '2023-07-01', '2023-10-01', 1, 'Y', '2022-12-20 13:17:09', '2022-12-20 13:17:09');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (32, 32, 'Kartini, SE', 'Penata', '2026-01-01', '2026-04-01', 1, 'Y', '2022-12-20 13:18:36', '2022-12-20 13:18:36');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (33, 33, 'Nana Ramayanti, SE', 'Penata', '2026-01-01', '2026-04-01', 1, 'Y', '2022-12-20 13:20:20', '2022-12-20 13:20:20');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (34, 34, 'Agus Sri Wiyono,SE', 'Penata', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-20 13:22:23', '2022-12-20 13:22:23');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (35, 35, 'Nurul Faikoh, SE., M.Si', 'Penata', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 13:24:04', '2022-12-20 13:24:04');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (36, 36, 'Sandhy Firmansyah, S.Sos', 'Penata', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-20 13:25:47', '2022-12-20 13:25:47');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (37, 37, 'Hj. Riska Yunita Fitriyani, SE., M.Si', 'Penata', '2023-07-01', '2023-10-01', 1, 'Y', '2022-12-20 13:27:54', '2022-12-20 13:27:54');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (38, 38, 'Yuni Puji Astuti, S.Pd', 'Penata', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 13:29:33', '2022-12-20 13:29:33');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (39, 39, 'Novandy, SE', 'Penata', '2026-01-01', '2026-04-01', 1, 'Y', '2022-12-20 13:30:49', '2022-12-20 13:30:49');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (40, 40, 'Veronika Ruris Pratiwi, S.Sos', 'Penata', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 13:32:16', '2022-12-20 13:32:16');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (41, 41, 'Hj. Risa Novita Sari, S.Sos', 'Penata Muda Tingkat 1', '2014-01-01', '2014-04-01', 1, 'N', '2022-12-20 13:35:30', '2022-12-20 13:35:30');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (42, 42, 'Mamiek Sumarmi, A.Md', 'Penata Muda Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 13:37:35', '2022-12-20 13:37:35');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (43, 43, 'Huztyawati Astuty Amin, A.Md', 'Penata Muda Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 13:40:12', '2022-12-20 13:40:12');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (44, 44, 'Rico Wahyu Hidayat, S.Sos', 'Penata Muda Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 13:43:33', '2022-12-20 13:43:33');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (45, 45, 'Sulviani, SE', 'Penata Muda Tingkat 1', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-20 13:45:19', '2022-12-20 13:45:19');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (46, 46, 'Agus Wijaya, SE', 'Penata Muda Tingkat 1', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-20 13:49:24', '2022-12-20 13:49:24');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (47, 47, 'Orva Septi Yusuf, SE., M. AP', 'Penata Muda Tingkat 1', '2024-07-01', '2024-10-01', 1, 'Y', '2022-12-20 13:51:04', '2022-12-20 13:51:04');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (48, 48, 'Agustina, S.Sos', 'Penata Muda Tingkat 1', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-20 13:53:05', '2022-12-20 13:53:05');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (49, 49, 'Winny Susanti Alwie, SE', 'Penata Muda Tingkat 1', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-20 13:54:18', '2022-12-20 13:54:18');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (50, 50, 'Mariana Dewi Santika, SE', 'Penata Muda Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 13:55:28', '2022-12-20 13:55:28');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (51, 51, 'Budy Fernandi Luk Setiawan, S. Sos', 'Penata Muda Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 13:58:16', '2022-12-20 13:58:16');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (52, 52, 'Musdalifa, S.Sos', 'Penata Muda Tingkat 1', '2026-01-01', '2026-04-01', 1, 'Y', '2022-12-20 14:00:57', '2022-12-20 14:00:57');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (53, 53, 'Suzanty Usman, S.E', 'Penata Muda Tingkat 1', '2026-01-01', '2026-04-01', 1, 'Y', '2022-12-20 14:02:40', '2022-12-20 14:02:40');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (54, 54, 'Kismiati, A.Md', 'Penata Muda Tingkat 1', '2026-01-01', '2026-04-01', 1, 'Y', '2022-12-20 14:04:11', '2022-12-20 14:04:11');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (55, 55, 'Rahmad Kurniadi, S.E', 'Penata Muda Tingkat 1', '2026-01-01', '2026-04-01', 1, 'Y', '2022-12-20 14:05:30', '2022-12-20 14:05:30');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (56, 56, 'Ernawati, S.Sos', 'Penata Muda', '2022-07-01', '2022-10-01', 1, 'Y', '2022-12-20 14:07:03', '2022-12-20 14:07:03');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (57, 57, 'Ahmad Badara, S.M', 'Penata Muda', '2023-07-01', '2023-10-01', 1, 'Y', '2022-12-20 14:09:06', '2022-12-20 14:09:06');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (58, 58, 'Sherly Marlina, S.E', 'Penata Muda', '2022-07-01', '2022-10-01', 1, 'Y', '2022-12-20 14:10:28', '2022-12-20 14:10:28');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (59, 59, 'Muhammad Sadli, S.Sos', 'Penata Muda', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-20 14:12:04', '2022-12-20 14:12:04');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (60, 60, 'Muhammad Jain, S.E', 'Penata Muda', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-20 14:13:13', '2022-12-20 14:13:13');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (61, 61, 'Kamsiani, S.E', 'Penata Muda', '2024-01-01', '2024-04-01', 1, 'Y', '2022-12-20 14:15:50', '2022-12-20 14:15:50');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (62, 62, 'Ahmad Dani, SE', 'Penata Muda', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-20 14:17:14', '2022-12-20 14:17:14');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (63, 63, 'Dobi Ronal', 'Pengatur Tingkat 1', '2019-01-01', '2019-04-01', 1, 'N', '2022-12-20 14:18:43', '2022-12-20 14:18:43');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (64, 64, 'Al Wardah', 'Pengatur Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 14:20:28', '2022-12-20 14:20:28');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (65, 65, 'Mulyadi', 'Pengatur Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 14:25:33', '2022-12-20 14:25:33');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (66, 66, 'Kaspul Pahri', 'Pengatur Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 14:26:59', '2022-12-20 14:26:59');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (67, 67, 'Rusnawanti', 'Pengatur Tingkat 1', '2023-01-01', '2023-04-01', 1, 'Y', '2022-12-20 14:28:16', '2022-12-20 14:28:16');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (68, 68, 'Herman Sophandiyanto', 'Pengatur Tingkat 1', '2010-10-01', '2011-01-01', 1, 'N', '2022-12-20 14:30:14', '2022-12-20 14:30:14');
COMMIT;

-- ----------------------------
-- Table structure for bpd_masa_kerja
-- ----------------------------
DROP TABLE IF EXISTS `bpd_masa_kerja`;
CREATE TABLE `bpd_masa_kerja` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pegawai_id` int DEFAULT NULL,
  `tahun` char(2) DEFAULT NULL,
  `bulan` char(2) DEFAULT NULL,
  `aktif` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `masa_kerja_pegawai_idx` (`pegawai_id`),
  CONSTRAINT `masa_kerja_pegawai_idx` FOREIGN KEY (`pegawai_id`) REFERENCES `mas_pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_masa_kerja
-- ----------------------------
BEGIN;
INSERT INTO `bpd_masa_kerja` VALUES (1, 1, '21', '1', 'Y', '2022-12-19 22:37:34', '2022-12-19 22:37:34');
INSERT INTO `bpd_masa_kerja` VALUES (2, 2, '22', '1', 'Y', '2022-12-19 22:38:51', '2022-12-19 22:38:51');
INSERT INTO `bpd_masa_kerja` VALUES (3, 3, '30', '2', 'Y', '2022-12-19 22:40:42', '2022-12-19 22:40:42');
INSERT INTO `bpd_masa_kerja` VALUES (4, 4, '20', '1', 'Y', '2022-12-19 22:43:33', '2022-12-19 22:43:33');
INSERT INTO `bpd_masa_kerja` VALUES (5, 5, '14', '1', 'Y', '2022-12-19 22:45:46', '2022-12-19 22:45:46');
INSERT INTO `bpd_masa_kerja` VALUES (6, 6, '31', '2', 'Y', '2022-12-19 22:48:42', '2022-12-19 22:48:42');
INSERT INTO `bpd_masa_kerja` VALUES (7, 7, '29', '2', 'Y', '2022-12-19 22:51:05', '2022-12-19 22:51:05');
INSERT INTO `bpd_masa_kerja` VALUES (8, 8, '20', '1', 'Y', '2022-12-19 22:52:54', '2022-12-19 22:52:54');
INSERT INTO `bpd_masa_kerja` VALUES (9, 9, '22', '1', 'Y', '2022-12-19 22:54:28', '2022-12-19 22:54:28');
INSERT INTO `bpd_masa_kerja` VALUES (10, 10, '20', '1', 'Y', '2022-12-19 22:56:23', '2022-12-19 22:56:23');
INSERT INTO `bpd_masa_kerja` VALUES (11, 11, '16', '1', 'Y', '2022-12-19 23:00:47', '2022-12-19 23:00:47');
INSERT INTO `bpd_masa_kerja` VALUES (12, 12, '15', '1', 'Y', '2022-12-19 23:02:52', '2022-12-19 23:02:52');
INSERT INTO `bpd_masa_kerja` VALUES (13, 13, '15', '1', 'Y', '2022-12-19 23:04:32', '2022-12-19 23:04:32');
INSERT INTO `bpd_masa_kerja` VALUES (14, 14, '13', '1', 'Y', '2022-12-19 23:06:26', '2022-12-19 23:06:26');
INSERT INTO `bpd_masa_kerja` VALUES (15, 15, '13', '1', 'Y', '2022-12-19 23:08:06', '2022-12-19 23:08:06');
INSERT INTO `bpd_masa_kerja` VALUES (16, 16, '14', '1', 'Y', '2022-12-19 23:09:53', '2022-12-19 23:09:53');
INSERT INTO `bpd_masa_kerja` VALUES (17, 17, '21', '1', 'Y', '2022-12-19 23:11:22', '2022-12-19 23:11:22');
INSERT INTO `bpd_masa_kerja` VALUES (18, 18, '17', '1', 'Y', '2022-12-19 23:12:56', '2022-12-19 23:12:56');
INSERT INTO `bpd_masa_kerja` VALUES (19, 19, '15', '1', 'Y', '2022-12-19 23:14:22', '2022-12-19 23:14:22');
INSERT INTO `bpd_masa_kerja` VALUES (20, 20, '11', '0', 'Y', '2022-12-19 23:16:11', '2022-12-19 23:16:11');
INSERT INTO `bpd_masa_kerja` VALUES (21, 21, '21', '1', 'Y', '2022-12-19 23:25:31', '2022-12-19 23:25:31');
INSERT INTO `bpd_masa_kerja` VALUES (22, 22, '21', '1', 'Y', '2022-12-19 23:27:26', '2022-12-19 23:27:26');
INSERT INTO `bpd_masa_kerja` VALUES (23, 23, '21', '1', 'Y', '2022-12-19 23:29:04', '2022-12-19 23:29:04');
INSERT INTO `bpd_masa_kerja` VALUES (24, 24, '20', '1', 'Y', '2022-12-19 23:30:32', '2022-12-19 23:30:32');
INSERT INTO `bpd_masa_kerja` VALUES (25, 25, '20', '1', 'Y', '2022-12-19 23:31:55', '2022-12-19 23:31:55');
INSERT INTO `bpd_masa_kerja` VALUES (26, 26, '15', '1', 'Y', '2022-12-19 23:34:00', '2022-12-19 23:34:00');
INSERT INTO `bpd_masa_kerja` VALUES (27, 27, '15', '1', 'Y', '2022-12-19 23:35:17', '2022-12-19 23:35:17');
INSERT INTO `bpd_masa_kerja` VALUES (28, 28, '13', '1', 'Y', '2022-12-19 23:36:33', '2022-12-19 23:36:33');
INSERT INTO `bpd_masa_kerja` VALUES (29, 29, '13', '1', 'Y', '2022-12-19 23:37:51', '2022-12-19 23:37:51');
INSERT INTO `bpd_masa_kerja` VALUES (30, 30, '21', '1', 'Y', '2022-12-19 23:39:10', '2022-12-19 23:39:10');
INSERT INTO `bpd_masa_kerja` VALUES (31, 31, '21', '1', 'Y', '2022-12-20 13:17:09', '2022-12-20 13:17:09');
INSERT INTO `bpd_masa_kerja` VALUES (32, 32, '21', '1', 'Y', '2022-12-20 13:18:36', '2022-12-20 13:18:36');
INSERT INTO `bpd_masa_kerja` VALUES (33, 33, '16', '1', 'Y', '2022-12-20 13:20:20', '2022-12-20 13:20:20');
INSERT INTO `bpd_masa_kerja` VALUES (34, 34, '16', '1', 'Y', '2022-12-20 13:22:23', '2022-12-20 13:22:23');
INSERT INTO `bpd_masa_kerja` VALUES (35, 35, '15', '1', 'Y', '2022-12-20 13:24:04', '2022-12-20 13:24:04');
INSERT INTO `bpd_masa_kerja` VALUES (36, 36, '13', '1', 'Y', '2022-12-20 13:25:47', '2022-12-20 13:25:47');
INSERT INTO `bpd_masa_kerja` VALUES (37, 37, '13', '1', 'Y', '2022-12-20 13:27:54', '2022-12-20 13:27:54');
INSERT INTO `bpd_masa_kerja` VALUES (38, 38, '12', '1', 'Y', '2022-12-20 13:29:33', '2022-12-20 13:29:33');
INSERT INTO `bpd_masa_kerja` VALUES (39, 39, '12', '1', 'Y', '2022-12-20 13:30:49', '2022-12-20 13:30:49');
INSERT INTO `bpd_masa_kerja` VALUES (40, 40, '11', '0', 'Y', '2022-12-20 13:32:16', '2022-12-20 13:32:16');
INSERT INTO `bpd_masa_kerja` VALUES (41, 41, '22', '1', 'Y', '2022-12-20 13:35:30', '2022-12-20 13:35:30');
INSERT INTO `bpd_masa_kerja` VALUES (42, 42, '15', '1', 'Y', '2022-12-20 13:37:35', '2022-12-20 13:37:35');
INSERT INTO `bpd_masa_kerja` VALUES (43, 43, '15', '1', 'Y', '2022-12-20 13:40:12', '2022-12-20 13:40:12');
INSERT INTO `bpd_masa_kerja` VALUES (44, 44, '15', '1', 'Y', '2022-12-20 13:43:33', '2022-12-20 13:43:33');
INSERT INTO `bpd_masa_kerja` VALUES (45, 45, '15', '1', 'Y', '2022-12-20 13:45:19', '2022-12-20 13:45:19');
INSERT INTO `bpd_masa_kerja` VALUES (46, 46, '10', '0', 'Y', '2022-12-20 13:49:24', '2022-12-20 13:49:24');
INSERT INTO `bpd_masa_kerja` VALUES (47, 47, '14', '1', 'Y', '2022-12-20 13:51:04', '2022-12-20 13:51:04');
INSERT INTO `bpd_masa_kerja` VALUES (48, 48, '12', '1', 'Y', '2022-12-20 13:53:05', '2022-12-20 13:53:05');
INSERT INTO `bpd_masa_kerja` VALUES (49, 49, '8', '0', 'Y', '2022-12-20 13:54:18', '2022-12-20 13:54:18');
INSERT INTO `bpd_masa_kerja` VALUES (50, 50, '7', '0', 'Y', '2022-12-20 13:55:28', '2022-12-20 13:55:28');
INSERT INTO `bpd_masa_kerja` VALUES (51, 51, '7', '0', 'Y', '2022-12-20 13:58:16', '2022-12-20 13:58:16');
INSERT INTO `bpd_masa_kerja` VALUES (52, 52, '15', '1', 'Y', '2022-12-20 14:00:57', '2022-12-20 14:00:57');
INSERT INTO `bpd_masa_kerja` VALUES (53, 53, '14', '1', 'Y', '2022-12-20 14:02:40', '2022-12-20 14:02:40');
INSERT INTO `bpd_masa_kerja` VALUES (54, 54, '14', '1', 'Y', '2022-12-20 14:04:11', '2022-12-20 14:04:11');
INSERT INTO `bpd_masa_kerja` VALUES (55, 55, '13', '1', 'Y', '2022-12-20 14:05:30', '2022-12-20 14:05:30');
INSERT INTO `bpd_masa_kerja` VALUES (56, 56, '16', '1', 'Y', '2022-12-20 14:07:03', '2022-12-20 14:07:03');
INSERT INTO `bpd_masa_kerja` VALUES (57, 57, '15', '1', 'Y', '2022-12-20 14:09:06', '2022-12-20 14:09:06');
INSERT INTO `bpd_masa_kerja` VALUES (58, 58, '14', '1', 'Y', '2022-12-20 14:10:28', '2022-12-20 14:10:28');
INSERT INTO `bpd_masa_kerja` VALUES (59, 59, '14', '1', 'Y', '2022-12-20 14:12:04', '2022-12-20 14:12:04');
INSERT INTO `bpd_masa_kerja` VALUES (60, 60, '14', '1', 'Y', '2022-12-20 14:13:13', '2022-12-20 14:13:13');
INSERT INTO `bpd_masa_kerja` VALUES (61, 61, '7', '0', 'Y', '2022-12-20 14:15:50', '2022-12-20 14:15:50');
INSERT INTO `bpd_masa_kerja` VALUES (62, 62, '8', '0', 'Y', '2022-12-20 14:17:14', '2022-12-20 14:17:14');
INSERT INTO `bpd_masa_kerja` VALUES (63, 63, '20', '1', 'Y', '2022-12-20 14:18:43', '2022-12-20 14:18:43');
INSERT INTO `bpd_masa_kerja` VALUES (64, 64, '15', '1', 'Y', '2022-12-20 14:20:28', '2022-12-20 14:20:28');
INSERT INTO `bpd_masa_kerja` VALUES (65, 65, '15', '1', 'Y', '2022-12-20 14:25:33', '2022-12-20 14:25:33');
INSERT INTO `bpd_masa_kerja` VALUES (66, 66, '15', '1', 'Y', '2022-12-20 14:26:59', '2022-12-20 14:26:59');
INSERT INTO `bpd_masa_kerja` VALUES (67, 67, '15', '1', 'Y', '2022-12-20 14:28:16', '2022-12-20 14:28:16');
INSERT INTO `bpd_masa_kerja` VALUES (68, 68, '15', '1', 'Y', '2022-12-20 14:30:14', '2022-12-20 14:30:14');
INSERT INTO `bpd_masa_kerja` VALUES (70, 70, '15', '1', 'Y', '2022-12-20 14:37:47', '2022-12-20 14:37:47');
INSERT INTO `bpd_masa_kerja` VALUES (71, 71, '14', '1', 'Y', '2022-12-20 14:39:14', '2022-12-20 14:39:14');
INSERT INTO `bpd_masa_kerja` VALUES (72, 72, '14', '1', 'Y', '2022-12-20 14:40:55', '2022-12-20 14:40:55');
INSERT INTO `bpd_masa_kerja` VALUES (73, 73, '10', '0', 'Y', '2022-12-20 14:42:37', '2022-12-20 14:42:37');
INSERT INTO `bpd_masa_kerja` VALUES (74, 74, '12', '1', 'Y', '2022-12-20 14:43:36', '2022-12-20 14:43:36');
INSERT INTO `bpd_masa_kerja` VALUES (75, 75, '10', '0', 'Y', '2022-12-20 14:44:41', '2022-12-20 14:44:41');
INSERT INTO `bpd_masa_kerja` VALUES (76, 76, '0', '0', 'Y', '2022-12-20 14:46:00', '2022-12-20 14:46:00');
INSERT INTO `bpd_masa_kerja` VALUES (77, 77, '10', '0', 'Y', '2022-12-20 14:47:36', '2022-12-20 14:47:36');
INSERT INTO `bpd_masa_kerja` VALUES (78, 78, '13', '1', 'Y', '2022-12-20 14:48:57', '2022-12-20 14:48:57');
INSERT INTO `bpd_masa_kerja` VALUES (79, 79, '17', '1', 'Y', '2023-01-08 21:01:21', '2023-01-08 21:01:21');
INSERT INTO `bpd_masa_kerja` VALUES (80, 80, '17', '1', 'Y', '2023-01-08 21:05:19', '2023-01-08 21:05:19');
INSERT INTO `bpd_masa_kerja` VALUES (81, 81, '16', '1', 'Y', '2023-01-08 21:08:19', '2023-01-08 21:08:19');
COMMIT;

-- ----------------------------
-- Table structure for bpd_pangkat
-- ----------------------------
DROP TABLE IF EXISTS `bpd_pangkat`;
CREATE TABLE `bpd_pangkat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pangkat` varchar(255) DEFAULT NULL,
  `golongan` char(5) DEFAULT NULL,
  `urut` int DEFAULT NULL,
  `aktif` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_pangkat
-- ----------------------------
BEGIN;
INSERT INTO `bpd_pangkat` VALUES (1, 'Juru Muda', 'I.a', 1, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (2, 'Juru Muda Tingkat 1', 'I.b', 2, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (3, 'Juru', 'I.c', 3, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (4, 'Juru Tingkat 1', 'I.d', 4, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (5, 'Pengatur Muda', 'II.a', 5, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (6, 'Pengatur Muda Tingkat 1', 'II.b', 6, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (7, 'Pengatur', 'II.c', 7, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (8, 'Pengatur Tingkat 1', 'II.d', 8, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (9, 'Penata Muda', 'III.a', 9, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (10, 'Penata Muda Tingkat 1', 'III.b', 10, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (11, 'Penata', 'III.c', 11, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (12, 'Penata Tingkat 1', 'III.d', 12, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (13, 'Pembina', 'IV.a', 13, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (14, 'Pembina Tingkat 1', 'IV.b', 14, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (15, 'Pembina Utama Muda', 'IV.c', 15, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (16, 'Pembina Utama Madya', 'IV.d', 16, 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (17, 'Pembina Utama', 'IV.e', 17, 'Y', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for bpd_sk_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `bpd_sk_pegawai`;
CREATE TABLE `bpd_sk_pegawai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomor` varchar(255) DEFAULT NULL,
  `pegawai_id` int DEFAULT NULL,
  `pangkat` varchar(255) DEFAULT NULL,
  `eff_date` date DEFAULT NULL,
  `golongan` char(5) DEFAULT NULL,
  `next_promote` date DEFAULT NULL,
  `file_uri` varchar(255) DEFAULT NULL,
  `aktif` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sk_pegawai_pegawai_idx` (`pegawai_id`),
  CONSTRAINT `sk_pegawai_pegawai_idx` FOREIGN KEY (`pegawai_id`) REFERENCES `mas_pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_sk_pegawai
-- ----------------------------
BEGIN;
INSERT INTO `bpd_sk_pegawai` VALUES (1, '01/10/2017', 1, 'Pembina Tingkat 1', '2017-10-01', 'IV.b', '2021-10-01', NULL, 'Y', '2022-12-19 22:37:34', '2022-12-19 22:37:34');
INSERT INTO `bpd_sk_pegawai` VALUES (2, '01/10/2015', 2, 'Pembina', '2015-10-01', 'IV.a', '2019-10-01', NULL, 'Y', '2022-12-19 22:38:51', '2022-12-19 22:38:51');
INSERT INTO `bpd_sk_pegawai` VALUES (3, '01/10/2019', 3, 'Pembina', '2019-10-01', 'IV.a', '2023-10-01', NULL, 'Y', '2022-12-19 22:40:42', '2022-12-19 22:40:42');
INSERT INTO `bpd_sk_pegawai` VALUES (4, '01/04/2017', 4, 'Pembina', '2017-04-01', 'IV.a', '2021-04-01', NULL, 'Y', '2022-12-19 22:43:33', '2022-12-19 22:43:33');
INSERT INTO `bpd_sk_pegawai` VALUES (5, '01/04/2021', 5, 'Penata Tingkat 1', '2021-04-01', 'III.d', '2025-04-01', NULL, 'Y', '2022-12-19 22:45:46', '2022-12-19 22:45:46');
INSERT INTO `bpd_sk_pegawai` VALUES (6, '01/04/2021', 6, 'Pembina', '2021-04-01', 'IV.a', '2025-04-01', NULL, 'Y', '2022-12-19 22:48:42', '2022-12-19 22:48:42');
INSERT INTO `bpd_sk_pegawai` VALUES (7, '01/04/2021', 7, 'Pembina', '2021-04-01', 'IV.a', '2025-04-01', NULL, 'Y', '2022-12-19 22:51:05', '2022-12-19 22:51:05');
INSERT INTO `bpd_sk_pegawai` VALUES (8, '01/04/2017', 8, 'Pembina', '2017-04-01', 'IV.a', '2021-04-01', NULL, 'Y', '2022-12-19 22:52:54', '2022-12-19 22:52:54');
INSERT INTO `bpd_sk_pegawai` VALUES (9, '01/04/2018', 9, 'Penata Tingkat 1', '2018-04-01', 'III.d', '2022-04-01', NULL, 'Y', '2022-12-19 22:54:28', '2022-12-19 22:54:28');
INSERT INTO `bpd_sk_pegawai` VALUES (10, '01/01/2021', 10, 'Penata Tingkat 1', '2021-01-01', 'III.d', '2025-01-01', NULL, 'Y', '2022-12-19 22:56:23', '2022-12-19 22:56:23');
INSERT INTO `bpd_sk_pegawai` VALUES (11, '01/04/2019', 11, 'Penata Muda Tingkat 1', '2019-04-01', 'III.d', '2023-04-01', NULL, 'Y', '2022-12-19 23:00:47', '2022-12-19 23:00:47');
INSERT INTO `bpd_sk_pegawai` VALUES (12, '01/04/2019', 12, 'Penata Tingkat 1', '2019-04-01', 'III.d', '2023-04-01', NULL, 'Y', '2022-12-19 23:02:52', '2022-12-19 23:02:52');
INSERT INTO `bpd_sk_pegawai` VALUES (13, '01/04/2019', 13, 'Penata Tingkat 1', '2019-04-01', 'III.d', '2023-04-01', NULL, 'Y', '2022-12-19 23:04:32', '2022-12-19 23:04:32');
INSERT INTO `bpd_sk_pegawai` VALUES (14, '01/04/2021', 14, 'Penata Tingkat 1', '2021-04-01', 'III.d', '2025-04-01', NULL, 'Y', '2022-12-19 23:06:26', '2022-12-19 23:06:26');
INSERT INTO `bpd_sk_pegawai` VALUES (15, '01/04/2020', 15, 'Penata Tingkat 1', '2020-04-01', 'III.d', '2024-04-01', NULL, 'Y', '2022-12-19 23:08:06', '2022-12-19 23:08:06');
INSERT INTO `bpd_sk_pegawai` VALUES (16, '01/04/2020', 16, 'Penata Tingkat 1', '2020-04-01', 'III.d', '2024-04-01', NULL, 'Y', '2022-12-19 23:09:53', '2022-12-19 23:09:53');
INSERT INTO `bpd_sk_pegawai` VALUES (17, '01/04/2020', 17, 'Penata', '2020-04-01', 'III.c', '2024-04-01', NULL, 'Y', '2022-12-19 23:11:22', '2022-12-19 23:11:22');
INSERT INTO `bpd_sk_pegawai` VALUES (18, '01/10/2019', 18, 'Penata', '2019-10-01', 'III.c', '2023-10-01', NULL, 'Y', '2022-12-19 23:12:56', '2022-12-19 23:12:56');
INSERT INTO `bpd_sk_pegawai` VALUES (19, '01/04/2020', 19, 'Penata', '2020-04-01', 'III.c', '2024-04-01', NULL, 'Y', '2022-12-19 23:14:22', '2022-12-19 23:14:22');
INSERT INTO `bpd_sk_pegawai` VALUES (20, '01/10/2018', 20, 'Penata', '2018-10-01', 'III.c', '2022-10-01', NULL, 'Y', '2022-12-19 23:16:11', '2022-12-19 23:16:11');
INSERT INTO `bpd_sk_pegawai` VALUES (21, '01/04/2017', 21, 'Penata Tingkat 1', '2017-04-01', 'III.d', '2021-04-01', NULL, 'Y', '2022-12-19 23:25:31', '2022-12-19 23:25:31');
INSERT INTO `bpd_sk_pegawai` VALUES (22, '01/04/2022', 22, 'Penata Tingkat 1', '2022-04-01', 'III.d', '2026-04-01', NULL, 'Y', '2022-12-19 23:27:26', '2022-12-19 23:27:26');
INSERT INTO `bpd_sk_pegawai` VALUES (23, '01/04/2020', 23, 'Penata Tingkat 1', '2020-04-01', 'III.d', '2024-04-01', NULL, 'Y', '2022-12-19 23:29:04', '2022-12-19 23:29:04');
INSERT INTO `bpd_sk_pegawai` VALUES (24, '01/04/2017', 24, 'Penata Tingkat 1', '2017-04-01', 'III.d', '2021-04-01', NULL, 'Y', '2022-12-19 23:30:32', '2022-12-19 23:30:32');
INSERT INTO `bpd_sk_pegawai` VALUES (25, '01/04/2020', 25, 'Penata Tingkat 1', '2020-04-01', 'III.d', '2024-04-01', NULL, 'Y', '2022-12-19 23:31:55', '2022-12-19 23:31:55');
INSERT INTO `bpd_sk_pegawai` VALUES (26, '01/04/2019', 26, 'Penata Tingkat 1', '2019-04-01', 'III.d', '2023-04-01', NULL, 'Y', '2022-12-19 23:34:00', '2022-12-19 23:34:00');
INSERT INTO `bpd_sk_pegawai` VALUES (27, '01/04/2022', 27, 'Penata Tingkat 1', '2022-04-01', 'III.d', '2026-04-01', NULL, 'Y', '2022-12-19 23:35:17', '2022-12-19 23:35:17');
INSERT INTO `bpd_sk_pegawai` VALUES (28, '01/04/2021', 28, 'Penata Tingkat 1', '2021-04-01', 'III.d', '2025-04-01', NULL, 'Y', '2022-12-19 23:36:33', '2022-12-19 23:36:33');
INSERT INTO `bpd_sk_pegawai` VALUES (29, '01/04/2021', 29, 'Penata Tingkat 1', '2021-04-01', 'III.d', '2025-04-01', NULL, 'Y', '2022-12-19 23:37:51', '2022-12-19 23:37:51');
INSERT INTO `bpd_sk_pegawai` VALUES (30, '01/10/2019', 30, 'Penata Tingkat 1', '2019-10-01', 'III.c', '2023-10-01', NULL, 'Y', '2022-12-19 23:39:10', '2022-12-19 23:39:10');
INSERT INTO `bpd_sk_pegawai` VALUES (31, '01/10/2019', 31, 'Penata', '2019-10-01', 'III.c', '2023-10-01', NULL, 'Y', '2022-12-20 13:17:09', '2022-12-20 13:17:09');
INSERT INTO `bpd_sk_pegawai` VALUES (32, '01/04/2022', 32, 'Penata', '2022-04-01', 'III.c', '2026-04-01', NULL, 'Y', '2022-12-20 13:18:36', '2022-12-20 13:18:36');
INSERT INTO `bpd_sk_pegawai` VALUES (33, '01/04/2022', 33, 'Penata', '2022-04-01', 'III.c', '2026-04-01', NULL, 'Y', '2022-12-20 13:20:20', '2022-12-20 13:20:20');
INSERT INTO `bpd_sk_pegawai` VALUES (34, '01/04/2020', 34, 'Penata', '2020-04-01', 'III.c', '2024-04-01', NULL, 'Y', '2022-12-20 13:22:23', '2022-12-20 13:22:23');
INSERT INTO `bpd_sk_pegawai` VALUES (35, '01/04/2019', 35, 'Penata', '2019-04-01', 'III.c', '2023-04-01', NULL, 'Y', '2022-12-20 13:24:04', '2022-12-20 13:24:04');
INSERT INTO `bpd_sk_pegawai` VALUES (36, '01/04/2021', 36, 'Penata', '2021-04-01', 'III.c', '2025-04-01', NULL, 'Y', '2022-12-20 13:25:47', '2022-12-20 13:25:47');
INSERT INTO `bpd_sk_pegawai` VALUES (37, '01/10/2019', 37, 'Penata', '2019-10-01', 'III.c', '2023-10-01', NULL, 'Y', '2022-12-20 13:27:54', '2022-12-20 13:27:54');
INSERT INTO `bpd_sk_pegawai` VALUES (38, '01/04/2019', 38, 'Penata', '2019-04-01', 'III.c', '2023-04-01', NULL, 'Y', '2022-12-20 13:29:33', '2022-12-20 13:29:33');
INSERT INTO `bpd_sk_pegawai` VALUES (39, '01/04/2022', 39, 'Penata', '2022-04-01', 'III.c', '2026-04-01', NULL, 'Y', '2022-12-20 13:30:49', '2022-12-20 13:30:49');
INSERT INTO `bpd_sk_pegawai` VALUES (40, '01/04/2019', 40, 'Penata', '2019-04-01', 'III.c', '2023-04-01', NULL, 'Y', '2022-12-20 13:32:16', '2022-12-20 13:32:16');
INSERT INTO `bpd_sk_pegawai` VALUES (41, '01/04/2010', 41, 'Penata Muda Tingkat 1', '2010-04-01', 'III.b', '2014-04-01', NULL, 'Y', '2022-12-20 13:35:30', '2022-12-20 13:35:30');
INSERT INTO `bpd_sk_pegawai` VALUES (42, '01/04/2019', 42, 'Penata Muda Tingkat 1', '2019-04-01', 'III.b', '2023-04-01', NULL, 'Y', '2022-12-20 13:37:35', '2022-12-20 13:37:35');
INSERT INTO `bpd_sk_pegawai` VALUES (43, '01/04/2019', 43, 'Penata Muda Tingkat 1', '2019-04-01', 'III.b', '2023-04-01', NULL, 'Y', '2022-12-20 13:40:12', '2022-12-20 13:40:12');
INSERT INTO `bpd_sk_pegawai` VALUES (44, '01/04/2019', 44, 'Penata Muda Tingkat 1', '2019-04-01', 'III.b', '2023-04-01', NULL, 'Y', '2022-12-20 13:43:33', '2022-12-20 13:43:33');
INSERT INTO `bpd_sk_pegawai` VALUES (45, '01/04/2021', 45, 'Penata Muda Tingkat 1', '2021-04-01', 'III.b', '2025-04-01', NULL, 'Y', '2022-12-20 13:45:19', '2022-12-20 13:45:19');
INSERT INTO `bpd_sk_pegawai` VALUES (46, '01/04/2020', 46, 'Penata Muda Tingkat 1', '2020-04-01', 'III.b', '2024-04-01', NULL, 'Y', '2022-12-20 13:49:24', '2022-12-20 13:49:24');
INSERT INTO `bpd_sk_pegawai` VALUES (47, '01/10/2020', 47, 'Penata Muda Tingkat 1', '2020-10-01', 'III.b', '2024-10-01', NULL, 'Y', '2022-12-20 13:51:04', '2022-12-20 13:51:04');
INSERT INTO `bpd_sk_pegawai` VALUES (48, '01/04/2021', 48, 'Penata Muda Tingkat 1', '2021-04-01', 'III.b', '2025-04-01', NULL, 'Y', '2022-12-20 13:53:05', '2022-12-20 13:53:05');
INSERT INTO `bpd_sk_pegawai` VALUES (49, '01/04/2021', 49, 'Penata Muda Tingkat 1', '2021-04-01', 'III.b', '2025-04-01', NULL, 'Y', '2022-12-20 13:54:18', '2022-12-20 13:54:18');
INSERT INTO `bpd_sk_pegawai` VALUES (50, '01/04/2019', 50, 'Penata Muda Tingkat 1', '2019-04-01', 'III.b', '2023-04-01', NULL, 'Y', '2022-12-20 13:55:28', '2022-12-20 13:55:28');
INSERT INTO `bpd_sk_pegawai` VALUES (51, '01/04/2019', 51, 'Penata Muda Tingkat 1', '2019-04-01', 'III.b', '2023-04-01', NULL, 'Y', '2022-12-20 13:58:16', '2022-12-20 13:58:16');
INSERT INTO `bpd_sk_pegawai` VALUES (52, '01/04/2022', 52, 'Penata Muda Tingkat 1', '2022-04-01', 'III.b', '2026-04-01', NULL, 'Y', '2022-12-20 14:00:57', '2022-12-20 14:00:57');
INSERT INTO `bpd_sk_pegawai` VALUES (53, '01/04/2022', 53, 'Penata Muda Tingkat 1', '2022-04-01', 'III.b', '2026-04-01', NULL, 'Y', '2022-12-20 14:02:40', '2022-12-20 14:02:40');
INSERT INTO `bpd_sk_pegawai` VALUES (54, '01/04/2022', 54, 'Penata Muda Tingkat 1', '2022-04-01', 'III.b', '2026-04-01', NULL, 'Y', '2022-12-20 14:04:11', '2022-12-20 14:04:11');
INSERT INTO `bpd_sk_pegawai` VALUES (55, '01/04/2022', 55, 'Penata Muda Tingkat 1', '2022-04-01', 'III.b', '2026-04-01', NULL, 'Y', '2022-12-20 14:05:30', '2022-12-20 14:05:30');
INSERT INTO `bpd_sk_pegawai` VALUES (56, '01/10/2018', 56, 'Penata Muda', '2018-10-01', 'III.a', '2022-10-01', NULL, 'Y', '2022-12-20 14:07:03', '2022-12-20 14:07:03');
INSERT INTO `bpd_sk_pegawai` VALUES (57, '01/10/2019', 57, 'Penata Muda', '2019-10-01', 'III.a', '2023-10-01', NULL, 'Y', '2022-12-20 14:09:06', '2022-12-20 14:09:06');
INSERT INTO `bpd_sk_pegawai` VALUES (58, '01/10/2018', 58, 'Penata Muda', '2018-10-01', 'III.a', '2022-10-01', NULL, 'Y', '2022-12-20 14:10:28', '2022-12-20 14:10:28');
INSERT INTO `bpd_sk_pegawai` VALUES (59, '01/04/2020', 59, 'Penata Muda', '2020-04-01', 'III.a', '2024-04-01', NULL, 'Y', '2022-12-20 14:12:04', '2022-12-20 14:12:04');
INSERT INTO `bpd_sk_pegawai` VALUES (60, '01/04/2020', 60, 'Penata Muda', '2020-04-01', 'III.a', '2024-04-01', NULL, 'Y', '2022-12-20 14:13:13', '2022-12-20 14:13:13');
INSERT INTO `bpd_sk_pegawai` VALUES (61, '01/04/2020', 61, 'Penata Muda', '2020-04-01', 'III.a', '2024-04-01', NULL, 'Y', '2022-12-20 14:15:50', '2022-12-20 14:15:50');
INSERT INTO `bpd_sk_pegawai` VALUES (62, '01/04/2021', 62, 'Penata Muda', '2021-04-01', 'III.a', '2025-04-01', NULL, 'Y', '2022-12-20 14:17:14', '2022-12-20 14:17:14');
INSERT INTO `bpd_sk_pegawai` VALUES (63, '01/04/2015', 63, 'Pengatur Tingkat 1', '2015-04-01', 'II.d', '2019-04-01', NULL, 'Y', '2022-12-20 14:18:43', '2022-12-20 14:18:43');
INSERT INTO `bpd_sk_pegawai` VALUES (64, '01/04/2019', 64, 'Pengatur Tingkat 1', '2019-04-01', 'II.d', '2023-04-01', NULL, 'Y', '2022-12-20 14:20:28', '2022-12-20 14:20:28');
INSERT INTO `bpd_sk_pegawai` VALUES (65, '01/04/2019', 65, 'Pengatur Tingkat 1', '2019-04-01', 'II.d', '2023-04-01', NULL, 'Y', '2022-12-20 14:25:33', '2022-12-20 14:25:33');
INSERT INTO `bpd_sk_pegawai` VALUES (66, '01/04/2019', 66, 'Pengatur Tingkat 1', '2019-04-01', 'II.d', '2023-04-01', NULL, 'Y', '2022-12-20 14:26:59', '2022-12-20 14:26:59');
INSERT INTO `bpd_sk_pegawai` VALUES (67, '01/04/2019', 67, 'Pengatur Tingkat 1', '2019-04-01', 'II.d', '2023-04-01', NULL, 'Y', '2022-12-20 14:28:16', '2022-12-20 14:28:16');
COMMIT;

-- ----------------------------
-- Table structure for bpd_thn_gaji
-- ----------------------------
DROP TABLE IF EXISTS `bpd_thn_gaji`;
CREATE TABLE `bpd_thn_gaji` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mkg` int DEFAULT NULL,
  `golongan` char(5) DEFAULT NULL,
  `nilai` float(8,0) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_thn_gaji
-- ----------------------------
BEGIN;
INSERT INTO `bpd_thn_gaji` VALUES (1, 0, 'I.a', 1560800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (2, 1, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (3, 2, 'I.a', 1610000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (4, 3, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (5, 4, 'I.a', 1660700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (6, 5, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (7, 6, 'I.a', 1713000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (8, 7, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (9, 8, 'I.a', 1766900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (10, 9, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (11, 10, 'I.a', 1822600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (12, 11, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (13, 12, 'I.a', 1880000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (14, 13, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (15, 14, 'I.a', 1939200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (16, 15, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (17, 16, 'I.a', 2000300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (18, 17, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (19, 18, 'I.a', 2063300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (20, 19, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (21, 20, 'I.a', 2128300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (22, 21, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (23, 22, 'I.a', 2195300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (24, 23, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (25, 24, 'I.a', 2264400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (26, 25, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (27, 26, 'I.a', 2335800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (28, 27, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (29, 28, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (30, 29, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (31, 30, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (32, 31, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (33, 32, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (34, 33, 'I.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (35, 0, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (36, 1, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (37, 2, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (38, 3, 'I.b', 1704500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (39, 4, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (40, 5, 'I.b', 1758200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (41, 6, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (42, 7, 'I.b', 1813600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (43, 8, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (44, 9, 'I.b', 1870700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (45, 10, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (46, 11, 'I.b', 1929600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (47, 12, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (48, 13, 'I.b', 1990400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (49, 14, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (50, 15, 'I.b', 2053100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (51, 16, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (52, 17, 'I.b', 2117700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (53, 18, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (54, 19, 'I.b', 2184400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (55, 20, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (56, 21, 'I.b', 2253200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (57, 22, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (58, 23, 'I.b', 2324200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (59, 24, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (60, 25, 'I.b', 2397400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (61, 26, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (62, 27, 'I.b', 2472900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (63, 28, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (64, 29, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (65, 30, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (66, 31, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (67, 32, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (68, 33, 'I.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (69, 0, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (70, 1, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (71, 2, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (72, 3, 'I.c', 1776600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (73, 4, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (74, 5, 'I.c', 1832600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (75, 6, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (76, 7, 'I.c', 1890300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (77, 8, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (78, 9, 'I.c', 1949800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (79, 10, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (80, 11, 'I.c', 2011200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (81, 12, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (82, 13, 'I.c', 2074600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (83, 14, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (84, 15, 'I.c', 2139900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (85, 16, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (86, 17, 'I.c', 2207300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (87, 18, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (88, 19, 'I.c', 2276800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (89, 20, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (90, 21, 'I.c', 2348500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (91, 22, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (92, 23, 'I.c', 2422500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (93, 24, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (94, 25, 'I.c', 2498800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (95, 26, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (96, 27, 'I.c', 2577500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (97, 28, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (98, 29, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (99, 30, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (100, 31, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (101, 32, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (102, 33, 'I.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (103, 0, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (104, 1, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (105, 2, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (106, 3, 'I.d', 1851800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (107, 4, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (108, 5, 'I.d', 1910100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (109, 6, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (110, 7, 'I.d', 1970200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (111, 8, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (112, 9, 'I.d', 2032300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (113, 10, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (114, 11, 'I.d', 2096300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (115, 12, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (116, 13, 'I.d', 2162300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (117, 14, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (118, 15, 'I.d', 2230400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (119, 16, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (120, 17, 'I.d', 2300700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (121, 18, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (122, 19, 'I.d', 2373100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (123, 20, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (124, 21, 'I.d', 2447900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (125, 22, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (126, 23, 'I.d', 2525000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (127, 24, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (128, 25, 'I.d', 2604500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (129, 26, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (130, 27, 'I.d', 2686500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (131, 28, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (132, 29, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (133, 30, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (134, 31, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (135, 32, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (136, 33, 'I.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (137, 0, 'II.a', 2022200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (138, 1, 'II.a', 2054100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (139, 2, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (140, 3, 'II.a', 2118800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (141, 4, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (142, 5, 'II.a', 2185500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (143, 6, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (144, 7, 'II.a', 2254300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (145, 8, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (146, 9, 'II.a', 2325300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (147, 10, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (148, 11, 'II.a', 2398600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (149, 12, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (150, 13, 'II.a', 2474100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (151, 14, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (152, 15, 'II.a', 2552000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (153, 16, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (154, 17, 'II.a', 2632400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (155, 18, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (156, 19, 'II.a', 2715300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (157, 20, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (158, 21, 'II.a', 2800800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (159, 22, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (160, 23, 'II.a', 2889100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (161, 24, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (162, 25, 'II.a', 2980000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (163, 26, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (164, 27, 'II.a', 3073900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (165, 28, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (166, 29, 'II.a', 3170700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (167, 30, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (168, 31, 'II.a', 3270600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (169, 32, 'II.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (170, 33, 'II.a', 3373600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (171, 0, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (172, 1, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (173, 2, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (174, 3, 'II.b', 2208400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (175, 4, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (176, 5, 'II.b', 2277900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (177, 6, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (178, 7, 'II.b', 2349700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (179, 8, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (180, 9, 'II.b', 2423700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (181, 10, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (182, 11, 'II.b', 2500000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (183, 12, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (184, 13, 'II.b', 2578800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (185, 14, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (186, 15, 'II.b', 2660000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (187, 16, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (188, 17, 'II.b', 2743800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (189, 18, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (190, 19, 'II.b', 2830200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (191, 20, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (192, 21, 'II.b', 2919300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (193, 22, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (194, 23, 'II.b', 3011300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (195, 24, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (196, 25, 'II.b', 3106100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (197, 26, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (198, 27, 'II.b', 3203900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (199, 28, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (200, 29, 'II.b', 3304800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (201, 30, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (202, 31, 'II.b', 3408900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (203, 32, 'II.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (204, 33, 'II.b', 3516300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (205, 0, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (206, 1, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (207, 2, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (208, 3, 'II.c', 2301800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (209, 4, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (210, 5, 'II.c', 2374300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (211, 6, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (212, 7, 'II.c', 2449100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (213, 8, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (214, 9, 'II.c', 2526200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (215, 10, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (216, 11, 'II.c', 2605800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (217, 12, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (218, 13, 'II.c', 2687800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (219, 14, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (220, 15, 'II.c', 2772500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (221, 16, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (222, 17, 'II.c', 2859800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (223, 18, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (224, 19, 'II.c', 2949900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (225, 20, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (226, 21, 'II.c', 3042800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (227, 22, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (228, 23, 'II.c', 3138600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (229, 24, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (230, 25, 'II.c', 3237500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (231, 26, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (232, 27, 'II.c', 3339400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (233, 28, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (234, 29, 'II.c', 3444600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (235, 30, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (236, 31, 'II.c', 3553100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (237, 32, 'II.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (238, 33, 'II.c', 3665000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (239, 0, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (240, 1, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (241, 2, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (242, 3, 'II.d', 2399200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (243, 4, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (244, 5, 'II.d', 2474700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (245, 6, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (246, 7, 'II.d', 2552700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (247, 8, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (248, 9, 'II.d', 2633100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (249, 10, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (250, 11, 'II.d', 2716000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (251, 12, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (252, 13, 'II.d', 2801500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (253, 14, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (254, 15, 'II.d', 2889800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (255, 16, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (256, 17, 'II.d', 2980800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (257, 18, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (258, 19, 'II.d', 3074700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (259, 20, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (260, 21, 'II.d', 3171500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (261, 22, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (262, 23, 'II.d', 3271400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (263, 24, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (264, 25, 'II.d', 3374400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (265, 26, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (266, 27, 'II.d', 3480700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (267, 28, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (268, 29, 'II.d', 3590300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (269, 30, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (270, 31, 'II.d', 3703400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (271, 32, 'II.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (272, 33, 'II.d', 3820000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (273, 0, 'III.a', 2579400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (274, 1, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (275, 2, 'III.a', 2660700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (276, 3, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (277, 4, 'III.a', 2744500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (278, 5, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (279, 6, 'III.a', 2830900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (280, 7, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (281, 8, 'III.a', 2920100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (282, 9, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (283, 10, 'III.a', 3012000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (284, 11, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (285, 12, 'III.a', 3106900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (286, 13, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (287, 14, 'III.a', 3204700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (288, 15, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (289, 16, 'III.a', 3305700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (290, 17, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (291, 18, 'III.a', 3409800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (292, 19, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (293, 20, 'III.a', 3517200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (294, 21, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (295, 22, 'III.a', 3627900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (296, 23, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (297, 24, 'III.a', 3742200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (298, 25, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (299, 26, 'III.a', 3860100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (300, 27, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (301, 28, 'III.a', 3981600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (302, 29, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (303, 30, 'III.a', 4107000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (304, 31, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (305, 32, 'III.a', 4236400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (306, 33, 'III.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (307, 0, 'III.b', 2688500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (308, 1, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (309, 2, 'III.b', 2773200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (310, 3, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (311, 4, 'III.b', 2860500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (312, 5, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (313, 6, 'III.b', 2950600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (314, 7, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (315, 8, 'III.b', 3043600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (316, 9, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (317, 10, 'III.b', 3139400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (318, 11, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (319, 12, 'III.b', 3238300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (320, 13, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (321, 14, 'III.b', 3340300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (322, 15, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (323, 16, 'III.b', 3445500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (324, 17, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (325, 18, 'III.b', 3554000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (326, 19, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (327, 20, 'III.b', 3665900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (328, 21, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (329, 22, 'III.b', 3781400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (330, 23, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (331, 24, 'III.b', 3900500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (332, 25, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (333, 26, 'III.b', 4023300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (334, 27, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (335, 28, 'III.b', 4150100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (336, 29, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (337, 30, 'III.b', 4280800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (338, 31, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (339, 32, 'III.b', 4415600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (340, 33, 'III.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (341, 0, 'III.c', 2802300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (342, 1, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (343, 2, 'III.c', 2890500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (344, 3, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (345, 4, 'III.c', 2981500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (346, 5, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (347, 6, 'III.c', 3075500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (348, 7, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (349, 8, 'III.c', 3172300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (350, 9, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (351, 10, 'III.c', 3272200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (352, 11, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (353, 12, 'III.c', 3375300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (354, 13, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (355, 14, 'III.c', 3481600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (356, 15, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (357, 16, 'III.c', 3591200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (358, 17, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (359, 18, 'III.c', 3704300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (360, 19, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (361, 20, 'III.c', 3621000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (362, 21, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (363, 22, 'III.c', 3941400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (364, 23, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (365, 24, 'III.c', 4065500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (366, 25, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (367, 26, 'III.c', 4193500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (368, 27, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (369, 28, 'III.c', 4325600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (370, 29, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (371, 30, 'III.c', 4461800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (372, 31, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (373, 32, 'III.c', 4602400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (374, 33, 'III.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (375, 0, 'III.d', 2920800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (376, 1, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (377, 2, 'III.d', 3012800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (378, 3, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (379, 4, 'III.d', 3107700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (380, 5, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (381, 6, 'III.d', 3205500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (382, 7, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (383, 8, 'III.d', 3306500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (384, 9, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (385, 10, 'III.d', 3410600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (386, 11, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (387, 12, 'III.d', 3518100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (388, 13, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (389, 14, 'III.d', 3628900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (390, 15, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (391, 16, 'III.d', 3743100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (392, 17, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (393, 18, 'III.d', 3861000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (394, 19, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (395, 20, 'III.d', 3982600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (396, 21, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (397, 22, 'III.d', 4108100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (398, 23, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (399, 24, 'III.d', 4237500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (400, 25, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (401, 26, 'III.d', 4370900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (402, 27, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (403, 28, 'III.d', 4508600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (404, 29, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (405, 30, 'III.d', 4650600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (406, 31, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (407, 32, 'III.d', 4797000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (408, 33, 'III.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (409, 0, 'IV.a', 3044300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (410, 1, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (411, 2, 'IV.a', 3140200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (412, 3, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (413, 4, 'IV.a', 3239100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (414, 5, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (415, 6, 'IV.a', 3341100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (416, 7, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (417, 8, 'IV.a', 3446400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (418, 9, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (419, 10, 'IV.a', 3554900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (420, 11, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (421, 12, 'IV.a', 3666900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (422, 13, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (423, 14, 'IV.a', 3782400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (424, 15, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (425, 16, 'IV.a', 3901500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (426, 17, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (427, 18, 'IV.a', 4024400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (428, 19, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (429, 20, 'IV.a', 4151100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (430, 21, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (431, 22, 'IV.a', 4281800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (432, 23, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (433, 24, 'IV.a', 4416700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (434, 25, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (435, 26, 'IV.a', 4555800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (436, 27, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (437, 28, 'IV.a', 4699300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (438, 29, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (439, 30, 'IV.a', 4847300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (440, 31, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (441, 32, 'IV.a', 5000000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (442, 33, 'IV.a', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (443, 0, 'IV.b', 3173100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (444, 1, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (445, 2, 'IV.b', 3273100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (446, 3, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (447, 4, 'IV.b', 3376100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (448, 5, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (449, 6, 'IV.b', 3482500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (450, 7, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (451, 8, 'IV.b', 3592100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (452, 9, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (453, 10, 'IV.b', 3705300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (454, 11, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (455, 12, 'IV.b', 3822000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (456, 13, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (457, 14, 'IV.b', 3942400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (458, 15, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (459, 16, 'IV.b', 4066500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (460, 17, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (461, 18, 'IV.b', 4194600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (462, 19, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (463, 20, 'IV.b', 4326700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (464, 21, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (465, 22, 'IV.b', 4463000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (466, 23, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (467, 24, 'IV.b', 4603500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (468, 25, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (469, 26, 'IV.b', 4748500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (470, 27, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (471, 28, 'IV.b', 4898100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (472, 29, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (473, 30, 'IV.b', 5052300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (474, 31, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (475, 32, 'IV.b', 5211500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (476, 33, 'IV.b', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (477, 0, 'IV.c', 3307300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (478, 1, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (479, 2, 'IV.c', 3411500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (480, 3, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (481, 4, 'IV.c', 3518900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (482, 5, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (483, 6, 'IV.c', 3629800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (484, 7, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (485, 8, 'IV.c', 3744100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (486, 9, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (487, 10, 'IV.c', 3862000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (488, 11, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (489, 12, 'IV.c', 3983600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (490, 13, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (491, 14, 'IV.c', 4109100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (492, 15, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (493, 16, 'IV.c', 4238500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (494, 17, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (495, 18, 'IV.c', 4372000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (496, 19, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (497, 20, 'IV.c', 4509700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (498, 21, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (499, 22, 'IV.c', 4651800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (500, 23, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (501, 24, 'IV.c', 4798300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (502, 25, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (503, 26, 'IV.c', 4949400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (504, 27, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (505, 28, 'IV.c', 5105300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (506, 29, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (507, 30, 'IV.c', 5266100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (508, 31, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (509, 32, 'IV.c', 5431900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (510, 33, 'IV.c', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (511, 0, 'IV.d', 3447200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (512, 1, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (513, 2, 'IV.d', 3555800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (514, 3, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (515, 4, 'IV.d', 3667800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (516, 5, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (517, 6, 'IV.d', 3783300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (518, 7, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (519, 8, 'IV.d', 3902500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (520, 9, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (521, 10, 'IV.d', 4025400, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (522, 11, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (523, 12, 'IV.d', 4152200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (524, 13, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (525, 14, 'IV.d', 4282900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (526, 15, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (527, 16, 'IV.d', 4417800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (528, 17, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (529, 18, 'IV.d', 4557000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (530, 19, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (531, 20, 'IV.d', 4700500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (532, 21, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (533, 22, 'IV.d', 4848500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (534, 23, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (535, 24, 'IV.d', 5001200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (536, 25, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (537, 26, 'IV.d', 5158700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (538, 27, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (539, 28, 'IV.d', 5321200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (540, 29, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (541, 30, 'IV.d', 5488800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (542, 31, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (543, 32, 'IV.d', 5661700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (544, 33, 'IV.d', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (545, 0, 'IV.e', 3593100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (546, 1, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (547, 2, 'IV.e', 3706200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (548, 3, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (549, 4, 'IV.e', 3822900, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (550, 5, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (551, 6, 'IV.e', 3943300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (552, 7, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (553, 8, 'IV.e', 4067500, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (554, 9, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (555, 10, 'IV.e', 4195700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (556, 11, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (557, 12, 'IV.e', 4327800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (558, 13, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (559, 14, 'IV.e', 4464100, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (560, 15, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (561, 16, 'IV.e', 4604700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (562, 17, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (563, 18, 'IV.e', 4749700, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (564, 19, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (565, 20, 'IV.e', 4899300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (566, 21, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (567, 22, 'IV.e', 5053600, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (568, 23, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (569, 24, 'IV.e', 5212800, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (570, 25, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (571, 26, 'IV.e', 5377000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (572, 27, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (573, 28, 'IV.e', 5546300, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (574, 29, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (575, 30, 'IV.e', 5721000, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (576, 31, 'IV.e', NULL, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (577, 32, 'IV.e', 5901200, 'Y', NULL, NULL);
INSERT INTO `bpd_thn_gaji` VALUES (578, 33, 'IV.e', NULL, 'Y', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for init_promosi
-- ----------------------------
DROP TABLE IF EXISTS `init_promosi`;
CREATE TABLE `init_promosi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `golongan` char(5) DEFAULT NULL,
  `durasi` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `aktif` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of init_promosi
-- ----------------------------
BEGIN;
INSERT INTO `init_promosi` VALUES (1, 'pangkat', NULL, 48, 'bulan', 'Y', NULL, NULL);
INSERT INTO `init_promosi` VALUES (2, 'gaji', 'III', 24, 'bulan', 'Y', NULL, NULL);
INSERT INTO `init_promosi` VALUES (3, 'gaji', 'IV', 24, 'bulan', 'Y', NULL, NULL);
INSERT INTO `init_promosi` VALUES (4, 'gaji', 'II', 36, 'bulan', 'Y', NULL, NULL);
INSERT INTO `init_promosi` VALUES (5, 'satya_lencana', NULL, 120, 'bulan', 'Y', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for mas_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `mas_pegawai`;
CREATE TABLE `mas_pegawai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `jenkel` enum('L','P') DEFAULT 'L',
  `type` varchar(255) DEFAULT NULL,
  `pangkat` varchar(255) DEFAULT NULL,
  `golongan` varchar(5) DEFAULT NULL,
  `essalon` varchar(5) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `pendidikan` varchar(30) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL,
  `tmt_cpns` date DEFAULT NULL,
  `keterangan` text,
  `photo` varchar(255) DEFAULT NULL,
  `createdby` int DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nipx` (`nip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mas_pegawai
-- ----------------------------
BEGIN;
INSERT INTO `mas_pegawai` VALUES (1, '19730708 200112 1 003', 'Syahfur, S.Sos, M.Si', 'L', 'PNS', 'Pembina Tingkat 1', 'IV.b', 'III.b', 'Kepala Badan', 'S2', 'Ilmu Administrasi Negara', '2001-12-01', NULL, NULL, 1, 'Y', '2022-12-19 22:37:34', '2022-12-19 22:37:34');
INSERT INTO `mas_pegawai` VALUES (2, '19700525 200003 2 005', 'Supianti, S.Sos. M.Si', 'P', 'PNS', 'Pembina', 'IV.a', 'III.a', 'Plt.Sekretaris (Kabid. Pendataan & Penetapan)', 'S2', 'Ilmu Administrasi Negara', '2000-02-01', NULL, NULL, 1, 'Y', '2022-12-19 22:38:51', '2022-12-19 22:38:51');
INSERT INTO `mas_pegawai` VALUES (3, '19661012 199203 1 011', 'Setia Budi, SE', 'L', 'PNS', 'Pembina', 'IV.a', 'III.b', 'Kabid Penagihan & Keberatan ', 'S1', 'Management', '1992-03-01', NULL, NULL, 1, 'Y', '2022-12-19 22:40:42', '2022-12-19 22:40:42');
INSERT INTO `mas_pegawai` VALUES (4, '19750822 200212 1 005', 'Deni Hendi, ST.,M.SI.', 'L', 'PNS', 'Pembina', 'IV.a', 'III.b', 'Kabid Pengendalian, Evaluasi & Pelaporan', 'S2', 'Management', '2002-12-01', NULL, NULL, 1, 'Y', '2022-12-19 22:43:33', '2022-12-19 22:43:33');
INSERT INTO `mas_pegawai` VALUES (5, '19771015 200801 1 018', 'Sundoro Yekti, SE., M.SI.', 'L', 'PNS', 'Penata Tingkat 1', 'III.d', 'III.b', 'Kabid PBB P2 dan BPHTB', 'S2', 'Magister sains', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-19 22:45:46', '2022-12-19 22:45:46');
INSERT INTO `mas_pegawai` VALUES (6, '19701016 199103 1 003', 'Taufiq Rahman, S.Sos., M.AP', 'L', 'PNS', 'Pembina', 'IV.a', 'IV.a', 'Kasubbid Penagihan', 'S2', 'Magister Administrasi Publik', '1991-03-01', NULL, NULL, 1, 'Y', '2022-12-19 22:48:42', '2022-12-19 22:48:42');
INSERT INTO `mas_pegawai` VALUES (7, '19730425 199303 1 003', 'Zonny Ezra, SE, M.Si', 'P', 'PNS', 'Pembina', 'IV.a', 'IV.a', 'Kasubbid Pengolahan Data & Informasi PBB P2 & BPHTB ', 'S2', 'Ilmu Ekonomi', '1993-03-01', NULL, NULL, 1, 'Y', '2022-12-19 22:51:05', '2022-12-19 22:51:05');
INSERT INTO `mas_pegawai` VALUES (8, '19730508 200212 1 006', 'M.Zulkifli, S.Hut, M.Si', 'L', 'PNS', 'Pembina', 'IV.a', 'IV.a', 'Kasubbid Penilaian', 'S2', 'Ilmu Ekonomi', '2002-12-01', NULL, NULL, 1, 'Y', '2022-12-19 22:52:54', '2022-12-19 22:52:54');
INSERT INTO `mas_pegawai` VALUES (9, '19780323 200012 2 001', 'Marlena Markus, SE', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', 'IV.a', 'Kasubbid Keberatan & Banding', 'S1', 'Management', '2000-12-01', NULL, NULL, 1, 'Y', '2022-12-19 22:54:28', '2022-12-19 22:54:28');
INSERT INTO `mas_pegawai` VALUES (10, '19751003 200212 1 012', 'Achmad Wildan Handany, S.E.', 'L', 'PNS', 'Penata Tingkat 1', 'III.d', 'IV.a', 'Analis Keuangan Pusat dan Daerah Ahli Muda ', NULL, '-', '2002-12-01', NULL, NULL, 1, 'Y', '2022-12-19 22:56:23', '2022-12-19 22:56:23');
INSERT INTO `mas_pegawai` VALUES (11, '19800325 200604 2 023', 'Sulistyowati Ariyani, S.Kom', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.d', 'IV.a', 'Analis Keuangan Pusat dan Daerah Ahli Muda ', 'S1', 'Teknik Informatika', '2006-04-01', NULL, NULL, 1, 'Y', '2022-12-19 23:00:47', '2022-12-19 23:00:47');
INSERT INTO `mas_pegawai` VALUES (12, '19770721 200701 2 017', 'Daryanti, S.E.', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', 'IV.a', 'Kasubbag Umum dan Kepegawaian', 'S1', 'Management', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:02:52', '2022-12-19 23:02:52');
INSERT INTO `mas_pegawai` VALUES (13, '19790608 200701 2 013', 'Rofiqoh Istiharoh, SP., M.Si', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', 'IV.a', 'Kasubbid Pendataan & Pendaftaran', 'S2', 'Magister sains', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:04:32', '2022-12-19 23:04:32');
INSERT INTO `mas_pegawai` VALUES (14, '19740101 200903 2 002', 'Nina Dwi Arlini, SE, M.E', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', 'IV.a', 'Analis Keuangan Pusat dan Daerah Ahli Muda', 'S2', 'Magister Ekonomi', '2009-03-01', NULL, NULL, 1, 'Y', '2022-12-19 23:06:26', '2022-12-19 23:06:26');
INSERT INTO `mas_pegawai` VALUES (15, '19760921 200902 1 003', 'Simon Floris. F, SE', 'L', 'PNS', 'Penata Tingkat 1', 'III.d', 'IV.a', 'Kasubbid  Pengembangan Potensi Pendapatan', 'S1', 'Ekonomi Akuntansi', '2009-02-01', NULL, NULL, 1, 'Y', '2022-12-19 23:08:06', '2022-12-19 23:08:06');
INSERT INTO `mas_pegawai` VALUES (16, '19790717 200801 2 042', 'Nirwana, S.E.', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', 'IV.a', 'Analis Keuangan Pusat dan Daerah Ahli Muda ', 'S1', 'Management', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:09:53', '2022-12-19 23:09:53');
INSERT INTO `mas_pegawai` VALUES (17, '19670721 200112 1 004', 'Awang .Edy Sofiyan, S.Sos', 'L', 'PNS', 'Penata', 'III.c', 'IV.a', 'Perencana Ahli Muda', 'S1', 'Ilmu Administrasi Negara', '2001-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:11:22', '2022-12-19 23:11:22');
INSERT INTO `mas_pegawai` VALUES (18, '19820402 200502 2 004', 'Salmiatin, S.Sos', 'P', 'PNS', 'Penata', 'III.c', 'IV.a', 'Kasubbid Perhitungan & Penetapan', 'S1', 'Ilmu Administrasi Negara', '2005-02-01', NULL, NULL, 1, 'Y', '2022-12-19 23:12:56', '2022-12-19 23:12:56');
INSERT INTO `mas_pegawai` VALUES (19, '19720505 200701 1 047', 'Nur Ihsan, SE', 'L', 'PNS', 'Penata', 'III.c', 'IV.a', 'Analis Keuangan Pusat dan Daerah Ahli Muda ', 'S1', 'Ekonomi Management', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:14:22', '2022-12-19 23:14:22');
INSERT INTO `mas_pegawai` VALUES (20, '19770128 201101 1 003', 'Riza Andri Safari, SE., MM', 'L', 'PNS', 'Penata', 'III.c', 'IV.a', 'Kasubbid  Evaluasi & Pelaporan ', 'S2', 'Management SDM', '2011-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:16:11', '2022-12-19 23:16:11');
INSERT INTO `mas_pegawai` VALUES (21, '19730616 200112 2 002', 'Juhria, S.Sos', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', NULL, 'Pengolah Data Penagihan Pajak', 'S1', 'Ilmu Administrasi Negara', '2001-12-01', NULL, NULL, 1, 'Y', '2022-12-19 23:25:31', '2022-12-19 23:25:31');
INSERT INTO `mas_pegawai` VALUES (22, '19801010 200112 2 002', 'Suhernis, SE., MM', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', NULL, 'Analis Audit', 'S2', 'Magister Manajemen', '2001-12-01', NULL, NULL, 1, 'Y', '2022-12-19 23:27:26', '2022-12-19 23:27:26');
INSERT INTO `mas_pegawai` VALUES (23, '19800217 200112 1 005', 'Dedi Setia Candra, S.Sos', 'L', 'PNS', 'Penata Tingkat 1', 'III.d', NULL, 'Penyusun Rencana Inspeksi dan Verifikasi', 'S1', 'Ilmu Administrasi Negara', '2001-12-01', NULL, NULL, 1, 'Y', '2022-12-19 23:29:04', '2022-12-19 23:29:04');
INSERT INTO `mas_pegawai` VALUES (24, '19730815 200212 2 005', 'Siti Rahmah, SE', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', NULL, 'Analis Pendapatan Daerah', 'S1', 'Ekonomi', '2002-12-01', NULL, NULL, 1, 'Y', '2022-12-19 23:30:32', '2022-12-19 23:30:32');
INSERT INTO `mas_pegawai` VALUES (25, '19800502 200212 2 003', 'Siti Zubaidah, SE', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', NULL, 'Analis Hasil Pengawasan dan Pengaduan Masyarakat', 'S1', 'Management', '2002-12-01', NULL, NULL, 1, 'Y', '2022-12-19 23:31:55', '2022-12-19 23:31:55');
INSERT INTO `mas_pegawai` VALUES (26, '19680814 200701 2 036', 'Nurlianah, SE', 'P', 'PNS', 'Penata Tingkat 1', 'III.d', NULL, 'Analis Pajak dan Retribusi Daerah', 'S1', 'Management Ekonomi', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:34:00', '2022-12-19 23:34:00');
INSERT INTO `mas_pegawai` VALUES (27, '19680119 200701 1 011', 'Effendi, SE', 'L', 'PNS', 'Penata Tingkat 1', 'III.d', NULL, 'Analis Pendapatan Daerah', 'S1', 'Management', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:35:17', '2022-12-19 23:35:17');
INSERT INTO `mas_pegawai` VALUES (28, '19751231 200901 1 005', 'Madesa Arjum, S.Sos', 'L', 'PNS', 'Penata Tingkat 1', 'III.d', NULL, 'Analis Pengawasan', 'S1', 'Ilmu Komunikasi', '2009-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:36:33', '2022-12-19 23:36:33');
INSERT INTO `mas_pegawai` VALUES (29, '19770616 200901 2 002', 'Adji Yuni Mustika, SE', 'L', 'PNS', 'Penata Tingkat 1', 'III.d', NULL, 'Analis Pengelolaan Dana Bagi Hasil Pajak dan Sumber Daya Alam', 'S1', 'Ekonomi', '2009-01-01', NULL, NULL, 1, 'Y', '2022-12-19 23:37:51', '2022-12-19 23:37:51');
INSERT INTO `mas_pegawai` VALUES (30, '19690401 200112 1 004', 'Samiuddin, S.Sos', 'L', 'PNS', 'Penata Tingkat 1', 'III.c', NULL, 'Analis Pajak dan Retribusi', 'S1', 'Ilmu Administrasi Negara', '2001-12-01', NULL, NULL, 1, 'Y', '2022-12-19 23:39:10', '2022-12-19 23:39:10');
INSERT INTO `mas_pegawai` VALUES (31, '19760923 200112 1 004', 'Akhmad Zainuddin, S.Sos', 'L', 'PNS', 'Penata', 'III.c', NULL, 'Pengelola Pengawasan', 'S1', 'Ilmu Administrasi Negara', '2001-12-01', NULL, NULL, 1, 'Y', '2022-12-20 13:17:09', '2022-12-20 13:17:09');
INSERT INTO `mas_pegawai` VALUES (32, '19780611 200112 2 004', 'Kartini, SE', 'P', 'PNS', 'Penata', 'III.c', NULL, 'Pengelola Keuangan', 'S1', 'Management', '2001-12-01', NULL, NULL, 1, 'Y', '2022-12-20 13:18:36', '2022-12-20 13:18:36');
INSERT INTO `mas_pegawai` VALUES (33, '19790727 200604 2 017', 'Nana Ramayanti, SE', 'P', 'PNS', 'Penata', 'III.c', NULL, 'Analis Monitoring, Evaluasi dan Pelaporan', 'S1', 'Management', '2006-04-01', NULL, NULL, 1, 'Y', '2022-12-20 13:20:20', '2022-12-20 13:20:20');
INSERT INTO `mas_pegawai` VALUES (34, '19800820 200604 1 014', 'Agus Sri Wiyono,SE', 'L', 'PNS', 'Penata', 'III.c', NULL, 'Penyusun Rencana Inspeksi dan Verifikasi', 'S1', 'Ekonomi Management', '2006-04-01', NULL, NULL, 1, 'Y', '2022-12-20 13:22:23', '2022-12-20 13:22:23');
INSERT INTO `mas_pegawai` VALUES (35, '19710831 200701 2 009', 'Nurul Faikoh, SE., M.Si', 'L', 'PNS', 'Penata', 'III.c', NULL, 'Pengolah Data Laporan Penilaian', 'S2', 'Ilmu Administrasi Negara', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:24:04', '2022-12-20 13:24:04');
INSERT INTO `mas_pegawai` VALUES (36, '19800229 200901 1 002', 'Sandhy Firmansyah, S.Sos', 'L', 'PNS', 'Penata', 'III.c', NULL, 'Analis Penilaian', 'S1', 'Ilmu Administrasi Negara', '2009-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:25:47', '2022-12-20 13:25:47');
INSERT INTO `mas_pegawai` VALUES (37, '19860609 200901 2 001', 'Hj. Riska Yunita Fitriyani, SE., M.Si', 'P', 'PNS', 'Penata', 'III.c', NULL, 'Analis Data dan Informasi', 'S2', 'Administrasi Pemerintah Daerah', '2009-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:27:54', '2022-12-20 13:27:54');
INSERT INTO `mas_pegawai` VALUES (38, '19800616 201001 2 008', 'Yuni Puji Astuti, S.Pd', 'P', 'PNS', 'Penata', 'III.c', NULL, 'Analis Pemeriksaan Pajak', 'S1', 'Pendidikan Bahasa dan Seni', '2010-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:29:33', '2022-12-20 13:29:33');
INSERT INTO `mas_pegawai` VALUES (39, '19851106 201001 1 003', 'Novandy, SE', 'L', 'PNS', 'Penata', 'III.c', NULL, 'Penyusun Rencana Kegiatan dan Anggaran', 'S1', 'Management', '2010-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:30:49', '2022-12-20 13:30:49');
INSERT INTO `mas_pegawai` VALUES (40, '19880707 201101 2 005', 'Veronika Ruris Pratiwi, S.Sos', 'P', 'PNS', 'Penata', 'III.c', NULL, 'Analis Perencanaan', 'S1', 'Ilmu Pemerintahan', '2011-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:32:16', '2022-12-20 13:32:16');
INSERT INTO `mas_pegawai` VALUES (41, '19790425 200003 2 001', 'Hj. Risa Novita Sari, S.Sos', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Pengelola Data', 'S1', 'Ilmu Administrasi Negara', '2000-03-01', NULL, NULL, 1, 'Y', '2022-12-20 13:35:30', '2022-12-20 13:35:30');
INSERT INTO `mas_pegawai` VALUES (42, '19660718 200701 2 011', 'Mamiek Sumarmi, A.Md', 'L', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Pengolah Data Kebijakan Pajak', 'D3', 'Ekonomi Perpajakan', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:37:35', '2022-12-20 13:37:35');
INSERT INTO `mas_pegawai` VALUES (43, '19700808 200701 2 024', 'Huztyawati Astuty Amin, A.Md', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Pengelola Program dan Kegiatan', 'D3', 'Teknik Industri', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:40:12', '2022-12-20 13:40:12');
INSERT INTO `mas_pegawai` VALUES (44, '19810922 200701 1 004', 'Rico Wahyu Hidayat, S.Sos', 'L', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Perancang Sistem Informasi Kepegawaian', 'S1', 'Ilmu Administrasi Negara', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:43:33', '2022-12-20 13:43:33');
INSERT INTO `mas_pegawai` VALUES (45, '19811115 200701 2 006', 'Sulviani, SE', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Pengelola Data Administrasi dan Verfikasi', 'S1', 'Management', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:45:19', '2022-12-20 13:45:19');
INSERT INTO `mas_pegawai` VALUES (46, '19750812 201212 1 002', 'Agus Wijaya, SE', 'L', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Penyusun Rencana kebutuhan Sarana dan Prasarana', 'S1', 'Management', '2012-12-01', NULL, NULL, 1, 'Y', '2022-12-20 13:49:24', '2022-12-20 13:49:24');
INSERT INTO `mas_pegawai` VALUES (47, '19830901 200801 2 024', 'Orva Septi Yusuf, SE., M. AP', 'L', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Analis Data dan Informasi', 'S2', 'Magister Administrasi Publik', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:51:04', '2022-12-20 13:51:04');
INSERT INTO `mas_pegawai` VALUES (48, '19790817 201001 2 007', 'Agustina, S.Sos', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Penyusun Rencana Kegiatan dan Anggaran', 'S1', 'Ilmu Administrasi Negara', '2010-01-01', NULL, NULL, 1, 'Y', '2022-12-20 13:53:05', '2022-12-20 13:53:05');
INSERT INTO `mas_pegawai` VALUES (49, '19840409 201406 2 006', 'Winny Susanti Alwie, SE', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Penyusun Kebutuhan Barang Inventaris', 'S1', 'Akuntansi', '2014-06-01', NULL, NULL, 1, 'Y', '2022-12-20 13:54:18', '2022-12-20 13:54:18');
INSERT INTO `mas_pegawai` VALUES (50, '19791109 201503 2 001', 'Mariana Dewi Santika, SE', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Analis Jabatan', 'S1', 'Management', '2015-03-01', NULL, NULL, 1, 'Y', '2022-12-20 13:55:28', '2022-12-20 13:55:28');
INSERT INTO `mas_pegawai` VALUES (51, '19810926 201503 1 001', 'Budy Fernandi Luk Setiawan, S. Sos', 'L', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Penyusun Rencana Kegiatan dan Anggaran', 'S1', 'Administrasi Negara', '2015-03-01', NULL, NULL, 1, 'Y', '2022-12-20 13:58:16', '2022-12-20 13:58:16');
INSERT INTO `mas_pegawai` VALUES (52, '19770813 200701 2 011', 'Musdalifa, S.Sos', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Analis Penagihan Pajak', 'S1', 'Ilmu Administrasi Negara', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:00:57', '2022-12-20 14:00:57');
INSERT INTO `mas_pegawai` VALUES (53, '19820423 200801 2 022', 'Suzanty Usman, S.E', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Penyusun Rencana Pengawasan', 'S1', 'Management', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:02:40', '2022-12-20 14:02:40');
INSERT INTO `mas_pegawai` VALUES (54, '19821123 200801 2 015', 'Kismiati, A.Md', 'P', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Pengelola PBB P2 dan BPHTB', 'D3', 'Sekretaris Manajemen', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:04:11', '2022-12-20 14:04:11');
INSERT INTO `mas_pegawai` VALUES (55, '19841101 200901 1 003', 'Rahmad Kurniadi, S.E', 'L', 'PNS', 'Penata Muda Tingkat 1', 'III.b', NULL, 'Investigator', 'S1', 'Management', '2009-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:05:30', '2022-12-20 14:05:30');
INSERT INTO `mas_pegawai` VALUES (56, '19800228 200604 2 027', 'Ernawati, S.Sos', 'P', 'PNS', 'Penata Muda', 'III.a', NULL, 'Pengelola Sumber Pendapatan Asli Daerah', 'S1', 'Ilmu Administrasi Negara', '2006-04-01', NULL, NULL, 1, 'Y', '2022-12-20 14:07:03', '2022-12-20 14:07:03');
INSERT INTO `mas_pegawai` VALUES (57, '19840112 200701 1 003', 'Ahmad Badara, S.M', 'L', 'PNS', 'Penata Muda', 'III.a', NULL, 'Penyusun Bahan Pengembangan Regulasi', 'S1', 'Management', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:09:06', '2022-12-20 14:09:06');
INSERT INTO `mas_pegawai` VALUES (58, '19830303 200801 2 018', 'Sherly Marlina, S.E', 'P', 'PNS', 'Penata Muda', 'III.a', NULL, 'Pengelola Pendapatan', 'S1', 'Management', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:10:28', '2022-12-20 14:10:28');
INSERT INTO `mas_pegawai` VALUES (59, '19830819 200801 1 014', 'Muhammad Sadli, S.Sos', 'L', 'PNS', 'Penata Muda', 'III.a', NULL, 'Pengelola PBB P2 dan BPHTB', 'S1', 'Ilmu Administrasi Negara', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:12:04', '2022-12-20 14:12:04');
INSERT INTO `mas_pegawai` VALUES (60, '19831212 200801 1 012', 'Muhammad Jain, S.E', 'L', 'PNS', 'Penata Muda', 'III.a', NULL, 'Analis Laporan Hasil Audit', 'S1', 'Management', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:13:13', '2022-12-20 14:13:13');
INSERT INTO `mas_pegawai` VALUES (61, '19820506 201503 2 002', 'Kamsiani, S.E', 'P', 'PNS', 'Penata Muda', 'III.a', NULL, 'Pengelola  Peraturan Perundang Undangan ', 'S1', 'Management', '2015-03-01', NULL, NULL, 1, 'Y', '2022-12-20 14:15:50', '2022-12-20 14:15:50');
INSERT INTO `mas_pegawai` VALUES (62, '19830718 201406 1 002', 'Ahmad Dani, SE', 'L', 'PNS', 'Penata Muda', 'III.a', NULL, 'Pengelola Pendaftaran, Pendataan Pajak  dan Retribusi', 'S1', 'Management', '2014-06-01', NULL, NULL, 1, 'Y', '2022-12-20 14:17:14', '2022-12-20 14:17:14');
INSERT INTO `mas_pegawai` VALUES (63, '19691229 200212 1 004', 'Dobi Ronal', 'L', 'PNS', 'Pengatur Tingkat 1', 'II.d', NULL, 'Pengadministrasi Pajak', 'SMU', 'IPA', '2002-12-01', NULL, NULL, 1, 'Y', '2022-12-20 14:18:43', '2022-12-20 14:18:43');
INSERT INTO `mas_pegawai` VALUES (64, '19720408 200701 2 015', 'Al Wardah', 'P', 'PNS', 'Pengatur Tingkat 1', 'II.d', NULL, 'Pengadministrasi Pajak', 'SMK', 'Perkantoran', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:20:28', '2022-12-20 14:20:28');
INSERT INTO `mas_pegawai` VALUES (65, '19750321 200701 1 013', 'Mulyadi', 'L', 'PNS', 'Pengatur Tingkat 1', 'II.d', NULL, 'Bendahara', 'SMU', 'IPA', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:25:33', '2022-12-20 14:25:33');
INSERT INTO `mas_pegawai` VALUES (66, '19801016 200701 1 007', 'Kaspul Pahri', 'L', 'PNS', 'Pengatur Tingkat 1', 'II.d', NULL, 'Pranata Teknologi Informasi Komputer', 'SMU', 'IPS', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:26:59', '2022-12-20 14:26:59');
INSERT INTO `mas_pegawai` VALUES (67, '19820524 200701 2 004', 'Rusnawanti', 'P', 'PNS', 'Pengatur Tingkat 1', 'II.d', NULL, 'Pengadministrasi Nota Perhitungan Pajak dan Retribusi Daerah', 'SMU', 'IPS', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:28:16', '2022-12-20 14:28:16');
INSERT INTO `mas_pegawai` VALUES (68, '19821124 200701 1 002', 'Herman Sophandiyanto', 'L', 'PNS', 'Pengatur Tingkat 1', 'II.d', NULL, 'Pengadministrasi Pajak', 'SMU', 'IPA', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:30:14', '2022-12-20 14:30:14');
INSERT INTO `mas_pegawai` VALUES (70, '19830117 200701 2 001', 'Marlina', 'P', 'PNS', 'Pengatur Tingkat 1', 'II.d', NULL, 'Pengadministrasi Data Peraturan Perundang Undangan', 'SMK', 'Sekretaris', '2007-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:37:47', '2022-12-20 14:37:47');
INSERT INTO `mas_pegawai` VALUES (71, '19711231 200801 1 096', 'Heru Suparta', 'L', 'PNS', 'Pengatur Tingkat 1', 'II.d', NULL, 'Pranata Teknologi Informasi Komputer', 'SLTA', 'Biologi', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:39:14', '2022-12-20 14:39:14');
INSERT INTO `mas_pegawai` VALUES (72, '19841104 200801 1 008', 'Irwan Effendy', 'L', 'PNS', 'Pengatur Tingkat 1', 'II.d', NULL, 'Pengadministrasi Kepegawaian', 'SLTA', 'IPS', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:40:55', '2022-12-20 14:40:55');
INSERT INTO `mas_pegawai` VALUES (73, '19760917 201212 2 001', 'Hj. Ruspidawati', 'P', 'PNS', 'Pengatur', 'II.c', NULL, 'Pranata Teknologi Informasi Komputer', 'SLTA', 'IPS', '2012-12-01', NULL, NULL, 1, 'Y', '2022-12-20 14:42:37', '2022-12-20 14:42:37');
INSERT INTO `mas_pegawai` VALUES (74, '19840215 201001 2 004', 'Rita Febriani', 'P', 'PNS', 'Pengatur', 'II.c', NULL, 'Pengadministrasi Umum', 'SLTA', 'IPS', '2010-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:43:36', '2022-12-20 14:43:36');
INSERT INTO `mas_pegawai` VALUES (75, '19850504 201212 1 003', 'Andriansyah', 'L', 'PNS', 'Pengatur', 'II.c', NULL, 'Pengadministrasi Nota Perhitungan Pajak dan Retribusi Daerah', 'SMU', 'IPS', '2012-12-01', NULL, NULL, 1, 'Y', '2022-12-20 14:44:41', '2022-12-20 14:44:41');
INSERT INTO `mas_pegawai` VALUES (76, '19980623 202203 1 007', 'Elmo Yoga Inzhagy, A.Md.Kom', 'L', 'PNS', 'Pengatur', 'II.c', NULL, 'Pranata Teknologi Informasi Komputer', 'D3', 'Teknik Informatika', '2022-03-01', NULL, NULL, 1, 'Y', '2022-12-20 14:46:00', '2022-12-20 14:46:00');
INSERT INTO `mas_pegawai` VALUES (77, '19821214 201212 2 001', 'Delpi Samende', 'L', 'PNS', 'Pengatur Muda Tingkat 1', 'II.b', NULL, 'Pengadministrasi Data Peraturan Perundang Undangan', 'SMU', 'IPS', '2012-12-01', NULL, NULL, 1, 'Y', '2022-12-20 14:47:36', '2022-12-20 14:47:36');
INSERT INTO `mas_pegawai` VALUES (78, '19771230 200901 1 002', 'Adi Hendri', 'L', 'PNS', 'Juru Tingkat 1', 'I.d', NULL, 'Pramu Bakti', 'SMP', '-', '2009-01-01', NULL, NULL, 1, 'Y', '2022-12-20 14:48:57', '2022-12-20 14:48:57');
INSERT INTO `mas_pegawai` VALUES (79, '6408.19810131.2006.06.0002', 'Rahmawati', 'P', 'TK2D', 'Pilih...', NULL, NULL, 'Pranata Acara', 'SMU', 'IPS', '2006-01-01', NULL, NULL, 1, 'Y', '2023-01-08 21:01:21', '2023-01-08 21:01:21');
INSERT INTO `mas_pegawai` VALUES (80, '6408.19870714.2005.06.0003', 'Zahid Abdillah, SE', 'L', 'TK2D', 'Pilih...', NULL, NULL, 'Pranata teknologi Informasi Komputer', 'S1', 'Management', '2006-01-01', NULL, NULL, 1, 'Y', '2023-01-08 21:05:19', '2023-01-08 21:05:19');
INSERT INTO `mas_pegawai` VALUES (81, '6408.19761231.2007.06.0004', 'Ahmad', 'L', 'TK2D', 'Pilih...', NULL, NULL, 'Teknisi Pemeliharaan Sarana dan Prasarana', 'Paket C', '-', '2007-01-01', NULL, NULL, 1, 'Y', '2023-01-08 21:08:19', '2023-01-08 21:08:19');
COMMIT;

-- ----------------------------
-- Table structure for sys_options
-- ----------------------------
DROP TABLE IF EXISTS `sys_options`;
CREATE TABLE `sys_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(30) NOT NULL,
  `teks` varchar(50) NOT NULL,
  `nilai` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `urut` int NOT NULL,
  `status` enum('Y','N') DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_options
-- ----------------------------
BEGIN;
INSERT INTO `sys_options` VALUES (1, 'user-groups', 'Administrator', 'administrator', 1, 'Y', '2021-03-13 16:16:35', '2021-03-13 16:16:35');
INSERT INTO `sys_options` VALUES (2, 'user-groups', 'Wakil Direktur', 'wadir', 3, 'Y', '2021-03-13 16:16:35', '2021-03-13 16:16:35');
INSERT INTO `sys_options` VALUES (3, 'user-groups', 'Finance', 'finance', 4, 'Y', '2021-03-13 16:16:35', '2021-03-13 16:16:35');
INSERT INTO `sys_options` VALUES (4, 'user-groups', 'Operation', 'operation', 7, 'Y', '2021-03-13 16:16:35', '2021-03-13 16:16:35');
INSERT INTO `sys_options` VALUES (5, 'user-groups', 'HRD', 'hrd', 6, 'Y', '2021-03-13 16:16:35', '2021-03-13 16:16:35');
INSERT INTO `sys_options` VALUES (6, 'user-groups', 'Logistik', 'logistik', 5, 'Y', '2021-03-13 16:16:35', '2021-03-13 16:16:35');
INSERT INTO `sys_options` VALUES (7, 'jenkel', 'Pilih Jenkel', '', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (8, 'jenkel', 'Laki-laki', 'L', 2, 'Y', '2021-02-21 03:30:03', '2021-02-21 04:14:07');
INSERT INTO `sys_options` VALUES (9, 'jenkel', 'Perempuan', 'P', 3, 'Y', '2021-02-21 03:30:30', '2021-02-21 04:14:11');
INSERT INTO `sys_options` VALUES (10, 'pangkat', 'Pilih Pangkat', '', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (11, 'pangkat', 'Pembina Tingkat I', 'Pembina Tingkat I', 2, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (12, 'pangkat', 'Penata Tingkat I', 'Penata Tingkat I', 3, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (13, 'pangkat', 'Pembina', 'Pembina', 4, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (14, 'pangkat', 'Penata', 'Penata', 5, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (15, 'pangkat', 'Penata Muda Tingkat I', 'Penata Muda Tingkat I', 6, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (16, 'pangkat', 'Penata Muda', 'Penata Muda', 7, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (17, 'pangkat', 'Pengatur Tingkat I', 'Pengatur Tingkat I', 8, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (18, 'pangkat', 'Pengatur Muda Tingkat I', 'Pengatur Muda Tingkat I', 9, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (19, 'pangkat', 'Pengatur', 'Pengatur', 10, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (20, 'pangkat', 'Juru', 'Juru', 11, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (21, 'pendidikan', 'Pilih Pendidikan Terakhir', '', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (22, 'pendidikan', 'S3', 'S3', 2, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (23, 'pendidikan', 'S2', 'S2', 3, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (24, 'pendidikan', 'S1', 'S1', 4, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (25, 'pendidikan', 'D3', 'D3', 5, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (26, 'pendidikan', 'D2', 'D2', 6, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (27, 'pendidikan', 'D1', 'D1', 7, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (28, 'pendidikan', 'SMU', 'SMU', 8, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (29, 'pendidikan', 'SLTA', 'SLTA', 9, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (30, 'pendidikan', 'SMP', 'SMP', 10, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (31, 'pendidikan', 'SD', 'SD', 11, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (32, 'pendidikan', 'Paket C', 'Paket C', 12, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (33, 'pendidikan', 'SMK', 'SMK', 13, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (34, 'pendidikan', 'Paket B', 'Paket B', 14, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (35, 'pendidikan', 'Paket A', 'Paket A', 15, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (36, 'status-golongan', 'Pilih Status Golongan', '', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (37, 'status-golongan', 'PNS', 'PNS', 2, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (38, 'status-golongan', 'CPNS', 'CPNS', 3, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (39, 'status-golongan', 'PTTD', 'PTTD', 4, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (40, 'status-golongan', 'TK2D', 'TK2D', 5, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (41, 'status-golongan', 'MAGANG', 'MAGANG', 6, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (42, 'status-golongan', 'PTGS TAMAN', 'PTGS TAMAN', 7, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (43, 'status-golongan', 'PENJAGA KEAMANAN', 'PENJAGA KEAMANAN', 8, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (44, 'status-golongan', 'SATPOL', 'SATPOL', 9, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (45, 'status-tingkat', 'Pilih Tingkat', '', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (46, 'status-tingkat', 'TK1', 'TK1', 2, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (47, 'status-tingkat', 'TK2D', 'TK2D', 3, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (48, 'status-tingkat', 'KEAMANAN', 'KEAMANAN', 4, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (49, 'golongan', 'Pilih', '', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (50, 'golongan', 'IV.d', 'IV.d', 2, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (51, 'golongan', 'IV.c', 'IV.c', 3, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (52, 'golongan', 'IV.b', 'IV.b', 4, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (53, 'golongan', 'IV.a', 'IV.a', 5, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (54, 'golongan', 'III.d', 'III.d', 6, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (55, 'golongan', 'III.c', 'III.c', 7, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (56, 'golongan', 'III.b', 'III.b', 8, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (57, 'golongan', 'III.a', 'III.a', 9, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (58, 'golongan', 'II.d', 'II.d', 10, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (59, 'golongan', 'II.c', 'II.c', 11, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (60, 'golongan', 'II.b', 'II.b', 12, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (61, 'golongan', 'II.a', 'II.a', 13, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (62, 'golongan', 'I.d', 'I.d', 14, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (63, 'golongan', 'I.c', 'I.c', 15, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (64, 'golongan', 'I.b', 'I.b', 16, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (65, 'golongan', 'I.a', 'I.a', 17, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (67, 'pangkat', 'Kepala Badan', 'Kepala Badan', 12, 'N', NULL, NULL);
INSERT INTO `sys_options` VALUES (68, 'type-pegawai', 'PNS', 'PNS', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (69, 'type-pegawai', 'CPNS', 'CPNS', 2, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (70, 'type-pegawai', 'PTT.D', 'PTT.D', 3, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (71, 'type-pegawai', 'TK2D', 'TK2D', 4, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (72, 'type-pegawai', 'MAGANG', 'MAGANG', 5, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (73, 'type-pegawai', 'PTGS.TAMAN', 'PTGS.TAMAN', 6, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (74, 'type-pegawai', 'PENJAGA KEAMANAN', 'PENJAGA KEAMANAN', 7, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (75, 'type-pegawai', 'SAT-POL', 'SAT-POL', 8, 'Y', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unique` (`token`),
  KEY `tokens_user_id_foreign` (`user_id`),
  KEY `tokens_token_index` (`token`),
  CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tokens
-- ----------------------------
BEGIN;
INSERT INTO `tokens` VALUES (1, 1, '6292d364-e48d-47cd-a892-98885c220a2f', 'remember_token', 0, '2022-12-15 09:56:57', '2022-12-15 09:56:57');
INSERT INTO `tokens` VALUES (2, 1, '01cdf196-a361-4a4c-848e-3e8b877f64d1', 'remember_token', 0, '2022-12-15 18:38:11', '2022-12-15 18:38:11');
INSERT INTO `tokens` VALUES (3, 1, 'db2902f2-778d-4c21-b774-0112a312062c', 'remember_token', 0, '2022-12-15 18:41:09', '2022-12-15 18:41:09');
INSERT INTO `tokens` VALUES (6, 1, '0edd5671-d678-4d31-99d1-9869ed1ed675', 'remember_token', 0, '2022-12-18 13:16:10', '2022-12-18 13:16:10');
INSERT INTO `tokens` VALUES (7, 1, 'd68a8afb-376d-4bdd-8225-8a5d57dd7943', 'remember_token', 0, '2022-12-19 21:13:58', '2022-12-19 21:13:58');
INSERT INTO `tokens` VALUES (9, 1, 'cc15050a-560d-45c0-b0ec-83d37d92f548', 'remember_token', 0, '2023-01-08 20:50:47', '2023-01-08 20:50:47');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'dev', 'ayat.ekapoetra@gmail.com', '081355719747', '$2a$10$LsVBPwf11DUKc3cCvpTaUOZPQR2YfOM6jEMoaRW17VR0GChXB0OoS', 'admin', 'Y', '2022-12-11 20:26:54', '2022-12-11 20:26:54');
COMMIT;

-- ----------------------------
-- View structure for v_mkg
-- ----------------------------
DROP VIEW IF EXISTS `v_mkg`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_mkg` AS select `b`.`pegawai_id` AS `id`,`a`.`nama_pegawai` AS `nama_pegawai`,`b`.`eff_date` AS `eff_date`,`b`.`golongan` AS `golongan`,timestampdiff(YEAR,`b`.`eff_date`,now()) AS `thn`,(timestampdiff(MONTH,`b`.`eff_date`,now()) % 12) AS `bln` from (`bpd_sk_pegawai` `b` join `mas_pegawai` `a` on((`a`.`id` = `b`.`pegawai_id`))) where (`a`.`type` = 'PNS');

-- ----------------------------
-- Triggers structure for table bpd_kenaikan_pangkat_reguler
-- ----------------------------
DROP TRIGGER IF EXISTS `trigg_defined_aktif`;
delimiter ;;
CREATE TRIGGER `trigg_defined_aktif` BEFORE INSERT ON `bpd_kenaikan_pangkat_reguler` FOR EACH ROW BEGIN
SET new.aktif = (SELECT IF(YEAR(NOW()) <= YEAR(new.eff_date), 'Y', 'N'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mas_pegawai
-- ----------------------------
DROP TRIGGER IF EXISTS `pegawai_add_masa_kerja`;
delimiter ;;
CREATE TRIGGER `pegawai_add_masa_kerja` AFTER INSERT ON `mas_pegawai` FOR EACH ROW BEGIN
SET @bulan = (SELECT (TIMESTAMPDIFF(MONTH, new.tmt_cpns, NOW()) / 12) DIV 12);
SET @tahun = (SELECT TIMESTAMPDIFF(YEAR, new.tmt_cpns, NOW()));
	INSERT INTO bpd_masa_kerja (pegawai_id, tahun, bulan, created_at, updated_at) VALUES(new.id, @tahun, @bulan, NOW(), NOW());
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mas_pegawai
-- ----------------------------
DROP TRIGGER IF EXISTS `pegawai_upd_masa_kerja`;
delimiter ;;
CREATE TRIGGER `pegawai_upd_masa_kerja` AFTER UPDATE ON `mas_pegawai` FOR EACH ROW BEGIN
SET @len = (SELECT COUNT(new.id) FROM bpd_masa_kerja WHERE pegawai_id=new.id);
SET @bulan = (SELECT(12 - MONTH(new.tmt_cpns)));
SET @tahun = (SELECT TIMESTAMPDIFF(YEAR, new.tmt_cpns, NOW()));
	IF @len > 0 THEN
		UPDATE bpd_masa_kerja
		SET tahun = @tahun, bulan = @bulan, aktif = new.aktif, updated_at = NOW()
		WHERE pegawai_id = old.id;
	ELSE
		INSERT INTO bpd_masa_kerja (pegawai_id, nama, tahun, bulan, aktif, created_at, updated_at) VALUES(new.id, new.nama_pegawai, @tahun, @bulan, 'Y', NOW(), NOW());
  END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
