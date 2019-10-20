-- 嵌套查询

-- 查询选修了课程编号为2的学生姓名（运用嵌套查询法,书上代码）
select stu_name    -- 外层查询或父查询
from student
where stu_id in
			(select stu_id   -- 内层查询或子查询
			 from elective_course
			 where course_id='2');
			 // stu_name
			 // 李勇
			 // 刘晨

-- 查询选修了课程编号为2的学生姓名（运用连接查询法，自己写的）
select student.stu_name
from student,elective_course
where student.stu_id=elective_course.stu_id
	  and elective_course.course_id='2'
group by student.stu_name
// stu_name
// 李勇
// 刘晨

-- 带有in谓词的子查询
  -- 查询与“刘晨”在同一个系学习的学生
    -- 1、确定“刘晨”所在系名
select stu_dept
from student
where stu_name='刘晨';
// stu_dept
// CS

    -- 2、查找所有在CS系学习的学生
select stu_id,stu_name,stu_dept
from student
where stu_dept='CS';
// stu_id	    stu_name	stu_dept
// 200215121	李勇         CS
// 200215122	刘晨         CS

    --将第一步查询嵌套到第二步查询的条件中
select stu_id,stu_name,stu_dept
from student
where stu_dept in
		(select stu_dept
		 from student
		 where stu_name='刘晨');
// 		 stu_id	stu_name	stu_dept
// 200215121	李勇         CS
// 200215122	刘晨         CS

  --查询与“刘晨”在同一个系学习的学生(用自身连接实现)
select first.stu_id,first.stu_name,first.stu_dept
from student first,student second
where first.stu_dept=second.stu_dept and second.stu_name='刘晨'
// stu_id	     stu_name	       stu_dept
// 200215121	李勇                	CS
// 200215122	刘晨                	CS
