-- 1)定义一个视图用以查看所有员工的编号、姓名和出生日期。
create view Employee_view
as
  select Employee_id,Employee_name,Employee_birth
  from Employee;

  -- 检验
  select *
  from Employee_view;

--Employee_id	Employee_name	Employee_birth
--1001  	李勇      	1978-03-12 00:00:00.000
--1002  	王敏      	1980-11-02 00:00:00.000
--1003  	刘晨      	1978-06-22 00:00:00.000
--1004  	周宏      	1983-10-03 00:00:00.000
--2001  	张立      	1978-08-01 00:00:00.000
--2002  	刘毅      	1982-01-23 00:00:00.000
--2003  	张玫      	1981-03-15 00:00:00.000
--2004  	王军      	1979-05-12 00:00:00.000
--3001  	徐静      	1976-08-12 00:00:00.000
--3002  	赵军      	1979-02-19 00:00:00.000
--3003  	王霞      	1982-08-18 00:00:00.000

-- 2)定义一个满足sex=’true’的员工的所有信息的视图。
create view sex_view
as
  select *
  from Employee
  where Employee_sex='1';

  -- 检验
  select *
  from sex_view;

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id
--1002  	王敏      	1980-11-02 00:00:00.000	1	河南                	475002	0378311     	wm@henu.edu.cn                	1  
--1004  	周宏      	1983-10-03 00:00:00.000	1	河北                	475004	7865987     	zh@ henu.edu.cn               	1  
--2003  	张玫      	1981-03-15 00:00:00.000	1	河南                	475007	0378355     	zm@henu.edu.cn                	2  
--3001  	徐静      	1976-08-12 00:00:00.000	1	河南                	475009	0378366     	xj@henu.edu.cn                	3  
--3003  	王霞      	1982-08-18 00:00:00.000	1	湖南                	475011	7556677     	wx@henu.edu.cn                	3  

-- 3)定义一个视图用以查看部门号码为‘2’的所有员工的姓名、电话和邮件地址。
create view departments_view
as
  select Employee_name,Employee_phone,Employee_email
  from Employee
  where dept_id='2';

  -- 检验
  select *
  from departments_view;

--Employee_name	Employee_phone	Employee_email
--张立      	0378333     	zl@henu.edu.cn                
--刘毅      	0378344     	ly@henu.edu.cn                
--张玫      	0378355     	zm@henu.edu.cn                
--王军      	5687967     	wj@henu.edu.cn

-- 4)定义一个视图用以查看所有员工的姓名、部门名及工资。
create view salary_view
as
  select Employee.Employee_name,Employee.dept_id,Salary.income-Salary.outcome as salary
  from Employee,Salary
  where Employee.Employee_id=Salary.Employee_id;

  -- 检验
  select *
  from salary_view;

--Employee_id	income	outcome	salary
--1001  	3600	1500	2100
--1002  	3300	1000	2300
--1003  	3700	1200	2500
--1004  	4500	1600	2900
--2001  	4000	1600	2400
--2002  	3800	1800	2000
--2003  	3800	1500	2300
--2004  	5100	1800	3300
--3001  	4200	2000	2200
--3002  	4100	1800	2300
--3003  	4600	1400	3200

-- 5)定义一个比所有财务部的雇员工资都高的雇员的信息的视图
  -- 增加一个列，表示工资 
  alter table Salary add salary float(8);

  -- 给新增加的列更新
  update Salary
  set salary=Salary.income-Salary.outcome;
  
  -- 检验1
  select *
  from Salary;

-- 建立视图
create view SalaryUpCaiWu_view
as
  select Employee.Employee_id,Employee_name,Employee_birth,Employee_sex,Employee_add,Employee_zip,Employee_phone,Employee_email,dept_id,salary
  from Employee,Salary
  where Salary.salary >
  (select max(Salary.salary)
   from Salary,Departments,Employee
   where Departments.dept_name='财务部' and Salary.Employee_id=Employee.Employee_id and Departments.dept_id=Employee.dept_id
   )and Salary.Employee_id=Employee.Employee_id

   -- 检验2
   select *
   from SalaryUpCaiWu_view;

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id	salary
--2004  	王军      	1979-05-12 00:00:00.000	0	山东                	475008	5687967     	wj@henu.edu.cn                	2  	3300
--3003  	王霞      	1982-08-18 00:00:00.000	1	湖南                	475011	7556677     	wx@henu.edu.cn                	3  	3200

-- 6)定义一个视图用以查看所有雇员的编号、姓名、年龄。

  -- 增加一个新的列（实验当时的系统年月日）
  alter table Employee add nowaday datetime;
  update Employee
  set nowaday=getyear();

  -- 检验1
  select *
  from Employee;

  create view age_view
  as
    select Employee_id,Employee_name,year(nowaday)-year(Employee_birth) as Employee_age
    from Employee;

  -- 检验2
  select *
  from age_view;

--Employee_id	Employee_name	Employee_age
--1001  	李勇      	41
--1002  	王敏      	39
--1003  	刘晨      	41
--1004  	周宏      	36
--2001  	张立      	41
--2002  	刘毅      	37
--2003  	张玫      	38
--2004  	王军      	40
--3001  	徐静      	43
--3002  	赵军      	40
--3003  	王霞      	37