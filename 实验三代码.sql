--1����S���в���Ԫ�顰s6��������40�����ݡ�
insert into Supply
values('S6','����',20,'����');

select *--����
from Supply;

--2����J���в���Ԫ�顰j8������������
insert into Project
values('J8','��������',NULL);

select*
from Project;

--3����ÿһ����Ӧ�̣�����Ϊ���ֹ��̹�Ӧ������������������˽���������ݿ�
create table quantity
(
Supply_id char(10),
quantity_all smallint
);
insert into quantity
select Supply_id,sum(distinct Quantity) as quantity_all
from Supply_Part_Project
group by Supply_id;
--����
select Supply_id,sum(distinct Quantity) as quantity_all
from Supply_Part_Project
group by Supply_id;

select *
from quantity;

--4����P����PNOֵΪp6��Ԫ���color����ֵ��Ϊ�̣�weight����ֵ��Ϊ60
update Part
set part_color='��',part_weight=60
where Part_id='P6';

--����
select*
from Part
where Part_id='P6';

--5����SPJ����ǰ4��Ԫ���qty����ֵͳһ�޸�Ϊ300
update Supply_Part_Project
set Quantity=300
where Supply_id='S1';

--����
select *
from Supply_Part_Project
where Supply_id='S1';

--6����S����city���������С������򡰽򡱵���Ӧstatus����ֵ����100
update Supply
set Supply_status=Supply_status+100
where Supply_city like '_��' or Supply_city like '_��';

--����
select *
from Supply;

--7������Ӧ��s2Ϊ��һ����������Ŀ����Ӧ����������޸�Ϊ2000
update Supply_Part_Project
set Quantity=2000
where Supply_id='S2' and Project_id in
(
 select Project.Project_id
 from Project
 where Project.Project_name='һ��'
);

--����
select *
from Supply_Part_Project;

--8����ȫ����ɫ�������ɫ�޸�Ϊǳ��ɫ
update Part
set part_color='ǳ��'
where part_color='��';

--����
select *
from Part;

--9����s5����j4�����p6��Ϊ��s3��Ӧ
update Supply_Part_Project
set Supply_id='S3'
where Supply_id='S5' and Project_id='J4' and Part_id='P6';

--����
select *
from Supply_Part_Project;

--10����SPJ��������һ��ΪSDATE�������У��Ըñ��е�ÿһԪ����SDATE������������ʵ�鵱ʱ�����ں�ʱ��
alter table Supply_Part_Project add Supply_date datetime;
update Supply_Part_Project
set Supply_date=getdate();

--����
select*
from Supply_Part_Project;

--11��ɾ�����ڳ���Ϊ�����ݡ��Ĺ�Ӧ�̼�¼��
delete from Supply 
where Supply_city ='����';  

--����
select*
from Supply;

--12��ɾ��������������е�һ����Ϊ���ݡ��ֵ������¼�����ڹ�Ӧ�������ɾ����Ӧ�ļ�¼
select *
from Part;
select *
from Supply;

--delete from Part,Supply_Part_Project using Part,Supply,Supply_Part_Project
--where Part.Part_ id=Supply_Part_Project.Part_id and Supply.Supply_id=Supply_Part_Project_id and Part.Part_id in
--(
 --select Part_name
 --from Part
 --where Part_name='��_' 
--)
delete from Supply_Part_Project
where Part_id in
(
 select Part_id
 from Part
 where Part_name like '��%' 
)
delete from Part
where Part_name like '��%';
--13��ɾ��s3��s4����Ӧ��Ϊ�����������̹�Ӧ����ĸ������˿�����������Ӧ��Ӧ���������Ϣ
delete 
from Supply_Part_Project
where (Supply_id='S3' or Supply_id='S4') 
and Project_id=(select Project_id from Project where Project_name ='����')
and Part_id in (select Part_id from Part where Part_name='��ĸ'or Part_name='��˿��')
