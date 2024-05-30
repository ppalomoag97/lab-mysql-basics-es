use bank;

-- Consulta 1
-- Obtén los valores de id de los primeros 5 clientes del district_id con un valor igual a 1.
SELECT client_id
FROM client
WHERE district_id=1
LIMIT 5;

-- Consulta 2
-- En la tabla client, obtén el valor de id del último cliente donde el district_id sea igual a 72.

SELECT MAX(client_id )
FROM client
WHERE district_id=72;

-- Consulta 3
-- Obtén las 3 cantidades más bajas en la tabla loan.
SELECT (amount)
FROM loan
order by amount asc
limit 3;

-- Consulta 4
-- ¿Cuáles son los valores posibles para status, ordenados alfabéticamente en orden ascendente en la tabla loan?
SELECT DISTINCT status
FROM loan
ORDER BY status ASC
limit 4;

-- Consulta 5
-- ¿Cuál es el loan_id del pago más alto recibido en la tabla loan?

SELECT loan_id
FROM loan
ORDER BY payments desc
limit 1;

-- Consulta 6
-- ¿Cuál es el monto del préstamo de los 5 account_id más bajos en la tabla loan? Muestra el account_id y el monto correspondiente.

SELECT account_id, amount
FROM loan
ORDER BY account_id asc
limit 5;

-- Consulta 7
-- ¿Cuáles son los account_id con el monto de préstamo más bajo que tienen una duration de préstamo de 60 en la tabla loan?

SELECT account_id
FROM loan
WHERE duration=60
ORDER BY amount asc
limit 5;

-- Consulta 8
-- ¿Cuáles son los valores únicos de k_symbol en la tabla order?
SELECT DISTINCT k_symbol
FROM `order`;

-- Consulta 9
-- En la tabla order, ¿cuáles son los order_id del cliente con el account_id 34?

SELECT order_id
FROM `order`
WHERE account_id=34;

-- Consulta 10
-- En la tabla order, ¿qué account_id fueron responsables de las órdenes entre order_id 29540 y order_id 29560 (inclusive)?

SELECT distinct account_id
FROM `order`
WHERE order_id<=29560 and order_id>29540;

-- Consulta 11
-- En la tabla order, ¿cuáles son los montos individuales que fueron enviados a (account_to) id 30067122?

SELECT amount
FROM `order`
WHERE account_to=30067122;

-- Consulta 12
-- En la tabla trans, muestra el trans_id, date, type y amount de las 10 primeras transacciones del account_id 793 en orden cronológico, de las más recientes a las más antiguas.

SELECT trans_id, date, type, amount
FROM trans 
WHERE account_id = 793 
order by date desc
LIMIT 10;

-- Consulta 13
-- En la tabla client, de todos los distritos con un district_id menor que 10, ¿cuántos clientes hay de cada district_id? Muestra los resultados ordenados por district_id en orden ascendente.

SELECT  district_id,
		count(client_id)
FROM client 
WHERE district_id <10
GROUP BY district_id
ORDER BY district_id ASC;

-- Consulta 14
-- En la tabla card, ¿cuántas tarjetas existen para cada type? Ordena el resultado comenzando con el type más frecuente.

SELECT DISTINCT type,
	COUNT(card_id) as monto_card
FROM card
GROUP BY type
ORDER BY monto_card desc;

-- Query 15
-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.

SELECT account_id,
SUM(AMOUNT)  as total_sum
FROM loan
GROUP BY account_id
ORDER BY total_sum desc
LIMIT 10;

-- Query 16
-- In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.

SELECT date,
 COUNT(loan_id)
FROM loan 
WHERE date<930907
GROUP BY date
ORDER BY date desc
;

-- Query 17
-- In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.

SELECT date,
	 duration,
	COUNT(loan_id)
FROM loan 
WHERE date>=971201 and date<=971231
GROUP BY date, duration
ORDER BY date asc ,duration asc
;

-- Query 18
-- In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.

SELECT account_id,
	   type,
		sum(amount) as total_amount
FROM trans
WHERE account_id=396 
GROUP BY account_id, type;