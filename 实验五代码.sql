-- 1)����һ����ͼ���Բ鿴����Ա���ı�š������ͳ������ڡ�
create view Employee_view
as
  select Employee_id,Employee_name,Employee_birth
  from Employee;

  -- ����
  select *
  from Employee_view;

--Employee_id	Employee_name	Employee_birth
--1001  	����      	1978-03-12 00:00:00.000
--1002  	����      	1980-11-02 00:00:00.000
--1003  	����      	1978-06-22 00:00:00.000
--1004  	�ܺ�      	1983-10-03 00:00:00.000
--2001  	����      	1978-08-01 00:00:00.000
--2002  	����      	1982-01-23 00:00:00.000
--2003  	��õ      	1981-03-15 00:00:00.000
--2004  	����      	1979-05-12 00:00:00.000
--3001  	�쾲      	1976-08-12 00:00:00.000
--3002  	�Ծ�      	1979-02-19 00:00:00.000
--3003  	��ϼ      	1982-08-18 00:00:00.000

-- 2)����һ������sex=��true����Ա����������Ϣ����ͼ��
create view sex_view
as
  select *
  from Employee
  where Employee_sex='1';

  -- ����
  select *
  from sex_view;

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id
--1002  	����      	1980-11-02 00:00:00.000	1	����                	475002	0378311     	wm@henu.edu.cn                	1  
--1004  	�ܺ�      	1983-10-03 00:00:00.000	1	�ӱ�                	475004	7865987     	zh@ henu.edu.cn               	1  
--2003  	��õ      	1981-03-15 00:00:00.000	1	����                	475007	0378355     	zm@henu.edu.cn                	2  
--3001  	�쾲      	1976-08-12 00:00:00.000	1	����                	475009	0378366     	xj@henu.edu.cn                	3  
--3003  	��ϼ      	1982-08-18 00:00:00.000	1	����                	475011	7556677     	wx@henu.edu.cn                	3  

-- 3)����һ����ͼ���Բ鿴���ź���Ϊ��2��������Ա�����������绰���ʼ���ַ��
create view departments_view
as
  select Employee_name,Employee_phone,Employee_email
  from Employee
  where dept_id='2';

  -- ����
  select *
  from departments_view;

--Employee_name	Employee_phone	Employee_email
--����      	0378333     	zl@henu.edu.cn                
--����      	0378344     	ly@henu.edu.cn                
--��õ      	0378355     	zm@henu.edu.cn                
--����      	5687967     	wj@henu.edu.cn

-- 4)����һ����ͼ���Բ鿴����Ա���������������������ʡ�
create view salary_view
as
  select Employee.Employee_name,Employee.dept_id,Salary.income-Salary.outcome as salary
  from Employee,Salary
  where Employee.Employee_id=Salary.Employee_id;

  -- ����
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

-- 5)����һ�������в��񲿵Ĺ�Ա���ʶ��ߵĹ�Ա����Ϣ����ͼ
  -- ����һ���У���ʾ���� 
  alter table Salary add salary float(8);

  -- �������ӵ��и���
  update Salary
  set salary=Salary.income-Salary.outcome;
  
  -- ����1
  select *
  from Salary;

-- ������ͼ
create view SalaryUpCaiWu_view
as
  select Employee.Employee_id,Employee_name,Employee_birth,Employee_sex,Employee_add,Employee_zip,Employee_phone,Employee_email,dept_id,salary
  from Employee,Salary
  where Salary.salary >
  (select max(Salary.salary)
   from Salary,Departments,Employee
   where Departments.dept_name='����' and Salary.Employee_id=Employee.Employee_id and Departments.dept_id=Employee.dept_id
   )and Salary.Employee_id=Employee.Employee_id

   -- ����2
   select *
   from SalaryUpCaiWu_view;

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id	salary
--2004  	����      	1979-05-12 00:00:00.000	0	ɽ��                	475008	5687967     	wj@henu.edu.cn                	2  	3300
--3003  	��ϼ      	1982-08-18 00:00:00.000	1	����                	475011	7556677     	wx@henu.edu.cn                	3  	3200

-- 6)����һ����ͼ���Բ鿴���й�Ա�ı�š����������䡣

  -- ����һ���µ��У�ʵ�鵱ʱ��ϵͳ�����գ�
  alter table Employee add nowaday datetime;
  update Employee
  set nowaday=getyear();

  -- ����1
  select *
  from Employee;

  create view age_view
  as
    select Employee_id,Employee_name,year(nowaday)-year(Employee_birth) as Employee_age
    from Employee;

  -- ����2
  select *
  from age_view;

--Employee_id	Employee_name	Employee_age
--1001  	����      	41
--1002  	����      	39
--1003  	����      	41
--1004  	�ܺ�      	36
--2001  	����      	41
--2002  	����      	37
--2003  	��õ      	38
--2004  	����      	40
--3001  	�쾲      	43
--3002  	�Ծ�      	40
--3003  	��ϼ      	37