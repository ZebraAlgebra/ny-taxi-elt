{{
  config(
    materialized='incremental',
    unique_key='pickup_datetime'
  )
-}}
{%- for year in [2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025] %}
    select * from {{ ref("stg_trips__" ~ year) }}
    {%- if is_incremental() %}
    where
      pickup_datetime > (select max(pickup_datetime) from {{ this }})
    {% endif -%}
    {%- if not loop.last %}
        union all
    {%- endif %}
{%- endfor %}
