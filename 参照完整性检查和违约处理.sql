-- ��ʽ˵�����������Ե�ΥԼ����ʾ��
create database S1831050011_HRM_nodata
go

use S1831050011_HRM_nodata 
go

create table Departments_1 --������Departments
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
	Employee_sex char(2) not null check(Employee_sex in ('��','Ů')),
	Employee_add char(20),
	Employee_zip char(6) unique not null,
	Employee_phone char(12) check(Employee_phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Employee_email char(30)unique,
	dept_id char(3) not null,
	foreign key(dept_id)references Departments_1(dept_id)
	-- on delete cascade-- ����ɾ��Employee_1������Ӧ��Ԫ��
	-- on update cascade-- ��������Employee_1������Ӧ��Ԫ��
)

create table Salary_1 -- ������Salary
(
	Employee_id char(6) not null,
	income float(8) not null check(income<=99999 and income>=0),
	outcome float(8) not null check(outcome<=99999 and outcome>=0),
	foreign key(Employee_id)references Employee_1(Employee_id)
	-- on delete no action-- ��ɾ��Employee_1���е�Ԫ���������Salary_1��һ��ʱ�ܾ�ɾ��
	on delete cascade-- ����ɾ��Employee_1������Ӧ��Ԫ��
	on update cascade-- ������Employee_1���е�Employee_idʱ����������Salary_1���е���Ӧ��Ԫ��
);

-- ע��on delete no action��on delete cascade���߲���ͬʱ����