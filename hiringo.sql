/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : hiringo

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2021-11-03 22:49:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course_basic
-- ----------------------------
DROP TABLE IF EXISTS `course_basic`;
CREATE TABLE `course_basic` (
  `course_id` int(200) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_type` int(100) NOT NULL,
  `course_teacher` varchar(255) NOT NULL,
  `user_id` int(100) DEFAULT NULL,
  `course_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course_deadline` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`),
  KEY `user_id2` (`user_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course_basic
-- ----------------------------

-- ----------------------------
-- Table structure for user_basic
-- ----------------------------
DROP TABLE IF EXISTS `user_basic`;
CREATE TABLE `user_basic` (
  `user_id` int(100) NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_superuser` int(10) NOT NULL,
  `is_teacher` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_basic
-- ----------------------------

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `user_id` int(100) NOT NULL,
  `user_message` varchar(255) DEFAULT NULL,
  `user_readornot` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id3` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_message
-- ----------------------------

-- ----------------------------
-- Table structure for user_permission
-- ----------------------------
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission` (
  `user_id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` int(10) NOT NULL,
  `codename` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id1` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_permission
-- ----------------------------

-- ----------------------------
-- Table structure for user_student_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_student_profile`;
CREATE TABLE `user_student_profile` (
  `user_id` int(100) NOT NULL,
  `user_nickname` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_phonenumber` int(100) DEFAULT NULL,
  `user_sex` varchar(10) DEFAULT NULL,
  `user_age` int(10) DEFAULT NULL,
  `user_city` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_student_profile
-- ----------------------------

-- ----------------------------
-- Table structure for user_teacher_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_teacher_profile`;
CREATE TABLE `user_teacher_profile` (
  `user_id` int(100) NOT NULL,
  `user_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_phonenumber` int(100) DEFAULT NULL,
  `user_sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_age` int(10) DEFAULT NULL,
  `user_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_subjecttype` int(100) NOT NULL,
  PRIMARY KEY (`user_id`,`user_subjecttype`),
  CONSTRAINT `user_id4` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_teacher_profile
-- ----------------------------
