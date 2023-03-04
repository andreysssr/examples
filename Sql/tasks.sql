# ===========================================
# 1.1 Простые SQL запросы
# Все товары

SELECT * FROM products;
# -------------------------------------------
# 1.1 Простые SQL запросы
# Имя и цена

SELECT name, price FROM products;
# -------------------------------------------
# Недорогие товары

SELECT * FROM products
WHERE price < 3000;
# -------------------------------------------
# Имя и цена дорогих товаров

SELECT name, price FROM products
WHERE price >= 10000;
# -------------------------------------------
# Отсутствующие товары

SELECT name FROM products
WHERE count = 0;
# -------------------------------------------
# Имя и цена недорогих товаров

SELECT name, price FROM products
WHERE price <= 4000;
# ===========================================
# 1.2 Простые SQL запросы
# Активные заказы

SELECT * FROM orders
WHERE `status` != 'cancelled';
# -------------------------------------------
# Заказы с 3 товарами

SELECT id, `sum` FROM orders
WHERE products_count >= 3;
# -------------------------------------------
# Отмененные заказы

SELECT * FROM orders
WHERE `status` = 'cancelled';
# -------------------------------------------
# Заказы от 3000

SELECT * FROM orders
WHERE `sum` > 3000
AND products_count >= 3;
# -------------------------------------------
# Небольшие заказы от 3000

SELECT * FROM orders
WHERE `sum` >= 3000
AND products_count < 3;
# -------------------------------------------
# Плохие заказы

SELECT * FROM orders
WHERE `status` = 'cancelled'
OR status = 'returned';
# -------------------------------------------
# Отмененные заказы, часть 2

SELECT * FROM orders
WHERE status = 'cancelled'
AND `sum` >= 3000
AND `sum` <= 10000;
# -------------------------------------------
# Отмененные дорогие заказы

SELECT * FROM orders
WHERE status = 'cancelled'
  AND `sum` BETWEEN 3000 AND 10000;
# ===========================================
# 1.4 Простые SQL запросы
# От дешевых к дорогим

SELECT * FROM products
ORDER BY price;
# -------------------------------------------
# Премии

SELECT * FROM users
WHERE salary < 30000
AND salary != 0
ORDER BY birthday;
# -------------------------------------------
# Зарплата от 40000

SELECT * FROM users
WHERE salary > 40000
ORDER BY salary DESC, first_name;
# -------------------------------------------
# От дорогих к дешевым

SELECT name, price FROM products
ORDER BY price DESC;
# -------------------------------------------
# Дорогие товары

SELECT * FROM products
WHERE price >= 5000
ORDER BY price DESC;
# -------------------------------------------
# По алфавиту

SELECT name, count, price FROM products
WHERE price < 3000
ORDER BY name;
# -------------------------------------------
# Пользователи по алфавиту

SELECT last_name, first_name FROM users
ORDER BY last_name, first_name;
# ===========================================
# 1.5 Простые SQL запросы
# Последние дорогие заказы

SELECT * FROM orders
WHERE `sum` >= 3000
ORDER BY date DESC
LIMIT 3;
# -------------------------------------------
# Самые дешевые товары

SELECT * FROM products
WHERE count != 0
ORDER BY price
LIMIT 3;
# -------------------------------------------
# 3 страница

SELECT * FROM products
ORDER BY price
LIMIT 5 OFFSET 10;
# -------------------------------------------
# Дорогие заказы

SELECT * FROM orders
ORDER BY `sum` DESC
LIMIT 5;
# -------------------------------------------
# Последняя страница

SELECT name, price FROM products
WHERE count != 0
ORDER BY name
LIMIT 6 OFFSET 12;
# ===========================================
# 2.1 Добавление, изменение, удаление
# Новый заказ

INSERT INTO orders (id, products, `sum`)
VALUES (6, 3, 3000);
# -------------------------------------------
# Новый товар

INSERT INTO products (id, name, count, price)
VALUES (7, 'Xbox', 3, 30000);
# -------------------------------------------
# Новый товар, 2

INSERT INTO products (id, name, count, price)
VALUES (8, 'iMac 21', 0, 100100);
# -------------------------------------------
# Новый пользователь

INSERT INTO user (id, first_name, last_name, birthday)
VALUES (9, 'Антон', 'Петрович', '1992-07-12');
# -------------------------------------------
# Новые товары

INSERT INTO table (id, name, count, price)
VALUES
    (8, '* iPhone 7', 1, 59990),
    (9, '* iPhone 8', 3, 64990),
    (10, '* iPhone X', 2, 79900);
# -------------------------------------------
# Новый пользователь, 2

INSERT INTO users (id, first_name, last_name, birthday)
VALUES (10, 'Никита', 'Петров', null);

INSERT INTO users SET id = 10, first_name = 'Николай', last_name = 'Петров', birthday = null;
# ===========================================
# 2.2 Добавление, изменение, удаление
# Ошибка в названии товара

UPDATE products SET name = 'iMac'
WHERE name = 'IMAC';
# -------------------------------------------
# Повышаем цены

UPDATE products SET price = price + (price * 0.05)
ORDER BY price
LIMIT 5;
# -------------------------------------------
# Итого

UPDATE orders
SET amount = `sum` * products_count;
# -------------------------------------------
# Выполненный заказ

UPDATE orders SET status = 'success'
WHERE id = 5;
# -------------------------------------------
# Увеличение зарплаты

UPDATE users
SET salary = salary + (salary * 0.1)
WHERE salary < 20000;
# -------------------------------------------
# Новые заказы

UPDATE orders
SET status = 'new'
WHERE status IS NULL;
# -------------------------------------------
# Уменьшаем цены

UPDATE products
SET price = price - 5000
ORDER BY price DESC
LIMIT 5;
# -------------------------------------------
# Новые товары

UPDATE products
SET count = count + 40
WHERE name = 'Сникерс';

UPDATE products
SET count = count + 40
WHERE name = 'Марс';
# ===========================================
# 2.3 Добавление, изменение, удаление
# Удаление всех визитов

DELETE FROM visits;
# -------------------------------------------
# Убрать отсутствующие товары

DELETE FROM products
WHERE count = 0;
# -------------------------------------------
# Старые автомобили

DELETE FROM cars
WHERE year <= 2010;
# -------------------------------------------
# Лишние автомобили

DELETE FROM cars
WHERE country = "KR"
OR power < 80;
# -------------------------------------------
# Лишние автомобили, 2

DELETE FROM cars
WHERE country = 'JP'
AND (power < 80 OR power > 130);
# -------------------------------------------
# Удаление всех автомобилей

TRUNCATE TABLE cars;
# ===========================================
# 3.1 Создание таблиц
# Таблица rating

DROP TABLE IF EXISTS rating;

CREATE TABLE rating
(
    id      INT,
    car_id  INT,
    user_id INT,
    rating  FLOAT
);

INSERT INTO rating (id, car_id, user_id, rating)
VALUES (1, 1, 1, 4.54),
       (2, 1, 2, 3.54),
       (3, 2, 3, 4.19),
       (4, 2, 11, 1.12);

# -------------------------------------------
# Таблица orders

DROP TABLE IF EXISTS orders;

CREATE TABLE orders
(
    id     INT,
    state  VARCHAR(50),
    amount INT
);

INSERT INTO orders (id, state, amount)
VALUES (1, 'new', 10000),
       (2, 'new', 3400),
       (3, 'delivery', 7300);

# -------------------------------------------

# Таблица users

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id         INT,
    first_name VARCHAR(50),
    last_name  VARCHAR(50)
);

INSERT INTO users (id, first_name, last_name)
VALUES (1, 'Дмитрий', 'Иванов'),
       (2, 'Анатолий', 'Белый'),
       (3, 'Денис', 'Давыдов');

# -------------------------------------------
# Дни рождения

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id         INT,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    birthday   DATE
);

INSERT INTO users (id, first_name, last_name, birthday)
VALUES (1, 'Дмитрий', 'Иванов', '1995-08-12'),
       (2, 'Светлана', 'Демчук', '1993-07-08'),
       (3, 'Денис', 'Антонов', '1996-12-23');

SELECT *
FROM users;

# -------------------------------------------

# Таблица messages

DROP TABLE IF EXISTS messages;

CREATE TABLE messages
(
    id        INT,
    subject   VARCHAR(100),
    message   TEXT,
    add_date  DATETIME,
    is_public BOOL
);

INSERT INTO messages
VALUES (1, 'Первое сообщение', 'Это моё первое сообщение!', '2016-12-12 14:16:00', TRUE);

SELECT *
FROM messages;

# ===========================================
# 3.2 Создание таблиц
# Товары в магазине

DROP TABLE IF EXISTS products;

CREATE TABLE products
(
    id    INT UNSIGNED,
    name  VARCHAR(100),
    count INT UNSIGNED,
    price INT(7) UNSIGNED
);

INSERT INTO products (id, name, count, price)
VALUES (1, 'Холодильник', 10, 50000),
       (2, 'Стиральная машина', 0, 23570),
       (3, 'Утюг', 3, 7300);

SELECT *
FROM products;

# -------------------------------------------
# Заказы со скидкой

DROP TABLE IF EXISTS orders;

CREATE TABLE orders
(
    id         INT UNSIGNED,
    product_id INT UNSIGNED,
    sale       TINYINT UNSIGNED,
    amount     DECIMAL(10, 2)
);

INSERT INTO orders
VALUES (1, 245, 0, 230.5),
       (2, 17, 15, 999999.99),
       (3, 145677, 21, 1240.00);

SELECT *
FROM orders;

# -------------------------------------------
# Файлы

DROP TABLE IF EXISTS files;

CREATE TABLE files
(
    id       INT UNSIGNED,
    filename VARCHAR(255),
    size     BIGINT UNSIGNED,
    filetype VARCHAR(3)
);

INSERT INTO files
VALUES (1, 'big_archive.zip', 81604378624, 'zip'),
       (2, 'move_37', 7838315315, 'mp4'),
       (3, 'music007.mp3', 5242880, 'mp3');

SELECT *
FROM files;

# -------------------------------------------
# Фильмы

DROP TABLE IF EXISTS films;

CREATE TABLE films
(
    id      INT UNSIGNED,
    name    VARCHAR(100),
    rating  DOUBLE(10, 2),
    country VARCHAR(2)
);

INSERT INTO films
VALUES (1, 'Большая буря', 3.45, 'RU'),
       (2, 'Игра', 7.5714, 'US'),
       (3, 'Матрица', 10.0, 'RU');

SELECT *
FROM films;

# ===========================================
# 3.4 Создание таблиц

# Биография

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id         INT UNSIGNED,
    first_name VARCHAR(50),
    last_name  VARCHAR(60),
    bio        TEXT
);

INSERT INTO users
VALUES (1, 'Антон', 'Кулик', 'С отличием окончил 39 лекций'),
       (2, 'Сергей', 'Давыдоы', ''),
       (3, 'Дмитрий', 'Соколов', 'Профессиональный программист');

SELECT *
FROM users;

# -------------------------------------------
# Квартиры

DROP TABLE IF EXISTS apartments;

CREATE TABLE apartments
(
    id     INT UNSIGNED,
    image  VARCHAR(100),
    price  INT,
    square INT
);

INSERT INTO apartments
VALUES (1, '/apartments/1/cover.jpg', 5250000, 90),
       (2, '/apartments/2/cover-3.jpg', 750000, 103),
       (3, '', 2300000, 56);

SELECT *
FROM apartments;

# -------------------------------------------
# Книги

DROP TABLE IF EXISTS books;

CREATE TABLE books
(
    id          INT UNSIGNED,
    name        VARCHAR(100),
    description VARCHAR(1000),
    isbn        BIGINT(13)
);

INSERT INTO books
VALUES (1, 'MySQL 5', 'Хорошая книга.', 5941579284),
       (2, 'Изучаем SQL', 'Полезная книга.', 5932860510),
       (3, 'Изучаем Python. 4-е издание', 'Подробная книга о Python.', 9785932861592);

SELECT *
FROM books;

# -------------------------------------------
# Автомобили Nissan

SELECT *
FROM cars
WHERE year < 1990
  AND power > 120;
# -------------------------------------------
# Путь до фотографии

DROP TABLE IF EXISTS files;

CREATE TABLE files
(
    id        INT UNSIGNED,
    file_url  VARCHAR(500),
    file_path VARCHAR(200),
    size      BIGINT UNSIGNED
);

INSERT INTO files
VALUES (1, 'https://archives.com/arhives/big_arhive.zip', 'files/2018/02/archive.zip', 81604378624),
       (2, 'https://movies.com/movies/movie.mp4', '', 0),
       (3, 'https://movies.com/best-songs/song.mp3', 'files/2018/03/song.mp3', 5242880);

SELECT *
FROM files;
# -------------------------------------------
# Японки и Пежо

SELECT *
FROM cars
WHERE country = 'JP'
   OR mark = 'Peugeot';

# ===========================================
# 3.5 Создание таблиц

# Регистрация и вход

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id            INT UNSIGNED,
    email         VARCHAR(100),
    date_joined   DATE,
    last_activity DATETIME
);

INSERT INTO users
VALUES (1, 'user1@domain.com', '2014-12-12', '2016-04-08 12:34:54'),
       (2, 'user2@domain.com', '2014-12-12', '2017-02-13 11:46:53'),
       (3, 'user3@domain.com', '2014-12-13', '2017-04-04 05:12:07');

SELECT *
FROM users;

# -------------------------------------------
# Автомобили дилера

DROP TABLE IF EXISTS cars;

CREATE TABLE cars
(
    id      INT UNSIGNED,
    mark    VARCHAR(20),
    model   VARCHAR(20),
    year    YEAR,
    mileage INT(6)
);

INSERT INTO cars
VALUES (1, 'Toyota', 'Camry', 2015, 32000),
       (2, 'Mazda', 'CX-5', 2016, 17000),
       (3, 'Nissan', 'Patrol', 2016, 60000);

SELECT *
FROM cars;

# -------------------------------------------
#Время прихода на работу

DROP TABLE IF EXISTS arrival;

CREATE TABLE arrival
(
    id      INT UNSIGNED,
    user_id INT UNSIGNED,
    a_date  DATE,
    a_time  TIME
);

INSERT INTO arrival
VALUES (1, 10, '2017-03-09', '08:45:41'),
       (2, 12, '2017-03-09', '08:46:12'),
       (3, 7, '2017-03-09', '09:55:02'),
       (4, 31, '2017-03-09', '11:34:54');

SELECT *
FROM arrival;
# -------------------------------------------
# Температура

DROP TABLE IF EXISTS temperature;

CREATE TABLE temperature
(
    id          INT UNSIGNED,
    city_id     INT UNSIGNED,
    temperature TINYINT,
    wind_speed  INT UNSIGNED,
    mdate       DATETIME
);

INSERT INTO temperature
VALUES (1, 465, 17, 7, '2017-02-08 12:00:00'),
       (2, 465, 19, 6, '2017-02-08 12:10:00'),
       (3, 465, 20, 6, '2017-02-08 12:20:00'),
       (4, 471, -7, 12, '2017-02-08 12:20:01'),
       (5, 44, -43, 17, '2017-02-08 12:23:12');

SELECT *
FROM temperature;
# -------------------------------------------
# Автомобили 2016 года

SELECT *
FROM cars
WHERE mileage < 50000
  AND year = 2016;
# -------------------------------------------
# Календарь посетителей

DROP TABLE IF EXISTS calendar;

CREATE TABLE calendar
(
    id         INT UNSIGNED,
    user_id    INT UNSIGNED,
    doctor_id  INT UNSIGNED,
    visit_date DATETIME
);

INSERT INTO calendar
VALUES (1, 1914, 1, '2017-04-08 12:00:00'),
       (2, 12, 1, '2017-04-08 12:30:00'),
       (3, 4641, 2, '2017-04-09 09:00:00'),
       (4, 784, 1, '2017-04-08 13:00:00'),
       (5, 15, 2, '2017-04-09 10:00:00');

SELECT *
FROM calendar;

# ===========================================
# 3.6 Создание таблиц
# Товары без категорий

SELECT name, count, price
FROM products
WHERE category_id IS NULL
ORDER BY price;
# -------------------------------------------
# Таблица для товаров

DROP TABLE IF EXISTS products;

CREATE TABLE products
(
    id          INT UNSIGNED            NOT NULL,
    name        VARCHAR(120)            NOT NULL,
    category_id INT UNSIGNED            NULL,
    price       DECIMAL(10, 2) UNSIGNED NOT NULL
);

INSERT INTO products
VALUES (1, 'Подгузники (12 шт)', 3, 700.00),
       (2, 'Подгузники (24 шт)', 3, 1250.00),
       (3, 'Спиннер', NULL, 250.40),
       (4, 'Пюре слива', 4, 47.50);

SELECT *
FROM products;

# -------------------------------------------
# Пустой email

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id    INT UNSIGNED NOT NULL,
    email VARCHAR(100)
);

INSERT INTO users
VALUES (1, 'user1@domain.com'),
       (2, 'user2@domain.com'),
       (3, 'user3@domain.com'),
       (4, 'user4@domain.com');

SELECT *
FROM users;
# ===========================================
# 3.8 Создание таблиц

# Номера в отеле

DROP TABLE IF EXISTS rooms;

CREATE TABLE rooms
(
    id         INT UNSIGNED NOT NULL,
    number     INT(3)       NOT NULL,
    beds       ENUM ('1+1', '2+1', '2+2'),
    additional SET ('conditioner', 'bar', 'fridge', 'wifi')
);

INSERT INTO rooms
VALUES (1, 10, '1+1', 'conditioner,bar,wifi'),
       (2, 12, '2+1', ''),
       (3, 24, '2+2', 'fridge,bar,wifi');

SELECT *
FROM rooms;

# -------------------------------------------
# Статьи

DROP TABLE IF EXISTS articles;

CREATE TABLE articles
(
    id    INT UNSIGNED NOT NULL,
    name  VARCHAR(80),
    text  TEXT,
    state ENUM ('draft', 'correction', 'public ')
);

INSERT INTO articles
VALUES (1, 'Новое в Python 3.6', '', 'draft'),
       (2, 'Оптимизация SQL запросов', 'При больших объемах данных ...', 'correction'),
       (3, 'Транзакции в MySQL', 'По долгу службы мне приходится ...', 'public');

SELECT *
FROM articles;

# -------------------------------------------
# Таблица заказов

DROP TABLE IF EXISTS orders;

CREATE TABLE orders
(
    id      INT UNSIGNED   NOT NULL,
    user_id INT UNSIGNED   NOT NULL,
    amount  DECIMAL(10, 2) NOT NULL,
    created DATETIME       NOT NULL,
    state   ENUM ('new', 'cancelled', 'in_progress', 'delivered', 'completed'),
    options SET ('pack', 'fitting', 'call', 'intercom')
);

INSERT INTO orders
VALUES (456, 763, 14299.00, '2018-02-01 17:45:59', 'completed', 'pack,call'),
       (457, 1987, 249.50, '2018-02-01 18:23:04', 'delivered', 'pack,intercom'),
       (459, 78, 2300.12, '2018-02-01 22:12:09', 'in_progress', '');

SELECT *
FROM orders;
# -------------------------------------------
# Персональные данные

SELECT id, first_name, last_name, birthday
FROM users
WHERE pers_info IS NULL
   OR pers_info = FALSE;
# -------------------------------------------
# Непроданные японские автомобили

SELECT mark, model, year, power
FROM cars
WHERE mark = 'Nissan'
  AND dealer_id IS NOT NULL
  AND year BETWEEN 2010 AND 2016
  AND sold = FALSE
ORDER BY power;

# -------------------------------------------
# Менеджеры

SELECT first_name, last_name, birthday, roles
FROM users
WHERE sex = 'm'
  AND active = TRUE
  AND FIND_IN_SET('manager', roles)
ORDER BY last_name, first_name;
# -------------------------------------------
# Товары из России и Белоруссии

SELECT name, price, country
FROM products
WHERE category_id IS NOT NULL
  AND (FIND_IN_SET('RU', country) OR FIND_IN_SET('BY', country))
ORDER BY price DESC;
# -------------------------------------------
# Товары из России и Украины

SELECT id, name, price, country
FROM products
WHERE count != 0
  AND (country = 'RU' OR country = 'UA')
ORDER BY country, price;
# ===========================================
# 3.10 Создание таблиц
# Отзывы

DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
    id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    course ENUM('python', 'sql', 'all') NOT NULL DEFAULT 'all',
    text TEXT NOT NULL,
    public BOOL NOT NULL DEFAULT FALSE
);

INSERT INTO reviews (id, user_id, course, text, public)
VALUES
    (1, 817, 'python', 'Это прекрасная возможность получить новые очки в программировании. Доступное объяснение позволяет без проблем изучить желаемый материал', TRUE),
    (2, 1289, 'python', 'Проект на мой взгляд отличный: 1. Короткие видеоролики без воды 2. Интересные задачи и практика 3. Очень быстрая обратная связь', TRUE);

INSERT INTO reviews (id, user_id, text)
VALUES
    (3, 2914, 'Хорошая затея. Но проект ещё нуждается в развитии.');

SELECT * FROM reviews;
# -------------------------------------------
# Логи

DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    browser VARCHAR(500) NOT NULL DEFAULT '',
    is_bot BOOL NOT NULL DEFAULT FALSE
);

INSERT INTO logs (browser, is_bot)
VALUES
    ('Chrome 64.0.1.417', FALSE),
    ('Firefox 55 (yandex bot)', TRUE),
    ('Chrome 63.0.0.471', FALSE);

SELECT * FROM logs;
# -------------------------------------------
# Товары

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT UNSIGNED NOT NULL,
    category_id INT DEFAULT NULL,
    name VARCHAR(100) NOT NULL ,
    count TINYINT UNSIGNED NOT NULL DEFAULT 0,
    price DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

INSERT INTO products (id, category_id, name, count, price)
VALUES
    (1, 1, 'Кружка', 5, 45.90);

INSERT INTO products (id, category_id, name, price)
VALUES
    (2, 17, 'Фломастеры', 78.00);

INSERT INTO products (id, name, count, price)
VALUES
    (3, 'Сникерс', 12, 78.00);

SELECT * FROM products;
# -------------------------------------------
# Статус по умолчанию

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    amount INT UNSIGNED NOT NULL  DEFAULT 0,
    created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    state ENUM ('new', 'cancelled', 'in_progress', 'delivered', 'completed') NOT NULL DEFAULT 'new'
);

INSERT INTO orders (id, user_id, amount)
VALUES
    (1, 56, 5400),
    (2, 90, 249),
    (3, 78, 2200);

SELECT * FROM orders;
# -------------------------------------------
# Пользователи

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    patronymic VARCHAR(20) NOT NULL DEFAULT '',
    is_active BOOL DEFAULT TRUE,
    is_superuser BOOL DEFAULT FALSE
);

INSERT INTO users (id, first_name, last_name)
VALUES (1, 'Дмитрий', 'Иванов');

INSERT INTO users (id, first_name, last_name, patronymic, is_superuser)
VALUES (2, 'Анатолий', 'Белый', 'Сергеевич', TRUE);

INSERT INTO users (id, first_name, last_name, is_active)
VALUES (3, 'Андрей', 'Крючков', FALSE);

SELECT * FROM users;

# ===========================================
# 4.1 Индексы
# Цифровые фильмы

DROP TABLE IF EXISTS files;

CREATE TABLE files (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    film_id INT UNSIGNED NOT NULL,
    size BIGINT UNSIGNED NOT NULL,
    filename VARCHAR(100)
);

INSERT INTO files (film_id, size, filename)
VALUES
    (356, 28668906700, 'silicon_valley_s02_1080p.zip'),
    (4514, 2684354560, 'dunkirk.mp4'),
    (87145,	734003200, 'milk.mp4');

SELECT * FROM files;
# -------------------------------------------
# Первичный ключ

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday DATE
);

INSERT INTO users (first_name, last_name, birthday)
VALUES
    ('Дмитрий', 'Иванов', NULL),
    ('Анатолий', 'Белый', NULL),
    ('Денис', 'Давыдов', '1995-09-08');

SELECT * FROM users;
# -------------------------------------------
# Четные первичные ключи

SELECT * FROM products
WHERE id % 2 = 0
ORDER BY price;
# -------------------------------------------
# Паспорта

DROP TABLE IF EXISTS passports;

CREATE TABLE passports (
    series VARCHAR(4) NOT NULL,
    number VARCHAR(6) NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    date_issue DATE,
    PRIMARY KEY inx_passports (series, number)
);

INSERT INTO passports
VALUES
    ('3206', '147345', 15, '2006-08-12'),
    ('3216', '147345', 234, '2016-09-23'),
    ('2405', '147345', 1, '2015-01-07'),
    ('5411', '147345', 15, '2008-03-03');

SELECT * FROM passports;
# -------------------------------------------
# Автоинкремент

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    state VARCHAR(8),
    amount DECIMAL(7,2)
);

INSERT INTO orders (state, amount)
VALUES
    ('new', 1000.50),
    ('new', 3400.10),
    ('delivery', 7300.00);

SELECT * FROM orders;
# -------------------------------------------
# Изменение пользователя

UPDATE users
SET first_name = 'Дмитрий'
WHERE id = 7;
# -------------------------------------------
# Товары после 5000 рублей

SELECT * FROM products
WHERE price >= 5000
ORDER BY id DESC;
# -------------------------------------------
# Удаление заказов

DELETE FROM orders
WHERE id IN (3,4,7);
# ===========================================
# 4.2 Индексы

# Клиенты

DROP TABLE IF EXISTS clients;

CREATE TABLE clients (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL ,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    passport VARCHAR(10) NOT NULL,
    UNIQUE KEY (email),
    UNIQUE KEY (passport)
);

SELECT * FROM clients;
# -------------------------------------------
# Штрих коды

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category_id INT UNSIGNED DEFAULT NULL,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(50) NOT NULL,
    ean13 VARCHAR(13) NOT NULL,
    UNIQUE KEY (ean13),
    UNIQUE KEY category_slug (category_id, slug)
);

SELECT * FROM products;
# -------------------------------------------
# Посты

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    name VARCHAR(100) NOT NULL,
    pub_date DATETIME DEFAULT NULL,
    slug VARCHAR(50) NOT NULL,
    UNIQUE KEY uslug (user_id, slug)
);

SELECT * FROM posts;
# -------------------------------------------
# Паспорта

DROP TABLE IF EXISTS passports;

CREATE TABLE passports (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    series VARCHAR(4) NOT NULL,
    number VARCHAR(6) NOT NULL,
    state ENUM ('active', 'expired ') NOT NULL DEFAULT 'active',
    UNIQUE KEY passport (series, number)
);

SELECT * FROM passports;
# ===========================================
# 4.3 Индексы

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    state VARCHAR(8) NOT NULL DEFAULT 'new',
    amount INT(7) NOT NULL DEFAULT 0,
    INDEX (user_id),
    INDEX (state)
);

SELECT * FROM orders;
# -------------------------------------------
# Индексы по категории и цене

DROP TABLE IF EXISTS products ;

CREATE TABLE products (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category_id INT DEFAULT NULL,
    name VARCHAR(100) NOT NULL,
    count TINYINT UNSIGNED NOT NULL DEFAULT 0,
    price DECIMAL (10, 2) NOT NULL DEFAULT 0.00,
    INDEX (category_id),
    INDEX (price)
);

# CREATE INDEX category_id ON products (category_id);
# CREATE INDEX price ON products (price);

SELECT * FROM products;
# -------------------------------------------
# Составной простой индекс

DROP TABLE IF EXISTS orders  ;

CREATE TABLE orders (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    city_id INT UNSIGNED NOT NULL,
    state ENUM ('new', 'cancelled', 'delivered', 'completed') NOT NULL DEFAULT 'new',
    amount INT(7) NOT NULL DEFAULT 0,
    INDEX main_search(city_id, state),
    INDEX (user_id)
);

SELECT * FROM orders;

# -------------------------------------------
# Индексы по номеру и серии паспорта

DROP TABLE IF EXISTS passports   ;

CREATE TABLE passports (
    id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    series VARCHAR(4) NOT NULL,
    number VARCHAR(6) NOT NULL,
    state ENUM ('active', 'expired') NOT NULL DEFAULT 'active',
    INDEX passport (series, number),
    INDEX (series),
    INDEX (number)
);

SELECT * FROM passports;
# ===========================================
# 4.4 Индексы
# Удаление неправильных индексов

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category_id INT UNSIGNED NULL DEFAULT NULL,
    name VARCHAR(100) NOT NULL,
    count TINYINT UNSIGNED NOT NULL DEFAULT 0,
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    UNIQUE INDEX category_id (category_id),
    INDEX count (count),
    INDEX main_search (category_id, price)
);

# ---
DROP INDEX count ON products;

SELECT * FROM products;
# -------------------------------------------
# Индекс по серии и номеру паспорта

DROP TABLE IF EXISTS passports;

CREATE TABLE passports (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    series VARCHAR(4) NOT NULL,
    number VARCHAR(6) NOT NULL,
    state ENUM('active','expired') NOT NULL DEFAULT 'active',
    UNIQUE KEY series (series),
    UNIQUE KEY number (number)
);
# ---
DROP INDEX series ON passports;
DROP INDEX number ON passports;

CREATE INDEX series_number ON passports(series, number);
# -------------------------------------------
# Индекс по дате

DROP TABLE IF EXISTS calendar;

CREATE TABLE calendar (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    city_id INT UNSIGNED NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    date DATETIME NOT NULL
);

CREATE INDEX base_query ON calendar ( city_id, date);

SELECT * FROM calendar;
# -------------------------------------------
# Индекс по категории

CREATE INDEX category_id ON products (category_id);
# ===========================================
# 5.1 Изменение таблиц
# Статус статьи

DROP TABLE IF EXISTS articles;

CREATE TABLE articles (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    text TEXT
);

SELECT * FROM articles;

#---
ALTER TABLE articles
ADD COLUMN state ENUM ('draft', 'correction', 'public') NOT NULL DEFAULT 'draft';

SELECT * FROM articles;
# -------------------------------------------
# Удаление столбца

DROP TABLE IF EXISTS articles;

CREATE TABLE articles (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    text TEXT,
    state ENUM('draft', 'correction', 'public') NOT NULL DEFAULT 'draft'
);

SELECT * FROM articles;
#---
ALTER TABLE articles
DROP COLUMN state;

SELECT * FROM articles;
# -------------------------------------------
# Средний рейтинг
ALTER TABLE films
DROP COLUMN rating;

ALTER TABLE films
ADD COLUMN rating DOUBLE(2,2) DEFAULT ((imdb + kinopoisk) / 2);

SELECT * FROM films;
# -------------------------------------------
# Место товара на складе

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NULL DEFAULT NULL,
    name VARCHAR(100) NOT NULL,
    count TINYINT UNSIGNED NOT NULL DEFAULT 0,
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00
);

SELECT * FROM products;
#---
ALTER TABLE products
ADD COLUMN stock_place VARCHAR(6) NOT NULL DEFAULT '';

SELECT * FROM products;
# -------------------------------------------
# Расширяем пользователя

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    is_admin BOOL NOT NULL DEFAULT False
);

SELECT * FROM users;
#---
ALTER TABLE users
ADD COLUMN birthday DATE DEFAULT NULL;

ALTER TABLE users
ADD COLUMN last_visit DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE users
ADD COLUMN is_active BOOL NOT NULL DEFAULT TRUE;

ALTER TABLE users
ADD COLUMN experience INT UNSIGNED NOT NULL DEFAULT 0;
# ===========================================
# 5.2 Изменение таблиц
# Фамилия пользователя

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL,
    name VARCHAR(20) NOT NULL DEFAULT '',
    is_admin BOOL NOT NULL DEFAULT False
);

SELECT * FROM users;
#---
ALTER TABLE users
CHANGE name first_name VARCHAR(20) NOT NULL DEFAULT '';

ALTER TABLE users
ADD COLUMN last_name VARCHAR(20) NOT NULL DEFAULT '';

SELECT * FROM users;
# -------------------------------------------
# Новые товары – новые цены

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NULL DEFAULT NULL,
    name VARCHAR(100) NOT NULL,
    count TINYINT UNSIGNED NOT NULL DEFAULT 0,
    price SMALLINT UNSIGNED NOT NULL DEFAULT 0
);

SELECT * FROM products;
#---
ALTER TABLE products
MODIFY price INT UNSIGNED NOT NULL DEFAULT 0;

SELECT * FROM products;
# -------------------------------------------
# Твиттер

DROP TABLE IF EXISTS twitts;

CREATE TABLE twitts (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    message VARCHAR(140) NOT NULL
);

SELECT * FROM twitts;
#---
ALTER TABLE twitts
MODIFY message VARCHAR(280) NOT NULL;
# -------------------------------------------
# Серия и номер паспорта

DROP TABLE IF EXISTS passports;

CREATE TABLE passports (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    series SMALLINT UNSIGNED NOT NULL,
    number SMALLINT UNSIGNED NOT NULL
);

SELECT * FROM passports;
#---
ALTER TABLE passports
MODIFY series VARCHAR(4) NOT NULL;

ALTER TABLE passports
MODIFY number VARCHAR(6) NOT NULL;

CREATE INDEX passport ON passports(series, number);

SELECT * FROM passports;
# -------------------------------------------
# Точные логи

DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    browser VARCHAR(500) NOT NULL DEFAULT '',
    is_bot BOOLEAN NOT NULL DEFAULT FALSE
);

SELECT * FROM logs;
#---
ALTER TABLE logs
MODIFY date DATETIME (6) NOT NULL;

SELECT * FROM logs;
# -------------------------------------------
# Новый статус заказа

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    amount MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
    created DATETIME NOT NULL,
    state ENUM('new', 'delivery', 'completed', 'cancelled')
);

SELECT * FROM orders;
#---
ALTER TABLE orders
MODIFY state ENUM('new', 'delivery', 'completed', 'cancelled', 'awaiting_payment') NOT NULL DEFAULT 'new ';

SELECT * FROM orders;
# ===========================================
# 5.3 Изменение таблиц
# Категория и категории

RENAME TABLE category TO categories;
# -------------------------------------------
# Wordpress

SET foreign_key_checks = 0;
DROP TABLE IF EXISTS wp_users;
DROP TABLE IF EXISTS wp_posts;
DROP TABLE IF EXISTS wp_comments;
DROP TABLE IF EXISTS blog_users;
DROP TABLE IF EXISTS blog_posts;
DROP TABLE IF EXISTS blog_comments;
SET foreign_key_checks = 1;
CREATE TABLE wp_users (id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT);
CREATE TABLE wp_posts (id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT);
CREATE TABLE wp_comments (id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT);
# ---
RENAME TABLE wp_comments TO blog_comments, wp_posts TO blog_posts, wp_users TO blog_users;
# ===========================================
# 6.1 Поиск текста
# Фамилии на А...

SELECT * FROM users WHERE last_name LIKE 'А%'
ORDER BY last_name;
# -------------------------------------------
# Доменные имена

SELECT * FROM domains
WHERE domain LIKE '%.ru'
ORDER BY created;
# -------------------------------------------
# Обновление цен

UPDATE wines
SET price = price - 1
WHERE price LIKE '%00';
# -------------------------------------------
# BMW не bmw

SELECT * FROM cars
WHERE mark = 'BMW'
AND mark NOT LIKE BINARY 'BMW';
# -------------------------------------------
UPDATE cars
SET mark = 'BMW'
WHERE mark = 'BMW'
AND mark NOT LIKE BINARY 'BMW';
# -------------------------------------------
# Доменные имена, 2

SELECT domain FROM domains
WHERE domain LIKE '%.___'
ORDER BY domain;
# -------------------------------------------
# Автомобильные номера

SELECT * FROM cars
WHERE mark = 'Ford'
AND color IN ('желтый', 'зеленый')
AND number LIKE '_1%ОР%';
# ===========================================
# 6.2 Поиск текста
# Проблемы и ошибки, 2

SELECT * FROM forum
WHERE MATCH(subject, post) AGAINST ('Ошибк*' IN BOOLEAN MODE)
OR MATCH(subject, post) AGAINST ('Проблем*' IN BOOLEAN MODE);
# -------------------------------------------
# Убираем лишнее

SELECT * FROM products
WHERE MATCH(name) AGAINST ('джинсы -Mango' IN BOOLEAN MODE)
OR MATCH(name) AGAINST ('жилет* -Mango' IN BOOLEAN MODE);
# -------------------------------------------
# Точный поиск

SELECT * FROM products
WHERE MATCH(name) AGAINST ('"Джинсы Mango"' IN BOOLEAN MODE);
# -------------------------------------------
# Джинсы и юбки

SELECT * FROM products
WHERE MATCH(name) AGAINST ('+джинсы +Mango' IN BOOLEAN MODE)
OR MATCH(name) AGAINST ('+юбк* +Mango' IN BOOLEAN MODE);
# -------------------------------------------
# Магазин одежды
SELECT * FROM products
WHERE MATCH(name) AGAINST ('"Джинсы Mango"')
AND count > 0
AND (FIND_IN_SET('36', sizes) OR FIND_IN_SET('38', sizes));
# -------------------------------------------
# Проблемы и ошибки

SELECT * FROM forum
WHERE MATCH(subject, post) AGAINST ('"ошибка"')
OR MATCH(subject, post) AGAINST ('"проблема"');
# ===========================================
# 7.1 Вспомогательные функции
# Страницы

SELECT *, CEILING(comments / 10) as pages FROM posts;
# -------------------------------------------
# ТОП 5 популярных фильмов
SELECT name, ROUND(rating, 2) as rating FROM films
ORDER BY rating DESC
LIMIT 5;
# -------------------------------------------
# Капитализация процентов

SELECT *, ROUND(initial_sum * POWER ((1 + percent / 100), years), 2) AS final_sum FROM deposits;
# -------------------------------------------
# Каждый третий

SELECT id, first_name, email FROM users
WHERE id % 3 = 0;
# -------------------------------------------
# Округление в сторону покупателя

SELECT *, FLOOR(amount - (amount / 100 * personal_sale)) AS final_amount FROM bills;
# -------------------------------------------
# Критическая температура

SELECT id, temperature FROM experiments
WHERE temperature < -10
OR temperature > 10;
# ===========================================
# 7.2 Вспомогательные функции
# Убираем пробелы

UPDATE products
SET name = TRIM(name);

SELECT * FROM products;
# -------------------------------------------
# Длина имени

SELECT * FROM products
WHERE CHAR_LENGTH(name) >= 5
AND  CHAR_LENGTH(name) <= 10
ORDER BY name;
# -------------------------------------------
# Номер паспорта

SELECT *, CONCAT(LPAD(series, 4, '0'), ' ', LPAD(number, 6, '0')) AS passport FROM passports
ORDER BY series, number;
# -------------------------------------------
# Доменные имена

UPDATE domains
SET domain = LEFT(domain, CHAR_LENGTH(domain) - 1)
WHERE domain LIKE '%.';

SELECT * FROM domains;
# -------------------------------------------
# Фамилии на ...ова

SELECT * FROM users
WHERE age >= 18
AND last_name LIKE '%ова'
ORDER BY age, last_name;
# -------------------------------------------
# Фамилия, имя, отчество

SELECT id, CONCAT_WS(' ', last_name , first_name, patronymic) AS name FROM users
ORDER BY last_name, first_name, patronymic;
# -------------------------------------------
# Паспорта

SELECT user_id, CONCAT(series, '', number) AS passport FROM passports;
# -------------------------------------------
# Номер и серия паспорта

SELECT id, LEFT(passport, 4) AS series, RIGHT(passport, 6) AS number FROM users
WHERE passport IS NOT NULL ;
# -------------------------------------------
SELECT id, SUBSTRING_INDEX(name, ' ', 1) AS first_name, SUBSTRING_INDEX(name, ' ', -1) AS last_name, age FROM users;
# Меняем таблицу

ALTER TABLE users
ADD COLUMN first_name VARCHAR(50) NOT NULL DEFAULT '';

ALTER TABLE users
ADD COLUMN last_name  VARCHAR(50) NOT NULL DEFAULT '';

UPDATE users
SET first_name = SUBSTRING_INDEX(name, ' ', 1),
    last_name = SUBSTRING_INDEX(name, ' ', -1);

ALTER TABLE users
DROP COLUMN name;

SELECT * FROM users;
# ===========================================
# 7.3 Вспомогательные функции
# Платежи в марте

SELECT id, user_id, amount, DATE_FORMAT(date, "%d.%m.%Y %H:%i") AS date
FROM payments
WHERE MONTH(date) = 3 AND YEAR(date) = 2017
ORDER BY date DESC
LIMIT 5;
# -------------------------------------------
# Гонщики

SELECT * FROM drivers
WHERE sex = 'm'
AND birthday <= ('2018-08-08' - INTERVAL 18 YEAR)
ORDER BY last_name, first_name;
# -------------------------------------------
# Часовые пояса - !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SELECT * , 	date + INTERVAL 3 HOUR AS visit_date FROM visits
ORDER BY date;
# -------------------------------------------
# Перенос записей

SELECT * , visit_date + INTERVAL 1 HOUR + INTERVAL 30 MINUTE as new_visit_date, 'перенос' as marker FROM calendar
WHERE visit_date > '2017-05-14 13:00:00'
UNION
SELECT * , visit_date as new_visit_date, 'без изменений' as marker FROM calendar
WHERE visit_date < '2017-05-14 13:00:00'
ORDER BY id;
#---
UPDATE calendar
SET visit_date = visit_date + INTERVAL 1 HOUR + INTERVAL 30 MINUTE
WHERE visit_date > '2017-05-14 13:00:00';

SELECT * FROM calendar;
# -------------------------------------------
# Будущие задачи

SELECT * , CONCAT_WS(' - ', 'будущие', id)  AS 'mark' FROM tasks
WHERE planned_date > NOW()
UNION
SELECT * , 'текущие' AS 'mark' FROM tasks
WHERE planned_date < NOW()
ORDER BY id;

#---
SELECT * FROM tasks
WHERE planned_date > NOW()
ORDER BY planned_date;
# -------------------------------------------
# Рожденные в 1994

SELECT * , DATE_FORMAT(birthday, '%d.%m.%Y') as user_birthday FROM users
WHERE YEAR(birthday) = 1994
ORDER BY birthday;
# -------------------------------------------
# Дни рождения в выходные
# Sat - суббота, Sun - воскресенье

SELECT * , DATE_FORMAT(birthday, '%a') AS day FROM users;
# ---
SELECT * , DATE_FORMAT(birthday, '%a') AS day FROM users
WHERE DATE_FORMAT(birthday, '%a') = 'Sat'
OR DATE_FORMAT(birthday, '%a') = 'Sun'
ORDER BY birthday;
# -------------------------------------------
# Визиты в обед

SELECT * FROM visits
WHERE date BETWEEN '2017-06-22 12:00:00' AND '2017-06-22 12:59:59'
ORDER BY date DESC ;
# ===========================================
# 8.1 Группировка данных
# Женщины до 30

SELECT * FROM  users
WHERE sex = 'w'
AND age < 30;
#---
SELECT COUNT(*) as women FROM users
WHERE sex = 'w'
  AND age < 30;
# -------------------------------------------
# Январский заработок

SELECT SUM(amount) as income FROM orders
WHERE YEAR(date) = 2015
  AND MONTH(date) = 1
AND status = 'success';
# -------------------------------------------
# Самый дорогой отмененный заказ

SELECT MAX(amount) AS max_losses FROM orders;
# -------------------------------------------
# Средний возраст и количество мужчин

SELECT COUNT(*) as count, ROUND(AVG(age), 1) AS age FROM clients;
# -------------------------------------------
# Первая отмена

SELECT DATE_FORMAT(MIN(date), '%d.%m.%Y') AS date FROM orders
WHERE status = 'cancelled';
# -------------------------------------------
# Число посетителей на сайте

SELECT COUNT(*) AS users FROM users
WHERE activity_date BETWEEN ('2018-04-08 12:36:17' - INTERVAL 5 MINUTE) AND '2018-04-08 12:36:17';
# -------------------------------------------
# Средний чек

SELECT ROUND(AVG(amount), 2) AS avg_check FROM orders
WHERE status = 'success'
  AND YEAR(date) = 2015;
# -------------------------------------------
# Налоги

SELECT CEILING(SUM(amount * 0.06)) AS tax FROM transactions
WHERE direction = 'in'
AND no_tax = TRUE
AND MONTH(date) IN (1, 2, 3);
# ===========================================
# 8.2 Группировка данных
# Число мужчин и женщин

SELECT sex as gender, COUNT(sex) as members FROM users GROUP BY sex;
# -------------------------------------------
# Сумма заказов по годам и месяцам

SELECT
    YEAR(date) AS year,
    MONTH(date) AS mounth,
    SUM(amount) AS income,
    COUNT(amount) as orders
FROM orders
WHERE status = 'success'
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, mounth;
# -------------------------------------------
# Средняя стоимость товаров

SELECT category_id, ROUND(AVG(price), 1) as avg_price, COUNT(*) as category_count FROM products
WHERE count > 0
GROUP BY category_id
ORDER BY category_id;
# -------------------------------------------
# Сумма заказов по годам

SELECT YEAR(date) AS year, SUM(amount) AS income FROM orders
WHERE status = 'success'
GROUP BY YEAR(date)
ORDER BY year;
# -------------------------------------------
# Возраст сотрудников

SELECT age, sex, COUNT(*) AS clients FROM users
GROUP BY age, sex
ORDER BY age DESC, sex;
# ===========================================
# 8.3 Группировка данных
# Категории с товарами

SELECT category_id, SUM(count) AS products FROM products
WHERE count > 0
GROUP BY category_id
ORDER BY products;
# -------------------------------------------
# Водители автобусов

SELECT driver_id, ROUND(ABS(AVG(diff)), 0) AS avg_diff FROM bus_logs
WHERE diff > 30 OR diff < -30
GROUP BY driver_id
HAVING avg_diff > 30
ORDER BY avg_diff;
# -------------------------------------------
# Лучшие сделки

SELECT user_id, COUNT(*) AS deals, SUM(amount) AS sum_amount, MAX(amount) AS max_amount FROM deals
WHERE status = 'closed'
GROUP BY user_id
HAVING deals >= 3
ORDER BY max_amount;
# -------------------------------------------
# Проблемные месяцы

SELECT YEAR(date) AS year, MONTH(date) AS month, SUM(amount) AS amount FROM deals
GROUP BY YEAR(date), MONTH(date)
HAVING amount < 300000
ORDER BY YEAR(date), MONTH(date);
# ===========================================
# 9.1 Многотабличные запросы
# Транзакции

SELECT * FROM bank_transactions
UNION
SELECT * FROM cashbox_transactions;
# -------------------------------------------
# База ГИБДД

SELECT LEFT(number, 6) AS number, RIGHT(number, 2) region, mark, model FROM cars
UNION
SELECT number, '39', mark, model FROM region39
UNION
SELECT number, region, mark, model FROM avto
UNION
SELECT LEFT(number, 6), RIGHT(number, 2), SUBSTRING_INDEX(car, ' ', 1), SUBSTRING_INDEX(car, ' ', -1) FROM autos;
# -------------------------------------------
# Транзакции пользователя

SELECT DATE_FORMAT(date, '%d.%m.%Y') AS date, amount, 'bank' AS payment_type FROM bank_transactions
WHERE client_id = 56
UNION
SELECT DATE_FORMAT(date, '%d.%m.%Y'), amount, 'cash' FROM cashbox_transactions
WHERE client_id = 56;
# -------------------------------------------
# Слияние фирм

SELECT
    (id * 10 + 1) AS id,
    first_name,
    last_name,
    age,
    NULL AS birthday,
    sex
FROM users
UNION
SELECT
    (id * 10 + 2),
    SUBSTRING_INDEX(name, ' ', 1),
    SUBSTRING_INDEX(name, ' ', -1),
#     YEAR(NOW()) - YEAR(birthday),
    NULl,
    birthday,
    sex
FROM members;
# -------------------------------------------
# Объявления пользователя

(SELECT id, category_id, date, text, 'opened' AS status FROM advs)
UNION
(SELECT id, category_id, date, text, 'closed' AS status FROM closed_advs)
ORDER BY date, id;
# -------------------------------------------
# Транзакции по датам

(SELECT date, amount, 'bank' AS pt FROM bank_transactions)
UNION
(SELECT date, amount, 'cash' FROM cashbox_transactions)
UNION
(SELECT date, amount, 'paypal' FROM paypal_transactions)
ORDER BY date DESC;
# -------------------------------------------
# Главная страница

(SELECT id, name, rating, 'Action' AS genre FROM games
WHERE category_id = 1 ORDER BY rating DESC LIMIT 2)
UNION
(SELECT id, name, rating, 'RPG' AS genre FROM games
WHERE category_id = 2 ORDER BY rating DESC LIMIT 2)
UNION
(SELECT id, name, rating, 'Adventure' AS genre FROM games
WHERE category_id = 3 ORDER BY rating DESC LIMIT 2)
UNION
(SELECT id, name, rating, 'Strategy ' AS genre FROM games
WHERE category_id = 4 ORDER BY rating DESC LIMIT 2)
UNION
(SELECT id, name, rating, 'Shooter' AS genre FROM games
WHERE category_id = 5 ORDER BY rating DESC LIMIT 2)
ORDER BY rating DESC, id;
# ===========================================
# 9.3 Многотабличные запросы
# Типы транзакций

SELECT type, SUM(amount) AS sum_amount FROM
(SELECT 'bank' AS type, amount FROM bank_transactions
UNION
SELECT 'cash', amount FROM cashbox_transactions
UNION
SELECT 'paypal', amount FROM paypal_transactions) result
GROUP BY type
ORDER BY sum_amount;
# -------------------------------------------
# Ежемесячные доходы

SELECT YEAR(date) AS year, MONTH(date) AS month, SUM(amount) AS month_amount FROM
(SELECT date, amount FROM bank_transactions
UNION
SELECT date, amount FROM cashbox_transactions
UNION
SELECT date, amount FROM paypal_transactions) result
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;
# -------------------------------------------
# Общая сумма

SELECT SUM(amount) AS all_money FROM
(SELECT amount FROM bank_transactions
UNION
SELECT amount FROM cashbox_transactions
UNION
SELECT amount FROM paypal_transactions) result;
# ===========================================
# 9.4 Многотабличные запросы
# Биографии пользователей

SELECT u.id, u.first_name, u.last_name, ud.bio  FROM users AS u, users_details AS ud
WHERE u.id = ud.id;
# -------------------------------------------
# Интернет-магазин красок

SELECT p.id, p.name, p.count, p.price, pd.description
FROM products AS p, products_details AS pd
WHERE p.id = pd.product_id
ORDER BY p.id;
# -------------------------------------------
# Неактивные товары

UPDATE products AS p, products_details AS pd
SET pd.description = ''
WHERE pd.product_id = p.id
AND p.active = FALSE;

SELECT * FROM products_details;
# -------------------------------------------
# Персональные данные

SELECT u.id, u.first_name, u.last_name, up.series
FROM users AS u, users_p AS up
WHERE u.id = up.id AND
up.series LIKE '32%'
ORDER BY u.last_name;
# -------------------------------------------
# Удаление товаров

DELETE FROM products
WHERE active = FALSE OR count = 0;

SELECT * FROM products;
SELECT * FROM products_details;
# -------------------------------------------
# Обновление пользователя

UPDATE users AS u, users_details AS ud
SET
    u.email = 'karina.n@domain.com',
    ud.last_name = 'Некифорова'
WHERE u.id = 8 AND u.id = ud.id;

SELECT * FROM users;
SELECT * FROM users_details;
# -------------------------------------------
# Биографии неактивных пользователей

# Разберем на примере ниже, как он работает.
# 1. В первой строке мы пишем из какой таблицы будем удалять — table2.
# 2. Затем с помощью USING и JOIN указываем, что эта таблица связана с таблицей table1.
# 3. Далее идет блок WHERE, где мы сперва задаем связь между двумя таблицами — через их id.
# 4. И в конце мы указываем условие удаления table1.id < 10.

# DELETE FROM table2
#     USING table1 JOIN table2
# WHERE
#     table2.id = table1.id AND
#     table1.id < 10;

DELETE FROM users_details
    USING users users_details
WHERE
    users.id = users_details.id AND
    users.active = FALSE;

SELECT * users_details;
# ===========================================
# 9.5 Многотабличные запросы
# Пользовательские данные

CREATE TABLE users (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_joined DATETIME NOT NULL
);

CREATE TABLE users_data (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bio TEXT,
    FOREIGN KEY (id) REFERENCES users(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
# -------------------------------------------
# Новый пользователь

INSERT INTO users (first_name, last_name)
VALUES ('Антон', 'Дмитриев');

INSERT INTO users_details (id, bio)
VALUES (LAST_INSERT_ID(), 'Антон родился в 1993 году.');
# -------------------------------------------
# Информация о краске

CREATE TABLE products (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NULL,
    count INTEGER NULL,
    price INTEGER NULL
);

CREATE TABLE products_details (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_id INT UNSIGNED NOT NULL,
    description TEXT,
    FOREIGN KEY (product_id) REFERENCES products (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
# -------------------------------------------
# Обновление и добавление

INSERT INTO users_details (id, bio)
VALUES (15, 'Антон родился в 1993 году.');

UPDATE users_details SET bio = 'Василиса Кац родилась в 1995 году.'
WHERE id = 4;
# ===========================================
# 9.6 Многотабличные запросы
# Товары с категориями

SELECT p.name, p.price, c.name AS category
FROM products AS p, categories AS c
WHERE p.category_id = c.id
ORDER BY p.name;
# -------------------------------------------
# Сделки

SELECT u.last_name, u.first_name, SUM(d.amount) AS total
FROM users AS u, deals AS d
WHERE u.id = d.user_id
GROUP BY u.id
ORDER BY total DESC ;
# -------------------------------------------
# Напитки

SELECT c1.id, c1.parent_id, c1.name FROM categories AS c1, categories AS c2
WHERE c1.parent_id = c2.id
AND c2.name = 'Напитки'
ORDER BY c1.id;
# -------------------------------------------
# Расписание врача

SELECT u.id, u.last_name, u.first_name, c.visit_date, DATE_FORMAT(c.visit_date, '%H:%m') AS visit_time
FROM users AS u, calendar AS c
WHERE u.id = c.client_id
  AND c.doctor_id = 9
AND DATE_FORMAT(c.visit_date, '%d-%m-%Y') = '17-04-2017';
# -------------------------------------------
# Завершенные заказы

SELECT DATE_FORMAT(o.date, '%d.%m.%Y') AS date  , o.amount, u.last_name, u.first_name
FROM orders AS o, users AS u
WHERE o.status = 'completed'
AND o.user_id = u.id
ORDER BY o.date;
# -------------------------------------------
# Февральские заказы

SELECT o.id, o.user_id, o.date, o.amount, o.status, u.first_name, u.last_name, u.age, u.sex
FROM orders AS o, users AS u
WHERE o.user_id = u.id
AND o.status = 'success'
AND u.age >= 18
AND u.sex = 'w'
AND YEAR(o.date) = 2017
AND MONTH(o.date) = 2;

SELECT o.id, o.user_id, o.date, o.amount
FROM orders AS o, users AS u
WHERE o.user_id = u.id
AND o.status = 'success'
AND u.age >= 18
AND u.sex = 'w'
AND YEAR(o.date) = 2017
AND MONTH(o.date) = 2;
# -------------------------------------------
# Книги по MySQL

SELECT b.id, b.name, b.price, CONCAT_WS(' ', a.first_name, a.last_name) AS author, c.name AS category
FROM books AS b, categories AS c, authors AS a
WHERE b.category_id = c.id
AND b.author_id = a.id
AND b.name LIKE '%MySQL%'
ORDER BY b.name;
# -------------------------------------------
# Джинсы и юбки, 2

SELECT p.id, p.name, p.price, b.name AS brand, c.name AS category
FROM brands AS b, categories AS c, products AS p
WHERE p.brand = b.id
AND p.category = c.id
AND p.count > 0
AND b.name = 'Mango'
AND (c.name = 'Джинсы' OR c.name = 'Юбки')
ORDER BY p.price, p.id;
# -------------------------------------------
# Опоздавшие сотрудники

SELECT u.id, u.last_name, u.first_name, COUNT(a.a_time) AS count
FROM users AS u, arrival AS a
WHERE u.id = a.user_id
AND YEAR(a.a_date) = 2017
AND MONTH(a.a_date) = 3
AND a.a_time > '09:00'
GROUP BY u.id
ORDER BY u.id;
# -------------------------------------------
# Товары с категориями и брендами

SELECT p.name, p.count, p.price, c.name, b.name
FROM products AS p, categories AS c, brands AS b
WHERE p.brand = b.id
AND p.category = c.id
AND p.count > 0
ORDER BY p.price, p.id;
# -------------------------------------------
# Количество наименований в категориях

SELECT c.name AS category, SUM(p.count) AS products
FROM categories AS c, products AS p
WHERE c.id = p.category_id
GROUP BY c.name
ORDER BY c.name;
# -------------------------------------------
# Напитки, часть 2

SELECT p.id, p.name, p.price, c.name AS category
FROM products AS p, categories AS c
WHERE p.category_id = c.id
AND c.name = 'Напитки';
# ===========================================
# 9.7 Многотабличные запросы
# Товары и категории

ALTER TABLE products
ADD FOREIGN KEY (category_id ) REFERENCES categories (id);

# -------------------------------------------
# Календарь врача

CREATE TABLE users (
   id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   first_name VARCHAR(50) NULL,
   last_name VARCHAR(50) NULL,
   is_doctor BOOLEAN NULL
);

CREATE TABLE calendar (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL,
    visit_date DATETIME NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES users(id),
    FOREIGN KEY (client_id) REFERENCES users(id)
);
# -------------------------------------------
# Связь жанров и исполнителей

CREATE TABLE genres (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NULL
);

CREATE TABLE artists (
     id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(50) NULL,
     is_group BOOLEAN NULL
);

ALTER TABLE artists
ADD COLUMN genre_id INT UNSIGNED NOT NULL;

ALTER TABLE artists
ADD FOREIGN KEY (genre_id) REFERENCES genres(id);
# -------------------------------------------
# Запись на массаж

INSERT INTO calendar (doctor_id, client_id, visit_date)
VALUES
    (7, 2, '2017-05-20 12:30' + INTERVAL 1 DAY),
    (7, 2, '2017-05-20 12:30' + INTERVAL 2 DAY),
    (7, 2, '2017-05-20 12:30' + INTERVAL 3 DAY),
    (7, 2, '2017-05-20 12:30' + INTERVAL 4 DAY),
    (7, 2, '2017-05-20 12:30' + INTERVAL 5 DAY);

SELECT * FROM `users`;
SELECT * FROM `calendar`;
# ===========================================
# 9.8 Многотабличные запросы
# Первый JOIN

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
    cats.parent_id IS NULL;

#---
SELECT
    p.id,
    p.name,
    p.price,
    cats.name as category
FROM
    products as p
JOIN
    categories as cats ON p.category_id = cats.id
WHERE
    cats.parent_id IS NULL;
# -------------------------------------------
# Исполнители и жанры

SELECT a.name, g.name, a.is_group
FROM artists AS a
JOIN genres AS g ON a.genre_id = g.id
WHERE a.is_group = TRUE
ORDER BY g.name, a.name;
# -------------------------------------------
# Города-миллионники

SELECT co.name AS country, ci.name AS name, ci.population
FROM cities AS ci
JOIN countries AS co ON ci.country = co.id
WHERE co.pw LIKE '%Europe%'
AND ci.population >= 1000000
ORDER BY ci.population DESC ;
# -------------------------------------------
# Количество исполнителей

SELECT g.name, COUNT(a.*) AS artists
FROM genres g
JOIN artists a ON g.id = a.genre_id
WHERE a.is_group = FALSE
GROUP BY g.name
ORDER BY artists DESC, g.name;
# -------------------------------------------
# Новый жанр и исполнитель

INSERT INTO genres (name)
VALUES ('Rap');

INSERT INTO artists ( name, genre_id, is_group)
SELECT 'Eminem' AS name, id, FALSE AS is_group FROM genres
WHERE name = 'Rap';
# -------------------------------------------
# Активные категории

SELECT c.name AS category, SUM(p.count) AS products
FROM categories c
JOIN products p ON p.category = c.id
WHERE p.count > 0
GROUP BY c.name
ORDER BY category;
# ===========================================
# 9.9 Многотабличные запросы
# Все категории

SELECT c.name AS category, SUM(p.count) AS products
FROM categories c
JOIN products p ON c.id = p.category
GROUP BY c.name
ORDER BY c.name;
# -------------------------------------------
# Товары с категориями

SELECT p.name, p.price, c.name AS category
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
ORDER BY p.name;
# -------------------------------------------
# Сотрудники и должности

SELECT e.first_name, e.last_name, r.name AS role
FROM employees e
LEFT JOIN roles r ON e.role_id = r.id
ORDER BY e.last_name, e.first_name;
# -------------------------------------------
# Наполненность жанров

SELECT g.name AS genres, COUNT(*) AS artists
FROM genres g
JOIN artists a ON a.genre_id = g.id
GROUP BY g.name
ORDER BY g.name;
# -------------------------------------------
# Структура компании

SELECT r.name, COUNT(e.id) AS employees
FROM roles r
JOIN employees e ON r.id = e.role_id
GROUP BY r.name
ORDER BY employees DESC, r.name;
# -------------------------------------------
# 9.10 Многотабличные запросы
# Книги и писатели

SELECT a.id AS author_id, b.id AS book_id, a.last_name, a.first_name, b.name AS name
FROM authors AS a
LEFT JOIN books AS b ON a.id = b.author_id
UNION
SELECT a.id AS author_id, b.id AS book_id, a.last_name, a.first_name, b.name AS name
FROM authors AS a
RIGHT JOIN books AS b ON a.id = b.author_id
ORDER BY author_id, book_id;
# -------------------------------------------
# Страны и города

SELECT co.name AS country, ci.name AS city
FROM countries AS co
JOIN cities AS ci ON co.id = ci.country
ORDER BY country, city;
# ===========================================
# 9.11 Многотабличные запросы
# Пользователи, роли, отделы

SELECT u.last_name, u.first_name, r.name AS role , d.name AS department
FROM users AS u
LEFT JOIN departments AS d ON u.department_id = d.id
LEFT JOIN roles AS r ON u.role_id = r.id
ORDER BY u.last_name, u.first_name;
# -------------------------------------------
# Количество композиций

SELECT g.name AS name, COUNT(s.name) AS songs
FROM genres AS g
JOIN artists AS a ON g.id = a.genre_id
JOIN albums AS al ON a.id = al.artist_id
JOIN songs AS s ON a.id = s.album_id
GROUP BY g.name;
# -------------------------------------------
# Машины автосалона

SELECT c.id , ma.name AS mark, mo.name AS model, c.price
FROM cars AS c
JOIN models AS mo ON c.model_id = mo.id
JOIN marks AS ma ON mo.mark_id = ma.id
ORDER BY c.price DESC ;
# -------------------------------------------
# Музыкальный сайт

SELECT s.id, s.name, al.name AS album , ar.name AS artist, g.name AS genres, al.year AS year
FROM songs AS s
JOIN albums AS al ON s.album_id = al.id
JOIN artists AS ar ON al.artist_id = ar.id
JOIN genres AS g ON ar.genre_id = g.id
WHERE g.name IN ('Rock', 'Metal')
AND al.year BETWEEN 2008 AND 2010
ORDER BY s.id;
# -------------------------------------------
# Отчет по менеджерам

SELECT m.first_name, m.last_name, sec_to_time(ROUND(AVG(ca.duration_sec), 0)) AS avg_duration
FROM managers AS m
JOIN calls AS ca ON ca.manager_id = m.id
JOIN clients AS cl ON ca.client_id = cl.id
JOIN companies AS co ON cl.company_id = co.id
GROUP BY m.first_name, m.last_name
ORDER BY avg_duration DESC ;
# -------------------------------------------
# Стоимость по маркам

SELECT ma.name AS mark, SUM(c.price) AS sum
FROM marks AS ma
JOIN models AS mo ON ma.id = mo.mark_id
JOIN cars AS c ON mo.id = c.model_id
GROUP BY ma.name
ORDER BY ma.name;
# -------------------------------------------
# Продолжительность звонков

SELECT co.name AS company, sec_to_time(SUM(ca.duration_sec)) AS duration
FROM companies AS co
JOIN clients AS cl ON co.id = cl.company_id
JOIN calls AS ca ON cl.id = ca.client_id
GROUP BY co.name
ORDER BY duration;
# -------------------------------------------
# Отчет о звонках

SELECT
    DATE_FORMAT(ca.date, '%H:%S') AS time,
    CONCAT(m.first_name, ' ', m.last_name) AS manager,
    CONCAT(cl.first_name, ' ', cl.last_name) AS client,
    co.name AS company,
    sec_to_time(ca.duration_sec) AS duration
FROM calls AS  ca
JOIN clients AS cl ON cl.id = ca.client_id
JOIN managers AS m ON m.id = ca.manager_id
LEFT JOIN companies AS co ON co.id = cl.company_id
WHERE DATE_FORMAT(ca.date, '%Y-%m-%d') = '2018-04-05'
ORDER BY time, duration;
# ===========================================
# 9.12 Многотабличные запросы
# Удаление категорий, часть 2

DELETE FROM categories
WHERE name = 'Молочные продукты'
OR name = 'Мясо';
# -------------------------------------------
# Удаление категории

DELETE FROM products
WHERE category_id IN (
SELECT id FROM categories
WHERE name = 'Молочные продукты'
OR name = 'Мясо'
);

DELETE FROM categories
WHERE name = 'Молочные продукты'
   OR name = 'Мясо';
# -------------------------------------------
# Перенос и удаление категорий

SELECT p.id, p.name
FROM products AS p
JOIN categories AS c ON p.category_id = c.id
WHERE c.name = 'Фрукты и овощи'
ORDER BY p.id;

#---
UPDATE products
SET category_id = 18
WHERE id IN (3, 4, 19);

UPDATE products
SET category_id = 19
WHERE id IN (9);

DELETE FROM categories
WHERE name = 'Фрукты и овощи';

DELETE FROM products
WHERE category_id IN (
    SELECT id FROM categories
    WHERE name = 'Молочные продукты'
) ;

DELETE FROM categories
WHERE name = 'Молочные продукты';
# -------------------------------------------
# Удаление категорий, часть 3

DELETE FROM categories
WHERE name IN ('Молочные продукты', 'Мясо');
# ===========================================
# 9.13 Многотабличные запросы
# Программисты

SELECT u.id, u.first_name, u.last_name
FROM users AS u
JOIN users_roles AS ur ON u.id = ur.user_id
JOIN roles AS r ON r.id = ur.role_id
WHERE r.name = 'Программист'
ORDER BY u.last_name;
# -------------------------------------------
# Сотрудники без ролей

SELECT u.id, u.last_name, u.first_name, ur.user_id
FROM users AS u
LEFT JOIN users_roles AS ur ON u.id = ur.user_id
WHERE ur.role_id IS NULL
ORDER BY u.last_name;
# -------------------------------------------
# Сотрудники компании

SELECT r.name AS role, COUNT(u.id) AS members
FROM roles AS r
JOIN users_roles AS ur ON ur.role_id = r.id
JOIN users AS u ON u.id = ur.user_id
GROUP BY r.name
ORDER BY r.name;
# -------------------------------------------
# Несколько ролей

SELECT u.id, u.first_name, u.last_name, COUNT(r.id) AS rols
FROM users AS u
JOIN users_roles AS ur ON u.id = ur.user_id
JOIN roles AS r ON r.id = ur.role_id
GROUP BY u.id
HAVING rols > 1
ORDER BY u.id;
# -------------------------------------------
# Команда проекта - 9.13 Многотабличные запросы

SELECT u.id, u.first_name, u.last_name, r.name
FROM users AS u
JOIN users_roles AS ur ON u.id = ur.user_id
JOIN roles AS r ON ur.role_id = r.id
WHERE r.name = 'Программист'
ORDER BY u.last_name;
# -------------------------------------------
# Сотрудники без ролей

SELECT u.id, u.last_name, u.first_name, ur.user_id
FROM users AS u
LEFT JOIN users_roles AS ur ON u.id = ur.user_id
WHERE ur.role_id IS NULL
ORDER BY u.last_name;
# -------------------------------------------
# Сотрудники компании

SELECT r.name AS role, COUNT(u.id) AS members
FROM roles AS r
JOIN users_roles AS ur ON r.id = ur.role_id
JOIN users AS u ON u.id = ur.user_id
GROUP BY r.name
ORDER BY r.name;
# -------------------------------------------
# Несколько ролей

SELECT u.id, u.first_name, u.last_name, COUNT(r.name) AS count
FROM users AS u
JOIN users_roles AS ur ON u.id = ur.user_id
JOIN roles AS r ON r.id = ur.role_id
GROUP BY u.id, u.first_name, u.last_name
HAVING count > 1
ORDER BY u.id;
# -------------------------------------------
# Команда проекта

SELECT u.id, u.first_name, u.last_name, r.name AS role
FROM users AS u
JOIN users_rp AS urp ON u.id = urp.user_id
JOIN roles AS r ON r.id = urp.role_id
JOIN projects AS p ON p.id = urp.project_id
WHERE p.name = 'Сайт оконный'
ORDER BY u.id;
# -------------------------------------------
# Самые продаваемые товары

SELECT p.id, p.name, COUNT(o.id) AS sold, COUNT(o.id) * p.price AS total
FROM products AS p
JOIN orders_details AS od ON od.product_id = p.id
JOIN orders AS o ON o.id = od.order_id
WHERE o.status = 'success'
GROUP BY p.id, p.name
ORDER BY sold DESC, total DESC
LIMIT 5;
# -------------------------------------------
# Заказы

SELECT o.id, COUNT(od.order_id) AS products, SUM(p.price) as amount
FROM orders AS o
JOIN orders_details AS od ON o.id = od.order_id
JOIN products AS p ON p.id = od.product_id
WHERE o.status = 'success'
GROUP BY o.id
ORDER BY amount;
# -------------------------------------------
# Корзина покупок

SELECT p.id, p.name, p.price
FROM products AS p
JOIN orders_details AS od ON p.id = od.product_id
JOIN orders AS o ON o.id = od.order_id
JOIN users AS u ON u.id = o.user_id
WHERE o.status = 'new'
AND u.first_name = 'Александр' AND u.last_name = 'Дмитриев'
ORDER BY p.id;
# -------------------------------------------
# Рок и метал композиции

SELECT s.id, s.name, al.name AS album, ar.name AS artist, g.name, al.year AS year
FROM songs AS s
JOIN albums AS al ON s.album_id = al.id
JOIN artists AS ar ON ar.id = al.artist_id
JOIN artists_genres AS ag ON ag.artist_id = ar.id
JOIN genres AS g ON g.id = ag.genre_id
WHERE (g.name = 'Rock' OR g.name = 'Metal')
AND al.year >= 2008
ORDER BY year, s.id;
# -------------------------------------------
# Битые заказы

SELECT o.id, o.status, COUNT(od.order_id) AS products
FROM orders AS o
LEFT JOIN orders_details AS od ON o.id = od.order_id
LEFT JOIN products AS p ON p.id = od.product_id
WHERE o.status = 'success'
AND p.name IS NULL
GROUP BY o.id, o.status;
# -------------------------------------------
# Меняем корзину

SELECT p.id, p.name
FROM products AS p
JOIN orders_details AS od ON od.product_id = p.id
JOIN orders AS o ON o.id = od.order_id
JOIN users AS u ON u.id = o.user_id
WHERE u.first_name = 'Александр'
AND u.last_name = 'Дмитриев'
ORDER BY p.id;
#---

INSERT INTO orders_details (order_id, product_id)
SELECT o.id AS order_id, p.id AS product_id
FROM orders AS o
         JOIN users AS u ON u.id = o.user_id
         JOIN products AS p
WHERE o.status = 'new'
  AND u.first_name = 'Александр'
  AND u.last_name = 'Дмитриев'
  AND p.name = 'Холодильник';
#---

DELETE
FROM orders_details
WHERE order_id = (SELECT o.id
                  FROM orders AS o
                           JOIN users AS u ON u.id = o.user_id
                  WHERE o.status = 'new'
                    AND u.first_name = 'Александр'
                    AND u.last_name = 'Дмитриев')
  AND product_id = (SELECT id
                    FROM products
                    WHERE name = 'Пылесос');
# -------------------------------------------
# Изменение ролей - 9.13 Многотабличные запросы

SELECT u.id, u.first_name, u.last_name, r.name
FROM users AS u
JOIN users_roles AS ur ON ur.user_id = u.id
JOIN roles AS r ON r.id = ur.role_id
ORDER BY u.id;
#---

DELETE FROM users_roles
WHERE user_id = (SELECT id
                 FROM users
                 WHERE first_name = 'Светлана'
                   AND last_name = 'Иванова')
  AND role_id = (SELECT id
                 FROM roles
                 WHERE name = 'Менеджер');
#---
INSERT INTO users_roles (user_id, role_id)
SELECT u.id AS user_id, r.id AS role_id
FROM users AS u
JOIN roles AS r
WHERE u.first_name = 'Анастасия'
  AND u.last_name = 'Дейчман'
AND r.name = 'Менеджер';

#---
INSERT INTO users_roles (user_id, role_id)
SELECT u.id AS user_id, r.id AS role_id
FROM users AS u
         JOIN roles AS r
WHERE u.first_name = 'Александр'
  AND u.last_name = 'Дмитриев'
  AND r.name = 'Программист';

# -------------------------------------------
# Ценные клиенты

SELECT u.id, u.first_name, u.last_name, SUM(p.price) AS value, COUNT(p.price) AS count_products
FROM users AS u
JOIN orders AS o ON u.id = o.user_id
JOIN orders_details AS od ON o.id = od.order_id
JOIN products AS p ON p.id = od.product_id
WHERE o.status = 'success'
GROUP BY u.id, u.first_name, u.last_name
ORDER BY value DESC
LIMIT 5;
# ===========================================
# 10.1 Вложенные запросы
# Активные категории, часть 2

SELECT id, name
FROM categories
WHERE id IN
(SELECT DISTINCT category FROM products WHERE count > 0)
ORDER BY name;
# -------------------------------------------
# VIP покупатели

SELECT id, first_name, last_name, age
FROM users
WHERE id IN (
      SELECT user_id FROM
          (SELECT user_id, SUM(amount) AS amount
           FROM orders
           WHERE status = 'completed'
           GROUP BY user_id
           HAVING amount = (SELECT amount
                            FROM (SELECT user_id, SUM(amount) AS amount
                                  FROM orders
                                  WHERE status = 'completed'
                                  GROUP BY user_id
                                  ORDER BY amount DESC
                                  LIMIT 1) AS t_maxSum)
           ) AS t_id);
# -------------------------------------------
# Хорошие джинсы

SELECT id, name, price
FROM products
WHERE category = (
    SELECT id FROM categories
    WHERE name = 'Джинсы'
)
AND price > (SELECT FLOOR(AVG(p.price)) AS avg_price
             FROM products AS p
             WHERE category = (
                 SELECT id FROM categories
                 WHERE name = 'Джинсы'
             ))
ORDER BY id;
# ===========================================
# 10.2 Вложенные запросы
# Минимальная партия

SELECT id, name, count
FROM products
WHERE category_id = 3
AND count < ALL (
    SELECT DISTINCT count
    FROM products
    WHERE category_id = 9
)
ORDER BY name;

# -------------------------------------------
# Дорогие овощи

SELECT id, name, price
FROM products
WHERE category_id = 9
AND price > ANY (
    SELECT DISTINCT price
    FROM products
    WHERE category_id = 3
)
ORDER BY name;
# ===========================================
# 10.3 Вложенные запросы
# Композиции 2008 года

SELECT * FROM songs
WHERE EXISTS(
SELECT * FROM albums
    WHERE year = 2008
    AND albums.id = songs.album_id
)
ORDER BY id;
# -------------------------------------------
# Активные категории, часть 3

SELECT * FROM categories
WHERE EXISTS(
    SELECT * FROM products
    WHERE products.count > 0
      AND products.category = categories.id
)
ORDER BY name;
# -------------------------------------------
# Сотрудники без ролей, часть 2

SELECT * FROM users
WHERE NOT EXISTS(
    SELECT * FROM users_roles
    WHERE users_roles.user_id = users.id
    AND role_id IN (
        SELECT id FROM roles
    )
);
# ===========================================
# 10.4 Вложенные запросы
# Подозреваемые

SELECT * FROM people
WHERE (people.first_name, people.last_name, people.age) IN
(
    SELECT suspects.fn, suspects.ln, suspects.age FROM suspects
)
ORDER BY people.id;

# -------------------------------------------
# Измененные цены

SELECT id, name, price FROM products
WHERE EXISTS(
    SELECT * FROM old_prices
    WHERE old_prices.product_id = products.id
)
ORDER BY id;
# -------------------------------------------
# Новые имена и фамилии

SELECT * FROM people
WHERE first_name NOT IN (
    SELECT first_name FROM first_names
    )
OR last_name NOT IN (
    SELECT last_name FROM last_names
    )
ORDER BY last_name;
# ===========================================
# 10.5 Вложенные запросы
# Фамилии и имена
SELECT * FROM
((SELECT l.last_name, f.first_name, f.sex
    FROM first_names AS f,
         last_names AS l
    WHERE f.sex = 'm'
      AND l.sex = 'm')
   UNION
   (SELECT l.last_name, f.first_name, f.sex
    FROM first_names AS f,
         last_names AS l
    WHERE f.sex = 'w'
      AND l.sex = 'w')) AS result
ORDER BY last_name, first_name, sex;
# -------------------------------------------
# Главная страница, часть 2

SELECT *
FROM (SELECT *
      FROM ((SELECT id, name, rating, 'Action' AS genre
             FROM games
             WHERE category_id = 1
             ORDER BY rating DESC
             LIMIT 2)
            UNION
            (SELECT id, name, rating, 'RPG' AS genre
             FROM games
             WHERE category_id = 2
             ORDER BY rating DESC
             LIMIT 2)
            UNION
            (SELECT id, name, rating, 'Adventure' AS genre
             FROM games
             WHERE category_id = 3
             ORDER BY rating DESC
             LIMIT 2)
            UNION
            (SELECT id, name, rating, 'Strategy ' AS genre
             FROM games
             WHERE category_id = 4
             ORDER BY rating DESC
             LIMIT 2)
            UNION
            (SELECT id, name, rating, 'Shooter ' AS genre
             FROM games
             WHERE category_id = 5
             ORDER BY rating DESC
             LIMIT 2)) AS result
      ORDER BY rating DESC
      LIMIT 5) As result
ORDER BY rating, id;
# -------------------------------------------
# Последние транзакции

SELECT * FROM
(SELECT * FROM
    (SELECT date, amount, 'bank' AS payment_type
            FROM bank_transactions
            UNION
            SELECT date, amount, 'cash' AS payment_type
            FROM cashbox_transactions
            UNION
            SELECT date, amount, 'paypal' AS payment_type
            FROM paypal_transactions) AS transact
      ORDER BY date DESC
      LIMIT 3) AS sorted
ORDER BY date;
# ===========================================
# 10.6 Вложенные запросы
# Последняя задача

SELECT * FROM products;
# -------------------------------------------
# Закрытые объявления

SELECT * FROM advs;
SELECT * FROM closed_advs;

INSERT INTO closed_advs (id, user_id, category_id, text, date)
SELECT id, user_id, category_id, text, date FROM advs WHERE closed = 0;

DELETE FROM advs WHERE closed = 0;
# -------------------------------------------
# Кэширование

SELECT * FROM cached_cars;

REPLACE INTO cached_cars (id, car, price)
SELECT cars.id, CONCAT(marks.name, ' ', models.name, ', ', cars.color) AS car, cars.price
FROM cars
JOIN models ON models.id = cars.model_id
JOIN marks ON marks.id = models.mark_id;
# ===========================================
# Продвинутый SQL
# 3.1 Оконные функции
# Сумма продаж

SELECT month, year, SUM(revenue) OVER() AS total_revenue
FROM revenues
ORDER BY year, month;
# -------------------------------------------
# Ежегодный доход

SELECT
    *,
    SUM(revenue) OVER(PARTITION BY year) AS year_revenue
FROM revenues
ORDER BY year, month;
# -------------------------------------------
# Вклад каждого месяца

SELECT
    month,
    year,
    revenue * 100 / SUM(revenue) OVER(PARTITION BY year) AS month_percent
FROM revenues
ORDER BY year, month;
# -------------------------------------------
# Население городов и стран

SELECT *, SUM(population) OVER(PARTITION BY country) AS country_population
FROM cities
ORDER BY country_population, population;
# -------------------------------------------
# Общая стоимость товаров

SELECT *, SUM(count * price) OVER () AS total
FROM products;

SELECT SUM(count * price)
FROM products;
# -------------------------------------------
# Доля товаров в магазине

SELECT *,
       ROUND(count * price * 100 / SUM(count * price) OVER (), 1)  AS percent
FROM products
ORDER BY percent DESC, id;
# -------------------------------------------
# Важность городов

SELECT *,
       SUM(population) OVER (PARTITION BY country) AS country_population,
       ROUND(population * 100 / SUM(population) OVER (PARTITION BY country), 2) AS percent
FROM cities
ORDER BY population;
# -------------------------------------------
# Мировая важность

SELECT *,
       population * 100 / SUM(population) OVER () AS world_percent
FROM cities
ORDER BY world_percent DESC ;
# ===========================================
# 3.2 Оконные функции
# Популярность фильмов

SELECT
    id,
    ROW_NUMBER() over () AS place,
    name,
    rating
FROM films
ORDER BY rating DESC;
# -------------------------------------------
# Уникализация строк

SELECT
    ROW_NUMBER() over () AS line_num,
    order_id,
    product_id
FROM orders_products
ORDER BY order_id, product_id;
# -------------------------------------------
# Нумерация на третьей странице

SELECT * FROM
(SELECT
    ROW_NUMBER() over () AS num,
    name,
    count,
    price
FROM products
ORDER BY price) AS result
WHERE num > 10
LIMIT 5;
# ===========================================
# 3.3 Оконные функции
# Популярность по жанрам

SELECT
    genre,
    ROW_NUMBER() over (PARTITION BY genre ORDER BY rating DESC) AS genre_place,
    rating,
    name
FROM films
ORDER BY genre, genre_place;
# -------------------------------------------
# Лучшие программисты

SELECT *,
       ROW_NUMBER() over (ORDER BY points DESC ) AS place
FROM results
ORDER BY id;
# -------------------------------------------
# Учитываем время

SELECT *,
       ROW_NUMBER() over (ORDER BY points DESC, time) AS plase
FROM results
ORDER BY plase;
# -------------------------------------------
# Лучшие в своём жанре

SELECT name, rating, genre FROM
(SELECT
     *,
     ROW_NUMBER() OVER (PARTITION BY genre ORDER BY rating DESC) AS result
FROM films) AS t_rating
WHERE result = 1 OR result = 2
ORDER BY rating DESC ;
# -------------------------------------------
# Лучшие по декадам

SELECT decade,
       ROW_NUMBER() over (PARTITION BY decade ORDER BY rating DESC ) AS place,
       name,
       rating
FROM
    (SELECT *, FLOOR(year / 10) * 10 AS decade
     FROM films) AS t_decade
ORDER BY decade, place;
# ===========================================
# 3.5 Оконные функции
# Подбор блогеров

SELECT
       ROW_NUMBER() over (ORDER BY subs DESC, avg_likes DESC, avg_comments DESC ) AS num,
       blogger,
       subs,
       avg_likes,
       avg_comments
FROM bloggers;
# -------------------------------------------
# Популярность постов

SELECT * FROM
(SELECT
       ROW_NUMBER() over (PARTITION BY blogger ORDER BY likes DESC ) AS post_popularity,
       blogger,
       post,
       likes
FROM bloggers_posts) AS tmp_table
ORDER BY blogger, post_popularity;
# -------------------------------------------
# Лучшие посты

SELECT
    blogger,
    post,
    likes,
    SUM(likes) OVER() AS total_likes,
    likes * 100 / SUM(likes) OVER () AS percent
FROM
(SELECT *,
       ROW_NUMBER() OVER (PARTITION BY blogger ORDER BY likes DESC) AS row_num
FROM bloggers_posts) AS tmp_table
WHERE row_num = 1
ORDER BY likes DESC ;
# ===========================================
# 3.6 Оконные функции
# Окупаемость инвестиций

SELECT *,
       SUM(income - outcome) OVER (ORDER BY year, month) AS ror
FROM revenues;
# -------------------------------------------
# Инвестиции для новой точки

SELECT DISTINCT
    MIN(ror) OVER() AS investment
FROM (
 SELECT *,
        SUM(income - outcome) OVER (ORDER BY year, month) AS ror
 FROM revenues
     ) AS tmp_table;
# -------------------------------------------
# Срок окупаемости инвестиций

SELECT COUNT(*) AS months
FROM (
         SELECT *,
                SUM(income - outcome) OVER (ORDER BY year, month) AS ror
         FROM revenues
     ) AS tmp_table
WHERE ror < 0;
# -------------------------------------------
# Поиск кассовых разрывов

SELECT *,
       SUM(money) OVER (ORDER BY date, id) AS balance
FROM transactions
ORDER BY date, id;
# -------------------------------------------
# Кассовый разрыв с начальным балансом

SELECT *,
       SUM(money) OVER (ORDER BY date, id) AS balance
FROM
((SELECT
    0 AS id,
    '2022-01-01' AS date,
    'Начальный баланс' AS item,
    10000 AS money)
UNION
(SELECT * FROM transactions)) AS tmp_table
ORDER BY date, id;
# ===========================================
# 3.7 Оконные функции
# Процент мужчин и женщин

SELECT sex,
       COUNT(*) AS members,
       COUNT(*) * 100 / SUM(COUNT(*)) OVER () AS percent
FROM users
GROUP BY sex
ORDER BY percent;
# -------------------------------------------
# Распределение по возрастам
#

SELECT
    ROW_NUMBER() over () AS age_num,
    age,
    COUNT(*) AS clients,
    COUNT(*) * 100 / SUM(COUNT(*)) OVER () AS percent
FROM users
GROUP BY age;
# -------------------------------------------
# Статусы в разрезе по годам

SELECT YEAR(date),
       status,
       COUNT(*) AS orders,
       ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (), 0) AS percent
FROM orders
GROUP BY YEAR(date), status
ORDER BY status;
# -------------------------------------------
# Процентный вклад каждого пользователя

SELECT YEAR(date) AS year,
       user_id,
       SUM(amount) AS amount,
       ROUND(SUM(amount) * 100 / SUM(SUM(amount)) OVER (PARTITION BY YEAR(date)), 2) AS percent
FROM orders
WHERE status = 'success'
GROUP BY YEAR(date), user_id
ORDER BY year, amount;
# -------------------------------------------
# Декларация УСН 6%
#SUM(income) OVER (ORDER BY QUARTER(date)) AS income_acc

SELECT *,
       SUM(income) OVER (ORDER BY quarter) AS income_acc,
       SUM(income * 0.06) OVER (ORDER BY quarter) AS usn6
FROM
(SELECT QUARTER(date) AS quarter,
       SUM(income) AS income
FROM transactions
GROUP BY QUARTER(date)
ORDER BY quarter) AS tmp_table;
# -------------------------------------------
# 3.8 Оконные функции
# Подбор квартир

# ??? ПЕРЕСМОТРЕТЬ И ПЕРЕДЕЛАТЬ ЗАДАНИЯ
# D:\Видеокурсы\SQL\[Stepik] Пакет SQL курсов (2021)\ Продвинутый SQL\03 Оконные функции\08 Ранжирование с помощью RANK и DENSE_RANK
SELECT street,
       house,
       price,
       rooms,
       RANK() over (ORDER BY rooms DESC, price) AS result
FROM flats
WHERE rooms > 1
ORDER BY rooms DESC, price;
# -------------------------------------------
# Расширяем подбор квартир

SELECT street,
       house,
       price,
       rooms,
       NTILE(3) over (ORDER BY rooms DESC, price) AS result
FROM flats
WHERE rooms > 1
ORDER BY rooms, price;
# -------------------------------------------
