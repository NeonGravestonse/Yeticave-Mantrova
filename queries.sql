INSERT INTO categories(id, title, alias)
VALUES
(null, 'Доски и лыжи', 'boards'),
(null, 'Крепления', 'bracing'),
(null, 'Ботинки','boots'),
(null, 'Одежда','clothing'),
(null,'Инструменты','tools'),
(null, 'Разное', 'other');


INSERT INTO users
(id, username, email, password, avatar, red_date, contacts)
VALUES
(null, 'Mantrova', 'Mant_rovaa@mail.ru', '126794lg', null, null),
(null, 'Tarelka','tarelochki55@mail.ru', 'ryjhsf4', null, null, null),
(null, 'Lavka_Skameika', 'lavka@gmail.com', '45872mfdj', null, null, null);

INSERT INTO lots
(id, name, description, image_url, start_price,	date_create, bet_step, user_id, winner_id, category_id)
VALUES
(null, '2014 Rossignol District Snowboard', 'Временно отсутствует', 'img/lot-1.jpg', 10999,'2020-03-27 13:34:05', 500,1,1,1),
(null,'DC Ply Mens 2016/2017 Snowboard', Временно отсутствует', 'img/lot-2.jpg', 159999, '2020-03-26 01:22:05',500,2,2,1),
(null, 'Крепления Union Contact Pro 2015 года размер L/XL','Временно отсутствует', 'img/lot-3.jpg', 8000,'2020-03-26 12:22:25', 500,3,1,2),
(null,'Ботинки для сноуборда DC Mutiny Charocal','Временно отсутствует', 'img/lot-4.jpg', 10999,'2020-03-27 23:32:15', 500,1,2,3),
(null,'Куртка для сноуборда DC Mutiny Charocal','Временно отсутствует', 'img/lot-5.jpg', 7500,'2020-03-26 04:34:15',  500,2,3,4),
(null,'Маска Oakley Canopy','Временно отсутствует', 'img/lot-6.jpg', 5400,'2020-03-25 18:40:59',500,1,3,6);

INSERT INTO bets(id, bet_date, bet_price, user_id, lot_id)
VALUES
(null, '2020-03-26 14:44:12', 18800, 2, 1),
(null, '2020-03-27 10:43:19', 126480, 3, 1);

— Запросы —

— Получить все категории —
SELECT title
FROM categories

/* Получить самые новые, открытые лоты. Каждый лот должен включать название,
стартовую цену, ссылку на изображение, цену последней ставки, количество
ставок, название категории
*/
SELECT DISTINCT name, start_price, image_url, MAX(bet_price) as 'Маскимальная ставка', count(c.id) as 'Количество ставок', 
title
FROM categories a left join lots b on id=category_id left join
bets c on b.id=c.id
WHERE "2020-03-27 12:13:34"<date_create
group by name
ORDER BY date_create DESC

— Показать лот по его id. Получите также название категории, к которой принадлежит лот —
SELECT name, title
FROM categories a inner join lots b on id=id
WHERE id=2

— Обновить название лота по его идентификатору —
UPDATE lots
SET name="Крепления Union Contact Pro 2015 года размер L/XXXL"
WHERE id=3

— Получить список самых свежих ставок для лота по его идентификатору —
SELECT id, name, start_price
from bets a inner join lots b on a.id=b.id
where a.id=1
ORDER BY bet_date desc
