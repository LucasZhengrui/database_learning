--������ͼ

--���ڵ������������ͼ

  --�����������ѧϵѧ������ͼ
  create view CS_Student
  as
    select stu_id,stu_name,stu_age
    from student
    where stu_dept='CS';

  --����
  select *
  from CS_Student;

  --stu_id	stu_name	stu_age
  --200215121	����    20
  --200215122	����    19

  --�����������ѧϵѧ������ͼ����Ҫ������޸ĺͲ������ʱ���豣֤����ͼֻ�м������ѧϵ��ѧ����
  create view CS_Student_1
  as
    select stu_id,stu_name,stu_age
    from student
    where stu_dept='CS'
    with check option;

  --����
  select *
  from CS_Student_1;

  --stu_id	stu_name	stu_age
  --200215121	����    20
  --200215122	����    19

--���ڶ�����������ͼ

  --�����������ѧϵѡ���˶��ſγ̵�ѧ������ͼ������ѧ�š��������ɼ�����
  create view CS_C1(stu_id,stu_name,grade)
  as
    select student.stu_id,student.stu_name,elective_course.grade
    from student,elective_course
    where stu_dept='CS'and student.stu_id=elective_course.stu_id and elective_course.course_id='2';
  
  --����
  select *
  from CS_C1;

  --stu_id	stu_name	grade
  --200215121	����                	85
  --200215122	����                	90

--������ͼ����ͼ

  --�����������ѧϵѡ���˶��ſγ��ҳɼ���90�����ϵ�ѧ������ͼ
  create view CS_C2_grade_90_up
  as
    select stu_id,stu_name,grade
	from CS_C1
	where grade>=90;

  --����
  select *
  from CS_C2_grade_90_up;

  --stu_id	stu_name	grade
  --200215122	����    90

--�����ʽ����ͼ

  --����һ����ӳѧ��������ݵ���ͼ
  create view BT_S(stu_id,stu_name,stu_birth)
  as
    select stu_id,stu_name,2019-stu_age
	from student;

  --����
  select *
  from BT_S;

  --stu_id	stu_name	stu_birth
  --200215121	����                	1999
  --200215122	����                	2000
  --200215123	����                	2001
  --200215125	����                	2000

--������ͼ

  --��ѧ����ѧ�ż�ƽ���ɼ�����Ϊһ����ͼ
  create view S_G(stu_id,grade_avg)
  as
    select stu_id,avg(grade)
	from elective_course
	group by stu_id;

  --����
  select *
  from S_G;

  --stu_id	grade_avg
  --200215121	88
  --200215122	85
  --200215123	80

--��student��������Ů����¼����Ϊһ����ͼ
create view female_student(female_stu_id,stu_sex,stu_age,stu_dept)
as
  --select *��PPT������δָ�������У��ᱨ��'female_student' �е��ж������б���ָ�����С��ʸ�Ϊ�£�
  select stu_id,stu_sex,stu_age,stu_dept
  from student
  where stu_sex='Ů';

--����
select*
from female_student;

--female_stu_id	stu_sex	stu_age	stu_dept
--200215122	Ů	19	CS                  
--200215123	Ů	18	MA                  