drop table t_user;
drop table t_city;
drop table t_tag;
drop table t_group;
drop table t_clazz;
drop table t_student_tag;
drop table t_student;
drop table t_tag;

-- 用户表
create table t_user(
	id varchar(40) primary key,
	username varchar(40),
	password varchar(40),
	photopath varchar(60),-- 保存用户头像路径
	createDate timestamp,
	role  varchar(40)	
);
-- 城市表
create table t_city(
	id varchar(40) primary key,
	name varchar(40)
);
-- 标签表
create table t_tag(
	id varchar(40) primary key,
	name varchar(40),
	type varchar(8),   -- 标签类型  班级  学生
	createDate timestamp
);
-- 班级表
create table t_clazz(
	id varchar(40) primary key,
	name varchar(40),
	tagId varchar(40) references t_tag(id)  -- 标签外键
);
-- 小组表
create table t_group(
	id varchar(40) primary key,
	name varchar(40),
	createDate timestamp,
	clazzId varchar(40) references t_clazz(id)  -- 班级外键
);
-- 学生表
create table t_student(
	id varchar(40) primary key,
	name varchar(40),
	age int(3),
	qq varchar(20),
	phone varchar(20),
	bir timestamp,
	mark  varchar(600),
	clazzId varchar(40) references t_clazz(id),  -- 班级外键
	groupId varchar(40) references t_group(id),  -- 小组外键
	cityId varchar(40) references t_city(id)     -- 城市外键
);
-- 学生标签表 (关系表)
create table t_student_tag(
	sid varchar(40) references t_student(id),  -- 学生外键
	tid varchar(40) references t_tag(id),      -- 标签外键
	primary key (sid,tid)
);


