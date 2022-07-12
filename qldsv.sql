/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : qldsv

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 12/07/2022 13:39:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gv
-- ----------------------------
DROP TABLE IF EXISTS `gv`;
CREATE TABLE `gv`  (
  `tengv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ns` date NULL DEFAULT NULL,
  `gioi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sdt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mamh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `magv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`magv`) USING BTREE,
  INDEX `mamh`(`mamh` ASC) USING BTREE,
  CONSTRAINT `gv_ibfk_1` FOREIGN KEY (`mamh`) REFERENCES `monhoc` (`mamh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ketqua
-- ----------------------------
DROP TABLE IF EXISTS `ketqua`;
CREATE TABLE `ketqua`  (
  `mamh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `masv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `diemthi1` float NULL DEFAULT NULL,
  `diemthi2` float NULL DEFAULT NULL,
  `diemthi3` float NULL DEFAULT NULL,
  INDEX `mamh`(`mamh` ASC) USING BTREE,
  INDEX `masv`(`masv` ASC) USING BTREE,
  CONSTRAINT `ketqua_ibfk_1` FOREIGN KEY (`mamh`) REFERENCES `monhoc` (`mamh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ketqua_ibfk_2` FOREIGN KEY (`masv`) REFERENCES `sinhvien` (`masv`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for khoa
-- ----------------------------
DROP TABLE IF EXISTS `khoa`;
CREATE TABLE `khoa`  (
  `makhoa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tenkhoa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`makhoa`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `tendn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lop
-- ----------------------------
DROP TABLE IF EXISTS `lop`;
CREATE TABLE `lop`  (
  `malop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tenlop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `makhoa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`malop`) USING BTREE,
  INDEX `makhoa`(`makhoa` ASC) USING BTREE,
  CONSTRAINT `lop_ibfk_1` FOREIGN KEY (`makhoa`) REFERENCES `khoa` (`makhoa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monhoc
-- ----------------------------
DROP TABLE IF EXISTS `monhoc`;
CREATE TABLE `monhoc`  (
  `mamh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tenmh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `makhoa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mamh`) USING BTREE,
  INDEX `makhoa`(`makhoa` ASC) USING BTREE,
  CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`makhoa`) REFERENCES `khoa` (`makhoa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for phanhoi
-- ----------------------------
DROP TABLE IF EXISTS `phanhoi`;
CREATE TABLE `phanhoi`  (
  `idsv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idmh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mess` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `idsv`(`idsv` ASC) USING BTREE,
  INDEX `idmh`(`idmh` ASC) USING BTREE,
  CONSTRAINT `phanhoi_ibfk_1` FOREIGN KEY (`idsv`) REFERENCES `sinhvien` (`masv`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phanhoi_ibfk_2` FOREIGN KEY (`idmh`) REFERENCES `monhoc` (`mamh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sinhvien
-- ----------------------------
DROP TABLE IF EXISTS `sinhvien`;
CREATE TABLE `sinhvien`  (
  `masv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ns` date NULL DEFAULT NULL,
  `gioi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `malop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `malop`(`malop` ASC) USING BTREE,
  INDEX `masv`(`masv` ASC) USING BTREE,
  CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`malop`) REFERENCES `lop` (`malop`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
