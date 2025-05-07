# NY Taxi ELT with DBT

This repo hosts codes for ELT-ing NY Taxi, using 86 months of records (~370 million rows)

The tech stack:

1. (E) Automate data downloads via Python scripts, perform basic inspections on schemas with `polars`
1. (L) Load data into local `postgresql` database, automated by Python
1. (T) Transform using `dbt-core` for documentations, additional transformations, data quality tests, version controls
1. (V: in progress) Connect to Power BI or some other visualization tools (like Tableau or Qlik)
1. (A: in progress) Automate data updates and refreshes using Airflow

The generated static doc site by dbt is hosted [here](https://zebalgebra-dbt-ny-taxi-elt.netlify.app) (link also in repo description).
