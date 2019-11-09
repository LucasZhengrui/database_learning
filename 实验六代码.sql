-- 1．	建立课程的实体完整性, 和课程号course_id的参照完整性;

  -- 添加主键约束（course_id）
  alter table course
  add constraint pk_course_id
  primary key(course_id);

  -- 设置课程名的唯一性
  alter table course 
  add constraint course_name
  unique (course_name);

  -- 课程号course_id的参照完整性
  alter table elective_course 
  add  constraint  FP_course_id
  foreign key (course_id) 
  references course(course_id);

-- 2．	对HRM数据库，练习建立三个表的主外键约束、唯一约束、取空值约束、用户自定义的约束（参考HRM数据库表定义图中说明）；

create database S1831050011_HRM_nodata --创建“S1831050011”数据库
go

use S1831050011_HRM_nodata --转到“S1831050011”数据库
go

create table Departments_1 --创建表Departments
(
	dept_id char(3) primary key,
	dept_name char(20) unique not null,
	note text 
)

create table Employee_1 --在“S1831050011”数据库中创建表Employee
(
	Employee_id char(6) primary key,
	Employee_name char(10) not null,
	Employee_birth datetime not null,
	Employee_sex char(2) not null check(Employee_sex in ('男','女')),
	Employee_add char(20),
	Employee_zip char(6) unique not null,
	Employee_phone char(12) check(Employee_phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Employee_email char(30)unique,
	dept_id char(3) not null,
	foreign key(dept_id)references Departments_1(dept_id)
)

create table Salary_1 -- 创建表Salary
(
	Employee_id char(6) not null,
	income float(8) not null check(income<=99999 and income>=0),
	outcome float(8) not null check(outcome<=99999 and outcome>=0),
	foreign key(Employee_id)references Employee_1(Employee_id)
);

-- 3．	建立salary表的Income字段限定在0-9999之间。

alter table Salary
add constraint Income
check (Income<=9999 and Income>=0);