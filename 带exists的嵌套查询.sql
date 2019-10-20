--带exists的嵌套查询
  --例3.63 查询至少选修了学生200215122选修的全部课程的学生号码
    select distinct stu_id
    from elective_course ECX
    where not exists
		  (select *
		   from elective_course ECY
		   where ECY.stu_id = '200215122' and not exists
				(select *
				 from elective_course ECZ
				 where ECZ.stu_id = ECX.stu_id and
					   ECZ.course_id = ECY.course_id)
		  );

      -- stu_id
      -- 200215121
      -- 200215122

  --用另一种除了exists嵌套查询的方法解决
    select stu_id
	from elective_course
	where course_id in
			(select course_id
			 from elective_course
			 where stu_id='200215122')
	group by stu_id;
-- stu_id
-- 200215121
-- 200215122
-- 200215123

--错误查询2
select stu_id
from elective_course
where stu_id in (select B.stu_id
				from elective_course A,elective_course B
				where A.stu_id='200215122'and A.course_id=B.course_id
				)
group by stu_id;

-- stu_id
-- 200215121
-- 200215122
-- 200215123

--错误查询3
select distinct stu_id
from elective_course
where course_id in(select course_id
from elective_course
where stu_id='200215122')and course_id not in('200215122')

-- stu_id
-- 200215121
-- 200215122
-- 200215123

--错误查询4
select distinct stu_id
from elective_course x
where course_id in(select course_id
				  from elective_course y
				  where x.course_id=y.course_id and x.stu_id!='200215122');
--group by stu_id;
-- stu_id
-- 200215121
-- 200215123

--用派生表的方法解决（正确的写法）
select b.stu_id
from (select *
	  from elective_course
	  where stu_id='200215122')as a left join elective_course b on a.course_id=b.course_id  --派生出一个a表
where b.stu_id!='200215122'
group by b.stu_id
having count(*)=(select count(*)
				 from elective_course
				 where stu_id='200215122');

         -- stu_id
         -- 200215121
