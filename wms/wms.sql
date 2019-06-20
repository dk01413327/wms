/*
 Navicat MySQL Data Transfer

 Source Server         : KO
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 110.45.211.157:3306
 Source Schema         : wms

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 20/06/2019 08:47:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for g_reel_id
-- ----------------------------
DROP TABLE IF EXISTS `g_reel_id`;
CREATE TABLE `g_reel_id`  (
  `reel_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `part_id` int(11) NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `lot_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vendor_cd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_ty` int(11) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`reel_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for g_station_part_d
-- ----------------------------
DROP TABLE IF EXISTS `g_station_part_d`;
CREATE TABLE `g_station_part_d`  (
  `mid` int(11) NOT NULL,
  `part_id` int(11) NULL DEFAULT NULL,
  `side` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `station` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for g_station_part_m
-- ----------------------------
DROP TABLE IF EXISTS `g_station_part_m`;
CREATE TABLE `g_station_part_m`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) NULL DEFAULT NULL,
  `line_id` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for g_wo_base
-- ----------------------------
DROP TABLE IF EXISTS `g_wo_base`;
CREATE TABLE `g_wo_base`  (
  `work_order` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `part_id` int(11) NULL DEFAULT NULL,
  `bom_ver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `prod_qty` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`work_order`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for g_wo_schedule
-- ----------------------------
DROP TABLE IF EXISTS `g_wo_schedule`;
CREATE TABLE `g_wo_schedule`  (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_order` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `line_id` int(11) NULL DEFAULT NULL,
  `schedule_qty` int(11) NULL DEFAULT NULL,
  `prod_rate` int(11) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_bom
-- ----------------------------
DROP TABLE IF EXISTS `sys_bom`;
CREATE TABLE `sys_bom`  (
  `bom_id` int(11) NOT NULL,
  `item_id` int(11) NULL DEFAULT NULL,
  `use_qty` int(11) NULL DEFAULT NULL,
  `item_group` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_bom_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_bom_info`;
CREATE TABLE `sys_bom_info`  (
  `bom_id` int(11) NOT NULL,
  `part_id` int(11) NULL DEFAULT NULL,
  `version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bom_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_line
-- ----------------------------
DROP TABLE IF EXISTS `sys_line`;
CREATE TABLE `sys_line`  (
  `line_id` int(11) NOT NULL AUTO_INCREMENT,
  `line_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `line_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`line_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `menu_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `file_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'vue路径名称',
  `com_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'vue组件名称',
  `fun_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单描述',
  `enabled` int(1) NULL DEFAULT 1,
  `dept_chk` int(1) NULL DEFAULT 0 COMMENT '是否需要先部门审核',
  `new_page` int(1) NULL DEFAULT 0 COMMENT '是否在新页面打开',
  `menu_level` tinyint(1) NULL DEFAULT 1 COMMENT '1:一级，2：二级',
  `menu_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `need_chk` int(1) NULL DEFAULT 0,
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `menu_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 'm', 'root', 'root', NULL, NULL, NULL, 1, 0, 0, 0, '', 0, NULL, '2018-09-06 08:58:21');
INSERT INTO `sys_menu` VALUES (2, 'm02', 'm', '公用数据', '', NULL, NULL, 1, 0, 0, 1, 'el-icon-edit-outline', 0, NULL, '2018-09-06 08:58:52');
INSERT INTO `sys_menu` VALUES (3, 'm0101', 'm01', '用户资料', 'main/user', 'user', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-06 08:59:52');
INSERT INTO `sys_menu` VALUES (4, 'm0102', 'm01', '角色权限', 'main/role', 'role', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-06 09:00:22');
INSERT INTO `sys_menu` VALUES (5, 'm03', 'm', '会议室预约', NULL, NULL, NULL, 1, 0, 0, 1, 'el-icon-date', 0, NULL, '2018-09-06 09:01:44');
INSERT INTO `sys_menu` VALUES (6, 'm0301', 'm03', '会议室资料', 'main/room', 'room', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-06 09:03:20');
INSERT INTO `sys_menu` VALUES (7, 'm0302', 'm03', '会议室预定', 'main/meeting', 'meeting', NULL, 1, 0, 1, 2, NULL, 0, NULL, '2018-09-06 09:04:24');
INSERT INTO `sys_menu` VALUES (8, 'm04', 'm', '人员计算', NULL, NULL, NULL, 1, 0, 0, 1, 'el-icon-news', 0, NULL, '2018-09-06 15:07:21');
INSERT INTO `sys_menu` VALUES (9, 'm0401', 'm04', '品番工程对应', 'main/mapping', 'mapping', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-06 15:08:01');
INSERT INTO `sys_menu` VALUES (10, 'm0303', 'm03', '我 的 预 约', 'main/mybooking', 'mybooking', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-07 09:56:22');
INSERT INTO `sys_menu` VALUES (11, 'm0402', 'm04', '品番生产性', 'main/productive', 'productive', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-07 14:40:55');
INSERT INTO `sys_menu` VALUES (12, 'm0203', 'm02', '品番资料', 'main/part', 'part', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-12 08:34:02');
INSERT INTO `sys_menu` VALUES (13, 'm0204', 'm02', '工程资料', 'main/bom', 'eng', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-12 08:34:35');
INSERT INTO `sys_menu` VALUES (14, 'm0103', 'm01', '审核设置', 'main/chkroute', 'chkroute', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-17 10:46:30');
INSERT INTO `sys_menu` VALUES (15, 'm0403', 'm04', '出货计划', 'main/shippingplan', 'shippingplan', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-18 07:55:50');
INSERT INTO `sys_menu` VALUES (16, 'm0404', 'm04', '人力报表', 'main/manreport', 'manreport', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-09-26 11:09:09');
INSERT INTO `sys_menu` VALUES (17, 'm05', 'm', '报关系统', NULL, NULL, NULL, 1, 0, 0, 1, 'el-icon-tickets', 0, NULL, '2018-10-08 09:34:30');
INSERT INTO `sys_menu` VALUES (18, 'm0501', 'm05', 'BANDO合同用量表', 'main/bando', 'bando', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-10-08 09:35:18');
INSERT INTO `sys_menu` VALUES (19, 'm01', 'm', '系统设置', NULL, NULL, NULL, 1, 0, 0, 1, 'el-icon-setting', 0, '', '2018-12-04 13:53:45');
INSERT INTO `sys_menu` VALUES (20, 'm0205', 'm02', '客户资料', 'main/customer', 'customer', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2018-12-04 14:48:42');
INSERT INTO `sys_menu` VALUES (21, 'm06', 'm', '仓库系统', NULL, NULL, NULL, 1, 0, 0, 1, 'el-icon-circle-check', 0, NULL, '2018-12-05 08:04:18');
INSERT INTO `sys_menu` VALUES (22, 'm0601', 'm06', '送货单作成', 'main/deliverynote', 'deliverynote', NULL, 1, 0, 0, 2, NULL, 1, 'g_delivery_main', '2018-12-05 08:07:26');
INSERT INTO `sys_menu` VALUES (23, 'm07', 'm', '物品外置系统', NULL, NULL, NULL, 1, 0, 0, 1, 'el-icon-sold-out', 0, NULL, '2018-12-27 11:34:41');
INSERT INTO `sys_menu` VALUES (24, 'm0701', 'm07', '物品外置申请', NULL, 'wfrequest', NULL, 1, 0, 0, 2, NULL, 1, 'g_wf_request', '2018-12-27 11:36:56');
INSERT INTO `sys_menu` VALUES (25, 'm0702', 'm07', '查看外置物品', NULL, 'wfoverview', NULL, 1, 0, 1, 2, NULL, 0, '', '2018-12-28 09:32:14');
INSERT INTO `sys_menu` VALUES (26, 'm0405', 'm04', '人力申请', NULL, 'manrequest', NULL, 1, 1, 0, 2, NULL, 1, 'g_hr_recruit_request', '2019-01-31 08:31:20');
INSERT INTO `sys_menu` VALUES (27, 'm08', 'm', '报修系统', NULL, NULL, NULL, 1, 0, 0, 1, 'el-icon-success', 0, NULL, '2019-02-19 09:19:39');
INSERT INTO `sys_menu` VALUES (28, 'm0801', 'm08', '维修员分组', NULL, 'repairgroup', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2019-02-19 09:20:20');
INSERT INTO `sys_menu` VALUES (29, 'm0802', 'm08', '位置主档', NULL, 'devicearea', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2019-02-19 13:35:03');
INSERT INTO `sys_menu` VALUES (30, 'm0803', 'm08', '设备主档', NULL, 'device', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2019-02-19 15:04:20');
INSERT INTO `sys_menu` VALUES (31, 'm0804', 'm08', '统计分析', NULL, 'tarreport', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2019-03-20 13:13:18');
INSERT INTO `sys_menu` VALUES (32, 'm09', 'm', 'SMT系统', NULL, NULL, NULL, 1, 0, 0, 1, 'el-icon-s-grid', 0, NULL, '2019-05-09 11:21:30');
INSERT INTO `sys_menu` VALUES (33, 'm0901', 'm09', '钢网管理', NULL, 'stencilmgr', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2019-05-09 13:27:51');
INSERT INTO `sys_menu` VALUES (34, 'm0902', 'm09', '锡膏管理', NULL, 'solder', NULL, 1, 0, 0, 2, NULL, 0, NULL, '2019-06-12 09:15:25');

-- ----------------------------
-- Table structure for sys_part
-- ----------------------------
DROP TABLE IF EXISTS `sys_part`;
CREATE TABLE `sys_part`  (
  `part_id` int(11) NOT NULL,
  `part_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `part_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pcb_qty` int(11) NULL DEFAULT 1,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`part_id`, `part_no`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `endabled` bit(1) NULL DEFAULT b'1' COMMENT '1:启用,0:禁用',
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '财务部', NULL, b'1', 'admin', '2018-09-11 13:14:32');
INSERT INTO `sys_role` VALUES (2, '报关部', NULL, b'1', 'admin', '2018-09-11 13:14:46');
INSERT INTO `sys_role` VALUES (3, '营业部', NULL, b'1', 'admin', '2018-09-11 13:15:18');
INSERT INTO `sys_role` VALUES (4, '人事部', NULL, b'1', 'admin', '2018-09-11 13:16:19');
INSERT INTO `sys_role` VALUES (5, '电脑部', NULL, b'1', 'admin', '2018-10-09 15:49:53');
INSERT INTO `sys_role` VALUES (6, '生产性维护', NULL, b'1', 'admin', '2018-11-06 16:43:44');
INSERT INTO `sys_role` VALUES (7, '物品外放系统管理员', NULL, b'1', 'admin', '2019-01-22 09:19:25');
INSERT INTO `sys_role` VALUES (8, '会议室预定', NULL, b'1', 'admin', '2019-04-04 11:48:27');
INSERT INTO `sys_role` VALUES (9, '钢网系统管理员', NULL, b'1', 'admin', '2019-05-21 13:48:55');
INSERT INTO `sys_role` VALUES (10, '钢网系统操作员', NULL, b'1', 'admin', '2019-05-28 11:38:22');
INSERT INTO `sys_role` VALUES (11, '钢网系统查询者', NULL, b'1', 'admin', '2019-05-28 11:39:07');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 413 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 4, 'm0102', '1000111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (2, 4, 'm0202', '1000111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (3, 4, 'm0203', '1000111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (4, 4, 'm0201', '1000111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (5, 4, 'm0101', '1000111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (6, 4, 'm0301', '1000111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (7, 4, 'm0302', '1000111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (50, 1, 'm0203', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (51, 1, 'm0201', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (52, 1, 'm0102', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (53, 1, 'm0202', '1111000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (54, 1, 'm0101', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (55, 1, 'm0301', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (56, 1, 'm0302', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (64, 3, 'm0201', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (65, 3, 'm0301', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (66, 3, 'm0202', '1110000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (67, 3, 'm0101', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (68, 3, 'm0203', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (69, 3, 'm0102', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (70, 3, 'm0302', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (166, 5, 'm0103', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (228, 5, 'm0202', '1100111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (227, 5, 'm0201', '1100111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (162, 5, 'm0102', '1100111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (163, 5, 'm0104', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (167, 5, 'm0105', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (226, 5, 'm0101', '1000011', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (229, 5, 'm0204', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (230, 5, 'm0301', '1100111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (232, 5, 'm0302', '1100111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (173, 5, 'm0304', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (234, 5, 'm0303', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (231, 5, 'm0401', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (110, 2, 'm0101', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (111, 2, 'm0102', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (112, 2, 'm0103', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (113, 2, 'm0301', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (114, 2, 'm0104', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (115, 2, 'm0302', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (116, 2, 'm0202', '1110000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (117, 2, 'm0203', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (118, 2, 'm0105', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (119, 2, 'm0303', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (120, 2, 'm0304', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (121, 2, 'm0401', '1111000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (122, 2, 'm0201', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (260, 6, 'm0202', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (262, 6, 'm0203', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (258, 6, 'm0101', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (261, 6, 'm0201', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (153, 6, 'm0102', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (264, 6, 'm0302', '1100010', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (266, 6, 'm0303', '1000010', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (156, 6, 'm0103', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (265, 6, 'm0301', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (158, 6, 'm0304', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (267, 6, 'm0401', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (160, 6, 'm0104', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (161, 6, 'm0105', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (259, 6, 'm0204', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (263, 6, 'm0205', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (268, 6, 'm0402', '1100000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (269, 6, 'm0403', '1100000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (270, 6, 'm0404', '1100000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (272, 6, 'm0702', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (274, 6, 'm0701', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (225, 5, 'm0203', '1100111', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (224, 5, 'm0205', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (240, 5, 'm0403', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (233, 5, 'm0402', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (237, 5, 'm0701', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (236, 5, 'm0404', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (238, 5, 'm0501', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (239, 5, 'm0702', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (235, 5, 'm0601', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (241, 7, 'm0205', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (242, 7, 'm0204', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (243, 7, 'm0101', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (244, 7, 'm0201', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (245, 7, 'm0203', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (246, 7, 'm0202', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (247, 7, 'm0303', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (248, 7, 'm0302', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (249, 7, 'm0402', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (250, 7, 'm0301', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (251, 7, 'm0401', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (252, 7, 'm0403', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (253, 7, 'm0501', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (254, 7, 'm0601', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (255, 7, 'm0404', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (256, 7, 'm0702', '1000100', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (257, 7, 'm0701', '1111000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (271, 6, 'm0405', '1111011', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (273, 6, 'm0501', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (275, 6, 'm0601', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (276, 8, 'm0201', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (277, 8, 'm0202', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (278, 8, 'm0101', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (279, 8, 'm0203', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (280, 8, 'm0205', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (281, 8, 'm0204', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (282, 8, 'm0303', '1111000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (283, 8, 'm0401', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (284, 8, 'm0302', '1111000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (285, 8, 'm0301', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (286, 8, 'm0402', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (287, 8, 'm0403', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (288, 8, 'm0405', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (289, 8, 'm0501', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (290, 8, 'm0601', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (291, 8, 'm0404', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (292, 8, 'm0801', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (293, 8, 'm0702', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (294, 8, 'm0701', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (295, 8, 'm0802', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (296, 8, 'm0803', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (297, 8, 'm0804', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (344, 9, 'm0101', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (346, 9, 'm0205', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (345, 9, 'm0204', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (348, 9, 'm0201', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (349, 9, 'm0203', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (347, 9, 'm0202', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (350, 9, 'm0301', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (351, 9, 'm0401', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (352, 9, 'm0402', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (355, 9, 'm0403', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (356, 9, 'm0303', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (353, 9, 'm0302', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (354, 9, 'm0404', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (357, 9, 'm0405', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (358, 9, 'm0501', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (362, 9, 'm0701', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (360, 9, 'm0801', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (361, 9, 'm0601', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (363, 9, 'm0802', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (365, 9, 'm0804', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (359, 9, 'm0702', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (366, 9, 'm0901', '1100000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (364, 9, 'm0803', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (367, 10, 'm0201', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (368, 10, 'm0101', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (369, 10, 'm0205', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (370, 10, 'm0204', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (371, 10, 'm0301', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (372, 10, 'm0302', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (373, 10, 'm0203', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (374, 10, 'm0202', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (375, 10, 'm0303', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (376, 10, 'm0401', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (377, 10, 'm0402', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (378, 10, 'm0404', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (379, 10, 'm0403', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (380, 10, 'm0405', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (381, 10, 'm0601', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (382, 10, 'm0501', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (383, 10, 'm0801', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (384, 10, 'm0701', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (385, 10, 'm0702', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (386, 10, 'm0802', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (387, 10, 'm0804', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (388, 10, 'm0803', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (389, 10, 'm0901', '1111011', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (390, 11, 'm0201', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (391, 11, 'm0204', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (392, 11, 'm0205', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (393, 11, 'm0101', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (394, 11, 'm0203', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (395, 11, 'm0303', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (396, 11, 'm0302', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (397, 11, 'm0401', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (398, 11, 'm0301', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (399, 11, 'm0202', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (400, 11, 'm0405', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (401, 11, 'm0404', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (402, 11, 'm0403', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (403, 11, 'm0601', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (404, 11, 'm0501', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (405, 11, 'm0701', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (406, 11, 'm0801', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (407, 11, 'm0803', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (408, 11, 'm0702', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (409, 11, 'm0802', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (410, 11, 'm0804', '0000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (411, 11, 'm0901', '1000000', NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (412, 11, 'm0402', '0000000', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (4, 2, 'CR03503', 'admin', '2018-10-26 11:46:40');
INSERT INTO `sys_role_user` VALUES (6, 6, 'tu1', 'admin', '2018-11-06 16:46:46');
INSERT INTO `sys_role_user` VALUES (7, 6, 'tu2', 'admin', '2018-11-06 16:47:32');
INSERT INTO `sys_role_user` VALUES (70, 6, 'aimi', 'admin', '2019-03-18 13:45:56');
INSERT INTO `sys_role_user` VALUES (9, 6, 'smt', 'admin', '2018-11-06 16:57:03');
INSERT INTO `sys_role_user` VALUES (10, 6, 'bando', 'admin', '2018-11-06 16:59:50');
INSERT INTO `sys_role_user` VALUES (11, 6, 'iida', 'admin', '2018-11-06 17:01:24');
INSERT INTO `sys_role_user` VALUES (12, 6, 'scanner', 'admin', '2018-11-07 08:15:34');
INSERT INTO `sys_role_user` VALUES (15, 6, 'clx', 'admin', '2018-11-07 08:16:48');
INSERT INTO `sys_role_user` VALUES (17, 6, 'press', 'admin', '2018-11-07 08:18:04');
INSERT INTO `sys_role_user` VALUES (65, 7, 'jiao', 'admin', '2019-02-18 09:03:48');
INSERT INTO `sys_role_user` VALUES (19, 6, 'PR03647', 'admin', '2018-11-07 14:30:15');
INSERT INTO `sys_role_user` VALUES (71, 5, 'aimi', 'admin', '2019-03-18 13:45:56');
INSERT INTO `sys_role_user` VALUES (27, 7, '06259', 'admin', '2019-01-22 11:25:21');
INSERT INTO `sys_role_user` VALUES (68, 7, '00816', 'admin', '2019-03-18 13:45:22');
INSERT INTO `sys_role_user` VALUES (64, 6, 'jiao', 'admin', '2019-02-18 09:03:48');
INSERT INTO `sys_role_user` VALUES (42, 6, 'RR01801', 'admin', '2019-02-15 14:37:21');
INSERT INTO `sys_role_user` VALUES (69, 5, '00816', 'admin', '2019-03-18 13:45:22');
INSERT INTO `sys_role_user` VALUES (67, 7, 'IR28229', 'admin', '2019-02-18 09:05:39');
INSERT INTO `sys_role_user` VALUES (72, 8, '28229', 'admin', '2019-04-04 11:54:13');
INSERT INTO `sys_role_user` VALUES (73, 9, '09023', 'admin', '2019-05-21 13:49:29');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pass_word` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cell_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enabled` int(11) NULL DEFAULT 1,
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `user_no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '123', 'IT', '12344', '12344', 1, '2019-06-17 09:21:22');
INSERT INTO `sys_user` VALUES (3, 'test', 'test', NULL, 'test', '12345', '12345', 1, '2019-06-19 11:08:21');

-- ----------------------------
-- Procedure structure for sp_change_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_change_password`;
delimiter ;;
CREATE PROCEDURE `sp_change_password`(userid int, oldpass varchar(50),newpass varchar(50))
leave_name:
BEGIN
	#Routine body goes here...
	set @cnt = 0;
	select count(1) into @cnt from sys_user where user_id=userid and pass_word = oldpass;
	if @cnt =  0 then
	  select 1 as errcode,'旧密码不正确' as errmsg;
		leave leave_name;
	end if;
	update sys_user set pass_word = newpass where user_id=userid;
	select 0 as errcode,'修改成功' as errmsg;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_get_sys_menu
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_get_sys_menu`;
delimiter ;;
CREATE PROCEDURE `sp_get_sys_menu`(IN `userno` varchar(20))
BEGIN
	#Routine body goes here...
  #select * from sys_menu where parent_id !='root' order by menu_id;
	if userno='admin' then
	  select a.menu_id,a.menu_name,a.parent_id,a.file_name,a.com_name,a.menu_level
		      ,a.menu_icon,a.menu_name as label,a.need_chk,'1111111' as permission,a.new_page
		from sys_menu a where parent_id !='root' order by parent_id,menu_id;#menu_id;
	else
	  	select a.menu_id,a.menu_name,a.parent_id,a.file_name,a.com_name,a.menu_level,a.menu_icon,a.menu_name as label,a.need_chk
			      ,concat(bquery,badd,bedit,bdelete,bapprove,bexport,bprint) permission ,a.new_page
			from  sys_menu a join (
									select menu_id,max(substr(permission,1,1)) bquery,max(substr(permission,2,1)) badd,max(substr(permission,3,1)) bedit
												,max(substr(permission,4,1)) bdelete,max(substr(permission,5,1)) bapprove,max(substr(permission,6,1)) bexport
												,max(substr(permission,7,1)) bprint
									from sys_role_permission a  join sys_role_user b on a.role_id=b.role_id
									where b.user_no=userno and a.permission>'0000000' group by menu_id
				) b on a.menu_id=b.menu_id where a.status=1
		union 
		  select a.menu_id,a.menu_name,a.parent_id,a.file_name,a.com_name,a.menu_level,a.menu_icon,a.menu_name as label,a.need_chk
		        ,'',a.new_page from sys_menu a
			where parent_id='M' 
				and exists(select 1 from sys_role_permission b  join sys_role_user c on b.role_id=c.role_id
									where c.user_no=userno and b.permission>'0000000' and instr(b.menu_id,a.menu_id)>0) order by parent_id,menu_id; #menu_id;

	end if;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_login`;
delimiter ;;
CREATE PROCEDURE `sp_login`(userno varchar(20),passwd varchar(20),ip varchar(20))
leave_name:
BEGIN
	#Routine body goes here...
	set @cnt = 0 ;
	select count(1) into @cnt from sys_user where user_no=userno ;
	if @cnt = 0 then
	  select 1 as errcode,'无此帐号' as errmsg;
		leave leave_name;
	end if;
	
	select count(1) into @cnt from sys_user where user_no=userno and enabled=0 ;
	if @cnt > 0 then
	  select 1 as errcode,'此人已离职' as errmsg;
		leave leave_name;
	end if;
	
	select count(1) into @cnt from sys_user where user_no=userno and pass_word=passwd;
	if @cnt = 0 then
	  select 1 as errcode,'密码不正确' as errmsg;
		leave leave_name;
	end if;
	
  select 0 as errcode, user_id, user_no, user_name,dept_name from sys_user 
	  where user_no=userno;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_save_role
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_save_role`;
delimiter ;;
CREATE PROCEDURE `sp_save_role`(roleid int,
rolenm varchar(20),
roledesc varchar(255))
leave_name:
BEGIN
	#Routine body goes here...
	set @cnt = 0;
	if roleid = 0 then
	  select count(1) into @cnt from sys_role where role_name = rolenm;
		if @cnt > 0 then
		  select 1 as errcode,'角色名称重复' as errmsg;
			leave leave_name;
		end if;
		insert into sys_role(role_name,role_desc) values (rolenm,roledesc);
	else
	  update sys_role set role_desc= roledesc where role_id=roleid;
	end if;
	select 0 as errcode,'保存成功' as errmsg ;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_save_user
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_save_user`;
delimiter ;;
CREATE PROCEDURE `sp_save_user`(userid int
,userno varchar(20)
,usernm varchar(50)
,dept varchar(50)
,email varchar(100)
,phone varchar(12))
leave_name:
BEGIN
	#Routine body goes here...
	set @cnt = 0;
  if userid > 0 then
	  update sys_user set user_name = usernm,dept_name = dept,email = email,cell_phone = phone where user_id= userid;
	else
	   select count(1) into @cnt from sys_user where user_no=userno;
		 if @cnt > 0 then
		   select 1 as errcode,'帐号重复' as errmsg;
			 leave leave_name;
		 end if;
	  insert into sys_user(user_no,user_name,dept_name,email,cell_phone) values (userno,usernm,dept,email,phone);
	end if;
	select 0 as errcode,'保存成功' as errmsg;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
