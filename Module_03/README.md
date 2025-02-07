# Data import

For the data import I used the provided scripts and it went well

# External and Native tables creation

I used the UI to generate both the external and the materialized tables

# Queries

These are the queries I used for the partitioned tables sections

```sql 
CREATE TABLE `taxi_data_regional.yellow_native_partitioned`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID
AS
SELECT *
FROM taxi_data_regional.yellow_native;
```

```sql
select distinct VendorID from `taxi_data_regional.yellow_native_partitioned` where tpep_dropoff_datetime between '2024-03-01' and '2024-03-15'
```