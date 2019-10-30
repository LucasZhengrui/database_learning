-- 查询视图

  -- 在计算机科学系学生的视图中找出年龄小于20岁的学生
  select stu_id,stu_age
  from CS_Student
  where stu_age<20;

    -- stu_id	stu_age
    -- 200215122	19

	-- 视图消解转换后的查询语句为：
	select stu_id,stu_age
	from student
	where stu_dept='CS' and stu_age<20;

	  -- stu_id	stu_age
      -- 200215122	19
	  
  -- 查询选修了1号课程的计算机科学系学生(涉及多表连接)
  select CS_Student.stu_id,CS_Student.stu_name
  from CS_Student,elective_course
  where CS_Student.stu_id=elective_course.stu_id and elective_course.course_id='1';

    -- stu_id	stu_name
    -- 200215121	李勇        

-- 	视图消解法的局限

  -- 在S_G视图中查询平均成绩在85分以上的学生学号和平均成绩
  select *
  from S_G
  where grade_avg>=85;

    -- stu_id	grade_avg
    -- 200215121	88
    -- 200215122	85

    -- S_G视图的子查询定义
    -- create view S_G(stu_id,grade_avg)
    -- as
    -- select stu_id,avg(grade)
    -- from elective_course
    -- group by stu_id;

  -- 错误：
  -- select stu_id,avg(grade)
  -- from elective_course
  -- where avg(grade)>=85
  -- group by stu_id;

    --报错原因：聚合不应出现在 WHERE 子句中，除非该聚合位于 HAVING 子句或选择列表所包含的子查询中，并且要对其进行聚合的列是外部引用。

  -- 正确：
  select stu_id,avg(grade)
  from elective_course
  group by stu_id
  having avg(grade)>=85;

    -- stu_id	(无列名)
    -- 200215121	88
    -- 200215122	85

  -- 或
  select *
  from (select stu_id,avg(grade)
        from elective_course
		group by stu_id) as S_G(stu_id,grade_avg)
  where grade_avg>=85;

  -- stu_id	grade_avg
  -- 200215121	88
  -- 200215122	85