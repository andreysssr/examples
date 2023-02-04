<!-- 
 *   https://github.com/andreysssr/examples
-->

# SQL / MySQL

[Основы SQL](#basics_sql)    
- [01 Простые SQL запросы](#simple_sql_requests)  
- [02 Составные условия](#composite_conditions)  
- [03 Порядок AND и OR](#and_or)  
- [04 Сортировка результатов](#sorting_results)  
- [05 Ограничение выборки](#limitation_selections)  
- [06 CASE](#case)
- [07 Уникальные значения DISTINCT](#distinct)

[Добавление, изменение, удаление](#insert_update_delete)  
- [01 Добавление данных](#insert_data)  
- [02 Обновление данных](#update_data)  
- [03 Удаление данных](#delete_data)  

[Создание таблиц](#create_tables)  
- [01 Создание простейших таблиц](#create_simple_tables)  
- [02 Числовые поля](#numeric_fields)  
- [03 Параметр ZEROFILL](#zerofill)  
- [04 Строковые поля](#string_fields)  
- [05 Дата и время](#datetaime_fields)  
- [06 NULL](#null)  
- [07 NULL в SELECT запросах](#null_select)  
- [08 BOOL, ENUM, SET](#bool_enum_set)  
- [09 _TRUE_ и _FALSE_ в SELECT запросах](#true_false)  
- [10 Значения по умолчанию](#default) 

[Индексы](#indexes)  
- [01 Первичный ключ](#primary_key)  
- [02 Уникальный индекс](#unique_index)  
- [03 Обычные индексы](#ordinary_indexes)  
- [04 Добавление и удаление индексов](#add_delete_indexes)

[Изменение таблиц](#modify_tables)  
- [01 Добавление и удаление столбцов](#add_delete_col)  
- [02 Изменение столбцов](#modify_col)  
- [03 Изменение названия таблицы](#change_name_table) 

[Поиск текста](#search_text)  
- [01 Поиск с помощью LIKE](#like)  
- [02 Полнотекстовый поиск](#full_search)  

[Вспомогательные функции](#functions)  
- [01 Математические функции](#math_functions)  
- [02 Строковые функции](#string_functions)  
- [03 Функции даты](#date_functions)  
- [04 Сортировка по дате](#sort_functions)  

[Группировка данных](#group_data)  
- [01 COUNT, MIN, MAX, AVG](#count_min_max_avg)  
- [02 GROUP BY](#group-by)  
- [03 HAVING и WHERE](#having_where)  

[Многотабличные запросы](#multi_table_queries)  
- [01 Объединение с помощью UNION](#union)  
- [02 Объединение с помощью UNION сортировка](#union_sort)  
- [03 Объединение с помощью UNION группировка](#union_group)  
- [04 Отношение один к одному](#one_to_one)  
- [05 Внешний ключ](#foreign_key)  
- [06 Отношения один-ко-многим](#one_to_many)  
- [07 Создание связей один-ко-многим](#link_one_to_many)  
- [08 JOIN](#join)  
- [09 Понимание JOIN](#meaning_join)  
- [10 Понимание JOIN, часть 2](#meaning_join2)  
- [11 Выборка из трех и более таблиц](#multi_queries)  
- [12 Ссылочная целостность](#кeferential_integrity)  
- [13 Отношения многие ко многим](#many_to_many)  

[Вложенные запросы](#nested_queries)  
- [01 Простые вложенные запросы](#simple_nested_queries)  
- [02 IN, ANY, ALL](#in_any_all)  
- [03 Ключевое слово EXISTS](#exists)  
- [04 Запросы, возвращающие несколько столбцов](#select_col)  
- [05 Подзапросы в конструкции FROM](#from)  
- [06 Подзапросы в конструкции INSERT](#insert_select)  

[Продвинутый SQL](#advanced_SQL)  
- [01 Введение в транзакции](#transaction)  
- [02 ACID](#acid)  
- [03 Потерянное обновление](#lost_update)  

[Другие возможности SQL](#other_SQL_features)  
- [01 Хранимые процедуры](#stored_procedures)  
- [02 Транзакции в хранимых процедурах](#transaction_in_stored_procedures)  
- [03 Хранимые функции](#stored_functions)  
- [04 Переменные](#variables)  
- [05 Переменные в хранимых процедурах](#variables_in_stored_procedures)  
- [06 Триггеры](#triggers)  
- [07 Представления](#views)  
- [08 Ограничения и проверки](#restrictions_and_checks)  
- [09 Блокировка таблиц](#locking_tables)  
- [10 Анализ и оптимизация запросов - EXPLAIN](#explain)  

[Оконные функции](#window_functions)  
- [01 Введение в оконные функции](#introduction_to_window_functions)  
- [02 Знакомство с неагрегирующими функциями](#non_aggregating_functions)  
- [03 Сортировка в оконных функциях](#sort_window_functions)  
- [04 Фильтрация в оконных функциях](#filter_window_functions)  
- [05 Понимание окон](#understanding_window)  
- [06 Сортировка для агрегирующих функций](#sotr_for_aggregating)  
- [07 Группировка и оконные функции](#grouping_window_functions)  
- [08 Ранжирование с помощью RANK и DENSE_RANK](#ranking_rank)  
- [09 Именованные окна](#named_windows)  
- [10 Ранжирование с помощью NTILE](#ranking_ntile)  
- [11 Статистическое ранжирование](#statistical_ranking)  
- [12 Опережение и отставание](#advance_and_lag)  
- [13 Сравнение с первым и последним](#Comparison_first_and_last)  

[Дополнительно](#additionally)  
- [SQL Commands](#sql_commands)  
- [Ограничения](#limitations)  
- [Целостность данных](#data_integrity)  
- [Нормализация БД](#database_normalization)  
- [Синтаксис SQL](#sql_syntax)  
- [Операторы](#operators)  
- [Функции](#functions)  
- [Создание, удаление БД](#creat_delet_db)  
- [Выбор БД](#db_selection)  
- [Таблицы](#tables)  
- [Изменение таблицы](#changing_table)  
- [Подзапросы](#subqueries)  
- [Подзапросы в инструкции INSERT](#subqueries_insert)  


Комментарии

```sql
-- однострочный комментарий

/*
* многострочный комментарий
*/
```

---
<a name="basics_sql"><h1>Основы SQL</h1></a>

<a name="simple_sql_requests"><h2>01 Простые SQL запросы</h2></a>
```sql
# выбрать (все) столбцы из таблицы (users) 
SELECT * FROM users;

# выбрать столбцы (last_nae, first_name, birthday)  из таблицы (users)
SELECT last_nae, first_name, birthday FROM users;

# выбрать столбцы (last_nae, first_name, birthday)  из таблицы (users) с возрастом больше 18
SELECT last_nae, first_name, birthday FROM users WHERE age > 18;
```

<a name="composite_conditions"><h2>02 Составные условия</h2></a>

Конструкции для построения условий используются в блоке WHERE
```
AND  
OR  
IN (...)  
BETWEEN ... AND ...  
NOT BETWEEN ... AND ...  
```

Операторы в предложении where
```
Оператор | Проверка
----------------------            
=   Равенство            
<>  Неравенство          
!=  Неравенство          
<   Меньше               
<=  Меньше или равно     
!<  Не меньше
>   Больше               
>=  Больше или равно     
!>  Не больше

BETW EEN     Вхождение в диапазон
IS NULL      Значение NULL    
IS NOT NULL  Значение не NULL
```

```sql
SELECT 
    last_nae, first_name, birthday 
FROM 
    users
WHERE age >= 18 
AND gender = 'm';
```
```sql
SELECT * FROM products WHERE country = 'RU' OR country = 'UA' OR country = 'BL'; # страну Ru или UA или BL
SELECT * FROM products WHERE country IN ('RU', 'UA', 'BL'); # тоже самое что и предыдущее

SELECT * FROM products WHERE country IN ('RU', 'UA', 'BL') AND price < 10000;

SELECT * FROM products WHERE price >= 10000 AND price <= 20000;
SELECT * FROM products WHERE price BETWEEN 10000 AND 20000; # тоже самое что и предыдущее

SELECT * FROM products WHERE price BETWEEN 10000 AND 20000 OR country = 'RU';
```

<a name="and_or"><h2>03 Порядок AND и OR</h2></a>

```sql
SELECT * FROM team WHERE level = 'middle' OR level = 'senior';
SELECT * FROM team WHERE level IN ('middle', 'senior');

SELECT * FROM team 
WHERE (language = 'python' OR language = 'php') AND level = 'middle';
```
<a name="sorting_results"><h2>04 Сортировка результатов</h2></a>

```sql
SELECT
    last_nae, first_name, birthday
FROM
    users
WHERE 
    age >= 18
ORDER BY
    last_name DESC,
    first_name;
```
<a name="limitation_selections"><h2>05 Ограничение выборки</h2></a>

```sql
SELECT * FROM products WHERE count > 0 ORDER BY price DESC LIMIT 3; # получить 3 строки
SELECT * FROM products WHERE count > 0 ORDER BY price DESC LIMIT 3, 5; # пропустим 3 записи и получим 5 следующих
```

<a name="case"><h2>06 CASE</h2></a>

```sql
# в нужном столбце значение NULL меняем на другое значение
SELECT contact_name,
       city,
       CASE
           WHEN region IS NULL THEN 'not defined'
           else
               region
           end AS region
FROM customers;
```

```sql
SELECT contact_name, 
       country,
       CASE 
           WHEN country IN ('Argentina', 'Brazil') THEN 'South America'
           WHEN country = 'Canada' THEN 'North America'
           WHEN country IN ('Spain', 'Portugal') THEN 'Europe' end AS continent
FROM customers
WHERE country IN ('Argentina', 'Brazil', 'Canada', 'Spain', 'Portugal');
```

```sql
SELECT contact_name, 
       country,
       CASE 
           WHEN country IN ('Argentina', 'Brazil') THEN 'South America'
           WHEN country = 'Canada' THEN 'North America'
           else 'Europe' end AS continent
FROM customers
WHERE country IN ('Argentina', 'Brazil', 'Canada', 'Spain', 'Portugal');
```

```sql
SELECT continent, COUNT(cantactname)
FROM 
(SELECT contact_name, 
       country,
       CASE 
           WHEN country IN ('Argentina', 'Brazil') THEN 'South America'
           WHEN country = 'Canada' THEN 'North America'
           else 'Europe' end AS continent
FROM customers
WHERE country IN ('Argentina', 'Brazil', 'Canada', 'Spain', 'Portugal')) AS tmp_table
GROUP BY continent
ORDER BY continent;
```


<a name="distinct"><h2>07 Уникальные значения DISTINCT</h2></a>

```sql
SELECT DISTINCT * FROM orders;
```

---

<a name="insert_update_delete"><h2>Добавление, изменение, удаление</h2></a>

<a name="insert_data"><h2>01 Добавление данных</h2></a>

```sql
INSERT INTO users (id, first_name, last_nae, birthday) 
VALUES (7, 'Vasiliy', 'Pupkin', '1990-11-24');
```

Новые записи в таблицу можно добавить не только с помощью VALUES, но и с помощью SET.
Следующие два запроса идентичны:

```sql
INSERT INTO table (field1, field2) VALUES (value1, value2);
INSERT INTO table SET field1=value1, field2=value2;
```

<a name="update_data"><h2>02 Обновление данных</h2></a>

```sql
UPDATE products SET name = 'new_value' WHERE name = 'old_value';

UPDATE products SET price = price * 0.9 ORDER BY price DESC LIMIT 1;
UPDATE products SET price = price * 0.9;

UPDATE products SET count = 10, price = price + 5 WHERE id = 4;

UPDATE products SET price = price + (price * 0.05) ORDER BY price LIMIT 5;

UPDATE orders SET status = 'new' WHERE status IS NULL;

UPDATE products SET count = count + 40 WHERE id IN (3, 5);
```

<a name="delete_data"><h2>03 Удаление данных</h2></a>

```sql
DELETE FROM users WHERE last_visit_date IS NULL;       # данные отсутствуют
DELETE FROM users WHERE last_visit_date IS NOT NULL;    # данные есть

DELETE FROM users; # удалит все данные из таблицы
TRUNCATE TABLE cars;

DELETE FROM products WHERE count = 0;

DELETE FROM cars WHERE country = "KR" OR power < 80;

DELETE FROM cars WHERE country = "JP" OR (power < 80 OR power > 130);
```

---

<a name="create_tables"><h2>Создание таблиц</h2></a>

<a name="create_simple_tables"><h2>01 Создание простейших таблиц</h2></a>
```sql
CREATE TABLE user2 (
    id INT UNSIGNED,  
    first_name VARCHAR(20),
    last_name VARCHAR(50),
    birthday DATE,  # 1000-01-01 / 9999-12-31
    age TINYINT UNSIGNED,
    active BOOL
);

INSERT INTO user2 (id, first_name, last_name, birthday, age, active) 
VALUES (1, 'Дмитрий', 'Иванов', '1986-02-18', 31, TRUE);

CREATE TABLE films (
   id INT UNSIGNED,
   name VARCHAR(20),
   imdb_rating FLOAT,
   kinopoisk_rating FLOAT   
);

INSERT INTO films (id, name, imdb_rating, kinopoisk_rating) 
VALUES (1, 'Хакеры', 6.2, 7.12); 

INSERT INTO films (id, name, imdb_rating, kinopoisk_rating) 
VALUES (2, 'Мистер Робот', 8.6, 7.83);
```

<a name="numeric_fields"><h2>02 Числовые поля</h2></a>

| Data type     |Description   | UNSIGNED |
| ------------- |-------------|----------|
| TINYINT(size)	 | -128 to 127 |0 to 255|
| SMALLINT(size)	| -32768 to 32767 |0 to 65535|
| MEDIUMINT(size)	| -8388608 to 8388607 |0 to 16777215|
| INT(size)	| -2147483648 to 2147483647 |0 to 4294967295|
| BIGINT(size)	| -9223372036854775808 to 9223372036854775807 |0 to 18446744073709551615|

| Data type     |Description   |
| ------------- |-------------|
| FLOAT(size,d)	| Небольшое число с плавающей запятой. Максимальное количество цифр может быть указано в параметре размера. |
| DOUBLE(size,d)	| Большое число с плавающей запятой. Максимальное количество цифр может быть указано в параметре размера. |
| DECIMAL(size,d)	| DOUBLE хранится в виде строки с фиксированной десятичной точкой. Максимальное количество цифр может быть указано в параметре размера.|


```sql
CREATE TABLE payments (
    id INT UNSIGNED,
    user_id INT UNSIGNED,
    payments_date DATETIME,
    amount DECIMAL(10,2)
);

INSERT INTO payments (id, user_id, payments_date, amount) 
VALUES (1, 23, '2017-03-13 12:00', 345.24); 

INSERT INTO payments (id, user_id, payments_date, amount) 
VALUES (2, 12, '2017-03-13 12:10', 99999999.99);
```

<a name="zerofill"><h2>03 Параметр ZEROFILL</h2></a>
```
id INT(10) unsigned
field INT(11)
```

```sql
DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id INT UNSIGNED ZEROFILL,
    name VARCHAR(50),
    rating SMALLINT UNSIGNED ZEROFILL    
);

INSERT INTO posts (id, name, rating) 
VALUES 
    (1, 'SQL запросы для маркетологов', 1574),
    (2, 'Почему базы данных устарели', 789),
    (3, 'Репликация данных на несколько серверов', 0),
    (4, 'SQL запросы для web-разработчиков', 54);

DESCRIBE posts; # получить параметры таблицы
```

```sql
SELECT id, rating + 1 FROM posts; # вернёт значения из колонки rating на 1 больше чем в базе данных
```

<a name="string_fields"><h2>04 Строковые поля</h2></a>

| Тип колонки       | Описание |
|-------------------|----------|
| CHAR(size)        | Содержит строку фиксированной длины (может содержать буквы, цифры и специальные символы). Фиксированный размер указан в скобках. Может хранить до 255 символов                                                                                                                             |
| VARCHAR(size)     | Содержит строку переменной длины (может содержать буквы, цифры и специальные символы). Максимальный размер указан в скобках. Может хранить до 255 символов. Примечание. Если вы укажете значение больше 255, оно будет преобразовано в тип TEXT.                                           |
| TINYTEXT	         | Содержит строку с максимальной длиной 255 символов.                                                                                                                                                                                                                                        |
| TEXT	             | Содержит строку с максимальной длиной 65 535 символов.                                                                                                                                                                                                                                     |
| BLOB	             | Для больших двоичных объектов (больших двоичных объектов). Вмещает до 65 535 байт данных                                                                                                                                                                                                   |
| MEDIUMTEXT	       | Содержит строку с максимальной длиной 16 777 215 символов.                                                                                                                                                                                                                                 |
| MEDIUMBLOB	       | Для больших двоичных объектов (больших двоичных объектов). Вмещает до 16 777 215 байт данных                                                                                                                                                                                               |
| LONGTEXT	         | Содержит строку максимальной длиной 4 294 967 295 символов.                                                                                                                                                                                                                                |
| LONGBLOB	         | Для больших двоичных объектов (больших двоичных объектов). Вмещает до 4 294 967 295 байт данных                                                                                                                                                                                            |
| ENUM(x,y,z,etc.)	 | Список возможных значений. Вы можете указать до 65535 значений в списке ENUM. Если вставляется значение, которого нет в списке, будет вставлено пустое значение. Примечание. Значения сортируются в порядке их ввода. Вы вводите возможные значения в следующем формате: ENUM('X','Y','Z') |
| SET               | 	Аналогичен ENUM, за исключением того, что SET может содержать до 64 элементов списка и может хранить более одного варианта выбора.                                                                                                                                                        |

```sql
CREATE TABLE films (
    id INT UNSIGNED,
    name VARCHAR(50),
    description VARCHAR(255),
    full_description VARCHAR(255),
    imdb_rating FLOAT
);
```

<a name="datetaime_fields"><h2>05 Дата и время</h2></a>

| Тип колонки     | Описание                                                                                                                                                                                                                            |
| ------------- |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DATE()	| Дата. Формат: YYYY-MM-DD . Поддерживается диапазон от «1000-01-01» до «9999-12-31».                                                                                                                                                 |
| DATETIME()	| Комбинация даты и времени. Формат: YYYY-MM-DD HH:MI:SS . Поддерживаемый диапазон от '1000-01-01 00:00:00' до '9999-12-31 23:59:59'                                                                                                  |
| TIMESTAMP()	 | A timestamp. TIMESTAMP значения хранятся как количество секунд, прошедших с эпохи Unix ('1970-01-01 00:00:00' UTC). Формат: YYYY-MM-DD HH:MI:SS . Поддерживаемый диапазон от '1970-01-01 00:00:01' UTC до '2038-01-09 03:14:07' UTC |
| TIME()	| A time. Формат: HH:MI:SS . Поддерживаемый диапазон от '-838:59:59' до '838:59:59'                                                                                                                                                   |
| YEAR()	| Год. В двузначном или четырехзначном формате. Допустимые значения в четырехзначном формате: 1901 до 2155. Допустимые значения в двузначном формате: 70 до 69, представляющие годы от 1970 до 2069                                   |


```sql
CREATE TABLE payments (
    id INT UNSIGNED,
    user_id INT UNSIGNED,
    payment_date DATETIME(6),  # 3 для миллисекунд , 6 для микросекунд
    amount DECIMAL(10, 2)
);

INSERT INTO payments (id, user_id, payment_date, amount)
VALUES (3, 11, '2017-03-13 12:20:05.468645', 1000.00);
```

```sql
CREATE TABLE clicks (
    id INT UNSIGNED,
    banner_id INT UNSIGNED,
    click_date DATE,
    click_time TIME(3)
);

INSERT INTO clicks (id, banner_id, click_date, click_time) 
VALUES 
    (1, 1, '2017-04-12', '01:34:55'),
    (2, 1, '2017-04-12', '01:45:53.2'),
    (3, 1, '2017-04-13', '02:34:55.567'),
    (4, 1, '2017-04-14', '02:47:55.999812');
```

<a name="null"><h2>06 NULL</h2></a>
```sql
CREATE TABLE users (
    id INT UNSIGNED NOT NULL ,
    name VARCHAR(20) NOT NULL ,
    birthday DATE NULL ,
    gender VARCHAR(1) NULL
);

SELECT * FROM users WHERE gender IS NULL ;
SELECT * FROM users WHERE gender IS NOT NULL ;

DELETE FROM users WHERE last_visit_date IS NULL;
```

<a name="null_select"><h2>07 NULL в SELECT запросах</h2></a>
```sql
SELECT * FROM users WHERE gender != 'm' ;
SELECT * FROM users WHERE gender != 'm' OR  gender IS NULL ;
SELECT * FROM users WHERE gender != 'm' OR  gender IS NOT NULL ;
```

<a name="bool_enum_set"><h2>08 BOOL, ENUM, SET</h2></a>
```sql
# BOOL

CREATE TABLE users (
    id INT UNSIGNED,
    first_name VARCHAR(20),
    last_name VARCHAR(50),
    birthday DATE,
    age TINYINT UNSIGNED,
    active BOOL # в таблице представлен типом (TINYINT), TRUE - 1, FALSE - 0
);

INSERT INTO users (id, first_name, last_name, birthday, age, active)  
VALUES (10, 'Сергей', 'Николаев', '1990-02-15', 22, FALSE);

SELECT * FROM users WHERE active = TRUE;
SELECT * FROM users WHERE active = 1;
```

```sql
# ENUM - может принимать 1 значение

CREATE TABLE orders (
    id INT UNSIGNED NOT NULL,
    add_date DATETIME NOT NULL ,
    state ENUM ('new', 'confirmed', 'completed') NOT NULL 
);

INSERT INTO orders (id, add_date, state) 
VALUES (1, '2016-01-01', 'new')
```

```sql
# SET - может принимать несколько значений

CREATE TABLE rooms (
    id INT UNSIGNED NOT NULL ,
    price SMALLINT UNSIGNED,
    facilities SET('tv', 'wifi', 'bar') NOT NULL 
);

INSERT INTO rooms (id, price, facilities) 
VALUES 
    (1, 5000, 'tv,wifi'),
    (2, 7000, 'wifi,bar,tv'),
    (3, 3000, ''),
    (4, 4000, 'wifi');

SELECT * FROM rooms WHERE FIND_IN_SET('wifi', facilities);
SELECT * FROM rooms WHERE FIND_IN_SET('wifi', facilities) AND FIND_IN_SET('tv', facilities);
```

<a name="true_false"><h2>09 _TRUE_ и _FALSE_ в SELECT запросах</h2></a>
```sql
SELECT * FROM tasks WHERE completed = TRUE;
SELECT * FROM tasks WHERE completed = FALSE;

# Любая строка при сравнении с логическим типом будет считаться как FALSE
SELECT * FROM tasks WHERE completed = 'TRUE';   # не правильный запрос, выдаст записи с полем = 0
SELECT * FROM tasks WHERE completed = 'FALSE';  # не правильный запрос, выдаст записи с полем = 0

UPDATE tasks SET completed = TRUE WHERE id = 1;
```

```
Любая строка при сравнении с логическим типом будет считаться как FALSE

"TRUE"   \
"СТРОКА" -- FALSE
"FALSE"  /
```

<a name="default"><h2>10 Значения по умолчанию</h2></a>

```sql
DROP TABLE users;
```

```sql
CREATE TABLE users (
    id INT UNSIGNED NOT NULL ,
    name VARCHAR(20) NOT NULL DEFAULT '',
    birthday DATE NULL ,
    gender VARCHAR(1) NULL
);

INSERT INTO users (id, birthday) 
VALUES (1, NULL);
```

```sql
CREATE TABLE products (
    id INT UNSIGNED NOT NULL ,
    category_id INT UNSIGNED NULL ,
    name VARCHAR(50) NOT NULL ,
    count TINYINT NOT NULL DEFAULT 0,
    price DECIMAL(8, 2) NOT NULL DEFAULT 0.00
);

INSERT INTO products (id, category_id, name)
VALUES (1, 2, 'Honor 8');

INSERT INTO products (id, name)
VALUES (2, 'WD 2 Tb 8');
```

```sql
CREATE TABLE logs (
    id INT UNSIGNED NOT NULL ,
    create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_agent VARCHAR(100) NOT NULL DEFAULT ''
);

INSERT INTO logs (id,user_agent) 
VALUES (1, 'Chrome')
```

---
<a name="indexes"><h2>Индексы</h2></a>

<a name="primary_key"><h2>01 Первичный ключ</h2></a>

```sql
# Создание первичного ключа по одному полю

CREATE TABLE products (
    id INT UNSIGNED NOT NULL PRIMARY KEY ,
    name VARCHAR(50) NOT NULL
);

INSERT INTO products (id, name)  
VALUES 
    (1, 'Телевизор'),
    (2, 'Телевизор');
```

```sql
# Создание первичного ключа по двум полям

CREATE TABLE products (
    id INT UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id, name)
);
```

```sql
DROP TABLE products;
```

```sql
CREATE TABLE products (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO products (id, name)  
VALUES 
    ('Телевизор'),
    ('Холодильник'),
    ('Телефон');
```

```
Возможные имена первичных ключей

users
    user_id
    id_user
    id

products
    product_id
    id_product
    id
```

<a name="unique_index"><h2>02 Уникальный индекс</h2></a>

```sql
CREATE TABLE users (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL DEFAULT '',
    password VARCHAR(10) NOT NULL,
    UNIQUE KEY password (password) # создать уникальный индекс с названием password по колонке (password)
);

INSERT INTO users (first_name, last_name, password) 
VALUES 
    ('Иван', 'Редько', '3200111111'),
    ('Наталья', 'Смелая', '3200222222'),
    ('Анатолий', 'Венский', '3200333333'),
    ('Денис', 'Кирин', '3200333334'),
    ('Альбина', 'Шик', '3200555555');
```

```sql
CREATE TABLE passports (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL ,
    series VARCHAR(4) NOT NULL ,
    number VARCHAR(6) NOT NULL ,
    UNIQUE KEY passport (series, number) # создать уникальный индекс (passport) по двум колонками (series, number)
);

INSERT INTO passports (id, user_id, series, number) 
VALUES 
    (7, '3200', '222222'),
    (8, '3200', '333333');
```

```sql
DROP TABLE IF EXISTS passports;

CREATE TABLE passports (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL ,
    series VARCHAR(4) NOT NULL ,
    number VARCHAR(6) NOT NULL ,
   # PRIMARY KEY passport (series, number), # создать уникальный индекс по двум колонками
    UNIQUE KEY user_id (user_id),                     
    INDEX (id)                      
);

INSERT INTO passports (user_id, series, number) 
VALUES 
    (7, '3200', '222222'),
    (8, '3200', '333333'),
    (9, '3200', '222223');

DROP INDEX `PRIMARY` ON passports;
ALTER TABLE `passports` DROP PRIMARY KEY;
```

<a name="ordinary_indexes"><h2>03 Обычные индексы</h2></a>

```sql
# создание индекса при создании таблицы
CREATE TABLE cars (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dealer_id INT UNSIGNED,
    mark VARCHAR(100) NOT NULL ,
    model VARCHAR(100) NOT NULL ,
    year YEAR NULL ,
    INDEX marks_index (mark)
);
```

<a name="add_delete_indexes"><h2>04 Добавление и удаление индексов</h2></a>

Добавление индекса при создании таблицы  
```sql
CREATE TABLE cars (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dealer_id INT UNSIGNED,
    mark VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    year YEAR NULL,
    INDEX marks_index (mark)
);
```

Добавление индекса отдельным запросом
```sql
# создать индекс (marks_index) в таблице (cars) по колонке (mark) 
CREATE INDEX marks_index ON cars(mark); 

CREATE UNIQUE INDEX marks_index ON cars(mark);
```

```sql
# создание индекса/составного индекса (email_index) в таблице (users) по полю (email) и полю (name)
CREATE INDEX email_index ON users(email, name);

# создание уникального индекса (email_index) в таблице (users) по полю (email)
CREATE UNIQUE INDEX email_index ON users(email);
```

```sql
# удалить индекс (email_index) в таблице (users)
DROP INDEX email_index ON users;

# удалить индекс (marks_index) из таблицы cars
DROP INDEX marks_index ON cars;
```

```sql
# удаление первичных индексов
# удалить первичный ключ, имя индекса всегда PRIMARY должно быть указано как идентификатор в кавычках, поскольку PRIMARY это зарезервированное слово:
DROP INDEX `PRIMARY` ON passports;
ALTER TABLE passports DROP PRIMARY KEY;

# удаление индексов
# alter table `имя таблицы` drop index `имя 1 индекса`;
DROP INDEX user_id ON passports;
ALTER TABLE passports DROP INDEX user_id;
```

---
<a name="modify_tables"><h2>Изменение таблиц</h2></a>

<a name="add_delete_col"><h2>01 Добавление и удаление столбцов</h2></a>

```sql
CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL ,
    email VARCHAR(50) NOT NULL 
);

# добавить колонку (birthday) и заполнить её параметром по умолчанию
ALTER TABLE users 
ADD COLUMN birthday DATE NULL DEFAULT NULL;

# удалить колонку (birthday)
ALTER TABLE users 
DROP COLUMN birthday;
```

<a name="modify_col"><h2>Изменение столбцов</h2></a>

```sql
# изменяем свойства столбца (name)  в таблице (users)
ALTER TABLE users
MODIFY name VARCHAR(50);

# при изменение параметров колонки нужно указывать её тип и длину, а так же 
# изменяемые параметры, база данных сама определит что нужно менять, а что нет
ALTER TABLE users
MODIFY name VARCHAR(50) NOT NULL DEFAULT '';
```

```sql
# меняем название столбца (nmae) на (name)
# при такой модификации можно изменить свойства столбца VARCHAR, заполнение данными, значение по умолчанию
ALTER TABLE products 
CHANGE nmae name VARCHAR(50) NULL DEFAULT NULL;
```

<a name="change_name_table"><h2>03 Изменение названия таблицы</h2></a>

```sql
# переименовать таблицу (product) в (products)
RENAME TABLE product TO products;

# переименуем несколько таблиц
# таблицу (user) в таблицу (users), и таблицу (log) в таблицу (logs)
RENAME TABLE user TO users, log TO logs;
```

---

<a name="search_text"><h2>Поиск текста</h2></a>

<a name="like"><h2>01 Поиск с помощью LIKE</h2></a>

```
Для поиска текста могут испольоваться 
- LIKE 
- NOT LIKE
```

```sql
# сравнение происходит без учёта регистра
SELECT * FROM products WHERE name = 'Телевизор';

# сравнение происходит без учёта регистра
SELECT * FROM products WHERE name LIKE 'Телевизор';

# сравнение происходит c учётом регистра
SELECT * FROM products WHERE name LIKE BINARY 'Телевизор';

# сравнение происходит без учёта регистра где (name) не равен 'Телевизор'
SELECT * FROM products WHERE name NOT LIKE 'Телевизор';
```

Поиск с использованием спецсимволов

| Спецсимвол | Значение спецсимвола                                                                                 |
|------------|------------------------------------------------------------------------------------------------------|
| %          | заменяет любое количество символов, в том числе и отсутствие символа (цифры, буквы и другие символы) |
| _          | заменяет ровно 1 символ (цифра, буква или другие символы)                                            |

```sql
# найдёт (телевизор), (телефон), и т.д. без учёта регистра
# для учёта регистра нужно использовать (LIKE BINARY)
SELECT * FROM products WHERE name LIKE 'Тел%';

SELECT * FROM users WHERE password LIKE '3200%11';
SELECT * FROM users WHERE password LIKE '%11';
SELECT * FROM users WHERE password LIKE '%11%';

# получить колонки в которых номер телефона начинается на (89)
# это могут быть номера разной длинны, но все будут начинаться с 89
SELECT * FROM users WHERE phone LIKE '89%';

# найти номер в середине которого записан символ %
# для поиска символа (%) в запросе его нужно экранировать
SELECT * FROM users WHERE phone LIKE '%\%%';

# найти всех пользователей у которых в имени вторая буква - (н)
SELECT * FROM users WHERE name LIKE '_н%';

# получить колонки в которых номер телефона начинается на 89 и состоит из (6 чисел)
SELECT * FROM users WHERE phone LIKE '89____';

# получить шестизначные номера телефонов
SELECT * FROM users WHERE phone LIKE '______';

# получить номера телефонов которые состоят из любого количества кроме 6 чисел
SELECT * FROM users WHERE phone NOT LIKE '______';

# LIKE работает как со строковыми, так и с числовыми значениями
# найти id которые состоят из 2 цифр
SELECT * FROM users WHERE id LIKE '__';
```

<a name="full_search"><h2>02 Полнотекстовый поиск</h2></a>

```sql
SELECT * FROM products 
WHERE name LIKE '%микроволновая%';
```
Результаты могут быть такими

```
Микроволновая печь
Печь микроволновая
Микроволновая кухня
```

Перед использованием полнотекстового поиска необходимо создать  
полнотекстовый индекс при создании таблицы, либо добавить его к существующей.

```sql
CREATE TABLE forum (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    subject VARCHAR(255) NULL,
    author_id INTEGER NULL,
    post TEXT NULL,
    FULLTEXT INDEX forum_text(subject, post)
);
```

```sql
# создать полнотекстовый индекс (ind_name) по полю (name) в таблице (products)
CREATE FULLTEXT INDEX ind_name ON products(name);

# MATCH(name) - имя колонки по которой будет поиск
# AGAINST ('микроволновая печь') - ищет слова по отдельности которые есть в колонке (name)
# будут найдены колонки в которых есть хотя-бы одно слово из перечисленных в (AGAINST)
SELECT * FROM products
WHERE MATCH(name) AGAINST ('микроволновая печь');

# полнотекстовый поиск сортирует найденные записи по релевантности
# чем точнее найденное совпадение - тем выше запись

# для расширенного поиска включаем специальный режим (IN BOOLEAN MODE)
# + обязательное наличие слова при поиске
# - обязательное отсутствие слова при поиске
# ~ понизить релевантность слова
# * «товар*» будет равносилен словам «товар», «товары», «товарами» и тд.
# "" - '"Кремниевая долина"' - фраза в кавычках - ищет точную копию фразы
SELECT * FROM products
WHERE MATCH(name) AGAINST ('-микроволновая +печь' IN BOOLEAN MODE);
```

---

<a name="functions"><h2>Вспомогательные функции</h2></a>

<a name="math_functions"><h2>01 Математические функции</h2></a>

```sql
SELECT * FROM films ORDER BY rating DESC LIMIT 5;

# округлить значение до целого числа
SELECT id, name, ROUND(rating) FROM films ORDER BY rating DESC LIMIT 5;

# округлить значение с точностью до 1 числа после запятой
# ! вернёт поля 'id', 'name', 'ROUND(rating, 1)'
SELECT id, name, ROUND(rating, 1) FROM films ORDER BY rating DESC LIMIT 5;

# ! вернёт поля 'id', 'name', 'rating'
SELECT id, name, ROUND(rating, 1) AS rating FROM films ORDER BY rating DESC LIMIT 5;


SELECT id, name, 
    ROUND(rating, 1) AS rating,      # округляет до указанной точности
    rating AS raw_rating,            # оригинальное значение
    TRUNCATE(rating, 1) AS t_rating, # усекает число до указанного количества после запятой
    FLOOR(rating) AS f_rating,       # округляет до целого в меньшую сторону (убирает дробную часть)
    CEILING(rating)                  # округляет до целого в большую сторону (убирает дробную часть)
FROM films ORDER BY rating DESC LIMIT 5;
```

```
9 CEILING - потолок  
8.1  
8 FLOOR - пол  
```

```
MOD(N,M)
%
Значение по модулю (подобно оператору % в C). Возвращает остаток от деления N на M:
mysql> SELECT MOD(234, 10);
        -> 4

mysql> SELECT 253 % 7;
        -> 1

mysql> SELECT MOD(29,9);
        -> 2
```

```
ABS(X)
Возвращает абсолютное значение величины X:
mysql> SELECT ABS(2);
        -> 2
mysql> SELECT ABS(-32);
        -> 32
        
POW(X,Y)
POWER(X,Y)
Возвращает значение аргумента X, возведенное в степень Y:
mysql> SELECT POW(2,2);
        -> 4.000000

mysql> SELECT POW(2,-2);
        -> 0.250000        
```

<a name="string_functions"><h2>02 Строковые функции</h2></a>

```sql
# в поле (count_first_name) вернёт количество байт строки 
# ! для кириллических символов количество байт удваивается
SELECT id, first_name, LENGTH(first_name) AS count_first_name FROM users;

# для кириллических и латинских символов вернёт одинаковое количество - символов
SELECT id, first_name, CHAR_LENGTH(first_name) AS length FROM users;

# вернуть строки где длинна имени больше 4
SELECT id, first_name, CHAR_LENGTH(first_name) AS length FROM users
WHERE CHAR_LENGTH(first_name) > 4;

# CHAR_LENGTH - возвращает количество символов
# CONCAT - конкатенирует преданные строки
# LEFT - передаёт указанное количество символов с начала строки
SELECT id, first_name, 
       CHAR_LENGTH(first_name) AS length,
       CONCAT(TRIM(last_name), ' ', UPPER(LEFT(first_name, 1)), '.') as fi
FROM users
WHERE CHAR_LENGTH(first_name) > 4;
```

<a name="date_functions"><h2>03 Функции даты</h2></a>

```sql
# вернуть пользователей у которых сегодня день рождения
SELECT * , 
       YEAR(birthday) as year,
       MONTH(birthday) as month,
       DAY(birthday) as day
FROM users
WHERE MONTH(birthday) = 12 AND DAY(birthday) = 10;

# вернуть пользователей у которых сегодня день рождения
SELECT * ,
       YEAR(birthday) as year,
       MONTH(birthday) as month,
       DAY(birthday) as day
FROM users
WHERE MONTH(birthday) = MONTH(NOW()) AND DAY(birthday) = DAY(NOW());
```

Функции обработки данных DATATIME
```
DAY         вернуть день
MONTH       вернуть месяц  
YEAR        вернуть год
WEEK        вернуть неделю  
DAYNAME     вернуть название дня  
MONTHNAME   вернуть название месяца  
MINUTE      вернуть минуты  
SECOND      вернуть секунды  
HOUR        вернуть часы  
```

```sql
# вернуть пользователей которые зарегистрировались в течении этой недели
SELECT * FROM users
WHERE date_joined > NOW() - INTERVAL 7 DAY ;

# вывести дату которая закончится через месяц
SELECT * , date_joined + INTERVAL 1 MONTH as trial_end FROM users
WHERE date_joined > NOW() - INTERVAL 7 DAY;

# вывести дату которая закончится через месяц в отформатированном виде "день.месяц.год часы:секунды"
SELECT *, DATE_FORMAT(date_joined + INTERVAL 1 MONTH, "%d.%m.%Y %H:%i") as trial_end 
FROM users
WHERE date_joined > NOW() - INTERVAL 7 DAY ;
```

<a name="sort_functions"><h2>04 Сортировка по дате</h2></a>

```sql
SELECT id, DATE_FORMAT(date, '%d.%m.%Y') as date_format
FROM transactions
ORDER BY date;

SELECT id, DATE_FORMAT(date, '%d.%m.%Y') as date 
FROM transactions
ORDER BY transactions.date;
```

---

<a name="group_data"><h2>Группировка данных</h2></a>

<a name="count_min_max_avg"><h2>01 COUNT, MIN, MAX, AVG</h2></a>

Функции агрегации

```sql
# Получение сводных данных из таблицы
# получить максимальную цену
SELECT MAX(priсe) FROM products;

# получить минимальную, максимальную и среднюю цену
SELECT
    MIN(priсe) as min,              # минимальное значение в столбце
    MAX(priсe) as max,              # максимальное значение в столбце
    ROUND(AVG(price), 2) as avg,    # округляет среднее значение по столбцу с точностью до 2 знаков после точки
    COUNT(*) as count,              # подсчёт по всем строкам таблицы
    COUNT(stock) as stock_count,    # подсчёт по столбцу stock
    SUM(stock) as products,         # количество товаров на складе
    SUM(stock * price) as sum       # общая сумма всех товаров на складе
FROM products;
```

<a name="group"><h2>02 GROUP BY</h2></a>

```sql
# вывести сгруппированные результаты по полю (category_id) в таблице (products)
# выводить можно поле по которому проводилась группировка, а отбирать в условии можно по любым полям
# также к полям по которым не проводится группировка можно применить функции агрегации 
SELECT 
    category_id, 
    AVG(price), 
    COUNT(*),
    SUM(count),
    SUM(count * price)
FROM products
WHERE count > 0
GROUP BY category_id
ORDER BY SUM(count);


SELECT gender, COUNT(*)
FROM users
GROUP BY gender;


SELECT 
    YEAR(date_joined) as year, 
    COUNT(*) as users,
    gender,
    MONTH(date_joined) as month
FROM users
GROUP BY 
    YEAR(date_joined),
    MONTH(date_joined),
    gender;
```

<a name="having_where"><h2>03 HAVING и WHERE</h2></a>

```sql
SELECT 
    category_id, 
    COUNT(*) as cnt
FROM products
WHERE count > 0         # (WHERE) - использует значения колонок таблицы
GROUP BY category_id
HAVING cnt > 2          # (HAVING) то же самое что и (WHERE) только применяется к сгруппированным результатам
                        # использует результат группировки (cnt)
```

---
<a name="multi_table_queries"><h2>Многотабличные запросы</h2></a>

<a name="union"><h2>01 Объединение с помощью UNION</h2></a>

```sql
# выбирает данные из разных таблиц
SELECT * logs_2016 WHERE browser = 'Chrome'
UNION
SELECT * logs_2017 WHERE browser = 'Chrome'
UNION
SELECT * logs_2018 WHERE browser = 'Chrome';

# все таблицы должны возвращать одинаковое количество столбцов
# имена столбцов будут взяты из первой таблицы
SELECT id, name, pub_date, 'post' as type FROM posts
UNION
SELECT id, title, date, 'articles' FROM articles;

# вводим дополнительную колонку type и заполняем данными - чтобы различать данные от разных таблиц
SELECT * , 'bank' AS type FROM bank_transactions
UNION
SELECT * , 'cashbox' FROM cashbox_transactions;
```

<a name="union_sort"><h2>02 Объединение с помощью UNION_ сортировка</h2></a>

```sql
# получаем из каждой таблицы отсортированные данные
# затем сортируем общий результат (объединённых данных)
(SELECT id, name, pub_date as date, 'post' as type
FROM posts ORDER BY pub_date DESC LIMIT 2)
UNION
(SELECT id, title, date, 'article'
FROM articles ORDER BY date DESC LIMIT 2)
ORDER BY date DESC;


(SELECT id, name, pub_date as date, 'post' as type
 FROM posts)
UNION
(SELECT id, title, date, 'article'
 FROM articles)
ORDER BY date DESC LIMIT 4; # сортировка итоговых объединёных данных
```

<a name="union_group"><h2>03 Объединение с помощью UNION_ группировка</h2></a>

```sql
# Работа с промежуточной таблицей (entries) полученной через UNION

SELECT * FROM
(SELECT id, name, pub_date as date, 'post' as type FROM posts
UNION 
SELECT id, title, date, 'article' FROM articles) entries
ORDER BY date;
```

```sql
SELECT type, COUNT(*) FROM
(SELECT id, name, pub_date as date, 'post' as type FROM posts
UNION 
SELECT id, title, date, 'article' FROM articles) entries
GROUP BY type;
```

<a name="one_to_one"><h2>04 Отношение один к одному</h2></a>

```sql
SELECT * 
FROM users, users_data
WHERE users.id = users_data.id;

SELECT u.id, u.first_name, u.last_name, ud.bio
FROM users as u, users_data as ud
WHERE u.id = ud.id AND u.id > 2
ORDER BY u.last_name DESC; 
```

```sql
UPDATE users as u, users_data as ud 
SET 
    u.last_name = 'Абрабмова',
    ud.bio = 'Биография Натальи Абрамовой';
WHERE u.id = 3 AND u.id = ud.id
```

<a name="foreign_key"><h2>05 Внешний ключ</h2></a>

```sql
DROP TABLE IF EXISTS users_data;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL ,
    last_name VARCHAR(50) NOT NULL ,
    date_joined DATETIME NOT NULL 
);

CREATE TABLE users_data (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bio TEXT NOT NULL,
    FOREIGN KEY (id) REFERENCES users(id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE              
); 

INSERT INTO users (first_name, last_name, date_joined)
VALUES ('Иван', 'Васильевич', '2017-01-01');
INSERT INTO users_data SET bio = 'Биография';

INSERT INTO users (first_name, last_name, date_joined)
VALUES ('Светлана', 'Нагиева', '2017-01-02');
INSERT INTO users_data SET bio = 'Биография Светланы';

INSERT INTO users (first_name, last_name, date_joined)
VALUES ('Виктор', 'Степаненко', '2017-01-03');
INSERT INTO users_data SET bio = 'Биография Виктора';
```

```sql
INSERT INTO users_data(id, bio)
VALUES (LAST_INSERT_ID(), 'Биография Дениса')
```

<a name="one_to_many"><h2>06 Отношения один-ко-многим</h2></a>

```sql
SELECT p.id, p.title, u.last_name, u.first_name
FROM post AS p, users AS u 
WHERE u.id = p.user_id
ORDER BY p.id;
```

```sql
SELECT * 
FROM
    comments as c,
    posts as p,
    users as u
WHERE c.user_id = u.id AND c.post_id = p.id;

# оптимизация получаемых параметров
SELECT 
    p.id as post_id,
    c.id as comments_id,
    c.comments,
    p.title,
    u.last_name,
    u.first_name
FROM
    comments as c,
    posts as p,
    users as u
WHERE c.user_id = u.id AND c.post_id = p.id;
```

```sql
# сгруппировать по количеству комментариев 
SELECT p.id, p.title, COUNT(c.id) as comments
FROM posts as p, comments as c 
WHERE c.post_id = p.id
GROUP BY c.post_id
```

<a name="link_one_to_many"><h2>07 Создание связей один-ко-многим</h2></a>

```sql
# добавляем поле
ALTER TABLE posts 
ADD COLUMN user_id INT UNSIGNED NULL;
UPDATE posts SET user_id = 1;

# добавляем внешний ключ
ALTER TABLE posts 
ADD FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE SET NULL;

INSERT INTO posts (title, text, uaer_id)
VALUES 
    ('Пост 4', 'Текст поста 4', 3),
    ('Пост 5', 'Текст поста 5', 2),
    ('Пост 6', 'Текст поста 6', 3),
    ('Пост 7', 'Текст поста 7', 4),
    ('Пост 8', 'Текст поста 8', NULL);
```

```sql
CREATE TABLE comments (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NULL ,
    post_id INT UNSIGNED NOT NULL ,
    text TEXT NOT NULL ,
    FOREIGN KEY (user_id) 
        REFERENCES users(id)
        ON DELETE SET NULL,
    FOREIGN KEY (post_id)
        REFERENCES posts(id)
        ON DELETE CASCADE                         
);

INSERT INTO comments (id, user_id, post_id, text)
VALUES 
    (3, 4, 'Комментарий 1'),
    (2, 3, 'Комментарий 2'),
    (2, 4, 'Комментарий 3'),
    (3, 1, 'Комментарий 4'),
    (4, 5, 'Комментарий 5'),
    (2, 2, 'Комментарий 6');
```

<a name="join"><h2>08 JOIN</h2></a>

Синтаксис JOIN
```sql
SELECT fieldA, fieldB
FROM table1
JOIN table2
ON fieldA = fieldB 
```

```sql
SELECT p.id, p.title, u.last_name, u.first_name
FROM posts as p
JOIN users as u ON u.id = p.user_id
WHERE u.first_name = 'Лидия'
ORDER BY p.id DESC;
```

```sql
SELECT 
    p.id, 
    p.name, 
    p.price,
    cats.name as category
FROM 
    products as p, 
    categories as cats
WHERE
    p.category_id = cats.id AND
    cats.parent_id IS NULL
```

```sql
SELECT
    p.id,
    p.name,
    p.price,
    c.name as category
FROM
    products as p,
    categories as c
WHERE
    p.category_id = c.id AND
    c.parent_id IS NULL
```

```sql
SELECT *
FROM
    products as p,
    categories as c
# WHERE p.category_id = c.id
WHERE c.id = p.category_id;
```

```sql
SELECT p.id, p.name, p.count, p.price, c.name as category
FROM
    products as p
LEFT JOIN categories as c
ON p.category_id = c.id
WHERE c.parent_id IS NOT NULL
ORDER BY p.count;
```

```sql
SELECT c.*, u.*, p.* 
FROM comment as c 
JOIN users as u ON u.id = c.user_id
JOIN posts as p ON p.id = c.post_id;
```

```sql
SELECT c.id as comment_id,
p.id as post_id, 
c.comment,
CONCAT(u.first_name, ' ', u.last_name) as comment_user,
p.title as post_title
FROM comments as c 
JOIN users as u ON u.id = c.user_id 
JOIN posts as p ON p.id = c.post_id
WHERE u.id = 3 AND p.id = 2
ORDER BY comment_id DESC ; 
```

<a name="meaning_join"><h2>09 Понимание JOIN</h2></a>

(INNER JOIN) то же самое что  (JOIN) 
LEFT OUTER JOIN 

```sql
SELECT users.*, COUNT(posts.id) as posts FROM users 
LEFT OUTER JOIN posts 
ON users.id = posts.user_id
GROUP BY users.id;
```

<a name="meaning_join2"><h2>10 Понимание JOIN, часть 2</h2></a>

```sql
SELECT * FROM users
LEFT JOIN posts
ON posts.user_id = user.id
UNION
SELECT * FROM users
RIGHT JOIN posts
ON posts.user_id = users.id
```

<a name="multi_queries"><h2>11 Выборка из трех и более таблиц</h2></a>

```sql 
SELECT 
    u.*,
    r.*,
    t.*
FROM users as u 
JOIN roles as r ON r.id = u.role_id
LEFT JOIN teams as t ON t.id = u.team_id;
```

```sql
SELECT 
    u.id, u.first_name, u.last_name,
    r.name as role,
    t.name as team,
    SUM(ti.second) as total
FROM users as u 
JOIN roles as r ON r.id = u.role_id
LEFT JOIN teams as t ON t.id = u.team_id
JOIN timer as ti ON ti.user_id = u.id
WHERE u.gender = 'w'
GROUP BY u.id
HAVING total > 2000
ORDER BY total;
```

<a name="кeferential_integrity"><h2>12 Ссылочная целостность</h2></a>

```
ON DELETE 
    SET NULL  - устанавливает значение NULL если главную запись удалили   
    CASCADE   - Удаляет запись если главную запись удалили
    RESTRICT  - Запрещает удаление если существуют записи в дочерних таблицах

ON UPDATE
    SET NULL  - устанавливает значение NULL если главную запись обновили
    CASCADE   - обновляет запись если главную запись удалили
```

<a name="many_to_many"><h2>13 Отношения многие ко многим</h2></a>

```sql
CREATE TABLE users_projects(
    user_id INT UNSIGNED NOT NULL ,
    project_id INT UNSIGNED NOT NULL ,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);
```

---
<a name="nested_queries"><h2>Вложенные запросы</h2></a>

<a name="simple_nested_queries"><h2>01 Простые вложенные запросы</h2></a>

```sql
SELECT * FROM categories WHERE id IN (
    SELECT categories FROM products WHERE price = (
        SELECT MAX(price) FROM products  
    )
);
```

<a name="in_any_all"><h2>02 IN, ANY, ALL</h2></a>

```sql
# IN - содержит все полученные значения
# пользователи которые что то заказали
SELECT * FROM users WHERE id IN (
    SELECT DISTINCT user_id FROM orders WHERE status = 'succes'
);

# пользователи которые ни чего не заказали заказали
SELECT * FROM users WHERE id NOT IN (
    SELECT DISTINCT user_id FROM orders WHERE status = 'succes'
);    
```

```sql
# ANY
# проверяет что (salary) больше чем любое из значений которые вернул подзапрос
SELECT * FROM employees WHERE salary > ANY (
  SELECT salary FROM employees WHERE role_id = 3
) AND role_id != 3;

# равнозначно 
SELECT * FROM employees WHERE salary > (
    SELECT MIN(salary) FROM employees WHERE role_id = 3
) AND role_id != 3;
```

```sql
# ALL
# проверяет что (salary) больше всех значений которые вернул подзапрос
SELECT * FROM employees WHERE salary > ALL (
  SELECT salary FROM employees WHERE role_id = 3
) AND role_id != 3;

# равнозначно 
SELECT * FROM employees WHERE salary > (
    SELECT MAX(salary) FROM employees WHERE role_id = 3
) AND role_id != 3;
```

<a name="exists"><h2>03 Ключевое слово EXISTS</h2></a>

```sql
# Пользователи которые сделали хотя бы 1 заказ
SELECT * FROM users WHERE EXISTS(
    SELECT * FROM orders WHERE orders.user_id = users.id 
    AND status = 'success'
);

# Пользователи которые ни чего не заказывали
SELECT * FROM users WHERE NOT EXISTS(
    SELECT * FROM orders WHERE orders.user_id = users.id
    AND status = 'success'
);
```

<a name="select_col"><h2>04 Запросы, возвращающие несколько столбцов</h2></a>

```sql
SELECT * FROM cars WHERE (mark_id, model_id) = (
    SELECT mark, model FROM test_drives WHERE date = '2018-06-24'
)
```

```sql
SELECT * FROM cars WHERE (mark_id, model_id) IN (
    SELECT mark, model FROM test_drives WHERE date = '2018-06-24'
)
```

```sql
SELECT 
    cars.id,
    marks.name,
    model.name,
    cars.color,
    cars.price
FROM cars
JOIN marks ON cars.marks_id = marks.id 
JOIN models ON cars.model_id = models.id
WHERE (cars.marks_id, cars.model_id) IN (
    SELECT mark, model FROM test_drivers WHERE date = '2018-06-24'
);
```

<a name="from"><h2>05 Подзапросы в конструкции FROM</h2></a>

```sql
SELECT * FROM (
    SELECT id, name, pub_date as date, 'post' as type FROM posts
    UNION 
    SELECT id, title, date, 'article' FROM articles
) entries
ORDER BY date;
```

```sql
SELECT * FROM cars 
JOIN (SELECT mark, model FROM test_drives WHERE date = '2018-06-24') as td
ON td.model = cars.model.id AND td.mark = cars.mark_id;
```

```sql
SELECT * FROM (SELECT * FROM cars ORDER BY price DESC LIMIT 5) as best_cars
ORDER BY price;
```

<a name="insert_select"><h2>06 Подзапросы в конструкции INSERT</h2></a>

```sql
INSERT INTO paypal_payments (
    SELECT id, user_id, date, amount FROM payments
    WHERE source ='paypal'
);

# игнорировать записи первичные ключи которых уже есть в таблице
INSERT IGNORE INTO paypal_payments (
    SELECT id, user_id, date, amount FROM payments
    WHERE source ='paypal'
)
```

```sql
INSERT INTO tableName (col1, col2, colN)
    SELECT col1, col2, colN
    FROM anotherTable
    WHERE id = 'params';
```

```sql
# добавляет новые заяписи и изменяет существующие
REPLACE INTO paypal_payments (
    SELECT id, user_id, date, amount FROM payments
    WHERE source = 'paypal'                                
);
```

---

<a name="advanced_SQL"><h2>Продвинутый SQL</h2></a>

<a name="transaction"><h2>01 Введение в транзакции</h2></a>

Транзакция - группа последовательных SQL запросов.
```sql
UPDATE accounts SET balance = balance - 10000 WHERE id = 2;
UPDATE accounts SET balance = balance + 10000 WHERE id = 1;
```

```php
mysql->query('START TRANSACTION;');

try {
    mysql->query('UPDATE accounts SET balance = balance - 10000 WHERE id = 2;');     
    mysql->query('UPDATE accounts SET balance = balance + 10000 WHERE id = 1;');     
 
    mysql->query('COMMIT;');
}
catch (
    mysql->query('ROLLBACK;');
)
```

<a name="acid"><h2>02 ACID</h2></a>

```
A (Atomiciti) - атомарность (будут выполнены либо все запросы, либо ни одного)
C (Consistency) - консистентность, согласованность данных (сохраняет бизнес логику программы)
I (Isolation) - изолированность (выполнение нескольких транзакций не должны оказывать влияние друг на друга)
D (Durability) - устойчивость к ошибкам.
```

Управление транзакцией

Для управления транзакцией используются следующие команды:

- BEGIN|START TRANSACTION — запуск транзакции
- COMMIT — сохранение изменений
- ROLLBACK — отмена изменений
- SAVEPOINT — контрольная точка для отмены изменений
- SET TRANSACTION — установка характеристик текущей транзакции

```sql
BEGIN TRANSACTION
    DELETE FROM users
    WHERE age = 26;
COMMIT;
```

```sql
BEGIN
  DELETE FROM users
  WHERE username = 'Oleg';
ROLLBACK;
```

<a name="lost_update"><h2>03 Потерянное обновление</h2></a>

```sql
# Уровни изоляции транзакций
# READ UNCOMMITTED - 
# READ COMMITTED - 
# REPEATABLE READ - 
# SERIALIZABLE - 
SET TRANSACTION ISOLATION LEVEL Read Uncommitted; 
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
#
COMMIT ;
```

---

<a name="other_SQL_features"><h2>Другие возможности SQL</h2></a>

<a name="stored_procedures"><h2>01 Хранимые процедуры</h2></a>

```sql
DELIMITER $$    # меняем разделитель команд (;) на ($ $) чтобы после первого символа (;) описание не прервалось 
CREATE PROCEDURE move_money(from_account_id INT, to_account_id INT, amount DECIMAL)
BEGIN
    UPDATE accounts SET balance = balance - amount WHERE id = from_account_id;
    UPDATE accounts SET balance = balance + amount WHERE id = to_account_id;
END $$          # окончание описания хранимой процедуры
DELIMITER ;     # меняем разделитель команд ($$) на (;)

# вызов процедуры
CALL move_money(4,2, 5000);
```

<a name="transaction_in_stored_procedures"><h2>02 Транзакции в хранимых процедурах</h2></a>

```sql
DROP PROCEDURE IF EXISTS move_money;    # если есть такая хранимая процедура - удаляем её

DELIMITER $$
CREATE PROCEDURE move_money(from_account_id INT, to_account_id INT, amount DECIMAL)
BEGIN
    DECLARE _rollback BOOL DEFAULT FALSE;   # создаём переменную (_rollback) булева типа со значением FALSE
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _rollback = TRUE; # если произойдёт ошибка, переменой присвоится значение TRUE
    
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   # объявляется самый строгий уровень транзакции
    START TRANSACTION;                              # начало транзакции
    
    UPDATE accounts SET balance = balance - amount WHERE id = from_account_id;
    UPDATE accounts SET balance = balance + amount WHERE id = to_account_id;
    
    IF _rollback THEN   
        ROLLBACK;       # если была ошибка производим откат транзакции
    ELSE
        COMMIT;         # если ошибки не было - фиксируем транзакцию
    END IF;
END $$          # окончание описания хранимой процедуры
DELIMITER ;     # меняем разделитель команд ($$) на (;)
```

```sql
# вызов процедуры
CALL move_money(4, 2, 5000);
```

```sql
DELIMITER $$
CREATE PROCEDURE payment(account_id INT, p_amount INT)
BEGIN
    START TRANSACTION;
    UPDATE accounts SET amount = amount - p_amount WHERE id = account_id;
    
    INSERT INTO operations (account_id, amount, direction) 
    VALUES (account_id, p_amount, 'outcome');
    
    IF p_amount < 1000 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END $$
DELIMITER ;
```

```sql
# процедуры могут возвращать какое-то значение

DELIMITER $$
CREATE PROCEDURE get_client_balance (client_id INT)
BEGIN
    SELECT SUM(balance) FROM accaunts WHERE user_id = client_id;
END $$
DELIMITER ;

CALL get_client_balance(2);
```

```
Поддержка MySQL условий внутри хранимых процедур
IF ... THEN ... ELSE  
CASE  
REPEAT  
LOOP  
GOTO  
```

<a name="stored_functions"><h2>03 Хранимые функции</h2></a>

```sql
# создание хранимой функций 

DELIMITER $$
CREATE FUNCTION get_client_balance (client_id INT) RETURNS DECIMAL
BEGIN
    DECLARE client_balance DECIMAL DEFAULT 0;   # объявляем переменную
    # возвращаем значение запроса в переменную (client_balance)
    SELECT SUM(balance) INTO client_balance FROM accaunts WHERE user_id = client_id; 
    RETURN client_balance;  # возвращаем переменную в ту часть запроса - где была вызвана функция
END $$
DELIMITER ;

CALL get_client_balance(2); # вызов хранимой процедуры
SELECT * FROM accounts WHERE balance > get_client_balance(2);  # вызов хранимой функции
```

<a name="variables"><h2>04 Переменные</h2></a>

```sql
SELECT @sum := 5000, @from := 4, @to := 2;
SELECT @balance_from := balance FROM accounts WHERE id = @from;
SELECT @balance_to := balance FROM accounts WHERE id = @to;
```

```sql
SELECT @client_id := 2;
SELECT SUM(balance) INTO @total_client_balance; # записать сумму в переменную
SELECT @total_client_balance := SUM(balance)
FROM account WHERE user_id = @client_id;
SELECT * FROM accounts WHERE balance > @total_client_balance
```

```sql
SELECT @client_id := 2; # выведет присвоенное значение

SET @client_id := 2;    # присваивает значение 
SET @last := CURDATE() - INTERVAL 7 DAY;

SET @client_id := 2, @last := CURDATE() - INTERVAL 7 DAY;
```

<a name="variables_in_stored_procedures"><h2>05 Переменные в хранимых процедурах</h2></a>

```sql
DROP PROCEDURE IF EXISTS move_money;    # если есть такая хранимая процедура - удаляем её

DELIMITER $$
CREATE PROCEDURE move_money(from_account_id INT, to_account_id INT, amount DECIMAL)
BEGIN
    DECLARE _rollback BOOL DEFAULT FALSE;   # создаём переменную (_rollback) булева типа со значением FALSE
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _rollback = TRUE; # если произойдёт ошибка, переменой присвоится значение TRUE
    
    SELECT balance INTO @from_balans FROM accounts WHERE id = from_account_id;
    IF @from_balans < amount THEN
        SET amount := @from_balans;
    END IF;
    
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   # объявляется самый строгий уровень транзакции
    START TRANSACTION;                              # начало транзакции
    
    UPDATE accounts SET balance = balance - amount WHERE id = from_account_id;
    UPDATE accounts SET balance = balance + amount WHERE id = to_account_id;
    
    IF _rollback THEN   
        ROLLBACK;       # если была ошибка производим откат транзакции
    ELSE
        COMMIT;         # если ошибки не было - фиксируем транзакцию
    END IF;
END $$          # окончание описания хранимой процедуры
DELIMITER ;     # меняем разделитель команд ($$) на (;)
```

```sql
DROP PROCEDURE IF EXISTS move_money;    # если есть такая хранимая процедура - удаляем её

DELIMITER $$
CREATE PROCEDURE move_money(from_account_id INT, to_account_id INT, amount DECIMAL)
BEGIN
    DECLARE _rollback BOOL DEFAULT FALSE;   # создаём переменную (_rollback) булева типа со значением FALSE
    DECLARE from_balance DECIMAL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _rollback = TRUE; # если произойдёт ошибка, переменой присвоится значение TRUE
    
    SELECT balance INTO from_balans FROM accounts WHERE id = from_account_id;
    IF from_balans < amount THEN
        SET amount := from_balans;
    END IF;
    
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   # объявляется самый строгий уровень транзакции
    START TRANSACTION;                              # начало транзакции
    
    UPDATE accounts SET balance = balance - amount WHERE id = from_account_id;
    UPDATE accounts SET balance = balance + amount WHERE id = to_account_id;
    
    IF _rollback THEN   
        ROLLBACK;       # если была ошибка производим откат транзакции
    ELSE
        COMMIT;         # если ошибки не было - фиксируем транзакцию
    END IF;
END $$          # окончание описания хранимой процедуры
DELIMITER ;     # меняем разделитель команд ($$) на (;)
```

```sql
CALL move_money(4, 2, 100000);

# вывести текущие переменные 
SELECT @from_balance, @amount, @_rollback; # внешние переменные (глобальные)

# DECLARE from_balance DECIMAL DEFAULT 0; # локальные объяснённые внутри хранимых процедур
```

<a name="triggers"><h2>06 Триггеры</h2></a>

| `AFTER` - после | `BEFORE` - до |
|---------------|-------------|
| 1. INSERT     | 4. INSERT   |
| 2. UPDATE     | 5. UPDATE   |
| 3. DELETE     | 6. DELETE   |

- Триггер `BEFORE UPDATE` будет выполняться перед созданием новой записи в таблице.
- Триггер `AFTER DELETE` будет выполняться после удаления записи в таблице.

```
UPDATE accounts SET balance = 20000

OLD.balance = 10000     # переменная OLD содержит старое значение
NEW.balance = 20000     # переменная NEW содержит новое значение
```

```sql
# 
DELIMITER $$
CREATE TRIGGER calc_client_balance AFTER UPDATE ON accounts
FOR EACH ROW # создать тригер который будет срабатывать после обновления любой строки в таблице (account)
BEGIN 
    UPDATE users SET balance = get_client_balance(OLD.user_id)  # OLD - старое значение строки
    WHERE id = NEW.user_id;                                     # NEW - новое значение строки
END$$
DELIMITER ;

# тригер сработает при обновлении таблицы (accounts) 
# и обновит баланс в таблице (users)
UPDATE accounts SET balance = balance + 5000 WHERE id = 4;
```

```sql
# 
DELIMITER $$
CREATE TRIGGER calc_client_balance_insert AFTER INSERT ON accounts
FOR EACH ROW # создать тригер который будет срабатывать после обновления любой строки в таблице (account)
BEGIN 
    UPDATE users SET balance = get_client_balance(NEW.user_id)  # NEW, при первой вставке старого значения (OLD) ещё не существует
    WHERE id = NEW.user_id;                                     # NEW - новое значение строки
END$$
DELIMITER ;

INSERT INTO accounts (user_id, balance) VALUES (4, 10000);
```

<a name="views"><h2>07 Представления</h2></a>

Представление - это результат SELECT запроса к которому потом можно 
обращаться как к отдельной таблице.  

! При вызове представления, база данных каждый раз будет выполнять SELECT запрос 
для создания представления, поэтому представления не увеличивают производительность базы данных.  

Представления позволяют сделать более удобное обращение к данным.  

При помощи представлений можно разделить доступ к данных - предоставить доступ к разрешённым данным.

В представлении можно использовать все возможности SELECT запросов:
- JOIN
- GROUP BY
- ORDER BY
- UNION
- подзапросы

Представления делятся на вертикальное и горизонтальное разделение
- Вертикальное - позволяет получить доступ не ко всей таблице, а к определённым столбцам.
- Горизонтальное - ограничивает обращение к определённым строкам (по id, или другим значениям строк).

! Простые представления без JOIN и UNION могут участвовать в UPDATE запросах (меняет исходные данных) - 
поэтому желательно не использовать изменения данных в представлениях.

Могут изменять те данные, которые были запрошены в представлении.

```sql
CREATE VIEW users_roles as 
SELECT u.ferst_name, u.last_name, r.name
FROM users as u 
JOIN roles as r ON u.role_id = r.id;

# получение результата представления
SELECT * FROM users_roles;
```

```sql
CREATE VIEW users_list as 
SELECT id, last_name, first_name FROM users ORDER BY last_name, first_name;

SELECT * FROM users_list;
```

```sql
CREATE VIEW users_list as
SELECT * FROM users WHERE team_id = 1 ORDER BY last_name, first_name;

SELECT * FROM users_list;
```

```sql
CREATE VIEW alpha_team as
SELECT * FROM users WHERE  team_id = 1 ORDER BY last_name, first_name;
```

```sql
UPDATE alpha_team SET gender = "M";
```

<a name="restrictions_and_checks"><h2>08 Ограничения и проверки</h2></a>

Часто тригеры и хранимые процедуры используют проверки данных перед их добавлением.
Чтобы пользователи случайно не вставили в таблицу не валидную информацию.

```sql
CREATE TABLE products (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL ,
    ean13 VARCHAR(13) NOT NULL DEFAULT '',
    price INT UNSIGNED,
    sale INT UNSIGNED DEFAULT 0
);
```

```sql
DELIMITER $$
CREATE PROCEDURE check_product (ean13 VARCHAR(13), price INT, sale INT)
BEGIN 
    DECLARE i INT DEFAULT 1;
    
    IF LENGTH(ean13) NOT IN (0, 13) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неверная длинна ean13';
    ELSE
        WHILE i <= LENGTH(eqn13) DO
            IF SUBSTRING(ean13, i, 1) NOT IN ('0','1','2','3','4','5','6','7','8','9') THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неверная длинна ean13';
            END IF;
            SET i = i + 1;
        END WHILE;
    END IF;

    IF sale > price THEN
        SIGNAL '45002'
            SET MESSAGE_TEXT = 'Значение скидки больше значения цены';
    END IF;
END $$

CREATE TRIGGER check_product_before_insert BEFORE INSERT ON products
FOR EACH ROW 
BEGIN 
    CALL check_product(NEW.ean13, NEW.price, NEW.sale);
END $$
DELIMITER ;
```

<a name="locking_tables"><h2>09 Блокировка таблиц</h2></a>

Иногда при чтении или записи данных нужно заблокировать таблицу, чтобы другие клиенты
не смогли с ней ни чего сделать. 

Например при массовом обновлении цен на сайте желательно сделать это в один заход, чтобы в процессе изменений 
ни один пользователь не получил устаревшие данные и сразу начали работать с новыми. 

Сущестуют 2 вида блокировок таблиц `на чтение` и `на запись`:  
- Блокировка на `чтение` запрещает другим клиентами записывать данные в таблицу, но разрешает читать их.
- Блокировка на `запись` запрещает другим клиентами и читать данные из таблицы, и записывать их.

| Операции другими клиентами | Блокировка - READ | Блокировка - WRITE |
|----------------------------|-------------------------------| --- |
| SELECT                     | Да                            | Нет |
| UPDATE                     | Нет                           | Нет |

```sql
LOCK TABLES products READ;
SELECT AVG(price) FROM products;    
UNLOCK TABLES;
```

```sql
LOCK TABLES products WRITE;
UPDATE products SET price = price * 1.1;  
UNLOCK TABLES;
```

<a name="explain"><h2>10 Анализ и оптимизация запросов - EXPLAIN</h2></a>

```sql
SELECT abs, COUNT(abc)
FROM products
GROUP BY abc;
```

```sql
# получаем информацию о нашем запросе 
EXPLAIN SELECT abs, COUNT(abc)
FROM products
GROUP BY abc;
```

```sql
CREATE INDEX abc_idx ON products(abc);
```

```sql
SELECT COUNT(*) FROM products
WHERE price < 10000 AND quantity > 10 AND category_id = 5;

CREATE INDEX main_filter ON products (price, quantity);
```

В запросах где использутся операторы `>` или `<` индексы применяются не всегда,
Индексы применяются при использовании оператора `=`.

---
<a name="window_functions"><h2>Оконные функции</h2></a>

Множество оконных функций можно разделять на 3 класса:
- Агрегирующие (Aggregate)
- Ранжирующие (Ranking)
- Функции смещения (Value)

Агрегирующие:
Можно применять любую из агрегирующих функций - SUM, AVG, COUNT, MIN, MAX

```sql
select name, subject, grade,
sum(grade) over (partition by name) as sum_grade,
avg(grade) over (partition by name) as avg_grade,
count(grade) over (partition by name) as count_grade,
min(grade) over (partition by name) as min_grade,
max(grade) over (partition by name) as max_grade
from student_grades;
```

Ранжирующие:
В ранжирующих функция под ключевым словом `OVER` обязательным идет указание условия `ORDER BY`, по которому будет происходить сортировка ранжирования.  
- `ROW_NUMBER()` - функция вычисляет последовательность ранг (порядковый номер) строк внутри партиции, НЕЗАВИСИМО от того, есть ли в строках повторяющиеся значения или нет.  
- `RANK()` - функция вычисляет ранг каждой строки внутри партиции. Если есть повторяющиеся значения, функция возвращает одинаковый ранг для таких строчек, пропуская при этом следующий числовой ранг.  
- `DENSE_RANK()` - то же самое что и `RANK`, только в случае одинаковых значений `DENSE_RANK` не пропускает следующий числовой ранг, а идет последовательно.  

```sql
select name, subject, grade,
row_number() over (partition by name order by grade desc),
rank() over (partition by name order by grade desc),
dense_rank() over (partition by name order by grade desc)
from student_grades;
```

Функции смещения:
Это функции, которые позволяют перемещаясь по выделенной партиции таблицы обращаться к предыдущему значению строки или крайним значениям строк в партиции.  
- `LAG()` - функция, возвращающая предыдущее значение столбца по порядку сортировки.  
- `LEAD()` - функция, возвращающая следующее значение столбца по порядку сортировки.  
На простом примере видно, как можно в одной строке получить текущую оценку, предыдущую и следующую оценки Пети в четвертях.  

```sql
select name, quartal, subject, grade, 
lag(grade) over (order by quartal) as previous_grade,
lead(grade) over (order by quartal) as next_grade
from grades_quartal;
```

<a name="introduction_to_window_functions"><h2>01 Введение в оконные функции</h2></a>

```sql
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS orders;
SET foreign_key_checks = 1;
CREATE TABLE orders (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NULL,
    date DATE NOT NULL,
    amount INTEGER NULL
);
INSERT INTO orders (id, user_id, date, amount)
VALUES
    (1, 138, '2021-01-01', 4500),
    (2, 491, '2021-01-02', 700),
    (3, 9841, '2021-01-04', 1200),
    (4, 174, '2021-01-04', 500),
    (5, 19, '2021-01-04', 8700),
    (6, 792, '2021-01-12', 1350),
    (7, 145, '2021-01-14', 600),
    (8, 491, '2021-02-01', 600),
    (9, 145, '2021-02-16', 1400),
    (10, 95, '2021-02-28', 4300),
    (11, 481, '2021-03-12', 8000),
    (12, 491, '2021-04-01', 980),
    (13, 45, '2021-04-14', 1600),
    (14, 671, '2020-12-30', 1500),
    (15, 145, '2020-12-31', 2500),
    (16, 891, '2020-12-29', 3500);

SELECT * FROM orders;
```
```sql
SELECT SUM(amount) as total
FROM orders
WHERE YEAR(date) = 2021
ORDER BY total;

SELECT 
    MONTH(date) as month,
    SUM(amount) as total
FROM orders 
WHERE YEAR(date) = 2021
GROUP BY month
ORDER BY month;
```

```sql
SELECT
    *,
    SUM(amount) OVER() as total
FROM orders
WHERE YEAR(date) = 2021
ORDER BY total;


SELECT 
    *, 
    SUM(amount) OVER() as total,
    SUM(amount) OVER(PARTITION BY MONTH(date)) as month_total,
    amount * 100 /  SUM(amount) OVER() as percent,
    amount * 100 /  SUM(amount) OVER(PARTITION BY MONTH(date)) as month_percent
FROM orders
WHERE YEAR(date) = 2021
ORDER BY total;
```

```sql
DROP TABLE IF EXISTS student_grades;

#создание таблицы
CREATE TABLE student_grades (
    name VARCHAR(50),
    subject VARCHAR(50),
    grade INT
);

# наполнение таблицы данными
INSERT INTO student_grades 
VALUES
    ('Петя', 'русский', 4),
    ('Петя', 'физика', 5),
    ('Петя', 'история', 4),
    ('Маша', 'математика', 4),
    ('Маша', 'русский', 3),
    ('Маша', 'физика', 5),
    ('Маша', 'история', 3);

#запрос всех данных из таблицы
SELECT *  FROM student_grades;
```

<a name="non_aggregating_functions"><h2>02 Знакомство с неагрегирующими функциями</h2></a>

`ROW_NUMBER()` - нумерация строк окна, по умолчанию начинается с 1

```sql
SELECT 
    # меняем нумерацию окна на 1 меньше дефолтного значения
    # нумерация строк окна будет с 0
    ROW_NUMBER() over () - 1 AS row_num,    
    ROW_NUMBER() over (PARTITION BY MONTH(date)) AS row_month_num,
    id, date, amount,
    SUM(amount) OVER () AS total,
    SUM(amount) OVER (PARTITION BY MONTH(date)) AS month_total
FROM orders 
WHERE YEAR(date) = 2021;
```

<a name="sort_window_functions"><h2>03 Сортировка в оконных функциях</h2></a>

```sql
SELECT 
    ROW_NUMBER() over (ORDER BY date) AS row_num, # 
    ROW_NUMBER() over (PARTITION BY YEAR(date) ORDER BY date) AS row_year_num,
    ROW_NUMBER() over (PARTITION BY YEAR(date), MONTH(date) ORDER BY amount) AS row_month_num,
    id, date, amount
FROM orders
ORDER BY date;    
```

<a name="filter_window_functions"><h2>04 Фильтрация в оконных функциях</h2></a>

```sql
SELECT * FROM ( 
    SELECT 
        ROW_NUMBER() OVER (ORDER BY date) AS row_num,
        ROW_NUMBER() OVER (PARTITION BY YEAR(date) ORDER BY date) AS month,
        id, date, amount
    FROM orders) AS tmp_table
WHERE month % 2 = 0
ORDER BY date;
```

<a name="understanding_window"><h2>05 Понимание окон</h2></a>

Составление запроса:
- Сначала данные (строим запрос для получения данных)
- Потом оконная аналитика (добавляем оконную функцию с параметрами)

<a name="sotr_for_aggregating"><h2>06 Сортировка для агрегирующих функций</h2></a>

С ORDER BY - построчная обработка (каждый раз добавляя новую строку)
Без ORDER BY - весь сегмент целиком

```sql
SELECT 
    ROW_NUMBER() over (ORDER BY date) AS nums,
    date,
    amount,
    MIN(amount) OVER (
        PARTITION BY YEAR(date), MONTH(date)
        ORDER BY id
        ) AS month_amount
FROM orders ORDER BY date;
```

<a name="grouping_window_functions"><h2>07 Группировка и оконные функции</h2></a>

```sql
SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(amount) AS mont_amount
FROM orders    
GROUP BY year, month
ORDER BY year, month;
```

Теперь добавляем оконные функции с параметрами

```sql
SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(amount) AS mont_amount,
    SUM(amount) OVER () as ov
FROM orders    
GROUP BY year, month
ORDER BY year, month;
```

```sql
SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(amount) AS mont_amount,
    SUM(SUM(amount)) OVER (
        PARTITION BY YEAR(date)
        ORDER BY YEAR(date), MONTH(date)
        )
FROM orders    
GROUP BY year, month
ORDER BY year, month;
```

<a name="ranking_rank"><h2>08 Ранжирование с помощью RANK и DENSE_RANK</h2></a>

RANK  
DENSE_RANK  
NTILE  

```sql
SELECT 
    ROW_NUMBER() over (
        PARTITION BY YEAR(date), MONTH(date)
        ORDER BY date) AS order_num,
    RANK() over (
        PARTITION BY YEAR(date), MONTH(date)
        ORDER BY date) AS rank_num,
    DENSE_RANK() over (
        PARTITION BY YEAR(date), MONTH(date)
        ORDER BY date) AS dense_num    
FROM orders
WHERE YEAR(date) = 2021;
```

<a name="named_windows"><h2>09 Именованные окна</h2></a>

```sql
# 1. Именованное окно с сегментами и сортировкой
SELECT
    ROW_NUMBER() OVER (by_month) as order_num,
    RANK() OVER (by_month) as rank_num,
    DENSE_RANK() OVER (by_month) as dense_num,
    user_id, amount, date
FROM orders
WHERE YEAR(date) = 2021
    WINDOW by_month AS (
        PARTITION BY YEAR(date), MONTH(date)
        ORDER BY date)
ORDER BY date, id;
```

```sql
# Именованное окно только с сегментами. 
# Сортировка происходит в окнах в блоке SELECT
SELECT
    ROW_NUMBER() OVER (
        by_month ORDER BY date) as order_num,
    RANK() OVER (
        by_month ORDER BY amount) as rank_num,
    DENSE_RANK() OVER
        (by_month ORDER BY user_id) as dense_num,
    user_id, amount, date
FROM orders
WHERE YEAR(date) = 2021
    WINDOW by_month AS (
        PARTITION BY YEAR(date), MONTH(date)
        )
ORDER BY date, id
```

<a name="ranking_ntile"><h2>10 Ранжирование с помощью NTILE</h2></a>

```sql
SELECT 
    YEAR(date) as year,
    user_id,
    SUM(amount) as total,
    NTILE(3) over (
        PARTITION BY YEAR(date)
        ORDER BY SUM(amount) 
        ) as user_group
FROM orders
GROUP BY year, user_id
ORDER BY year, total;    
```

<a name="statistical_ranking"><h2>11 Статистическое ранжирование</h2></a>

```sql
SELECT id, amount, date,
       RANK() over (ORDER BY amount) as `rank`,
       PERCENT_RANK() over (ORDER BY amount) as `percent_rank`,
       CUME_DIST() over (ORDER BY amount) as `cume_dist`
FROM orders
WHERE YEAR(date) = 2021
ORDER BY amount;
```

<a name="advance_and_lag"><h2>12 Опережение и отставание</h2></a>

```sql
SELECT 
    MONTH(date) as month,
    SUM(amount) as month_rtevenue,
    # LAG для текущей строки отдаёт данные прошлой строки
    LAG(SUM(amount)) over (ORDER BY MONTH(date)) as prev, 
    # 1 - количество отставаний строк
    SUM(amount) - LAG(SUM(amount), 1, SUM(amount)) OVER (ORDER BY MONTH(date)) as diff,
    # LEAD - отдаёт данные из будущих строк
    SUM(amount) - LEAD(SUM(amount), 1, SUM(amount)) OVER (ORDER BY MONTH(date)) as diff,
FROM orders
WHERE YEAR(date) = 2021
GROUP BY month
ORDER BY month;
```

<a name="Comparison_first_and_last"><h2>13 Сравнение с первым и последним</h2></a>

```sql
SELECT 
    MONTH(date) as month,
    SUM(amount) as month_rtevenue,
    LAG(SUM(amount)) over (ORDER BY MONTH(date)) as prev, 
    SUM(amount) - LAG(SUM(amount), 1, SUM(amount)) OVER (ORDER BY MONTH(date)) as diff,
    FIRST_VALUE(SUM(amount)) OVER (ORDER BY MONTH(date)) as fm,
    SUM(amount) - FIRST_VALUE(SUM(amount)) OVER (ORDER BY MONTH(date)) as btfm,
    SUM(amount) - FIRST_VALUE(SUM(amount)) OVER (ORDER BY SUM(amount)) as amfm_min,
    SUM(amount) - FIRST_VALUE(SUM(amount)) OVER (ORDER BY SUM(amount) DESC ) as amfm_max,
    SUM(amount) - LAST_VALUE(SUM(amount)) OVER (ORDER BY SUM(amount)) as amfm_max2
FROM orders
WHERE YEAR(date) = 2021
GROUP BY month
ORDER BY month;
```

---

<a name="additionally"><h2>Дополнительно</h2></a>

<a name="sql_commands"><h2>Команды SQL</h2></a>

| N	| Команда	| Описание                                                                   |
|---|---|----------------------------------------------------------------------------|
| 1	| CREATE	| Создает новую таблицу, представление таблицы или другой объект в БД        |
| 2	| ALTER	| Модифицирует существующий в БД объект, такой как таблица                   |
| 3	| DROP	| Удаляет существующую таблицу, представление таблицы или другой объект в БД |


| N | Команда |	Описание |
|---|---|---|
| 1 | SELECT |	Извлекает записи из одной или нескольких таблиц |
| 2 | INSERT |	Создает записи |
| 3 | UPDATE |	Модифицирует записи |
| 4 | DELETE |	Удаляет записи |


---
<a name="limitations"><h2>Ограничения</h2></a>

Ограничения (`constraints`) — это правила, применяемые к данным.

Ограничения могут устанавливаться как на уровне колонки, так и на уровне таблицы.   

Среди наиболее распространенных ограничений можно назвать следующие:
- `NOT NULL` — колонка не может иметь нулевое значение
- `DEFAULT` — значение колонки по умолчанию
- `UNIQUE` — все значения колонки должны быть уникальными
- `PRIMARY` KEY — первичный или основной ключ, уникальный идентификатор записи в текущей таблице
- `FOREIGN` KEY — внешний ключ, уникальный идентификатор записи в другой таблице (таблице, связанной с текущей)
- `CHECK` — все значения в колонке должны удовлетворять определенному условию
- `INDEX` — быстрая запись и извлечение данных

Любое ограничение может быть удалено с помощью команды `ALTER TABLE` и `DROP CONSTRAINT` + название ограничения.

<a name="data_integrity"><h2>Целостность данных</h2></a>

В каждой СУБД существуют следующие категории целостности данных:

- целостность объекта (`Entity Integrity`) — в таблице не должно быть дубликатов (двух и более строк с одинаковыми значениями)
- целостность домена (`Domain Integrity`) — фильтрация значений по типу, формату или диапазону
- целостность ссылок (`Referential integrity`) — строки, используемые другими записями (строки, на которые в других записях имеются ссылки), не могут быть удалены
- целостность, определенная пользователем (`User-Defined Integrity`) — дополнительные правила


<a name="database_normalization"><h2>Нормализация БД</h2></a>

Нормализация — это процесс эффективной организации данных в БД. Существует две главных причины, для нормализации БД:
- предотвращение записи в БД лишних данных, например, хранения одинаковых данных в разных таблицах
- обеспечение "оправданной" связи между данными

<a name="sql_syntax"><h2>Синтаксис SQL</h2></a>

Синтаксис — это уникальный набор правил и рекомендаций. Все инструкции `SQL` должны начинаться с ключевого слова, такого как `SELECT`, `INSERT`, `UPDATE`, `DELETE`, `ALTER`, `DROP`, `CREATE`, `USE`, `SHOW` и т.п. и заканчиваться точкой с запятой `;`. `SQL` не чувствителен к регистру, т.е. `SELECT`, `select` и `SeLeCt` являются идентичными инструкциями.

Примеры синтаксиса

```sql
-- выборка
SELECT col1, col2, colN
FROM tableName;

SELECT DISTINCT col1, col2, colN
FROM tableName;

SELECT col1, col2, colN
FROM tableName
WHERE condition;

SELECT col1, col2, colN
FROM tableName
WHERE condition1 AND|OR condition2;

SELECT col2, col2, colN
FROM tableName
WHERE colName IN (val1, val2, valN);

SELECT col1, col2, colN
FROM tableName
WHERE colName BETWEEN val1 AND val2;

SELECT col1, col2, colN
FROM tableName
WHERE colName LIKE pattern;

SELECT col1, col2, colN
FROM tableName
WHERE condition
ORDER BY colName [ASC|DESC];

SELECT SUM(colName)
FROM tableName
WHERE condition
GROUP BY colName;

SELECT COUNT(colName)
FROM tableName
WHERE condition;

SELECT SUM(colName)
FROM tableName
WHERE condition
GROUP BY colName
HAVING (function condition);

-- создание таблицы
CREATE TABLE tableName (
col1 datatype,
col2 datatype,
colN datatype
PRIMARY KEY (одна или более колонка)
);

-- удаление таблицы
DROP TABLE tableName;

-- создание индекса
CREATE UNIQUE INDEX indexName
ON tableName (col1, col2, colN);

-- удаление индекса
ALTER TABLE tableName
DROP INDEX indexName;

-- получение описания структуры таблицы
DESC tableName;

-- очистка таблицы
TRUNCATE TABLE tableName;

-- добавление/удаление/модификация колонок
ALTER TABLE tableName ADD|DROP|MODIFY colName [datatype];

-- переименование таблицы
ALTER TABLE tableName RENAME TO newTableName;

-- вставка значений
INSERT INTO tableName (col1, col2, colN)
VALUES (val1, val2, valN);

-- обновление записей
UPDATE tableName
SET col1 = val1, col2 = val2, colN = valN
[WHERE condition];

-- удаление записей
DELETE FROM tableName
WHERE condition;

-- создание БД
CREATE DATABASE [IF NOT EXISTS] dbName;

-- удаление БД
DROP DATABASE [IF EXISTS] dbName;

-- выбор БД
USE dbName;

-- завершения транзакции
COMMIT;

-- отмена изменений
ROLLBACK;
```

---
<a name="operators"><h2>Операторы</h2></a>

Оператор (operators) — это ключевое слово или символ, которые, в основном, используются в инструкциях WHERE для выполнения каких-либо операций.

Арифметические

| Оператор |	Описание	| Пример                                                                           |
|----------|---|----------------------------------------------------------------------------------|
| +        |(сложение) | 	Сложение значений `a + b = 30`                                                  |
| -        |(вычитание) | 	Вычитание правого операнда из левого `b — a = 10`                               |
| *        |(умножение) | 	Умножение значений `a * b = 200`                                                |
| /        |(деление) | 	Деление левого операнда на правый	`b / a = 2`                                   |
| %        | (деление с остатком/по модулю) | 	Деление левого операнда на правый с остатком (возвращается остаток)	`b % a = 0` |


Операторы сравнения

| Оператор | 	Описание                                                                               | Пример             |
|----------|-----------------------------------------------------------------------------------------|--------------------|
| =        | Определяет равенство значений                                                           | `a = b -> false`   |
| !=       | Определяет НЕравенство значений                                                         | `a != b -> true`   |
| <>       | Определяет НЕравенство значений                                                         | `a <> b -> true`   |
| \>       | Значение левого операнда больше значения правого операнда? | `a > b -> false`  |
| <        | Значение левого операнда меньше значения правого операнда? | `a < b -> true`   |
| >=       | Значение левого операнда больше или равно значению правого операнда? | `a >= b -> false` |
| <=       | Значение левого операнда меньше или равно значению правого операнда? | `a <= b -> true`  |
| !<       | Значение левого операнда НЕ меньше значения правого операнда? | `a !< b -> false` |
| !>       | Значение левого операнда НЕ больше значения правого операнда? | `a !> b -> true`  |


Логические операторы

| N	| Оператор | Описание                                                                                                        |
|---|---|-----------------------------------------------------------------------------------------------------------------|
| 1	| ALL | Сравнивает все значения                                                                                         |
| 2	| AND | Объединяет условия (все условия должны совпадать)                                                               |
| 3	| ANY | Сравнивает одно значение с другим, если последнее совпадает с условием                                          |
| 4	| BETWEEN | Проверяет вхождение значения в диапазон от минимального до максимального                                        |
| 5	| EXISTS | Определяет наличие строки, соответствующей определенному критерию                                               |
| 6	| IN | Выполняет поиск значения в списке значений                                                                      |
| 7	| LIKE | Сравнивает значение с похожими с помощью операторов подстановки                                                 |
| 8	| NOT | Инвертирует (меняет на противоположное) смысл других логических операторов, например, NOT EXISTS, NOT IN и т.д. |
| 9	| OR | Комбинирует условия (одно из условий должно совпадать)                                                          |
| 10 | IS NULL | Определяет, является ли значение нулевым                                                                        |
| 11 | UNIQUE | Определяет уникальность строки                                                                                  |

---
<a name="functions"><h2>Функции</h2></a>

Агрегирующие

- AVG — вычисляет среднее значение
- SUM — вычисляет сумму значений
- MIN — вычисляет наименьшее значение
- MAX — вычисляет наибольшее значение
- COUNT — вычисляет количество записей в таблице

---
Для работы со строками:

- CONCAT — объединение строк
- LENGTH — возвращает количество символов в строке
- TRIM — удаляет пробелы в начале и конце строки
- SUBSTRING — извлекает подстроку из строки
- REPLACE — заменяет подстроку в строке
- LOWER — переводит символы строки в нижний регистр
- UPPER — переводит символы строки в верхний регистр и т.д.

---
Для работы с числами:

- ROUND — округляет число
- TRUNCATE — обрезает дробное число до указанного количества знаков после запятой
- CEILING — возвращает наименьшее целое число, которое больше или равно текущему значению
- FLOOR — возвращает наибольшее целое число, которое меньше или равно текущему значению
- POWER — возводит число в указанную степень
- SQRT — возвращает квадратный корень числа
- RAND — генерирует случайное число с плавающей точкой в диапазоне от 0 до 1

---
Для получения текущей даты и времени:

- CURDATE/CURRENT_DATE — возвращает текущую дату
- CURTIME/CURRENT_TIME — возвращает текущее время и т.д.

---
Функции для разбора даты и времени:

- DAYOFMONTH(date) — возвращает день месяца в виде числа
- DAYOFWEEK(date) — возвращает день недели в виде числа
- DAYOFYEAR(date) — возвращает номер дня в году
- MONTH(date) — возвращает месяц
- YEAR(date) — возвращает год
- LAST_DAY(date) — возвращает последний день месяца в виде даты
- HOUR(time) — возвращает час
- MINUTE(time) — возвращает минуты
- SECOND(time) — возвращает секунды и др.

---
Функции для манипулирования датами:

- DATE_ADD(date, interval) — выполняет сложение даты и определенного временного интервала
- DATE_SUB(date, interval) — выполняет вычитание из даты определенного временного интервала
- DATEDIFF(date1, date2) — возвращает разницу в днях между двумя датами
- TO_DAYS(date) — возвращает количество дней с 0-го дня года
- TIME_TO_SEC(time) — возвращает количество секунд с полуночи и др.


Для форматирования даты и времени используются функции 

- DATE_FORMAT(date, format) 
- TIME_FORMAT(date, format).

---

<a name="creat_delet_db"><h2>Создание, удаление БД</h2></a>

Для создания БД используется инструкция CREATE DATABASE.
```sql 
CREATE DATABASE dbName;
-- или
CREATE DATABASE IF NOT EXISTS dbName;
```

Получаем список БД:

```sql
SHOW DATABASES;
```

Удаление БД

Для удаления БД используется инструкция `DROP DATABASE`.
```sql
DROP DATABASE dbName;
-- или
DROP DATABASE IF EXISTS dbName;
```

<a name="db_selection"><h2>Выбор БД</h2></a>

При наличии нескольких БД, перед выполнением каких-либо операций, необходимо выбрать БД. Для этого используется инструкция USE.
```sql
USE dbName;
```

Предположим, что мы не удаляли testDB. Тогда мы можем выбрать ее так:
```sql
USE testDB;
```

<a name="tables"><h2>Таблицы</h2></a>

Проверяем, что таблица была создана:
```sql
DESC users;
```

Удаление таблицы users
```sql
DROP TABLE users;
```

<a name="changing_table"><h3>Изменение таблицы</h3></a>

Команда `ALTER TABLE` используется для добавления, удаления и модификации колонок существующей таблицы. Также эта команда используется для добавления и удаления ограничений.

Синтаксис:

```sql
-- добавление новой колонки
ALTER TABLE tableName ADD colName datatype;

-- удаление колонки
ALTER TABLE tableName DROP COLUMN colName;

-- изменение типа данных колонки
ALTER TABLE tableName MODIFY COLUMN colName newDatatype;

-- добавление ограничения `NOT NULL`
ALTER TABLE tableName MODIFY colName datatype NOT NULL;

-- добавление ограничения `UNIQUE`
ALTER TABLE tableName
ADD CONSTRAINT myUniqueConstraint UNIQUE (col1, col2, colN);

-- добавление ограничения `CHECK`
ALTER TABLE tableName
ADD CONSTRAINT myUniqueConstraint CHECK (condition);

-- добавление первичного ключа
ALTER TABLE tableName
ADD CONSTRAINT myPrimaryKey PRIMARY KEY (col1, col2, colN);

-- удаление ограничения
ALTER TABLE tableName
DROP CONSTRAINT myUniqueContsraint;

-- mysql
ALTER TABLE tableName
DROP INDEX myUniqueContsraint;

-- удаление первичного ключа
ALTER TABLE tableName
DROP CONSTRAINT myPrimaryKey;

-- mysql
ALTER TABLE tableName
DROP PRIMARY KEY;

-- Добавляем в таблицу users новую колонку — пол пользователя:
ALTER TABLE users ADD gender char(1);

-- Удаляем эту колонку:
ALTER TABLE users DROP gender;
```

---
Очистка таблицы

Команда `TRUNCATE TABLE` используется для очистки таблицы. Ее отличие от `DROP TABLE` состоит в том, что сохраняется структура таблицы (`DROP TABLE` полностью удаляет таблицу и все ее данные).
Ещё делает сброс счетчика `AUTO_INCREMENT`;

```
TRUNCATE TABLE tableName;
```

```sql
# Очищаем таблицу users:
TRUNCATE TABLE users;
```
---

<a name="subqueries"><h2>Подзапросы</h2></a>

Подзапрос — это внутренний (вложенный) запрос другого запроса, встроенный (вставленный) с помощью WHERE или других инструкций.

Подзапросы могут использоваться в инструкциях `SELECT`, `INSERT`, `UPDATE` и `DELETE`, а также с операторами `=`, `<`, `>`, `>=`, `<=`, `IN`, `BETWEEN` и т.д.

```sql
SELECT * FROM users
WHERE userId IN (
    SELECT userId FROM users
    WHERE status = 'active'
);
```

<a name="subqueries_insert"><h3>Подзапросы в инструкции `INSERT`</h3></a>

```sql
INSERT INTO tableName (col1, col2, colN)
    SELECT col1, col2, colN
    FROM table1, table2, tableN
    WHERE operator = 'param';
```
