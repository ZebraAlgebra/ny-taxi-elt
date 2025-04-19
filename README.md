# NY Taxi ELT

This repo hosts codes for analyzing NY Taxi.

## Dataset

The number of rows in all the csv files:

## Steps

The tech stack:

1. (E and slight T) Automate data downloads, data cleaning via Python scripts
1. (L) Load data into local `postgresql` database
1. (T) Transform using `dbt-core` for documentations, additional transformations
1. (L) Upload to snowflake as cloud DWH after dbt's transformations
1. (V) PowerBI for data visualization
