--用户表
create table t_user(
	id varchar2(40) primary key,
	username varchar2(40),
	password varchar2(40),
	photopath varchar2(60),--保存用户头像路径
	createDate date,
	role  varchar2(40)	
);
--城市表
create table t_city(
	id varchar2(40) primary key,
	name varchar2(40)
);
--标签表
create table t_tag(
	id varchar2(40) primary key,
	name varchar2(40),
	type varchar2(8),   --标签类型  班级  学生
	createDate Date
);
--班级表
create table t_clazz(
	id varchar2(40) primary key,
	name varchar2(40),
	tagId varchar2(40) references t_tag(id)  --标签外键
);
--小组表
create table t_group(
	id varchar2(40) primary key,
	name varchar2(40),
	createDate Date,
	clazzId varchar2(40) references t_clazz(id)  --班级外键
);
--学生表
create table t_student(
	id varchar2(40) primary key,
	name varchar2(40),
	age number(3),
	qq varchar2(20),
	phone varchar2(20),
	bir date,
	starts varchar2(20),--星座
	attr  varchar2(10),--生肖
	mark  varchar2(600),
	clazzId varchar2(40) references t_clazz(id),  --班级外键
	groupId varchar2(40) references t_group(id),  --小组外键
	cityId varchar2(40) references t_city(id)     --城市外键
);
--学生标签表 (关系表)
create table t_student_tag(
	sid varchar2(40) references t_student(id),  --学生外键
	tid varchar2(40) references t_tag(id),      --标签外键
	primary key (sid,tid)
);


