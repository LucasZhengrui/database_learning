--a)	查询每个雇员的情况及工资情况（工资=Income - Outcome）
select *,income-outcome as salary
from Employee,Salary
where Employee.Employee_id = Salary.Employee_id

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id	Employee_id	income	outcome	salary
--1001  	李勇      	1978-03-12 00:00:00.000	0	河南                	475001	3880378     	ly@henu.edu.cn                	1  	1001  	3600	1500	2100
--1002  	王敏      	1980-11-02 00:00:00.000	1	河南                	475002	0378311     	wm@henu.edu.cn                	1  	1002  	3300	1000	2300
--1003  	刘晨      	1978-06-22 00:00:00.000	0	河南                	475003	0378322     	lc@henu.edu.cn                	1  	1003  	3700	1200	2500
--1004  	周宏      	1983-10-03 00:00:00.000	1	河北                	475004	7865987     	zh@ henu.edu.cn               	1  	1004  	4500	1600	2900
--2001  	张立      	1978-08-01 00:00:00.000	0	河南                	475005	0378333     	zl@henu.edu.cn                	2  	2001  	4000	1600	2400
--2002  	刘毅      	1982-01-23 00:00:00.000	0	河南                	475006	0378344     	ly@henu.edu.cn                	2  	2002  	3800	1800	2000
--2003  	张玫      	1981-03-15 00:00:00.000	1	河南                	475007	0378355     	zm@henu.edu.cn                	2  	2003  	3800	1500	2300
--2004  	王军      	1979-05-12 00:00:00.000	0	山东                	475008	5687967     	wj@henu.edu.cn                	2  	2004  	5100	1800	3300
--3001  	徐静      	1976-08-12 00:00:00.000	1	河南                	475009	0378366     	xj@henu.edu.cn                	3  	3001  	4200	2000	2200
--3002  	赵军      	1979-02-19 00:00:00.000	0	河南                	475010	0378377     	zj@henu.edu.cn                	3  	3002  	4100	1800	2300
--3003  	王霞      	1982-08-18 00:00:00.000	1	湖南                	475011	7556677     	wx@henu.edu.cn                	3  	3003  	4600	1400	3200

--b)	查询财务部工资在2200元以上的雇员姓名及工资情况
select distinct Employee.Employee_name,Salary.income-Salary.outcome as salary
from Employee,Salary
where Employee.Employee_id=Salary.Employee_id and Salary.income-Salary.outcome >= '2200';

--Employee_name	salary
--刘晨      	2500
--王军      	3300
--王敏      	2300
--王霞      	3200
--徐静      	2200
--张立      	2400
--张玫      	2300
--赵军      	2300
--周宏      	2900

--c)	查询研发部在1980年以前出生的雇员姓名及其工资详情
select distinct Employee.Employee_name,Salary.income-Salary.outcome as salary
from Employee,Salary
where Employee.Employee_birth < '1980-01-01' and Employee.Employee_id=Salary.Employee_id and dept_id in
							(select dept_id
							from Departments
							where dept_name = '研发部'
							);

--Employee_name	salary
--王军      	3300
--张立      	2400

--d)	查询人力资源部雇员的最高和最低工资
select Salary.income-Salary.outcome as salary
from Salary
where Salary.income-Salary.outcome in
(select max(Salary.income-Salary.outcome)
from Salary,Departments,Employee
where Departments.dept_name='人力资源部' and Salary.Employee_id = Employee.Employee_id and Employee.dept_id = Departments.dept_id
)

--salary
--3200
--上述仅实现出显示最高工资的目的

--e)	将各雇员的情况按工资由低到高排列
--f)	求各部门的雇员数
--g)	找出所有在财务部和人力资源部工作的雇员的编号
--h)	统计人力资源部工资在2500以上雇员的人数
--i)	求财务部雇员的总人数
--j)	求财务部雇员的平均工资
--k)	查找比所有财务部的雇员工资都高的雇员的姓名
--l)	查找财务部年龄不低于研发部所有雇员年龄的雇员的姓名
--m)	查找在财务部工作的雇员的情况
