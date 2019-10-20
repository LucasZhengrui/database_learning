create database S1831050011 --������S1831050011�����ݿ�
go

use S1831050011 --ת����S1831050011�����ݿ�
go

create table Departments --������Departments
(
	dept_id char(3) primary key,
	dept_name char(20) not null,
	note text 
)

create table Employee --�ڡ�S1831050011�����ݿ��д�����Employee
(
	Employee_id char(6) primary key,
	Employee_name char(10) not null,
	Employee_birth datetime not null,
	Employee_sex bit not null,
	Employee_add char(20),
	Employee_zip char(6),
	Employee_phone char(12),
	Employee_email char(30),
	dept_id char(3) not null references Departments
)

create table Salary -- ������Salary
(
	Employee_id char(6) not null references Employee,
	income float(8) not null,
	outcome float(8) not null,
)

insert into Departments(dept_id,dept_name,note)
values
    ('1','����','����'),
    ('2','�з���','�з���'),
    ('3','������Դ��','������Դ��');

insert into Employee( Employee_id ,Employee_name,Employee_birth,Employee_sex,Employee_add,Employee_zip,Employee_phone,Employee_email,dept_id)
values
    ('1001', '����', '78-3-12', '0', '����', '475001', '3880378', 'ly@henu.edu.cn', '1'),
    ('1002', '����', '80-11-2', '1', '����', '475002', '0378311', 'wm@henu.edu.cn', '1'),
    ('1003', '����', '78-6-22', '0', '����', '475003', '0378322', 'lc@henu.edu.cn', '1'),
    ('1004', '�ܺ�', '83-10-3', '1', '�ӱ�', '475004', '7865987', 'zh@ henu.edu.cn', '1'),
    ('2001', '����', '78-8-1', '0', '����', '475005', '0378333', 'zl@henu.edu.cn', '2'),
    ('2002', '����', '82-1-23', '0', '����', '475006', '0378344', 'ly@henu.edu.cn', '2'),
    ('2003', '��õ', '81-3-15', '1', '����', '475007', '0378355', 'zm@henu.edu.cn', '2'),
    ('2004', '����', '79-5-12', '0', 'ɽ��', '475008', '5687967', 'wj@henu.edu.cn', '2'),
    ('3001', '�쾲', '76-8-12', '1', '����', '475009', '0378366', 'xj@henu.edu.cn', '3'),
    ('3002', '�Ծ�', '79-2-19', '0', '����', '475010', '0378377', 'zj@henu.edu.cn', '3'),
    ('3003', '��ϼ', '82-8-18', '1', '����', '475011', '7556677', 'wx@henu.edu.cn', '3');

insert into Salary(Employee_id ,income,outcome)
values
    ('1001', '3600', '1500'),
    ('1002', '3300', '1000'),
    ('1003', '3700', '1200'),
    ('1004', '4500', '1600'),
    ('2001', '4000', '1600'),
    ('2002', '3800', '1800'),
    ('2003', '3800', '1500'),
    ('2004', '5100', '1800'),
    ('3001', '4200', '2000'),
    ('3002', '4100', '1800'),
    ('3003', '4600', '1400');