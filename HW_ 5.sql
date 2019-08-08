

/* Урок 5. ДЗ_1_Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 */


-- вставим тестовые данные

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


/* Урок 5. ДЗ_2 Выведите список товаров products и разделов catalogs, который соответствует товару.
 */


select pd.name ,ctl.name 
from products as pd
left join catalogs as ctl
on pd.catalog_id=ctl.id;

/* Урок 5. ДЗ_ по желанию 
Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
 Поля from, to и label содержат английские названия городов, поле name — русское. 
 Выведите список рейсов flights с русскими названиями городов.
* */


/*Все таблицы создаются в базе sample
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
('moscow','Москва'),
('irkutsk','Иркутск'),
('novgorod','Новгород'),
('kazan','Казань'),
('omsk','Омск');
	  
	 

select 
id,
(select name from cities where label = from_) as 'Откуда',
(select name from cities where label = to_)as 'Куда'
from flights;





