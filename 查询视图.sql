-- ��ѯ��ͼ

  -- �ڼ������ѧϵѧ������ͼ���ҳ�����С��20���ѧ��
  select stu_id,stu_age
  from CS_Student
  where stu_age<20;

    -- stu_id	stu_age
    -- 200215122	19

	-- ��ͼ����ת����Ĳ�ѯ���Ϊ��
	select stu_id,stu_age
	from student
	where stu_dept='CS' and stu_age<20;

	  -- stu_id	stu_age
      -- 200215122	19
	  
  -- ��ѯѡ����1�ſγ̵ļ������ѧϵѧ��(�漰�������)
  select CS_Student.stu_id,CS_Student.stu_name
  from CS_Student,elective_course
  where CS_Student.stu_id=elective_course.stu_id and elective_course.course_id='1';

    -- stu_id	stu_name
    -- 200215121	����        

-- 	��ͼ���ⷨ�ľ���

  -- ��S_G��ͼ�в�ѯƽ���ɼ���85�����ϵ�ѧ��ѧ�ź�ƽ���ɼ�
  select *
  from S_G
  where grade_avg>=85;

    -- stu_id	grade_avg
    -- 200215121	88
    -- 200215122	85

    -- S_G��ͼ���Ӳ�ѯ����
    -- create view S_G(stu_id,grade_avg)
    -- as
    -- select stu_id,avg(grade)
    -- from elective_course
    -- group by stu_id;

  -- ����
  -- select stu_id,avg(grade)
  -- from elective_course
  -- where avg(grade)>=85
  -- group by stu_id;

    --����ԭ�򣺾ۺϲ�Ӧ������ WHERE �Ӿ��У����Ǹþۺ�λ�� HAVING �Ӿ��ѡ���б����������Ӳ�ѯ�У�����Ҫ������оۺϵ������ⲿ���á�

  -- ��ȷ��
  select stu_id,avg(grade)
  from elective_course
  group by stu_id
  having avg(grade)>=85;

    -- stu_id	(������)
    -- 200215121	88
    -- 200215122	85

  -- ��
  select *
  from (select stu_id,avg(grade)
        from elective_course
		group by stu_id) as S_G(stu_id,grade_avg)
  where grade_avg>=85;

  -- stu_id	grade_avg
  -- 200215121	88
  -- 200215122	85