select *
from Part;

--Part_id	Part_name	part_color	part_weight
--P1  	螺母      	红  	12
--P2  	螺栓      	绿  	12
--P3  	螺丝刀    	蓝  	12
--P4  	螺丝刀    	红  	12
--P5  	凸轮      	蓝  	12
--P6  	齿轮      	绿色	60

select *
from Project;

--Project_id	Project_name	Project_city
--J1  	三建      	北京 
--J2  	一汽      	长春 
--J3  	弹簧厂    	天津 
--J4  	造船厂    	天津 
--J5  	机车厂    	唐山 
--J6  	无线电厂  	常州 
--J7  	半导体厂  	南京 
--J8  	传感器厂  	NULL

select *
from Supply;

--Supply_id	Supply_name	Supply_status	Supply_city
--S1        	精益      	120	天津 
--S2        	盛锡      	110	北京 
--S3        	东方红    	130	北京 
--S4        	丰泰盛    	120	天津 
--S5        	为民      	30	上海 
--S6        	华誉      	20	广州 

select *
from Supply_Part_Project;

--Supply_id	Part_id	Project_id	Quantity
--S1        	P1  	J1  	300
--S1        	P1  	J3  	300
--S1        	P1  	J4  	300
--S1        	P2  	J2  	300
--S2        	P3  	J1  	400
--S2        	P3  	J2  	2000
--S2        	P3  	J3  	500
--S2        	P3  	J4  	400
--S2        	P5  	J1  	400
--S2        	P5  	J2  	2000
--S3        	P1  	J1  	200
--S3        	P3  	J1  	200
--S4        	P5  	J1  	100
--S4        	P6  	J3  	300
--S4        	P6  	J4  	200
--S5        	P2  	J4  	100
--S5        	P3  	J1  	200
--S5        	P6  	J2  	200
--S5        	P6  	J4  	500
