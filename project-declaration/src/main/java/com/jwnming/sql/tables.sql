1.用户表:
create table user(
	id int(8) primary key,
	name varchar(20),
	password varchar(100),
	salt varchar(4),		盐值*MD5加密
	sex int(1),
	age int(2),
	level varchar(4),		届
	department varchar(100),	所属院系
	major varchar(100),	所属专业
	clazz varchar(100),		所属班级
	laboratory varchar(100),	所属实验室
	mobile varchar(11),	手机
	email varchar(100),		电子邮箱
	picture varchar(200),	头像路径
	status int(1),		状态
	teacher_id int(8)
)
2.指导老师:
create table teacher(
	id int(8) primary key,
	name varchar(20),
	job varchar(100),		职位
	mobile varchar(11)
)
3.项目分类:
create table category(
	id int(8) primary key,
	name varchar(20),
	distinguish int(2)
)
4.项目表:
create table project(
	id int(8) primary key,
	name varchar(20),
	declare_time date,		申报时间
	funds double(8),		申报经费
	logo varchar(200),		项目logo
	description varchar(100),	简介
	documents_id  int(8),	申报附件
	category_id  int(8),		所属类别
	user_id  int(8)		所属用户
)
5.采购表:
create table purchase(
	id int(8) primary key,
	device_name varchar(20),	设备名
	model varchar(100),	型号
	count int(2),		数量
	source varchar(100),	经费来源
	plan_expenditure double(8), 计划支出
	total_payment double(8), 	总经费
	arrival_time date,		到货时间
	picture varcahr(200),	图片
	status int(1),		验收状态
	user_id  int(8),
	project_id int(8)
)

6.管理员表:
create table admin(
	id int(8) primary key,
	name varchar(20),
	password varchar(100)
)
7.管理菜单表:
create table menu(
	id int(8) primary key,
	title varchar(20),
	icon varchar(200),	菜单图标
	href varchar(200),	管理页面路径
	parent_id int(8)	父级菜单
)
8.首页轮播图表:
create table rotation(
	id int(8) primary key,
	title varchar(20),
	image_path varchar(200),	路径
	upload_date date,		上传日期
	status int(1),		状态
	proportion int(8)		权重
)
9.申报文件表:
create table documents(
	id int(8) primary key,
	name varchar(20),
	path varchar(200),
	project_id int(8),
	user_id int(8)
)
10.新闻动态表:
create table news(
	id int(8) primary key,
	title varchar(20),		新闻标题
	content varchar(1000),	新闻内容
	upload_time date
)