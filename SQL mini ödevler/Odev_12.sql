
--1.film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

SELECT COUNT(*) AS FilmSayisi
FROM film
WHERE length > ANY (
  SELECT AVG(length)
  FROM film
);

--2.film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

SELECT COUNT(*) AS FilmSayisi
FROM film
WHERE rental_rate = ALL (
  SELECT MAX(rental_rate)
  FROM film
);

--3.film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.

SELECT *
FROM film
WHERE rental_rate = ANY (SELECT MIN(rental_rate) FROM film )
AND replacement_cost = ANY (
  SELECT MIN(replacement_cost)
  FROM film
);

--4.payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

--4.1.En çok alışveriş yapandan az alışveriş yapana doğru sıralayan kod;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(*) AS transaction_count
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY transaction_count DESC;


--4.2. Yalnızca en çok (max) alışveriş yapanları sıralayan kod:

SELECT c.customer_id, c.first_name, c.last_name, t.max_transaction_count
FROM customer c
JOIN (
    SELECT customer_id, COUNT(*) AS transaction_count, MAX(COUNT(*)) OVER () AS max_transaction_count
    FROM payment
    GROUP BY customer_id
) t ON c.customer_id = t.customer_id
WHERE t.transaction_count = t.max_transaction_count;
