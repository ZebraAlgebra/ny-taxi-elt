{{
  config(
    materialized='incremental',
    unique_key='pickup_hour'
  )
-}}

with cte as (
  select
    pickup_hour,
    trip_duration,
    trip_distance,
    vendor_id,
    rate_code_id,
    payment_type_id,
    store_forward_flag,
    fare_amount_usd,
    extra_charges_usd,
    mta_tax_usd,
    tip_amount_usd,
    tip_amount_usd_percentage,
    tolls_amount_usd,
    total_amount_usd,
    improvement_surcharge_usd,
    congestion_surcharge_usd,
    airport_fee_usd,
    cbd_congestion_fee_usd
  from
    {{ ref("int_trips__all") }}
  {%- if is_incremental() %}
  where
    pickup_hour > (select max(pickup_hour) from {{ this }})
  {% endif -%}
)

select
  pickup_hour,
  count(pickup_hour) as trip_count,
  {{ gen_percentile_cols("trip_duration") }},
  {{ gen_percentile_cols("trip_distance") }},
  {{ gen_percentile_cols("total_amount_usd") }},
  {{ gen_percentile_cols("fare_amount_usd") }},
  {{ gen_sum_col("tip_amount_usd") }},
  {{ gen_percentile_cols("tip_amount_usd_percentage", gen_sum=False) }},
  {{ gen_sum_col("tolls_amount_usd") }},
  {{ gen_sum_col("improvement_surcharge_usd") }},
  {{ gen_sum_col("congestion_surcharge_usd") }},
  {{ gen_sum_col("airport_fee_usd") }},
  {{ gen_sum_col("cbd_congestion_fee_usd") }},
  {{ gen_value_count_cols("vendor_id", [1, 2, 4, 5, 6, 7]) }},
  {{ gen_value_count_cols("rate_code_id", [1, 2, 3, 4, 5, 6, 99]) }},
  {{ gen_value_count_cols("store_forward_flag", [0, 1]) }},
  {{ gen_value_count_cols("payment_type_id", [1, 2, 3, 4, 5, 6]) }}
from
  cte
group by
  pickup_hour
order by
  pickup_hour
