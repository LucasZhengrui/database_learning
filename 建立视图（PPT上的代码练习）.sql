--建立视图

--基于单个基本表的视图

  --建立计算机科学系学生的视图
  create view CS_Student
  as
    select stu_id,stu_name,stu_age
    from student
    where stu_dept='CS';

  --检验
  select *
  from CS_Student;

  --stu_id	stu_name	stu_age
  --200215121	李勇    20
  --200215122	刘晨    19

  --建立计算机科学系学生的视图，并要求进行修改和插入操作时仍需保证该视图只有计算机科学系的学生。
  create view CS_Student_1
  as
    select stu_id,stu_name,stu_age
    from student
    where stu_dept='CS'
    with check option;

  --检验
  select *
  from CS_Student_1;

  --stu_id	stu_name	stu_age
  --200215121	李勇    20
  --200215122	刘晨    19

--基于多个基本表的视图

  --建立计算机科学系选修了二号课程的学生的视图（包括学号、姓名、成绩）。
  create view CS_C1(stu_id,stu_name,grade)
  as
    select student.stu_id,student.stu_name,elective_course.grade
    from student,elective_course
    where stu_dept='CS'and student.stu_id=elective_course.stu_id and elective_course.course_id='2';
  
  --检验
  select *
  from CS_C1;

  --stu_id	stu_name	grade
  --200215121	李勇                	85
  --200215122	刘晨                	90

--基于视图的视图

  --建立计算机科学系选修了二号课程且成绩在90分以上的学生的视图
  create view CS_C2_grade_90_up
  as
    select stu_id,stu_name,grade
	from CS_C1
	where grade>=90;

  --检验
  select *
  from CS_C2_grade_90_up;

  --stu_id	stu_name	grade
  --200215122	刘晨    90

--带表达式的视图

  --定义一个反映学生出生年份的视图
  create view BT_S(stu_id,stu_name,stu_birth)
  as
    select stu_id,stu_name,2019-stu_age
	from student;

  --检验
  select *
  from BT_S;

  --stu_id	stu_name	stu_birth
  --200215121	李勇                	1999
  --200215122	刘晨                	2000
  --200215123	王敏                	2001
  --200215125	张立                	2000

--分组视图

  --将学生的学号及平均成绩定义为一个视图
  create view S_G(stu_id,grade_avg)
  as
    select stu_id,avg(grade)
	from elective_course
	group by stu_id;

  --检验
  select *
  from S_G;

  --stu_id	grade_avg
  --200215121	88
  --200215122	85
  --200215123	80

--将student表中所有女生记录定义为一个视图
create view female_student(female_stu_id,stu_sex,stu_age,stu_dept)
as
  --select *（PPT上如左未指定属性列，会报错：'female_student' 中的列多于列列表中指定的列。故改为下）
  select stu_id,stu_sex,stu_age,stu_dept
  from student
  where stu_sex='女';

--检验
select*
from female_student;

--female_stu_id	stu_sex	stu_age	stu_dept
--200215122	女	19	CS                  
--200215123	女	18	MA                  