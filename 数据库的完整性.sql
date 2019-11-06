-- ��student���е�stu_id���Զ���Ϊ��
  -- ���м���������
  create table student
  (
   stu_id char(9)primary key,
   stu_name char(20)not null,
   stu_sex char(2),
   stu_age smallint,
   stu_dept char(20)
  );
  -- �ڱ���������
  CREATE TABLE Student
  (  
   stu_id char(9),
   stu_name char(20)not null,
   stu_sex char(2),
   stu_age smallint,
   stu_dept char(20),
   PRIMARY KEY (stu_id)
  ); 

-- ��elective_course���е�stu_id,course_id�����鶨��Ϊ��
   CREATE TABLE elective_course
   (  stu_id CHAR(9)NOT NULL, 
      course_id CHAR(4)NOT NULL,  
      grade SMALLINT,
      PRIMARY KEY (stu_id,course_id)    /*ֻ���ڱ���������*/
   ); 

-- �������Լ��
   -- ����һ�����ұ�
   create table dormitory
   (
    stu_id char(9) not null,
	building_id char(5) not null,
	building_name char(20),
	dormitory_id char(20) not null,
   );
   -- �������Լ��
   alter table dormitory
   add constraint pk_dormitory_id
   primary key(dormitory_id);
   -- ������Լ��
   alter table dormitory
   add constraint fk_stu_id
   foreign key(stu_id) references student(stu_id);