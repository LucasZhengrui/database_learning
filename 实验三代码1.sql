--1．在S表中插入元组“s6，华誉，40，广州”
insert into Supply
values('S6','华誉',20,'广州');

select *--检验
from Supply;

--2．在J表中插入元组“j8，传感器厂”
insert into Project
values('J8','传感器厂',NULL);

select*
from Project;

--3．对每一个供应商，求他为各种工程供应零件的总数量，并将此结果存入数据库
create table quantity
(
Supply_id char(10),
quantity_all smallint
);
insert into quantity
select Supply_id,sum(distinct Quantity) as quantity_all
from Supply_Part_Project
group by Supply_id;
--检验
select Supply_id,sum(distinct Quantity) as quantity_all
from Supply_Part_Project
group by Supply_id;

select *
from quantity;

--4．将P表中PNO值为p6的元组的color属性值改为绿，weight属性值改为60
update Part
set part_color='绿',part_weight=60
where Part_id='P6';

--检验
select*
from Part
where Part_id='P6';

--5．将SPJ表中前4个元组的qty属性值统一修改为300
update Supply_Part_Project
set Quantity=300
where Supply_id='S1';

--检验
select *
from Supply_Part_Project
where Supply_id='S1';

--6．将S表中city属性名含有“京”或“津”的相应status属性值增加100
update Supply
set Supply_status=Supply_status+100
where Supply_city like '_京' or Supply_city like '_津';

--检验
select *
from Supply;

--7．将供应商s2为“一汽”工程项目所供应的零件数量修改为2000
update Supply_Part_Project
set Quantity=2000
where Supply_id='S2' and Project_id in
(
 select Project.Project_id
 from Project
 where Project.Project_name='一汽'
);

--检验
select *
from Supply_Part_Project;

--8．将全部红色零件的颜色修改为浅红色
update Part
set part_color='浅红'
where part_color='红';

--检验
select *
from Part;

--9．由s5供给j4的零件p6改为由s3供应
update Supply_Part_Project
set Supply_id='S3'
where Supply_id='S5' and Project_id='J4' and Part_id='P6';

--检验
select *
from Supply_Part_Project;

--10．在SPJ表中新增一名为SDATE的属性列，对该表中的每一元组在SDATE属性列上填上实验当时的日期和时间
alter table Supply_Part_Project add Supply_date datetime;
update Supply_Part_Project
set Supply_date=getdate();

--检验
select*
from Supply_Part_Project;

--11．删除所在城市为“广州”的供应商记录、
delete from Supply 
where Supply_city ='广州';  

--检验
select*
from Supply;

/*--12．删除所有零件名称中第一个字为“螺”字的零件记录，并在供应情况表中删除相应的记录
delete from Part,Supply
where Part.Part_name='螺%' and Part.Part_id=

--13．删除s3和s4两供应商为“三建”工程供应“螺母”或“螺丝刀”零件的相应供应情况数据信息
delete from Supply_Part_Project
where Supply_id='S3' and Supply_id='S4' and */
