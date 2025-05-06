{{
  config(
    materialized='view',
  )
}}
select * from {{ ref('taxi_zone_lookups') }}
