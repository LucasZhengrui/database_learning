-- 完整性约束命名子句

create database S1831050011_HRM_nodata1 --创建“S1831050011”数据库
go

use S1831050011_HRM_nodata1 --转到“S1831050011”数据库
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
	Employee_sex char(2) constraint C1 check(Employee_sex in ('男','女')) not null,
	Employee_add char(20),
	Employee_zip char(6) unique not null,
	Employee_phone char(12) constraint C2 check(Employee_phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Employee_email char(30)constraint C3 unique,
	dept_id char(3) not null,
	foreign key(dept_id)references Departments_1(dept_id)
)

create table Salary_1 -- 创建表Salary
(
	Employee_id char(6) not null,
	income float(8) constraint B1 not null check(income<=99999 and income>=0),
	outcome float(8) constraint B2 not null check(outcome<=99999 and outcome>=0),
	foreign key(Employee_id)references Employee_1(Employee_id)
);
-- 去掉Salary_1表中限制。
alter table Salary_1
drop constraint B1;

-- 增添限制
ALTER TABLE Employee_1
ADD CONSTRAINT C4 CHECK
(Employee_birth BETWEEN xxx AND xxx);
