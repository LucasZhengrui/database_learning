-- 定义或添加默认值约束
  -- 给员工邮编号码赋予默认值‘516001’
  alter table Employee_1
  add constraint Employee_zip
  default '516001' for Employee_zip;

  -- 给员工电话号码赋予默认值‘0000000’
  alter table Employee_1
  add constraint Employee_phone
  default '0000000' for Employee_phone;

  -- 验证

  insert into Departments_1(dept_id,dept_name,note)
  values
    ('1','财务部','财务部'),
    ('2','研发部','研发部'),
    ('3','人力资源部','人力资源部');
  insert into Employee_1( Employee_id ,Employee_name,Employee_birth,Employee_sex,Employee_add,Employee_email,dept_id)
  values
  ('1001', '李勇', '78-3-12', '男', '河南', 'ly@henu.edu.cn', '1')
  -- 由于库中本无数据，所以出现如下错误：INSERT 语句与 FOREIGN KEY 约束"FK__Employee___dept___3E52440B"冲突。
  -- 该冲突发生于数据库"S1831050011_HRM_nodata"，表"dbo.Departments_1", column 'dept_id'，故加入所要求的表后重新调试。

  select*
  from Employee_1;
  -- Employee_id	Employee_name	Employee_birth	Employee_sex	Employee_add	Employee_zip	Employee_phone	Employee_email	dept_id
  -- 1001  	李勇      	1978-03-12 00:00:00.000	男	河南                	516001	0000000     	ly@henu.edu.cn                	1  
  -- PS.由于未输入邮编与电话号码，所以自动生成默认值，验证成功。
