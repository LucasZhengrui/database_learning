select *
from Departments;

--dept_id	dept_name	note
--1  	    财务部      财务部
--2  	    研发部      研发部
--3  	    人力资源部  人力资源部

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

select *
from Salary;

--Employee_id	income	outcome
--1001  	3600	1500
--1002  	3300	1000
--1003  	3700	1200
--1004  	4500	1600
--2001  	4000	1600
--2003  	3800	1500
--2004  	5100	1800
--3001  	4200	2000
--3002  	4100	1800
--3003  	4600	1400