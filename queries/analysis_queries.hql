USE bank_datalake;

-- Total records
SELECT COUNT(*) AS total_records FROM bank_transaction;

-- Transaction type count
SELECT type, COUNT(*) AS transaction_count
FROM bank_transaction
GROUP BY type
ORDER BY transaction_count DESC;

-- Top 10 destination accounts by transaction count
SELECT namedest, COUNT(*) AS account_count
FROM bank_transaction
GROUP BY namedest
ORDER BY account_count DESC
LIMIT 10;

-- Type wise total money
SELECT type, SUM(amount) AS total_money
FROM bank_transaction
GROUP BY type
ORDER BY total_money DESC;

-- Top 10 destination accounts by total money
SELECT namedest, SUM(amount) AS total_money
FROM bank_transaction
GROUP BY namedest
ORDER BY total_money DESC
LIMIT 10;

-- Top 10 biggest transactions
SELECT type, amount
FROM bank_transaction
ORDER BY amount DESC
LIMIT 10;

-- Fraud transactions by type
SELECT type,
       COUNT(*) AS total_transactions,
       SUM(isfraud) AS fraud_count,
       ROUND(100 * SUM(isfraud) / COUNT(*), 4) AS fraud_percent
FROM bank_transaction
GROUP BY type
ORDER BY fraud_count DESC;

-- Hive result tables (re-run safe)

DROP TABLE IF EXISTS transaction_type_count;
CREATE TABLE transaction_type_count AS
SELECT type, COUNT(*) AS transaction_count
FROM bank_transaction
GROUP BY type;

DROP TABLE IF EXISTS destination_account_count;
CREATE TABLE destination_account_count AS
SELECT namedest, COUNT(*) AS account_count
FROM bank_transaction
GROUP BY namedest
ORDER BY account_count DESC
LIMIT 10;

DROP TABLE IF EXISTS type_wise_total_money;
CREATE TABLE type_wise_total_money AS
SELECT type, SUM(amount) AS total_money
FROM bank_transaction
GROUP BY type;

DROP TABLE IF EXISTS destination_wise_total_money;
CREATE TABLE destination_wise_total_money AS
SELECT namedest, SUM(amount) AS total_money
FROM bank_transaction
GROUP BY namedest
ORDER BY total_money DESC
LIMIT 10;

DROP TABLE IF EXISTS top_10_biggest_transactions;
CREATE TABLE top_10_biggest_transactions AS
SELECT *
FROM bank_transaction
ORDER BY amount DESC
LIMIT 10;

DROP TABLE IF EXISTS fraud_by_type;
CREATE TABLE fraud_by_type AS
SELECT type,
       COUNT(*) AS total_transactions,
       SUM(isfraud) AS fraud_count,
       ROUND(100 * SUM(isfraud) / COUNT(*), 4) AS fraud_percent
FROM bank_transaction
GROUP BY type;

-- HDFS Parquet outputs (result tables se)

INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/transaction_type_count'
STORED AS PARQUET
SELECT * FROM transaction_type_count;

INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/destination_account_count'
STORED AS PARQUET
SELECT * FROM destination_account_count;

INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/type_wise_total_money'
STORED AS PARQUET
SELECT * FROM type_wise_total_money;

INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/destination_wise_total_money'
STORED AS PARQUET
SELECT * FROM destination_wise_total_money;

INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/top_10_biggest_transactions'
STORED AS PARQUET
SELECT * FROM top_10_biggest_transactions;

INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/fraud_by_type'
STORED AS PARQUET
SELECT * FROM fraud_by_type;

-- beeline -u jdbc:hive2://localhost:10000 -n aaqib -f analysis_queries.hql
