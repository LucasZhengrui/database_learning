-- 将student表中的stu_id属性定义为码
  -- 在列级定义主码
  create table student
  (
   stu_id char(9)primary key,
   stu_name char(20)not null,
   stu_sex char(2),
   stu_age smallint,
   stu_dept char(20)
  );
  -- 在表级定义主码
  CREATE TABLE Student
  (  
   stu_id char(9),
   stu_name char(20)not null,
   stu_sex char(2),
   stu_age smallint,
   stu_dept char(20),
   PRIMARY KEY (stu_id)
  ); 

-- 将elective_course表中的stu_id,course_id属性组定义为码
   CREATE TABLE elective_course
   (  stu_id CHAR(9)NOT NULL, 
      course_id CHAR(4)NOT NULL,  
      grade SMALLINT,
      PRIMARY KEY (stu_id,course_id)    /*只能在表级定义主码*/
   ); 

-- 添加主键约束
   -- 创建一个寝室表
   create table dormitory
   (
    stu_id char(9) not null,
	building_id char(5) not null,
	building_name char(20),
	dormitory_id char(20) not null,
   );
   -- 添加主键约束
   alter table dormitory
   add constraint pk_dormitory_id
   primary key(dormitory_id);
   -- 添加外键约束
   alter table dormitory
   add constraint fk_stu_id
   foreign key(stu_id) references student(stu_id);