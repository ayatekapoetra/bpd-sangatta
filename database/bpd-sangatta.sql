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

 Date: 17/12/2022 01:26:32
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
  `eff_date` date DEFAULT NULL,
  `nilai` float(8,0) DEFAULT NULL,
  `golongan` varchar(255) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gaji_pegawai_pegawai_idx` (`pegawai_id`),
  CONSTRAINT `gaji_pegawai_pegawai_idx` FOREIGN KEY (`pegawai_id`) REFERENCES `mas_pegawai` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_gaji_pegawai
-- ----------------------------
BEGIN;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_kenaikan_pangkat_reguler
-- ----------------------------
BEGIN;
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (1, 1, 'Syahfur, S.Sos, M.Si', 'Pembina Tingkat 1', '2021-07-10', '2021-10-10', 1, 'N', '2022-12-17 00:28:30', '2022-12-17 00:28:30');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (2, 2, 'Supianti, S.Sos. M.Si', 'Pembina', '2019-07-01', '2019-10-01', 1, 'N', '2022-12-17 00:42:15', '2022-12-17 00:42:15');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (3, 3, 'Setia Budi, SE', 'Pembina', '2023-07-01', '2023-10-01', 1, 'Y', '2022-12-17 00:48:08', '2022-12-17 00:48:08');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (4, 4, 'Deni Hendi, ST.,M.SI.', 'Pembina', '2021-01-01', '2021-04-01', 1, 'N', '2022-12-17 00:57:46', '2022-12-17 00:57:46');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (5, 5, 'Sundoro Yekti, SE., M.SI.', 'Penata Tingkat 1', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-17 01:01:23', '2022-12-17 01:01:23');
INSERT INTO `bpd_kenaikan_pangkat_reguler` VALUES (6, 6, 'Taufiq Rahman, S.Sos., M.AP', 'Pembina', '2025-01-01', '2025-04-01', 1, 'Y', '2022-12-17 01:03:53', '2022-12-17 01:03:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_masa_kerja
-- ----------------------------
BEGIN;
INSERT INTO `bpd_masa_kerja` VALUES (1, 1, '21', '1', 'Y', '2022-12-17 00:28:30', '2022-12-17 00:28:30');
INSERT INTO `bpd_masa_kerja` VALUES (2, 2, '22', '1', 'Y', '2022-12-17 00:42:15', '2022-12-17 00:42:15');
INSERT INTO `bpd_masa_kerja` VALUES (3, 3, '30', '2', 'Y', '2022-12-17 00:48:08', '2022-12-17 00:48:08');
INSERT INTO `bpd_masa_kerja` VALUES (4, 4, '20', '1', 'Y', '2022-12-17 00:57:46', '2022-12-17 00:57:46');
INSERT INTO `bpd_masa_kerja` VALUES (5, 5, '14', '1', 'Y', '2022-12-17 01:01:23', '2022-12-17 01:01:23');
INSERT INTO `bpd_masa_kerja` VALUES (6, 6, '31', '2', 'Y', '2022-12-17 01:03:53', '2022-12-17 01:03:53');
COMMIT;

-- ----------------------------
-- Table structure for bpd_pangkat
-- ----------------------------
DROP TABLE IF EXISTS `bpd_pangkat`;
CREATE TABLE `bpd_pangkat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pangkat` varchar(255) DEFAULT NULL,
  `golongan` char(5) DEFAULT NULL,
  `aktif` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_pangkat
-- ----------------------------
BEGIN;
INSERT INTO `bpd_pangkat` VALUES (1, 'Juru Muda', 'I.a', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (2, 'Juru Muda Tingkat 1', 'I.b', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (3, 'Juru', 'I.c', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (4, 'Juru Tingkat 1', 'I.d', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (5, 'Pengatur Muda', 'II.a', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (6, 'Pengatur Muda Tingkat 1', 'II.b', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (7, 'Pengatur', 'II.c', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (8, 'Pengatur Tingkat 1', 'II.d', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (9, 'Penata Muda', 'III.a', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (10, 'Penata Muda Tingkat 1', 'III.b', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (11, 'Penata', 'III.c', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (12, 'Penata Tingkat 1', 'III.d', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (13, 'Pembina', 'IV.a', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (14, 'Pembina Tingkat 1', 'IV.b', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (15, 'Pembina Utama Muda', 'IV.c', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (16, 'Pembina Utama Madya', 'IV.d', 'Y', NULL, NULL);
INSERT INTO `bpd_pangkat` VALUES (17, 'Pembina Utama', 'IV.e', 'Y', NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bpd_sk_pegawai
-- ----------------------------
BEGIN;
INSERT INTO `bpd_sk_pegawai` VALUES (1, '011017', 1, 'Pembina Tingkat 1', '2017-10-10', 'IV.b', '2021-10-10', NULL, 'Y', '2022-12-17 00:28:30', '2022-12-17 00:28:30');
INSERT INTO `bpd_sk_pegawai` VALUES (2, '010200', 2, 'Pembina', '2015-10-01', 'IV.a', '2019-10-01', NULL, 'Y', '2022-12-17 00:42:15', '2022-12-17 00:42:15');
INSERT INTO `bpd_sk_pegawai` VALUES (3, '010392', 3, 'Pembina', '2019-10-01', 'IV.a', '2023-10-01', NULL, 'Y', '2022-12-17 00:48:08', '2022-12-17 00:48:08');
INSERT INTO `bpd_sk_pegawai` VALUES (4, '011202', 4, 'Pembina', '2017-04-01', 'IV.a', '2021-04-01', NULL, 'Y', '2022-12-17 00:57:46', '2022-12-17 00:57:46');
INSERT INTO `bpd_sk_pegawai` VALUES (5, '010108', 5, 'Penata Tingkat 1', '2021-04-01', 'III.d', '2025-04-01', NULL, 'Y', '2022-12-17 01:01:23', '2022-12-17 01:01:23');
INSERT INTO `bpd_sk_pegawai` VALUES (6, '010391', 6, 'Pembina', '2021-04-01', 'IV.a', '2025-04-01', NULL, 'Y', '2022-12-17 01:03:53', '2022-12-17 01:03:53');
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
  `nip` varchar(25) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mas_pegawai
-- ----------------------------
BEGIN;
INSERT INTO `mas_pegawai` VALUES (1, '19730708 200112 1 003', 'Syahfur, S.Sos, M.Si', 'L', 'PNS', 'Pembina Tingkat 1', 'IV.b', 'III.b', 'Kepala Badan', 'S2', 'Ilmu Administrasi Negara', '2001-12-01', NULL, NULL, 1, 'Y', '2022-12-17 00:28:30', '2022-12-17 00:28:30');
INSERT INTO `mas_pegawai` VALUES (2, '19700525 200003 2 005', 'Supianti, S.Sos. M.Si', 'P', 'PNS', 'Pembina', 'IV.a', 'III.a', 'Plt.Sekretaris (Kabid. Pendataan & Penetapan)', 'S2', 'Ilmu Administrasi Negara', '2000-02-01', NULL, NULL, 1, 'Y', '2022-12-17 00:42:15', '2022-12-17 00:42:15');
INSERT INTO `mas_pegawai` VALUES (3, '19661012 199203 1 011', 'Setia Budi, SE', 'L', 'PNS', 'Pembina', 'IV.a', 'III.b', 'Kabid Penagihan & Keberatan ', 'S1', 'Management', '1992-03-01', NULL, NULL, 1, 'Y', '2022-12-17 00:48:08', '2022-12-17 00:48:08');
INSERT INTO `mas_pegawai` VALUES (4, '197508222002121005', 'Deni Hendi, ST.,M.SI.', 'L', 'PNS', 'Pembina', 'IV.a', 'III.b', 'Kabid Pengendalian, Evaluasi & Pelaporan', 'S2', 'Magister Manajemen', '2002-12-01', NULL, NULL, 1, 'Y', '2022-12-17 00:57:46', '2022-12-17 00:57:46');
INSERT INTO `mas_pegawai` VALUES (5, '19771015 200801 1 018', 'Sundoro Yekti, SE., M.SI.', 'L', 'PNS', 'Penata Tingkat 1', 'III.d', 'III.b', 'Kabid PBB P2 dan BPHTB', 'S2', 'Magister sains', '2008-01-01', NULL, NULL, 1, 'Y', '2022-12-17 01:01:23', '2022-12-17 01:01:23');
INSERT INTO `mas_pegawai` VALUES (6, '19701016 199103 1 003', 'Taufiq Rahman, S.Sos., M.AP', 'L', 'PNS', 'Pembina', 'IV.a', 'IV.a', 'Kasubbid Penagihan', 'S2', 'Magister Administrasi Publik', '1991-03-01', NULL, NULL, 1, 'Y', '2022-12-17 01:03:53', '2022-12-17 01:03:53');
COMMIT;

-- ----------------------------
-- Table structure for sys_options
-- ----------------------------
DROP TABLE IF EXISTS `sys_options`;
CREATE TABLE `sys_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(30) NOT NULL,
  `teks` varchar(50) NOT NULL,
  `nilai` varchar(50) NOT NULL,
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
INSERT INTO `sys_options` VALUES (50, 'golongan', 'IV.a', 'IV.a', 2, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (51, 'golongan', 'IV.b', 'IV.b', 3, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (52, 'golongan', 'IV.c', 'IV.c', 4, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (53, 'golongan', 'IV.d', 'IV.d', 5, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (54, 'golongan', 'III.a', 'III.a', 6, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (55, 'golongan', 'III.b', 'III.b', 7, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (56, 'golongan', 'III.c', 'III.c', 8, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (57, 'golongan', 'III.d', 'III.d', 9, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (58, 'golongan', 'II.a', 'II.a', 10, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (59, 'golongan', 'II.b', 'II.b', 11, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (60, 'golongan', 'II.c', 'II.c', 12, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (61, 'golongan', 'II.d', 'II.d', 13, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (62, 'golongan', 'I.a', 'I.a', 14, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (63, 'golongan', 'I.b', 'I.b', 15, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (64, 'golongan', 'I.c', 'I.c', 16, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (65, 'golongan', 'I.d', 'I.d', 17, 'Y', NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tokens
-- ----------------------------
BEGIN;
INSERT INTO `tokens` VALUES (1, 1, '6292d364-e48d-47cd-a892-98885c220a2f', 'remember_token', 0, '2022-12-15 09:56:57', '2022-12-15 09:56:57');
INSERT INTO `tokens` VALUES (2, 1, '01cdf196-a361-4a4c-848e-3e8b877f64d1', 'remember_token', 0, '2022-12-15 18:38:11', '2022-12-15 18:38:11');
INSERT INTO `tokens` VALUES (3, 1, 'db2902f2-778d-4c21-b774-0112a312062c', 'remember_token', 0, '2022-12-15 18:41:09', '2022-12-15 18:41:09');
INSERT INTO `tokens` VALUES (5, 1, 'ddd9094d-1bdd-4063-a5c2-ca06efd0fe8c', 'remember_token', 0, '2022-12-16 23:43:35', '2022-12-16 23:43:35');
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
-- Triggers structure for table bpd_kenaikan_pangkat_reguler
-- ----------------------------
DROP TRIGGER IF EXISTS `trigg_defined_aktif`;
delimiter ;;
CREATE TRIGGER `trigg_defined_aktif` BEFORE INSERT ON `bpd_kenaikan_pangkat_reguler` FOR EACH ROW BEGIN
SET new.aktif = (SELECT IF(CURDATE() <= new.eff_date, 'Y', 'N'));
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
