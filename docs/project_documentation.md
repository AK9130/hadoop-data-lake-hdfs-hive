# Project Documentation _ Hadoop Data Lake Using HDFS and Hive

## 1. Hive Table Implementation

The project uses the `bank_datalake` Hive database.

### External Text Table

The raw CSV data is accessed through:

```text
bank_transaction_ext_txt
```

Storage format:

```text
TEXTFILE
```

HDFS location:

```text
/user/aaqib/input_projects/4_hadoop_data_lake
```

### Managed Parquet Table

The CSV/Text data is converted to Parquet using:

```text
bank_transaction_manage_parquet
```

Storage format:

```text
PARQUET
```

Conversion:

```sql
INSERT INTO bank_transaction_manage_parquet
SELECT * FROM bank_transaction_ext_txt;
```

### External Parquet Table

An external Parquet table is created over the generated Parquet data:

```text
bank_transaction_ext_parquet
```

It is then renamed to:

```text
bank_transaction
```

The complete table implementation is in:

```text
hive_scripts/create_table.hql
```

---

## 2. Analysis Queries

The analysis is performed on:

```text
bank_transaction
```

Five analyses are included:

```text
1. Transaction Type Wise Count
2. Destination Account Count
3. Transaction Type Wise Total Amount
4. Destination Wise Total Amount
5. Top 10 Biggest Transactions
```

The complete queries are available in:

```text
queries/analysis_queries.hql
```

---

## 3. Analysis Result Tables

The analysis results are also saved as Hive tables:

```text
transaction_type_count
destination_account_count
type_wise_total_money
destination_wise_total_money
top_10_biggest_transactions
```

These tables are created using `CREATE TABLE AS SELECT`.

---

## 4. HDFS Parquet Outputs

The same analysis results are written to HDFS as Parquet directories using:

```sql
INSERT OVERWRITE DIRECTORY
STORED AS PARQUET
```

HDFS output location:

```text
/user/aaqib/output_projects/4_hadoop_datalake/
```

Directories:

```text
transaction_type_count/
destination_account_count/
type_wise_total_money/
destination_wise_total_money/
top_10_biggest_transactions/
```

These are Parquet output directories, not Hive tables.

---

## 5. Local Output

The HDFS output directories were copied to the project's local `output/` directory.

```bash
hdfs dfs -get /user/aaqib/output_projects/4_hadoop_datalake/* /home/aaqib/PROJECTS/4_Hadoop_Data_Lake_HDFS+Hive/output/
```

Local output:

```text
output/
├── destination_account_count/
├── destination_wise_total_money/
├── top_10_biggest_transactions/
├── transaction_type_count/
└── type_wise_total_money/
```

---

## 6. Screenshots

Project screenshots are stored in:

```text
docs/screenshots/
```

- `hdfs_dataset.png`
- `hive_table_data.png`
- `hive_analysis_result.png`
- `top10_highest_transactions.png`
- `transaction_type_total_amount.png`

---

## 7. Main Execution Commands

Upload dataset:

```bash
hdfs dfs -put data_sets/bank_transactions/bank_transaction.csv /user/aaqib/input_projects/4_hadoop_data_lake
```

Create Hive tables:

```bash
hive -f hive_scripts/create_table.hql
```

Run analysis:

```bash
hive -f queries/analysis_queries.hql
```

Check HDFS outputs:

```bash
hdfs dfs -ls /user/aaqib/output_projects/4_hadoop_datalake/
```
