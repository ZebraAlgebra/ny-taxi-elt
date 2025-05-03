{% docs __overview__ %}

# 🚕 NY Taxi dbt project

In this project,
we analyze and visualize the Yellow Taxi data from 
[TLC Trip Records](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page),
from the year before COVID-19 started,
to the most recent month with available data.

## ℹ️ Basic Project Info

- **Data used**: from 2018 January to 2025 February (86 months of data)
- **Tools**:
  - (E) `python` and `polars` for automation of downloading data
  - (L) `sqlalchemy` for loading data into a local `postgresql` database
  - (T: in progress) `dbt` as data transformation and documentation tool, with `timescale` extension
  - (V: in progress) Current plan is to load to snowflake, and connect to PowerBI
  - (A: in progress) Automate updating of data using Airflow.
- **Total number of rows after combining source and cleaning**: ~370 million.

## 🔎 Some Findings for Data Quality during EDA

During some basic EDA, some issues about the data has been noticed:
- **Slowing changing schema**: Throughout time, though the changes are not significant,
  the monthly `parquet` files might have column renames,
  new columns, data types inconsistencies.
  Therefore, some efforts were given on enforcing consistency of schemas using macros.
- **Out-of-bounds dates**: For some months,
  the `parquet` file has records that has `pickup_datetime` not within the month,
  the most extreme ones has year before 2005 and year after 2085.
  These are filtered out when building the yearly staging models.
- **Absurd Fares**: Some trips has unusually large fares.
  The author of this project found this out when errors were shown
  originating from attempts of casting financial columns to `numeric(7, 2)`,
  which should be sufficient 
  (as we anticipate trips to have values <= 99999.99 USD).
  During the creation of staging models, 
  the threshold was set at 10000.
- **Undocumented Values**: Some earlier `vendor_id` values are not documented 
  in the official data dictionary documentation.
  The author of this project retained these values and added to the lookup tables
  and treated as values without meanings.

{% enddocs %}

{% docs __dbt_postgres__ %}
External package `dbt_postgres`'s macros.
{% enddocs %}
