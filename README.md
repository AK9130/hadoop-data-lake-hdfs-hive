

 Bank Transaction Data Lake using Hadoop HDFS and Hive

## Overview

This project builds a simple data lake pipeline using Hadoop HDFS and Hive.
A banking transaction dataset is stored in HDFS, processed in Hive, and converted from CSV to Parquet for efficient querying.
This project simulates a real-world banking analytics use case.

## Tech Stack

* Hadoop HDFS
* Apache Hive
* Linux
* SQL / Parquet

## Project Structure

```
.
├── data_sets
│   └── bank_transactions
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

```

## Workflow

CSV → HDFS → Hive External Table → Parquet Conversion → Analysis

## How to Run

```bash
# Upload data to HDFS
hdfs dfs -put data_sets/bank_transactions/bank_transaction.csv /user/aaqib/input_projects/4_hadoop_data_lake
```

```bash
# Create tables
hive -f hive_scripts/create_table.sql
```

```bash
# Run queries
hive -f queries/analysis_queries.sql
```

## Analysis

* Transaction type count
* Top destination accounts
* Total transaction amount (type-wise)
* Top 10 highest transactions


## Outcome

Built a basic data lake using HDFS and Hive with optimized storage using Parquet.

## Key Learning

HDFS storage, Hive tables, and data format optimization.
