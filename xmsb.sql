/*
Navicat MySQL Data Transfer

Source Server         : mysql-jwnming
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : xmsb

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2019-05-25 19:30:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(8) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1001', '蒋文明', '123456');
INSERT INTO `admin` VALUES ('1002', 'jwnming', '123456');
INSERT INTO `admin` VALUES ('1003', 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `distinguish` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1001', '实验室软件项目', '1001');
INSERT INTO `category` VALUES ('1002', '教学实验项目', '1001');
INSERT INTO `category` VALUES ('1003', '非实验创新项目', '1003');
INSERT INTO `category` VALUES ('1007', 'c', '5423');

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `device_id` int(8) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(20) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `count` int(2) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `plan_expenditure` double(8,3) DEFAULT NULL,
  `total_payment` double(8,3) DEFAULT NULL,
  `arrival_time` date DEFAULT NULL,
  `device_status` int(1) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `project_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('10005', '1', '1', '1', '1', '1.000', '1.000', '2019-05-10', '1', '1000', '1001');
INSERT INTO `device` VALUES ('10006', '12', '1', '1', '1', '1.000', '1.000', null, '0', '1000', '1001');
INSERT INTO `device` VALUES ('100001', '设备1', '型号1', '1', '---', '4.000', '4.000', '2019-05-06', '1', '1000', '1001');
INSERT INTO `device` VALUES ('100002', '设备2', '型号2', '1', 'sdf', '2.000', '2.000', '2019-05-01', '0', '1000', '1001');
INSERT INTO `device` VALUES ('100003', '设备3', '型号3', '3', '---', '2.000', '2.000', '2019-05-03', '1', '1000', '1002');

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `href` varchar(200) DEFAULT NULL,
  `project_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documents
-- ----------------------------
INSERT INTO `documents` VALUES ('1008', '申报材料.txt', '/user/uploadfiles/documents/5b3fa542-dc89-447c-99b4-93e73fdcff28.txt', '1002', '1000');
INSERT INTO `documents` VALUES ('1009', '申报材料.docx', '/user/uploadfiles/documents/4ee6728f-3855-4eb9-94e7-d09110915f46.docx', '1001', '1000');
INSERT INTO `documents` VALUES ('1010', '申报材料.pdf', '/user/uploadfiles/documents/a4743de4-c966-47b0-9ccf-7bc2d3e352bc.pdf', '1003', '1000');
INSERT INTO `documents` VALUES ('1011', '申报材料.docx', '/user/uploadfiles/documents/f85cc5d6-666b-4332-8619-a9b876d27e4e.docx', null, '1000');
INSERT INTO `documents` VALUES ('1012', '申报材料.txt', '/user/uploadfiles/documents/0377e324-7e83-44af-8c5d-48ac0a565c60.txt', null, '1000');
INSERT INTO `documents` VALUES ('1013', '申报材料.docx', '/user/uploadfiles/documents/84080fd1-2c3a-4de3-8f1c-646e6682820d.docx', null, '1000');
INSERT INTO `documents` VALUES ('1014', '23-申报材料.jpg', '/user/uploadfiles/documents/3a7db6d3-6d2b-45d4-9a11-ed130e256081.jpg', null, '1000');
INSERT INTO `documents` VALUES ('1015', '123-申报材料.jpg', '/user/uploadfiles/documents/4553e8cf-df90-4da4-a73b-f15fa1969c69.jpg', null, '1000');
INSERT INTO `documents` VALUES ('1016', '1-申报材料.jpg', '/user/uploadfiles/documents/c674b8e2-9f37-45aa-a98c-c4f72ae29f66.jpg', null, '1000');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `href` varchar(200) DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1001', '首页管理', 'icon-application_side_expand', null, null);
INSERT INTO `menu` VALUES ('1002', '学生用户模块管理', 'icon-cd', null, null);
INSERT INTO `menu` VALUES ('1003', '项目管理', 'icon-book_red', null, null);
INSERT INTO `menu` VALUES ('1004', '设备采购经费管理', 'icon-application_form', null, null);
INSERT INTO `menu` VALUES ('1005', '申报材料管理', 'icon-page_save', null, null);
INSERT INTO `menu` VALUES ('1006', '统计', 'icon-user_mature', null, null);
INSERT INTO `menu` VALUES ('1007', '首页轮播图片管理', 'icon-cog', '/admin/manager/rotation/rotationList.jsp', '1001');
INSERT INTO `menu` VALUES ('1008', '首页新闻动态管理', 'icon-cog', '/admin/manager/news/news.jsp', '1001');
INSERT INTO `menu` VALUES ('1009', '优秀团队展示管理', 'icon-cog', '/admin/manager/user/userList_exhibition.jsp', '1001');
INSERT INTO `menu` VALUES ('1010', '优秀项目展示管理', 'icon-cog', '/admin/manager/project/projectList_exhibition.jsp', '1001');
INSERT INTO `menu` VALUES ('1011', '用户信息管理', 'icon-cog', '/admin/manager/user/userList.jsp', '1002');
INSERT INTO `menu` VALUES ('1012', '指导老师管理', 'icon-cog', '/admin/manager/user/teacherList.jsp', '1002');
INSERT INTO `menu` VALUES ('1013', '项目申报审核', 'icon-cog', '/admin/manager/project/projectList_status.jsp', '1003');
INSERT INTO `menu` VALUES ('1014', '项目信息管理', 'icon-cog', '/admin/manager/project/projectList.jsp', '1003');
INSERT INTO `menu` VALUES ('1015', '完成项目管理', 'icon-cog', '/admin/manager/project/projectList_finished.jsp', '1003');
INSERT INTO `menu` VALUES ('1016', '资金申请审核', 'icon-cog', '/admin/manager/purchase/purchaseList_status.jsp', '1004');
INSERT INTO `menu` VALUES ('1017', '项目资金信息', 'icon-cog', '/admin/manager/purchase/purchaseList.jsp', '1004');
INSERT INTO `menu` VALUES ('1018', '项目分类管理', 'icon-cog', '/admin/manager/project/categoryList.jsp', '1003');
INSERT INTO `menu` VALUES ('1019', '查看所有文档信息', 'icon-cog', '/admin/manager/documents/documentsList.jsp', '1005');
INSERT INTO `menu` VALUES ('1020', '用户统计', 'icon-cog', '/admin/manager/statistics/userStatistics.jsp', '1006');
INSERT INTO `menu` VALUES ('1021', '项目统计', 'icon-cog', '/admin/manager/statistics/projectStatistics.jsp', '1006');
INSERT INTO `menu` VALUES ('1022', '资金统计', 'icon-cog', '/admin/manager/statistics/purchaseStatistics.jsp', '1006');
INSERT INTO `menu` VALUES ('1023', '项目验收申请', 'icon-cog', '/admin/manager/project/projectList_finished_confirm.jsp', '1003');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `upload_time` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1001', '发布的新闻标题1', '这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容。', '2019-05-16', '1');
INSERT INTO `news` VALUES ('1003', '发布的新闻标题2', '这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容。', '2019-05-28', '1');
INSERT INTO `news` VALUES ('1007', 'efsa发布的新闻标题3', '这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容。', '2019-05-06', '1');
INSERT INTO `news` VALUES ('1008', '这个是新闻的标题', '这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容，这里是新闻的内容。', '2019-05-12', '1');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `declare_time` date DEFAULT NULL,
  `funds` double(8,3) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `documents_id` int(8) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `finished` int(1) DEFAULT NULL,
  `exhibition` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1001', '智能家居项目', '2019-05-05', '4.000', '/user/uploadfiles/project_logo/7d45da4b-9246-4c57-8554-bba03bad9706.jpg', '此项目是以计算机技术，使家庭的一些家具电子化，从而更智能化，只需一部手机或一个控制器就可实现家具的自动开关使用！', '1008', '非实验室创新项目', '1000', '蒋文明', '1', '2', '1');
INSERT INTO `project` VALUES ('1002', '优盘防毒项目', '2019-05-06', '3.000', '/user/uploadfiles/project_logo/default.png', '以嵌入式的方式，保证优盘自身文件的安全', '1008', '实验室软件项目', '1002', '张三', '1', '0', '1');
INSERT INTO `project` VALUES ('1003', '飞天绿化项目', '2019-05-02', '13.230', '/user/uploadfiles/project_logo/default.png', '促进绿化，这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！', '1008', '教学实验项目', '1001', '蒋文明', '2', '0', '1');
INSERT INTO `project` VALUES ('1005', '共享电脑', '2019-05-09', '4.000', '/user/uploadfiles/project_logo/default.png', '这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！', '1008', '实验室软件项目', '1000', '蒋文明', '1', '1', '1');
INSERT INTO `project` VALUES ('1006', '打Call瘦身', '2019-05-09', '3.000', '/user/uploadfiles/project_logo/default.png', '这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！', '1009', '实验室软件项目', '1000', '蒋文明', '1', '0', '1');
INSERT INTO `project` VALUES ('1007', '关于量子空间物理的研究', '2019-05-09', '1.000', '/user/uploadfiles/project_logo/default.png', '这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！', '1010', '教学实验项目', '1000', '蒋文明', '2', '0', '0');
INSERT INTO `project` VALUES ('1008', 'VR购物', '2019-05-23', '12.000', '/user/uploadfiles/project_logo/default.png', '这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！', '1015', 'c', '1000', '蒋文明', '0', '0', '0');
INSERT INTO `project` VALUES ('1009', '化学实验', '2019-05-23', '1.000', '/user/uploadfiles/project_logo/default.png', '这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！这里是描述内容！', '1016', 'c', '1000', '蒋文明', '0', '0', '0');

-- ----------------------------
-- Table structure for rotation
-- ----------------------------
DROP TABLE IF EXISTS `rotation`;
CREATE TABLE `rotation` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `image_path` varchar(200) DEFAULT NULL,
  `upload_date` date DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `proportion` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rotation
-- ----------------------------
INSERT INTO `rotation` VALUES ('1001', '郑州大学北校区第一实验室', '/admin/upload/rotations/banner1.jpg', '2019-04-25', '图为郑州大学北校区第一实验室', '1', '5');
INSERT INTO `rotation` VALUES ('1002', '首页轮播图标题1', '/admin/upload/rotations/banner2.jpg', '2019-04-16', '这里是图片的简介', '1', '4');
INSERT INTO `rotation` VALUES ('1003', '这个是一个轮播图', '/admin/upload/rotations/banner3.jpg', '2019-04-12', '这里是图片的简介', '1', '3');
INSERT INTO `rotation` VALUES ('1004', '首页轮播图标题2', '/admin/upload/rotations/banner4.jpg', '2019-04-09', '描述', '1', '1');
INSERT INTO `rotation` VALUES ('1005', '首页轮播图标题4', '/admin/upload/rotations/banner5.jpg', '2019-04-17', '这里是图片的简介', '1', '1');
INSERT INTO `rotation` VALUES ('1006', '首页轮播图标题5', '/admin/upload/rotations/banner2.jpg', '2019-05-01', '简介', '1', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1001', '李四', '指导老师', '12345678901');
INSERT INTO `teacher` VALUES ('1002', '张三', '辅导员', '12345678910');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(4) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  `level` varchar(4) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `clazz` varchar(100) DEFAULT NULL,
  `laboratory` varchar(100) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `teacher_id` int(8) DEFAULT NULL,
  `exhibition` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1000', '蒋文明', '123456', '0000', '1', '23', '2015', '软件与应用科技学院', '软件开发与测试', '3班', '实验楼2-234室', '15238350476', 'jwnmingjava@163.com', '/user/uploadfiles/head_pic/jwnming.jpg', '1', '1001', '1');
INSERT INTO `user` VALUES ('1002', '张三', '123456', '1111', '1', '22', '2015', '软件与应用科技学院', '移动互联网', '4班', '第十一实验室', '12476526344', '34@sd.com', '/user/uploadfiles/head_pic/jwnming.jpg', '0', '1002', '0');
INSERT INTO `user` VALUES ('1003', '李四', '123456', '1111', '1', '22', '2015', '软件与应用科技学院', '移动互联网', '4班', '北区345室', '12343234563', '34dfa@sd.com', '/user/uploadfiles/head_pic/jwnming.jpg', '1', '1001', '1');
INSERT INTO `user` VALUES ('1004', '杜拉拉', '123456', '1111', '0', '21', '2017', '建筑学院', '计算机科学与技术', '1班', '北区实验室3-345', '15323456754', '1234@qq.com', '/user/uploadfiles/head_pic/default.jpg', '1', '1001', '1');
INSERT INTO `user` VALUES ('1007', '王二妮', '123456', '1111', '0', '22', '2019', '软件与应用科技学院', '软件开发与测试', '1班', '实验楼234室', '15643456234', '466946114@qq.com', '/user/uploadfiles/head_pic/ca1dffdb-d943-4182-aaf7-638f2be191df.JPG', '1', '1002', '0');
INSERT INTO `user` VALUES ('1008', '张浩好', 'zzu123', '1111', '1', '22', '2019', '软件与应用科技学院', '嵌入式', '1班', '6号楼2-234室', '18436353745', '466946114@qq.com', '/user/uploadfiles/head_pic/a33a57f1-c316-470c-b118-43203ab89217.JPG', '1', '1001', '1');
INSERT INTO `user` VALUES ('1009', '雷磊', 'zzu123', '1111', '1', '19', '2017', '音乐学院', '古典乐器', '1班', '实验楼2-234室', '15123454321', '466946114@qq.com', '/user/uploadfiles/head_pic/default.jpg', '1', '1002', '1');
INSERT INTO `user` VALUES ('1010', '余敬光', 'zzu123', '1111', '1', '23', '2014', '建筑学院', '测量工程', '4班', '实验楼2-544室', '13456545654', '123@test.com', '/user/uploadfiles/head_pic/222f4b39-6452-430b-bbc3-b4e3061a7db7.jpg', '0', '1002', '0');
INSERT INTO `user` VALUES ('1011', '天平平', 'zzu123', '1111', '0', '21', '2019', '法学院', '法律', '3班', '新区第二实验室', '13434234543', '466946114@qq.com', '/user/uploadfiles/head_pic/92f1339d-3b55-4ec0-a13c-0c12b186688f.jpg', '1', '1001', '0');
INSERT INTO `user` VALUES ('1012', '马致远', 'zzu123', '0000', '1', '21', '2019', '法学院', '法律', '2班', '实验楼4-234室', '12312343215', '123asdf@163.com', '/user/uploadfiles/head_pic/default.jpg', '1', '1001', '0');
INSERT INTO `user` VALUES ('1013', '王奥威', 'zzu123', '1111', '1', '25', '2019', '法学院', '法律', '1班', '实验楼2-236室', '15768934653', '123@123.com', '/user/uploadfiles/head_pic/default.jpg', '1', '1001', '0');
INSERT INTO `user` VALUES ('1014', '李思琪', 'zzu123', '0000', '0', '23', '2019', '法学院', '法律', '5班', '第五实验室', '12345432423', 'xx@xx.com', '/user/uploadfiles/head_pic/default.jpg', '1', '1002', '0');
INSERT INTO `user` VALUES ('1015', '赵天乐', 'zzu123', '0000', '1', '24', '2019', '建筑学院', '土木工程', '6班', '实验楼2-34室', '16234542435', '1test@test.com', '/user/uploadfiles/head_pic/default.jpg', '1', '1002', '0');
