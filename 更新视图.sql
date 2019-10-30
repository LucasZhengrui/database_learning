-- 更新视图
  -- 将计算机科学系视图CS_Student中学生“200215122”的学生姓名改为“刘辰”。
    update CS_Student
	set stu_name='刘辰'
	where stu_id='200215122';

  -- 转换后的语句
    -- update student
	-- set stu_name='刘辰'
	-- where stu_id='200215122' and stu_dept='CS';

  -- 检验
    -- 原始

	select *
	from CS_Student;

	-- stu_id	stu_name	stu_age
    -- 200215121	李勇    20
    -- 200215122	刘晨    19

	-- 改后

	-- stu_id	stu_name	stu_age
    -- 200215121	李勇    20
    -- 200215122	刘辰    19

  -- 向计算机科学系视图CS_Student中插入一个新的学生记录，其中学号为“200215129”，姓名为“赵新”，年龄为20岁。
  insert
  into CS_Student
  values('200215129','赵新',20);
    -- 错误，此举将新的信息插入到了基本表student中，但CS_Student中没有相关信息。
	-- 分析，可以对视图进行删除后，在重新基于基本表student再次进行建立视图的操作即可实现“刷新”视图。

  -- 转换为对基本表的更新
     -- insert
     -- into Student(stu_id,stu_name,stu_age,stu_dept)
     -- values('200215129','赵新',20,'CS');

  -- 检验
    select *
    from CS_Student;

    --  stu_id	stu_name	stu_age
    -- 200215121	李勇                	20
    -- 200215122	刘辰                	19

    select *
    from student;

    -- stu_id	stu_name	stu_sex	stu_age	stu_dept
    -- 200215121	李勇    男	    20	CS                  
    -- 200215122	刘辰    女	    19	CS                  
    -- 200215123	王敏    女	    18	MA                  
    -- 200215125	张立    男	    19	IS                  
    -- 200215129	赵新    NULL	20	NULL

  -- 删除计算机科学系学生视图CS_Student中学号为“200215129”的记录
    delete
	from CS_Student
	where stu_id='200215129';
	-- 结果：(0 行受影响)
	-- 因为上方无法添加到视图中，故此处无法删除(该学生信息仍存在于基本表student表中)

  -- 转换为对基本表的更新
    -- delete
	-- from student
	-- where stu_id='200215129' and stu_dept='CS';

	  -- 检验

	  select *
	  from student;

	  -- stu_id	stu_name	stu_sex	stu_age	stu_dept
      -- 200215121	李勇    男	    20	CS                  
      -- 200215122	刘辰    女	    19	CS                  
      -- 200215123	王敏    女	    18	MA                  
      -- 200215125	张立    男	    19	IS                  
      -- 200215129	赵新    NULL	20	NULL

  -- S_G为不可更新视图

    update S_G
    set grade_avg=90
    where stu_id='200215121';

    -- 报错：对视图或函数 'S_G' 的更新或插入失败，因其包含派生域或常量域。
    -- 分析：stu_id既是student表的主键，又是其他表的外键。

  -- 将elective_course中成绩在平均成绩之上的元组定义成一个视图
    create view good_elective_course
	as
	select stu_id,course_id,grade
	from elective_course
	where grade>
	            (select avg(grade)
				 from elective_course);

    select*
	from good_elective_course;

    -- 展示
	  -- stu_id	course_id	grade
      -- 200215121	1   	92
      -- 200215121	3   	88
      -- 200215122	2   	90