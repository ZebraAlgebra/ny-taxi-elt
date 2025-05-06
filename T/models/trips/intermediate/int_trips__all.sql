with cte as (
  select
    *
  from
    {{ ref("stg_trips__all") }}
)

select
  date_trunc('hour', pickup_datetime) as pickup_hour,
  dropoff_datetime - pickup_datetime as trip_duration,
  pickup_location_id,
  dropoff_location_id,
  trip_distance,
  vendor_id,
  rate_code_id,
  payment_type_id,
  store_forward_flag,
  fare_amount_usd,
  extra_charges_usd,
  mta_tax_usd,
  tip_amount_usd,
  ROUND(
    NULLIF(
      tip_amount_usd,
      0
    ) * 100.0 / NULLIF(
      fare_amount_usd,
      0
    ),
    2
  ) as tip_amount_usd_percentage,
  tolls_amount_usd,
  total_amount_usd,
  improvement_surcharge_usd,
  congestion_surcharge_usd,
  airport_fee_usd,
  cbd_congestion_fee_usd
from
  cte
