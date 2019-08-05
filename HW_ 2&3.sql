# УРОК 3 .
# Задание 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем

alter table users modify created_at DATETIME DEFAULT now();
alter table users modify updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

/* Задание 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
 * и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME,
 *  сохранив введеные ранее значения
 */
#Отформатируем данные и потом изменим структуру таблицы при условии, что до этого created_at и updated_at были строчным типом данных
update users set created_at=STR_TO_DATE(created_at,'%d.%M.%Y %h:%i');
update users set updated_at=STR_TO_DATE(updated_at,'%d.%M.%Y %h:%i');

alter table users modify created_at DATETIME;
alter table users modify updated_at DATETIME;

/*Задание 3. В таблице складских запасов В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
 в поле value могут встречаться самые разные цифры:
 *  0, если товар закончился и выше нуля, если на складе имеются запасы.
 *  Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
 *  Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/

insert into storehouses_products(storehouse_id,product_id,value) values 
(1,1,0),
(1,2,2500),
(2,1,0),
(2,2,30),
(1,1,500),
(1,2,1);


(select * from storehouses_products order by value limit 5 offset 2)
union all
(select * from storehouses_products where value=0);


# УРОК 4

/*Задание 1 Подсчитайте средний возраст пользователей в таблице users
 */
SELECT
AVG(FLOOR ((TO_DAYS (NOW()) - TO_DAYS(birthday_at))/ 365.25 )) AS average_age
from users ;


/*Задание 2. Подсчитайте количество дней рождения, которые приходятся на каждую из дней недели.
 *  Следует учесть, что необходимы дни недели текущего года, а не года рождения
 */ 

select 
count(name) as count_user,
DAYNAME(concat(year(now()),substring(birthday_at,5,6))) as weekdays

from users
group by weekdays;



