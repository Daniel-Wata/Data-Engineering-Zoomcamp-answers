# Question 1

I ran the flow 02_postgres_taxi with yellow parameter for 2020-04 and looked at the output of the extract task to get the answer

# Question 2

Looking at the code, the variable is set to
"{{inputs.taxi}}_tripdata_{{inputs.year}}-{{inputs.month}}.csv"

Sor replacing with the parameters it would be 

yellow_tripdata_2020-04.csv

# Question 3

```sql
select COUNT(*) from yellow_tripdata where filename like '%2020%'
```

returns 24648499

# Question 4

```sql
select COUNT(*) from green_tripdata where filename like '%2020%'
```

returns 1734051

# Question 5

```sql
select COUNT(*) from yellow_tripdata where filename like '%2021-03%'
```

returns 1925152

# Question 6

According to the documentation at

https://kestra.io/docs/workflow-components/triggers/schedule-trigger

it is possible to setup a specific timezone using the timezone property, in this case using America/New_York notation. as shown below

```yaml
triggers:
  - id: daily
    type: io.kestra.plugin.core.trigger.Schedule
    cron: "@daily"
    timezone: America/New_York
```