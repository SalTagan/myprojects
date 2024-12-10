#1)     T_TAB1 – товары с описанием (тип товара, кол-во, сумма и продавец)
#2)     T_TAB2 – имена сотрудников, их возраст и заработная плата
 
T_TAB1
ID (number, unique) – уникальный идентификатор
GOODS_TYPE (varchar2) – тип проданного товара
QUANTITY (number) – количество проданного товара
AMOUNT (number) – суммарная стоимость товара
SELLER_NAME (varchar2) – имя продавца

 
CREATE TABLE T_TAB1 (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    GOODS_TYPE VARCHAR(20),
    QUANTITY INT,
    AMOUNT INT, 
    SELLER_NAME VARCHAR(10)
    );

INSERT INTO t_tab1(ID, GOODS_TYPE, QUANTITY, AMOUNT, SELLER_NAME)
VALUES(NULL, 'MOBILE PHONE', 2, 400000, 'MIKE'),
   (NULL, 'KEYBOARD', 1, 10000, 'MIKE'),
   (NULL, 'MOBILE PHONE', 1, 50000, 'JANE'),
   (NULL, 'MONITOR', 1, 110000, 'JOE'),
   (NULL, 'MONITOR', 2, 80000, 'JANE'),
   (NULL, 'MOBILE PHONE', 1, 130000, 'JOE'),
   (NULL, 'MOBILE PHONE', 1, 60000, 'ANNA'),
   (NULL, 'PRINTER', 1, 90000, 'ANNA'),
   (NULL, 'KEYBOARD', 2, 10000, 'ANNA'),
   (NULL, 'PRINTER', 1, 80000, 'MIKE');
   
SELECT * FROM t_tab1;

T_TAB2
ID (number, unique) – уникальный идентификатор
NAME (varchar2) – имя сотрудника
SALARY (number) – зарплата
AGE (number) – возраст

CREATE TABLE T_TAB2 (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(10),
    SALARY INT,
    AGE INT 
    );
    
INSERT INTO t_tab2(ID, NAME, SALARY, AGE)
VALUES(NULL, 'ANNA', 110000, 27),  
(NULL, 'JANE', 80000, 25),  
(NULL, 'MIKE', 120000, 25),
(NULL, 'JOE', 70000, 24),    
(NULL, 'RITA', 120000, 29);

SELECT * FROM t_tab2;

#1.Напишите запрос, который вернёт список уникальных категорий товаров (GOODS_TYPE).
#Какое количество уникальных категорий товаров вернёт запрос?  
SELECT DISTINCT GOODS_TYPE FROM t_tab1;
# ответ: 4

#2. Напишите запрос, который вернет суммарное количество и суммарную стоимость проданных мобильных телефонов.
# Какое суммарное количество и суммарную стоимость вернул запрос?
SELECT SUM(QUANTITY), SUM(AMOUNT) FROM t_tab1
WHERE GOODS_TYPE = 'MOBILE PHONE';
# ответ: 5, 640000

#3.Напишите запрос, который вернёт список сотрудников с заработной платой > 100000.
#Какое кол-во сотрудников вернул запрос?
SELECT NAME FROM t_tab2
WHERE SALARY > 100000;
# ответ: 3

#4.Напишите запрос, который вернёт минимальный и максимальный возраст сотрудников, а также минимальную и максимальную заработную плату.
SELECT MIN(AGE), MAX(AGE), MIN(SALARY), MAX(SALARY) FROM t_tab2;

#5. Напишите запрос, который вернёт среднее количество проданных клавиатур и принтеров.
SELECT AVG(QUANTITY) FROM t_tab1
WHERE GOODS_TYPE ='KEYBOARD' OR GOODS_TYPE ='PRINTER';

#6. Напишите запрос, который вернёт имя сотрудника и суммарную стоимость проданных им товаров.
SELECT SELLER_NAME, SUM(AMOUNT)
FROM t_tab1
GROUP BY 1;

#7. Напишите запрос, который вернёт имя сотрудника, тип товара, кол-во товара, стоимость товара, заработную плату и возраст сотрудника MIKE.
SELECT NAME, GOODS_TYPE, QUANTITY, AMOUNT, SALARY, AGE FROM t_tab1 t1
INNER JOIN t_tab2 t2 ON t1.SELLER_NAME = t2.NAME
WHERE NAME = 'MIKE';

#8. Напишите запрос, который вернёт имя и возраст сотрудника, который ничего не продал.
#Сколько таких сотрудников?

SELECT NAME, AGE FROM t_tab2 t2
LEFT JOIN t_tab1 t1 ON t1.SELLER_NAME = t2.NAME
WHERE t1.ID IS NULL;
# ответ: 1

#9.Напишите запрос, который вернёт имя сотрудника и его заработную плату с возрастом меньше 26 лет?
#Какое количество строк вернул запрос?

SELECT NAME, SALARY FROM t_tab2
WHERE AGE < 26;
# ответ: 3

#10. Сколько строк вернёт следующий запрос:
 
SELECT * FROM T_TAB1 t
JOIN T_TAB2 t2 ON t2.NAME = t.seller_name
WHERE t2.NAME = 'RITA';
# ответ: 0










 

   
    
