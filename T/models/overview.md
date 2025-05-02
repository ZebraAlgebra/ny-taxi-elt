{% docs __overview__ %}

# 🚕 NY Taxi dbt project

In this project,
we analyze and visualize the Yellow Taxi data from 
[TLC Trip Records](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page),
from the year COVID-19 started,
to the most recent

## Basic Project Info

- **Data used**: from 2018 January to 2025 February (86 months of data)
- **Tools**:
  - (E) `python` and `polars` for automation of downloading data
  - (L) `sqlalchemy` for loading data into a local `postgresql` database
  - (T: in progress) `dbt` as data transformation and documentation tool
  - (V: in progress) Current plan is to load to snowflake, and connect to PowerBI
  - (A: in progress) Automate updating of data using Airflow.

{% enddocs %}
