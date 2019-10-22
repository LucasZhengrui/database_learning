--练习下面简单的查询语句：
--a) 查询每个雇员的所有信息
select *
from Employee;

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id
--1001  	李勇      	1978-03-12 00:00:00.000	0	河南                	475001	3880378     	ly@henu.edu.cn                	1  
--1002  	王敏      	1980-11-02 00:00:00.000	1	河南                	475002	0378311     	wm@henu.edu.cn                	1  
--1003  	刘晨      	1978-06-22 00:00:00.000	0	河南                	475003	0378322     	lc@henu.edu.cn                	1  
--1004  	周宏      	1983-10-03 00:00:00.000	1	河北                	475004	7865987     	zh@ henu.edu.cn               	1  
--2001  	张立      	1978-08-01 00:00:00.000	0	河南                	475005	0378333     	zl@henu.edu.cn                	2  
--2002  	刘毅      	1982-01-23 00:00:00.000	0	河南                	475006	0378344     	ly@henu.edu.cn                	2  
--2003  	张玫      	1981-03-15 00:00:00.000	1	河南                	475007	0378355     	zm@henu.edu.cn                	2  
--2004  	王军      	1979-05-12 00:00:00.000	0	山东                	475008	5687967     	wj@henu.edu.cn                	2  
--3001  	徐静      	1976-08-12 00:00:00.000	1	河南                	475009	0378366     	xj@henu.edu.cn                	3  
--3002  	赵军      	1979-02-19 00:00:00.000	0	河南                	475010	0378377     	zj@henu.edu.cn                	3  
--3003  	王霞      	1982-08-18 00:00:00.000	1	湖南                	475011	7556677     	wx@henu.edu.cn                	3  

--b) 查询每个雇员的地址和电话
select Employee_add,Employee_phone
from Employee;

--Employee_add	Employee_phone
--河南                	3880378     
--河南                	0378311     
--河南                	0378322     
--河北                	7865987     
--河南                	0378333     
--河南                	0378344     
--河南                	0378355     
--山东                	5687967     
--河南                	0378366     
--河南                	0378377     
--湖南                	7556677     

--c) 查询EmployeeID为2001的雇员的地址和电话。
select Employee_add,Employee_phone
from Employee
where Employee_id='2001';

--Employee_add	Employee_phone
--河南                	0378333   

--d) 查询女雇员地址和电话，并用AS子句将结果中各列的标题分别指定为“地址”和“电话”。
select Employee_add as address,Employee_phone as phone
from Employee
where Employee_sex='1';

--address	phone
--河南                	0378311     
--河北                	7865987     
--河南                	0378355     
--河南                	0378366     
--湖南                	7556677  

--e) 计算每个雇员的实际收入。
select Employee_id,income-outcome as realized_income
from Salary;

--realized_income
--2100
--2300
--2500
--2900
--2400
--2000
--2300
--3300
--2200
--2300
--3200

--f) 找出所有姓王的雇员的部门号。
select dept_id
from Employee
where Employee_name like '王%';

--dept_id
--1  
--2  
--3  

--g）找出所有地址中含有“河南”的雇员的号码和部门号。
select Employee_id,dept_id
from Employee
where Employee_add='河南';

--Employee_id	dept_id
--1001  	1  
--1002  	1  
--1003  	1  
--2001  	2  
--2002  	2  
--2003  	2  
--3001  	3  
--3002  	3  
