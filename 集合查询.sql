--集合查询
  --例3.64查询计算机科学系的学生及年龄不大于19岁的学生
    select *
    from student
    where stu_dept='CS'
    union
    select *
    from student
    where stu_age<=19
    
//stu_id	stu_name	stu_sex	stu_age	stu_dept
//200215121	李勇	男	20	CS
//200215122	刘晨	女	19	CS
//200215123	王敏	女	18	MA
//200215125	张立	男	19	IS
    
  --查询既选修了课程1又选修了课程2的学生。就是查询选修课程1的学生集合与选修课程2的学生集合的交集
    select stu_id
    from elective_course
    where course_id='1'
    intersect
    select stu_id
    from elective_course
    where course_id='2' 
    
//stu_id
//200215121
