/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : hiringo

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2021-11-22 09:05:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course_basic
-- ----------------------------
DROP TABLE IF EXISTS `course_basic`;
CREATE TABLE `course_basic` (
  `transaction_id` int(100) NOT NULL,
  `student_id` int(100) NOT NULL,
  `course_id` int(200) NOT NULL,
  `course_amount` int(100) NOT NULL,
  `course_payment_currecy` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `course_status` int(10) NOT NULL,
  `course_teacher_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`,`student_id`),
  KEY `user_id2` (`student_id`),
  KEY `user_id5` (`course_teacher_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`student_id`) REFERENCES `user_basic` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id5` FOREIGN KEY (`course_teacher_id`) REFERENCES `user_basic` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course_basic
-- ----------------------------

-- ----------------------------
-- Table structure for sub_basic
-- ----------------------------
DROP TABLE IF EXISTS `sub_basic`;
CREATE TABLE `sub_basic` (
  `sub_name` varchar(255) DEFAULT NULL,
  `user_subject_type` int(100) NOT NULL,
  PRIMARY KEY (`user_subject_type`),
  CONSTRAINT `user_subject_type` FOREIGN KEY (`user_subject_type`) REFERENCES `user_teacher_profile` (`user_subject_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sub_basic
-- ----------------------------

-- ----------------------------
-- Table structure for user_basic
-- ----------------------------
DROP TABLE IF EXISTS `user_basic`;
CREATE TABLE `user_basic` (
  `user_name` int(100) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_superuser` int(10) NOT NULL,
  `is_teacher` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_basic
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
  CONSTRAINT `user_id1` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`user_name`)
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
  `user_biography` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_telephone` int(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`user_name`)
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
  `user_subject_type` int(100) NOT NULL,
  `user_biography` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_telephone` int(100) NOT NULL,
  PRIMARY KEY (`user_id`,`user_subject_type`),
  KEY `user_subject_type` (`user_subject_type`),
  CONSTRAINT `user_id4` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_teacher_profile
-- ----------------------------
