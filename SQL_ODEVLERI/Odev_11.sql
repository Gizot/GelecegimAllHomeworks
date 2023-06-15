--1)actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım.

(SELECT first_name FROM actor)
UNION ALL
(SELECT first_name FROM customer);

--2)actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım.

SELECT first_name FROM actor
INTERSECT
SELECT first_name FROM customer;

--3)actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan
-- ancak ikinci tabloda bulunmayan verileri sıralayalım.

SELECT first_name FROM actor
EXCEPT
SELECT first_name FROM customer;

--4)İlk 3 sorguyu tekrar eden veriler için de yapalım.

-- 4.1)Tekrar eden verileri görmek için;
SELECT first_name, COUNT(*) AS tekrar_sayısı
FROM (
    SELECT first_name FROM actor
    UNION ALL
    SELECT first_name FROM customer
) AS combined
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY tekrar_sayısı DESC;

--4.2) Tekrar eden verileri görebilmek için;
SELECT first_name, COUNT(*) AS tekrar_sayısı
FROM (
    SELECT first_name FROM actor
    INTERSECT
    SELECT first_name FROM customer
) AS intersection
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY tekrar_sayısı DESC;

--4.3) Tekrar eden verileri görebilmek için;

SELECT first_name, COUNT(*) AS tekrar_sayısı
FROM (
    SELECT first_name FROM actor
    EXCEPT
    SELECT first_name FROM customer
) AS difference
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY tekrar_sayısı DESC;