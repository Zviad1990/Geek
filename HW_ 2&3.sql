# ���� 3 .
# ������� 1. ����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� ����� � ��������

alter table users modify created_at DATETIME DEFAULT now();
alter table users modify updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

/* ������� 2. ������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR 
 * � � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". ���������� ������������� ���� � ���� DATETIME,
 *  �������� �������� ����� ��������
 */
#������������� ������ � ����� ������� ��������� ������� ��� �������, ��� �� ����� created_at � updated_at ���� �������� ����� ������
update users set created_at=STR_TO_DATE(created_at,'%d.%M.%Y %h:%i');
update users set updated_at=STR_TO_DATE(updated_at,'%d.%M.%Y %h:%i');

alter table users modify created_at DATETIME;
alter table users modify updated_at DATETIME;

/*������� 3. � ������� ��������� ������� � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������ ���������� � �����, ����� ���� �������.
 � ���� value ����� ����������� ����� ������ �����:
 *  0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������.
 *  ���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value.
 *  ������, ������� ������ ������ ���������� � �����, ����� ���� �������.
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


# ���� 4

/*������� 1 ����������� ������� ������� ������������� � ������� users
 */
SELECT
AVG(FLOOR ((TO_DAYS (NOW()) - TO_DAYS(birthday_at))/ 365.25 )) AS average_age
from users ;


/*������� 2. ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������.
 *  ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������
 */ 

select 
count(name) as count_user,
DAYNAME(concat(year(now()),substring(birthday_at,5,6))) as weekdays

from users
group by weekdays;



