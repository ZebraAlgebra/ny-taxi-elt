{{
  config(
    materialized='hypertable',
    main_dimension='pickup_datetime',
    chunk_time_interval="interval '1 hour'"
  )
}}
{%- for year in [2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025] %}
    select * from {{ ref("stg_trips__" ~ year) }}
    {%- if not loop.last %}
        union all
    {%- endif %}
{%- endfor %}
