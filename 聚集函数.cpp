/*聚集函数*/

/*计算教师的总人数*/
select count(*) as the_number_of_instructor
from instructor;

/*计算生物系开设课程的数量*/
select count(title) as the_number_of_class_of_Biology
from course
where dept_name='Biology';

/*计算所有教师工资的平均值*/
select avg(salary) as the_average_of_the_salary
from instructor;

/*计算所有教师中工资最高的人*/
select max(salary) as the_max_of_salary
from instructor;

/*计算所有教师工资的总额*/
select sum(salary) as the_sum_of_the_salary
from instructor;
