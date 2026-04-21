# Hadoop Data Lake using HDFS and Hive

## Project Description

This project demonstrates how to store large-scale transaction data in Hadoop HDFS and perform analytical queries using Apache Hive.

## Project Structure

└── bank_transactions
│       └── bank_transaction.csv
├── docs
│   └── project_documentation.md
├── hive_scripts
│   └── create_table.sql
├── output
│   ├── hdfs_dataset.png
│   ├── hive_analysis_result.png
│   ├── hive_table_data.png
│   ├── top10_highest_transactions.png
│   └── transaction_type_total_amount.png
├── queries
│   └── analysis_queries.sql
└── README.md

## Technologies Used

* Hadoop HDFS
* Apache Hive
* Linux

## Dataset

Bank Transaction Dataset (CSV format)

## Workflow

CSV Dataset → HDFS Storage → Hive External Table → Hive Queries → Data Analysis

## Analysis Performed

* Transaction type wise count
* Total amount by transaction type
* Top 10 highest transactions

## Outcome

Efficient storage and analysis of large-scale transaction data using the Hadoop ecosystem.

