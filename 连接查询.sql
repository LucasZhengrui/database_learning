--将student和elective_course表连接，查询出选了课的学生各项信息
  select student.*,elective_course.*
  from student,elective_course
  where student.stu_id = elective_course.stu_id;

  // stu_id	stu_name	stu_sex	stu_age	stu_dept	stu_id	course_id	grade
  // 200215121	李勇     男	  20	    CS       200215121	1   	 92
  // 200215121	李勇     男	  20	    CS       200215121	2   	 85
  // 200215121	李勇     男	  20    	CS       200215121	3   	 88
  // 200215122	刘晨     女	  19   	  CS       200215122	2    	 90
  // 200215122	刘晨     女   	19   	  CS       200215122	3    	 80

--自然连接
  select student.stu_id,student.stu_name,student.stu_sex,student.stu_age,student.stu_dept,elective_course.course_id,elective_course.grade
  from student,elective_course
  where student.stu_id = elective_course.stu_id;

  // stu_id	stu_name	stu_sex	stu_age	stu_dept	course_id	grade
  // 200215121	李勇  男	        20	  CS       1   	     92
  // 200215121	李勇  男	        20	  CS       2   	     85
  // 200215121	李勇  男	        20 	  CS       3   	     88
  // 200215122	刘晨  女	        19	  CS       2   	     90
  // 200215122	刘晨  女	        19	  CS       3   	     80

--查询选修2号课程且成绩在90分及以上的所有学生的学号和姓名
  select student.stu_id,student.stu_name
  from student,elective_course
  where student.stu_id = elective_course.stu_id and elective_course.course_id = '2' and elective_course.grade>=90;

  // stu_id	    stu_name
  // 200215122	刘晨

--自身连接
  select first.course_id,second.course_pro_id
  from course first,course second
  where first.course_id=second.course_pro_id;

  // course_id	course_pro_id
  //      5   	5
  //      1   	1
  //      6   	6
  //      7   	7
  //      6   	6

--外连接
  select student.stu_id,student.stu_name,student.stu_sex,student.stu_age,student.stu_dept,elective_course.course_id,elective_course.grade
  from student left outer join elective_course on(student.stu_id=elective_course.stu_id);
// stu_id	stu_name	stu_sex	stu_age	stu_dept	course_id	grade
// 200215121	李勇  男	       20	    CS            1   	92
// 200215121	李勇  男	       20	    CS            2   	85
// 200215121	李勇  男	       20	    CS            3   	88
// 200215122	刘晨  女	       19	    CS            2   	90
// 200215122	刘晨  女	       19	    CS            3   	80
// 200215123	王敏  女	       18	    MA            NULL	NULL
// 200215125	张立  男        19	    IS            NULL	NULL

--多表连接(查询选了选修课的学生信息和课程的名字)
  select student.stu_id,student.stu_name,course.course_name,elective_course.grade
  from student,elective_course,course
  where student.stu_id = elective_course.stu_id and elective_course.course_id = course.course_id;

// stu_id	stu_name	course_name	grade
// 200215121	李勇   数据库      92
// 200215121	李勇   数学        85
// 200215121	李勇   信息系统    88
// 200215122	刘晨   数学        90
// 200215122	刘晨   信息系统    80
