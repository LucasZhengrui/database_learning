-- ��������Ĭ��ֵԼ��
  -- ��Ա���ʱ���븳��Ĭ��ֵ��516001��
  alter table Employee_1
  add constraint Employee_zip
  default '516001' for Employee_zip;

  -- ��Ա���绰���븳��Ĭ��ֵ��0000000��
  alter table Employee_1
  add constraint Employee_phone
  default '0000000' for Employee_phone;

  -- ��֤

  insert into Departments_1(dept_id,dept_name,note)
  values
    ('1','����','����'),
    ('2','�з���','�з���'),
    ('3','������Դ��','������Դ��');
  insert into Employee_1( Employee_id ,Employee_name,Employee_birth,Employee_sex,Employee_add,Employee_email,dept_id)
  values
  ('1001', '����', '78-3-12', '��', '����', 'ly@henu.edu.cn', '1')
  -- ���ڿ��б������ݣ����Գ������´���INSERT ����� FOREIGN KEY Լ��"FK__Employee___dept___3E52440B"��ͻ��
  -- �ó�ͻ���������ݿ�"S1831050011_HRM_nodata"����"dbo.Departments_1", column 'dept_id'���ʼ�����Ҫ��ı�����µ��ԡ�

  select*
  from Employee_1;
  -- Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id
  -- 1001  	����      	1978-03-12 00:00:00.000	��	����                	516001	0000000     	ly@henu.edu.cn                	1  
  -- PS.����δ�����ʱ���绰���룬�����Զ�����Ĭ��ֵ����֤�ɹ���
