-- 显式说明参照完整性的违约处理示例
create database S1831050011_HRM_nodata
go

use S1831050011_HRM_nodata 
go

create table Departments_1 --创建表Departments
(
	dept_id char(3) primary key,
	dept_name char(20) unique not null,
	note text 
)

create table Employee_1
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
	-- on delete cascade-- 级联删除Employee_1表中相应的元组
	-- on update cascade-- 级联更新Employee_1表中相应的元组
)

create table Salary_1 -- 创建表Salary
(
	Employee_id char(6) not null,
	income float(8) not null check(income<=99999 and income>=0),
	outcome float(8) not null check(outcome<=99999 and outcome>=0),
	foreign key(Employee_id)references Employee_1(Employee_id)
	-- on delete no action-- 当删除Employee_1表中的元组造成了与Salary_1表不一致时拒绝删除
	on delete cascade-- 级联删除Employee_1表中相应的元组
	on update cascade-- 当更新Employee_1表中的Employee_id时，级联更新Salary_1表中的相应的元组
);

-- 注：on delete no action，on delete cascade两者不能同时出现