--a)	��ѯÿ����Ա��������������������=Income - Outcome��
select *,income-outcome as salary
from Employee,Salary
where Employee.Employee_id = Salary.Employee_id

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id	Employee_id	income	outcome	salary
--1001  	����      	1978-03-12 00:00:00.000	0	����                	475001	3880378     	ly@henu.edu.cn                	1  	1001  	3600	1500	2100
--1002  	����      	1980-11-02 00:00:00.000	1	����                	475002	0378311     	wm@henu.edu.cn                	1  	1002  	3300	1000	2300
--1003  	����      	1978-06-22 00:00:00.000	0	����                	475003	0378322     	lc@henu.edu.cn                	1  	1003  	3700	1200	2500
--1004  	�ܺ�      	1983-10-03 00:00:00.000	1	�ӱ�                	475004	7865987     	zh@ henu.edu.cn               	1  	1004  	4500	1600	2900
--2001  	����      	1978-08-01 00:00:00.000	0	����                	475005	0378333     	zl@henu.edu.cn                	2  	2001  	4000	1600	2400
--2002  	����      	1982-01-23 00:00:00.000	0	����                	475006	0378344     	ly@henu.edu.cn                	2  	2002  	3800	1800	2000
--2003  	��õ      	1981-03-15 00:00:00.000	1	����                	475007	0378355     	zm@henu.edu.cn                	2  	2003  	3800	1500	2300
--2004  	����      	1979-05-12 00:00:00.000	0	ɽ��                	475008	5687967     	wj@henu.edu.cn                	2  	2004  	5100	1800	3300
--3001  	�쾲      	1976-08-12 00:00:00.000	1	����                	475009	0378366     	xj@henu.edu.cn                	3  	3001  	4200	2000	2200
--3002  	�Ծ�      	1979-02-19 00:00:00.000	0	����                	475010	0378377     	zj@henu.edu.cn                	3  	3002  	4100	1800	2300
--3003  	��ϼ      	1982-08-18 00:00:00.000	1	����                	475011	7556677     	wx@henu.edu.cn                	3  	3003  	4600	1400	3200

--b)	��ѯ���񲿹�����2200Ԫ���ϵĹ�Ա�������������
select distinct Employee.Employee_name,Salary.income-Salary.outcome as salary
from Employee,Salary
where Employee.Employee_id=Salary.Employee_id and Salary.income-Salary.outcome >= '2200';

--Employee_name	salary
--����      	2500
--����      	3300
--����      	2300
--��ϼ      	3200
--�쾲      	2200
--����      	2400
--��õ      	2300
--�Ծ�      	2300
--�ܺ�      	2900

--c)	��ѯ�з�����1980����ǰ�����Ĺ�Ա�������乤������
select distinct Employee.Employee_name,Salary.income-Salary.outcome as salary
from Employee,Salary
where Employee.Employee_birth < '1980-01-01' and Employee.Employee_id=Salary.Employee_id and dept_id in
							(select dept_id
							from Departments
							where dept_name = '�з���'
							);

--Employee_name	salary
--����      	3300
--����      	2400

--d)	��ѯ������Դ����Ա����ߺ���͹���
select Salary.income-Salary.outcome as salary
from Salary,Departments,Employee
where Departments.dept_name='������Դ��' and Salary.Employee_id=Employee.Employee_id and Employee.dept_id=Departments.dept_id;
--�����飬��ʾ����������Դ����Ա�Ĺ������
select Salary.income-Salary.outcome as salary
from Salary
where Salary.income-Salary.outcome in
(select max(Salary.income-Salary.outcome)	
from Salary,Departments,Employee
where Departments.dept_name='������Դ��' and Salary.Employee_id = Employee.Employee_id and Employee.dept_id = Departments.dept_id
);
--salary
--3200
--������ʵ�ֳ���ʾ��߹��ʵ�Ŀ��

select max(Salary.income-Salary.outcome) as max_salary,min(Salary.income-Salary.outcome) as min_salary
from Salary,Departments,Employee
where Departments.dept_name='������Դ��' and Salary.Employee_id = Employee.Employee_id and Employee.dept_id = Departments.dept_id;
--max_salary	min_salary
--3200	2200
--����Ϊd)��Ŀ�����ղ�ѯ����

--e)	������Ա������������ɵ͵�������
select Employee.*,Salary.income-Salary.outcome as salary
from Employee,Salary
where Employee.Employee_id=Salary.Employee_id
order by Salary.income-Salary.outcome asc;

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id	salary
--2002  	����      	1982-01-23 00:00:00.000	0	����                	475006	0378344     	ly@henu.edu.cn                	2  	2000
--1001  	����      	1978-03-12 00:00:00.000	0	����                	475001	3880378     	ly@henu.edu.cn                	1  	2100
--3001  	�쾲      	1976-08-12 00:00:00.000	1	����                	475009	0378366     	xj@henu.edu.cn                	3  	2200
--3002  	�Ծ�      	1979-02-19 00:00:00.000	0	����                	475010	0378377     	zj@henu.edu.cn                	3  	2300
--2003  	��õ      	1981-03-15 00:00:00.000	1	����                	475007	0378355     	zm@henu.edu.cn                	2  	2300
--1002  	����      	1980-11-02 00:00:00.000	1	����                	475002	0378311     	wm@henu.edu.cn                	1  	2300
--2001  	����      	1978-08-01 00:00:00.000	0	����                	475005	0378333     	zl@henu.edu.cn                	2  	2400
--1003  	����      	1978-06-22 00:00:00.000	0	����                	475003	0378322     	lc@henu.edu.cn                	1  	2500
--1004  	�ܺ�      	1983-10-03 00:00:00.000	1	�ӱ�                	475004	7865987     	zh@ henu.edu.cn               	1  	2900
--3003  	��ϼ      	1982-08-18 00:00:00.000	1	����                	475011	7556677     	wx@henu.edu.cn                	3  	3200
--2004  	����      	1979-05-12 00:00:00.000	0	ɽ��                	475008	5687967     	wj@henu.edu.cn                	2  	3300

--f)	������ŵĹ�Ա��
select dept_id,count(Employee_id) as num
from Employee
group by dept_id;

--dept_id	num
--1  	4
--2  	4
--3  	3

--g)	�ҳ������ڲ��񲿺�������Դ�������Ĺ�Ա�ı��
select Departments.dept_name,Employee.Employee_id
from Employee,Departments
where Employee.dept_id=Departments.dept_id and Departments.dept_name in 
(select Departments.dept_name
 from Departments
 where Departments.dept_name='������Դ��' or Departments.dept_name='����'
);

--dept_name	Employee_id
--����              	1001  
--����              	1002  
--����              	1003  
--����              	1004  
--������Դ��          	3001  
--������Դ��          	3002  
--������Դ��          	3003  

--h)	ͳ��������Դ��������2500���Ϲ�Ա������
select count(distinct Employee.Employee_id) as num_2500_up
from Employee,Salary,Departments
where Departments.dept_name='������Դ��' and Departments.dept_id=Employee.dept_id and Salary.Employee_id=Employee.Employee_id and Salary.income-Salary.outcome in
(select Salary.income-Salary.outcome
from Salary
where Salary.income-Salary.outcome>='2500'
);

--num_2500_up
--1

--i)	����񲿹�Ա��������
select count(distinct Employee.Employee_id) as num_����
from Employee,Departments
where Departments.dept_name='����' and Employee.dept_id=Departments.dept_id;

--num_����
--4

--j)	����񲿹�Ա��ƽ������
select avg(distinct Salary.income-Salary.outcome) avg_����
from Employee,Salary,Departments
where Employee.dept_id=Departments.dept_id and Salary.Employee_id=Employee.Employee_id;

--avg_����
--2544.44444444444

--k)	���ұ����в��񲿵Ĺ�Ա���ʶ��ߵĹ�Ա������
select Employee.Employee_name
from Employee,Salary,Departments
where Departments.dept_id=Employee.dept_id and Employee.Employee_id=Salary.Employee_id and Departments.dept_name<>'����' and Salary.income-Salary.outcome>all
(select Salary.income-Salary.outcome
from Salary,Employee,Departments
where Departments.dept_name='����' and Departments.dept_id=Employee.dept_id and Employee.Employee_id=Salary.Employee_id);

--Employee_name
--����      
--��ϼ           

--l)	���Ҳ������䲻�����з������й�Ա����Ĺ�Ա������
select Employee.Employee_name
from Employee,Departments
where Employee.dept_id=Departments.dept_id and Departments.dept_name='����' and Employee.Employee_birth<=all
(select Employee.Employee_birth
from Departments,Employee
where dept_name='�з���' and Employee.dept_id=Departments.dept_id
);

--Employee_name
--����      
--����

--m)	�����ڲ��񲿹����Ĺ�Ա�����
select Employee.*
from Employee,Departments
where Employee.dept_id=Departments.dept_id and Departments.dept_name='����';

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id
--1001  	����      	1978-03-12 00:00:00.000	0	����                	475001	3880378     	ly@henu.edu.cn                	1  
--1002  	����      	1980-11-02 00:00:00.000	1	����                	475002	0378311     	wm@henu.edu.cn                	1  
--1003  	����      	1978-06-22 00:00:00.000	0	����                	475003	0378322     	lc@henu.edu.cn                	1  
--1004  	�ܺ�      	1983-10-03 00:00:00.000	1	�ӱ�                	475004	7865987     	zh@ henu.edu.cn               	1  