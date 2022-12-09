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

 Date: 10/12/2022 06:28:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mas_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `mas_pegawai`;
CREATE TABLE `mas_pegawai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(25) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `jenkel` enum('L','P') DEFAULT 'L',
  `pangkat` varchar(255) DEFAULT NULL,
  `golongan` varchar(5) DEFAULT NULL,
  `essalon` varchar(5) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `pendidikan` varchar(30) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL,
  `tmt_cpns` date DEFAULT NULL,
  `keterangan` text,
  `createdby` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mas_pegawai
-- ----------------------------
BEGIN;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

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
INSERT INTO `sys_options` VALUES (7, 'jenkel', 'Pilih Jenkel', '-', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (8, 'jenkel', 'Laki-laki', 'L', 2, 'Y', '2021-02-21 03:30:03', '2021-02-21 04:14:07');
INSERT INTO `sys_options` VALUES (9, 'jenkel', 'Perempuan', 'P', 3, 'Y', '2021-02-21 03:30:30', '2021-02-21 04:14:11');
INSERT INTO `sys_options` VALUES (10, 'pangkat', 'Pilih Pangkat', '-', 1, 'Y', NULL, NULL);
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
INSERT INTO `sys_options` VALUES (21, 'pendidikan', 'Pilih Pendidikan Terakhir', '-', 1, 'Y', NULL, NULL);
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
INSERT INTO `sys_options` VALUES (36, 'status-golongan', 'Pilih Status Golongan', '-', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (37, 'status-golongan', 'PNS', 'PNS', 2, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (38, 'status-golongan', 'CPNS', 'CPNS', 3, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (39, 'status-golongan', 'PTTD', 'PTTD', 4, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (40, 'status-golongan', 'TK2D', 'TK2D', 5, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (41, 'status-golongan', 'MAGANG', 'MAGANG', 6, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (42, 'status-golongan', 'PTGS TAMAN', 'PTGS TAMAN', 7, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (43, 'status-golongan', 'PENJAGA KEAMANAN', 'PENJAGA KEAMANAN', 8, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (44, 'status-golongan', 'SATPOL', 'SATPOL', 9, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (45, 'status-tingkat', 'Pilih Tingkat', '-', 1, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (46, 'status-tingkat', 'TK1', 'TK1', 2, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (47, 'status-tingkat', 'TK2D', 'TK2D', 3, 'Y', NULL, NULL);
INSERT INTO `sys_options` VALUES (48, 'status-tingkat', 'KEAMANAN', 'KEAMANAN', 4, 'Y', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
