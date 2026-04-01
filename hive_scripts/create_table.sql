CREATE DATABASE bank_datalake;

USE bank_datalake;

CREATE EXTERNAL TABLE bank_transaction (
step INT,
type STRING,
amount DOUBLE,
nameOrig STRING,
oldbalanceOrg DOUBLE,
newbalanceOrig DOUBLE,
nameDest STRING,
oldbalanceDest DOUBLE,
newbalanceDest DOUBLE,
isFraud INT,
isFlaggedFraud INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/aaqib/input_projects/4_hadoop_data_lake';

-- then

CREATE TABLE bank_transaction_parquet (
step INT,
type STRING,
amount DOUBLE,
nameorig STRING,
oldbalanceorg DOUBLE,
newbalanceorig DOUBLE,
namedest STRING,
oldbalancedest DOUBLE,
newbalancedest DOUBLE,
isfraud INT,
isflaggedfraud INT
)
STORED AS PARQUET;

-- convert csv --> parquet
INSERT INTO bank_transaction_parquet
SELECT * FROM bank_transaction;

-- rename table
ALTER TABLE bank_transaction_parquet
RENAME TO bank_transaction;
