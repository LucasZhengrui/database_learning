-- ������ͼ
  -- ���������ѧϵ��ͼCS_Student��ѧ����200215122����ѧ��������Ϊ����������
    update CS_Student
	set stu_name='����'
	where stu_id='200215122';

  -- ת��������
    -- update student
	-- set stu_name='����'
	-- where stu_id='200215122' and stu_dept='CS';

  -- ����
    -- ԭʼ

	select *
	from CS_Student;

	-- stu_id	stu_name	stu_age
    -- 200215121	����    20
    -- 200215122	����    19

	-- �ĺ�

	-- stu_id	stu_name	stu_age
    -- 200215121	����    20
    -- 200215122	����    19

  -- ��������ѧϵ��ͼCS_Student�в���һ���µ�ѧ����¼������ѧ��Ϊ��200215129��������Ϊ�����¡�������Ϊ20�ꡣ
  insert
  into CS_Student
  values('200215129','����',20);
    -- ���󣬴˾ٽ��µ���Ϣ���뵽�˻�����student�У���CS_Student��û�������Ϣ��
	-- ���������Զ���ͼ����ɾ���������»��ڻ�����student�ٴν��н�����ͼ�Ĳ�������ʵ�֡�ˢ�¡���ͼ��

  -- ת��Ϊ�Ի�����ĸ���
     -- insert
     -- into Student(stu_id,stu_name,stu_age,stu_dept)
     -- values('200215129','����',20,'CS');

  -- ����
    select *
    from CS_Student;

    --  stu_id	stu_name	stu_age
    -- 200215121	����                	20
    -- 200215122	����                	19

    select *
    from student;

    -- stu_id	stu_name	stu_sex	stu_age	stu_dept
    -- 200215121	����    ��	    20	CS                  
    -- 200215122	����    Ů	    19	CS                  
    -- 200215123	����    Ů	    18	MA                  
    -- 200215125	����    ��	    19	IS                  
    -- 200215129	����    NULL	20	NULL

  -- ɾ���������ѧϵѧ����ͼCS_Student��ѧ��Ϊ��200215129���ļ�¼
    delete
	from CS_Student
	where stu_id='200215129';
	-- �����(0 ����Ӱ��)
	-- ��Ϊ�Ϸ��޷���ӵ���ͼ�У��ʴ˴��޷�ɾ��(��ѧ����Ϣ�Դ����ڻ�����student����)

  -- ת��Ϊ�Ի�����ĸ���
    -- delete
	-- from student
	-- where stu_id='200215129' and stu_dept='CS';

	  -- ����

	  select *
	  from student;

	  -- stu_id	stu_name	stu_sex	stu_age	stu_dept
      -- 200215121	����    ��	    20	CS                  
      -- 200215122	����    Ů	    19	CS                  
      -- 200215123	����    Ů	    18	MA                  
      -- 200215125	����    ��	    19	IS                  
      -- 200215129	����    NULL	20	NULL

  -- S_GΪ���ɸ�����ͼ

    update S_G
    set grade_avg=90
    where stu_id='200215121';

    -- ��������ͼ���� 'S_G' �ĸ��»����ʧ�ܣ�������������������
    -- ������stu_id����student�������������������������

  -- ��elective_course�гɼ���ƽ���ɼ�֮�ϵ�Ԫ�鶨���һ����ͼ
    create view good_elective_course
	as
	select stu_id,course_id,grade
	from elective_course
	where grade>
	            (select avg(grade)
				 from elective_course);

    select*
	from good_elective_course;

    -- չʾ
	  -- stu_id	course_id	grade
      -- 200215121	1   	92
      -- 200215121	3   	88
      -- 200215122	2   	90