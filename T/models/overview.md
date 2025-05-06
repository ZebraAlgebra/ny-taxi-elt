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
  - (T) `dbt` as data transformation and documentation tool.
  - (V: in progress) Connect to PowerBI
  - (A: in progress) Automate updating of data using Airflow.
- **Total number of rows after combining source and cleaning**: ~370 million (or 0.37 billion).
- **Total table sizes**: 
  - Raw data (built from 86 parquet files): 62 GB
  - dbt's models (containing both final tables and various intermediate, staging, seeding models): 46 GB
- **Final models**: These will be used for visualizations.
  - Aggregation tables:
    - Hourly trips time series: This is a time series of hour intervals (created as an incremental model)
      - `agg_hourly_trips_stats`
    - Projections: These are tables that aggregates by single time dimensions 
      (year, season, month, dow (day of week), period (which period in day), hour)
      - `agg_zones_pairwise__year`
      - `agg_zones_pairwise__season`
      - `agg_zones_pairwise__month`
      - `agg_zones_pairwise__dow`
      - `agg_zones_pairwise__period`
      - `agg_zones_pairwise__hour`
  - Dimension tables: These are for ease of building data models in PowerBI
    - Time dimensions: these holds meanings for time dimension encodings:
      - `dim__season`
      - `dim__month`
      - `dim__period`
      - `dim__dow`
    - Trips dimensions: these holds meanings for trip column encodings:
      - `dim__location_id`
      - `dim__vendor_id`
      - `dim__payment_type_id`
      - `dim__rate_code_id`
      - `dim__store_forward_flag`

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
- **Fares with Negative Values**: Some trips have negative-valued fares;
  among some inspection, the author found that in these trips,
  there often is a "corresponding positive-fared trip" 
  (have same `pickup_datetime` and `pickup_location_id`).
  After the previous three steps,
  there are `1830130` (about 1.8M) negative-fared trips,
  and `1798908` (also about 1.8M) of those are such.
  The author retained these trips in the data,
  as it might either be cancelled trips,
  or just errors originating from other causes 
  that cannot be determined solely from the data alone.
  These weird trips 
  (if counting both negative-fared and there corresponding positive correspondents)
  consists of about 1% about the data.
- **Undocumented Values**: Some earlier `vendor_id` values are not documented 
  in the official data dictionary documentation.
  The author of this project retained these values and added to the lookup tables
  and treated as values without meanings.

{% enddocs %}

{% docs __dbt_postgres__ %}
External package `dbt_postgres`'s macros.
{% enddocs %}

