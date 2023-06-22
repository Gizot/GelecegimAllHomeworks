--1)film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
SELECT rating, COUNT(*) FROM film
GROUP BY rating;

rating | count
-------+-------
G      | 178
PG     | 194
PG-13  | 223
R      | 195
NC-17  | 210

--2)film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan replacement_cost 
--değerini ve karşılık gelen film sayısını sıralayınız.
SELECT replacement_cost, COUNT(*) FROM film
GROUP BY replacement_cost
HAVING COUNT(*) > 50;

replacement_cost | count
-----------------+-------
19.99           | 67
20.99           | 59

--3) customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir? 

SELECT store_id, COUNT(*) FROM customer
GROUP BY store_id;

store_id | count
---------+-------
1        | 326
2        | 273

--4) city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra
-- en fazla şehir sayısı barındıran country_id bilgisini ve şehir sayısını paylaşınız.

SELECT country_id, COUNT(*) FROM city
GROUP BY country_id
ORDER BY COUNT(*) DESC
LIMIT 1;

country_id | count
-----------+-------
87         | 60
