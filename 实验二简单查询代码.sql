--��ϰ����򵥵Ĳ�ѯ��䣺
--a) ��ѯÿ����Ա��������Ϣ
select *
from Employee;

--Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id
--1001  	����      	1978-03-12 00:00:00.000	0	����                	475001	3880378     	ly@henu.edu.cn                	1  
--1002  	����      	1980-11-02 00:00:00.000	1	����                	475002	0378311     	wm@henu.edu.cn                	1  
--1003  	����      	1978-06-22 00:00:00.000	0	����                	475003	0378322     	lc@henu.edu.cn                	1  
--1004  	�ܺ�      	1983-10-03 00:00:00.000	1	�ӱ�                	475004	7865987     	zh@ henu.edu.cn               	1  
--2001  	����      	1978-08-01 00:00:00.000	0	����                	475005	0378333     	zl@henu.edu.cn                	2  
--2002  	����      	1982-01-23 00:00:00.000	0	����                	475006	0378344     	ly@henu.edu.cn                	2  
--2003  	��õ      	1981-03-15 00:00:00.000	1	����                	475007	0378355     	zm@henu.edu.cn                	2  
--2004  	����      	1979-05-12 00:00:00.000	0	ɽ��                	475008	5687967     	wj@henu.edu.cn                	2  
--3001  	�쾲      	1976-08-12 00:00:00.000	1	����                	475009	0378366     	xj@henu.edu.cn                	3  
--3002  	�Ծ�      	1979-02-19 00:00:00.000	0	����                	475010	0378377     	zj@henu.edu.cn                	3  
--3003  	��ϼ      	1982-08-18 00:00:00.000	1	����                	475011	7556677     	wx@henu.edu.cn                	3  

--b) ��ѯÿ����Ա�ĵ�ַ�͵绰
select Employee_add,Employee_phone
from Employee;

--Employee_add	Employee_phone
--����                	3880378     
--����                	0378311     
--����                	0378322     
--�ӱ�                	7865987     
--����                	0378333     
--����                	0378344     
--����                	0378355     
--ɽ��                	5687967     
--����                	0378366     
--����                	0378377     
--����                	7556677     

--c) ��ѯEmployeeIDΪ2001�Ĺ�Ա�ĵ�ַ�͵绰��
select Employee_add,Employee_phone
from Employee
where Employee_id='2001';

--Employee_add	Employee_phone
--����                	0378333   

--d) ��ѯŮ��Ա��ַ�͵绰������AS�Ӿ佫����и��еı���ֱ�ָ��Ϊ����ַ���͡��绰����
select Employee_add as address,Employee_phone as phone
from Employee
where Employee_sex='1';

--address	phone
--����                	0378311     
--�ӱ�                	7865987     
--����                	0378355     
--����                	0378366     
--����                	7556677  

--e) ����ÿ����Ա��ʵ�����롣
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

--f) �ҳ����������Ĺ�Ա�Ĳ��źš�
select dept_id
from Employee
where Employee_name like '��%';

--dept_id
--1  
--2  
--3  

--g���ҳ����е�ַ�к��С����ϡ��Ĺ�Ա�ĺ���Ͳ��źš�
select Employee_id,dept_id
from Employee
where Employee_add='����';

--Employee_id	dept_id
--1001  	1  
--1002  	1  
--1003  	1  
--2001  	2  
--2002  	2  
--2003  	2  
--3001  	3  
--3002  	3  
