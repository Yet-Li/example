SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS `company`;
CREATE DATABASE `company` CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (111, '技术部', '技术研发');
INSERT INTO `department` VALUES (222, '产品部', '产品构想');
INSERT INTO `department` VALUES (333, '运营部', '产品运营');
INSERT INTO `department` VALUES (444, '设计部', '产品设计');
INSERT INTO `department` VALUES (555, '市场部', '市场调研');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `phone_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_department_id`(`department_id`) USING BTREE,
  CONSTRAINT `FK_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'AA', '男', 23, '18332069527', '技术', 111);
INSERT INTO `employee` VALUES (2, 'BB', '女', 21, '15833982012', '设计', 444);
INSERT INTO `employee` VALUES (3, 'CC', '男', 25, '15032122020', '运营', 333);
INSERT INTO `employee` VALUES (4, 'DD', '女', 27, '18232060515', '运营', 333);
INSERT INTO `employee` VALUES (5, '小赵', '女', 18, '13780212639', '运营', 333);
INSERT INTO `employee` VALUES (6, '小钱', '男', 24, '18933278139', '市场', 555);
INSERT INTO `employee` VALUES (7, '小孙', '男', 30, '18712349527', '产品', 222);
INSERT INTO `employee` VALUES (8, '小李', '男', 23, '18320122639', '技术', 111);
INSERT INTO `employee` VALUES (9, '小白', '男', 26, '18233277276', '设计', 444);
INSERT INTO `employee` VALUES (10, '塔塔', '女', 22, '15033272639', '设计', 444);

SET FOREIGN_KEY_CHECKS = 1;


#手机号脱敏
SELECT
phone_number 未脱敏手机号,CONCAT(LEFT(phone_number,3),'****',RIGHT(phone_number,4))已脱敏手机号
FROM
employee;

SELECT
phone_number 未脱敏手机号,INSERT(phone_number,4,4,'****') 已脱敏手机号
FROM
employee;



#统计各部门的员工人数
SELECT
d.department_id 部门编号,d.department_name 部门名称,COUNT(*)
员工人数
FROM
employee e
INNER JOIN department d
ON
e.department_id = d.department_id
GROUP BY
e.department_id;



#查询每个部门年龄最大的员工
SELECT
*
FROM
employee
WHERE
age IN (
SELECT
MAX(age)
FROM
employee
GROUP BY
department_id
);



#手机号模糊查询
SELECT
phone_number
FROM
employee
WHERE
phone_number LIKE '183%';