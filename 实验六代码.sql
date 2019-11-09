-- 1��	�����γ̵�ʵ��������, �Ϳγ̺�course_id�Ĳ���������;

  -- �������Լ����course_id��
  alter table course
  add constraint pk_course_id
  primary key(course_id);

  -- ���ÿγ�����Ψһ��
  alter table course 
  add constraint course_name
  unique (course_name);

  -- �γ̺�course_id�Ĳ���������
  alter table elective_course 
  add  constraint  FP_course_id
  foreign key (course_id) 
  references course(course_id);

-- 2��	��HRM���ݿ⣬��ϰ����������������Լ����ΨһԼ����ȡ��ֵԼ�����û��Զ����Լ�����ο�HRM���ݿ����ͼ��˵������

create database S1831050011_HRM_nodata --������S1831050011�����ݿ�
go

use S1831050011_HRM_nodata --ת����S1831050011�����ݿ�
go

create table Departments_1 --������Departments
(
	dept_id char(3) primary key,
	dept_name char(20) unique not null,
	note text 
)

create table Employee_1 --�ڡ�S1831050011�����ݿ��д�����Employee
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
)

create table Salary_1 -- ������Salary
(
	Employee_id char(6) not null,
	income float(8) not null check(income<=99999 and income>=0),
	outcome float(8) not null check(outcome<=99999 and outcome>=0),
	foreign key(Employee_id)references Employee_1(Employee_id)
);

-- 3��	����salary���Income�ֶ��޶���0-9999֮�䡣

alter table Salary
add constraint Income
check (Income<=9999 and Income>=0);