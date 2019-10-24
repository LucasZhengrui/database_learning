create database S1831050011_
go
use S1831050011_
go
create table Supply
(
 Supply_id char(10) primary key,
 Supply_name char(10) unique,
 Supply_status smallint,
 Supply_city char(5)
);

create table Part
(
Part_id char(4) primary key,
Part_name char(10),
part_color char(4),
part_weight smallint
);

create table Project
(
Project_id char(4) primary key,
Project_name char(10),
Project_city char(5)
);

create table Supply_Part_Project
(
 Supply_id char(10),
 Part_id char(4),
 Project_id char(4),
 Quantity smallint,
 primary key (Supply_id,Part_id,Project_id),
 foreign key (Supply_id) references Supply(Supply_id),
 foreign key (Part_id) references Part(Part_id),
 foreign key (Project_id) references Project(Project_id)
);

insert into Supply
values('S1','����',20,'���');

insert into Supply
values('S2','ʢ��',10,'����');

insert into Supply
values('S3','������',30,'����');

insert into Supply
values('S4','��̩ʢ',20,'���');

insert into Supply
values('S5','Ϊ��',30,'�Ϻ�');

insert into Part
values('P1','��ĸ','��',12);

insert into Part
values('P2','��˨','��',12);

insert into Part
values('P3','��˿��','��',12);

insert into Part
values('P4','��˿��','��',12);

insert into Part
values('P5','͹��','��',12);

insert into Part
values('P6','����','��',12);

insert into Project 
values('J1','����','����');

insert into Project
values('J2','һ��','����');

insert into Project
values('J3','���ɳ�','���');

insert into Project
values('J4','�촬��','���');

insert into Project
values('J5','������','��ɽ');

insert into Project
values('J6','���ߵ糧','����');

insert into Project
values('J7','�뵼�峧','�Ͼ�')

insert into Supply_Part_Project
values('S1','P1','J1',200);
insert into Supply_Part_Project
values('S1','P1','J3',100);
insert into Supply_Part_Project
values('S1','P1','J4',700);
insert into Supply_Part_Project
values('S1','P2','J2',100);
insert into Supply_Part_Project
values('S2','P3','J1',400);
insert into Supply_Part_Project
values('S2','P3','J2',200);
insert into Supply_Part_Project
values('S2','P3','J3',500);
insert into Supply_Part_Project
values('S2','P3','J4',400);
insert into Supply_Part_Project
values('S2','P5','J1',400);
insert into Supply_Part_Project
values('S2','P5','J2',100);
insert into Supply_Part_Project
values('S3','P1','J1',200);
insert into Supply_Part_Project
values('S3','P3','J1',200);
insert into Supply_Part_Project
values('S4','P5','J1',100);
insert into Supply_Part_Project
values('S4','P6','J3',300);
insert into Supply_Part_Project
values('S4','P6','J4',200);
insert into Supply_Part_Project
values('S5','P2','J4',100);
insert into Supply_Part_Project
values('S5','P3','J1',200);
insert into Supply_Part_Project
values('S5','P6','J2',200);
insert into Supply_Part_Project
values('S5','P6','J4',500);
