select  first.course_id,first.course_name,third.course_id,third.course_name
from course first,course second,course third
where first.course_pro_id=second.course_id and second.course_pro_id=third.course_id;
// course_id	 course_name	course_id	course_name
// 1   	      数据库           7   	PASCAL语言
// 3   	      信息系统         5   	 数据结构
// 5   	      数据结构         6   	 数据处理                                
