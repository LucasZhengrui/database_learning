-- group by
-- 查询选修各个课程的人数
select course_id,count(stu_id) as course_number
from elective_course
group by course_id;

// course_id	course_number
// 1   	        1
// 2   	        2
// 3   	        2

--查询选修了两门以上课程的学生信息
select elective_course.stu_id,student.stu_name
from elective_course,student
where elective_course.stu_id=student.stu_id
group by elective_course.stu_id,student.stu_name
having count(*)>1;

// stu_id	     stu_name
// 200215121	 李勇
// 200215122	 刘晨                
