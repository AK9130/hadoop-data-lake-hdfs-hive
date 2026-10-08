USE bank_datalake;

--Original analysis queries
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

--Hive result tables
-- Save Analysis Results as Hive Tables

-- Save Transaction Type Count
CREATE TABLE transaction_type_count AS
SELECT type,
       COUNT(*) AS transaction_count
FROM bank_transaction
GROUP BY type;

-- Save Destination Account Count
CREATE TABLE destination_account_count AS
SELECT namedest, COUNT(*) AS account_count
FROM bank_transaction
GROUP BY namedest
LIMIT 10;

-- Save Type Wise Total Money
CREATE TABLE type_wise_total_money AS
SELECT type, SUM(amount) AS total_money
FROM bank_transaction
GROUP BY type;

-- Save Destination Wise Total Money
CREATE TABLE destination_wise_total_money AS
SELECT namedest, SUM(amount) AS total_money
FROM bank_transaction
GROUP BY namedest
LIMIT 10;

-- Save Top 10 Biggest Transactions
CREATE TABLE top_10_biggest_transactions AS
SELECT *
FROM bank_transaction
ORDER BY amount DESC
LIMIT 10;

--HDFS Parquet outputs
-- Save Analysis Results as Parquet in HDFS

-- Save Transaction Type Count as Parquet in HDFS
INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/transaction_type_count'
STORED AS PARQUET
SELECT type, COUNT(*) AS transaction_count
FROM bank_transaction
GROUP BY type;

-- Save Destination Account Count as Parquet in HDFS
INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/destination_account_count'
STORED AS PARQUET
SELECT namedest, COUNT(*) AS account_count
FROM bank_transaction
GROUP BY namedest
LIMIT 10;

-- Save Type Wise Total Money as Parquet in HDFS
INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/type_wise_total_money'
STORED AS PARQUET
SELECT type, SUM(amount) AS total_money
FROM bank_transaction
GROUP BY type;

-- Save Destination Wise Total Money as Parquet in HDFS
INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/destination_wise_total_money'
STORED AS PARQUET
SELECT namedest, SUM(amount) AS total_money
FROM bank_transaction
GROUP BY namedest
LIMIT 10;

-- Save Top 10 Biggest Transactions as Parquet in HDFS
INSERT OVERWRITE DIRECTORY '/user/aaqib/output_projects/4_hadoop_datalake/top_10_biggest_transactions'
STORED AS PARQUET
SELECT *
FROM bank_transaction
ORDER BY amount DESC
LIMIT 10;
