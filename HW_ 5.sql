

/* ���� 5. ��_1_��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.
 */


-- ������� �������� ������

/*

insert into orders(user_id) values 
(3),(4),(5),(6),(3),(4),(4),(5);

**/

select name 
from users 
where id in (
				select distinct user_id 
				from orders
			);


/* ���� 5. ��_2 �������� ������ ������� products � �������� catalogs, ������� ������������� ������.
 */


select pd.name ,ctl.name 
from products as pd
left join catalogs as ctl
on pd.catalog_id=ctl.id;

/* ���� 5. ��_ �� ������� 
����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name).
 ���� from, to � label �������� ���������� �������� �������, ���� name � �������. 
 �������� ������ ������ flights � �������� ���������� �������.
* */


/*��� ������� ��������� � ���� sample
 */


drop table if exists flights;
create table flights (
	  id SERIAL PRIMARY KEY,
	  from_ VARCHAR(255),
	  to_ VARCHAR(255));
	  
insert into flights(from_,to_) 
values 
('moscow','omsk'),
('novgorod','kazan' ),
( 'irkutsk','moscow'),
('omsk','irkutsk' ),
( 'moscow','kazan');
	  

select * from flights;
	  
drop table if exists cities;
create table cities (
	  id SERIAL PRIMARY KEY,
	  label VARCHAR(255),
	   name VARCHAR(255));

insert into cities(label,name)
values 
('moscow','������'),
('irkutsk','�������'),
('novgorod','��������'),
('kazan','������'),
('omsk','����');
	  
	 

select 
id,
(select name from cities where label = from_) as '������',
(select name from cities where label = to_)as '����'
from flights;





