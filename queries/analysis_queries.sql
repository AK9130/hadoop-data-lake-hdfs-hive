USE bank_datalake;

--transaction type count
SELECT type, COUNT(*)
FROM bank_transaction
GROUP BY type;

--destination account count
SELECT namedest, COUNT(*)
FROM bank_transaction
GROUP BY namedest
LIMIT 10;

--Type wise total money
SELECT type, SUM(amount)
FROM bank_transaction
GROUP BY type;

--destination wise total money
SELECT namedest, SUM(amount)
FROM bank_transaction
GROUP BY namedest
LIMIT 10;

--top 10 biggest transactions
SELECT *
FROM bank_transaction
ORDER BY amount DESC
LIMIT 10;
