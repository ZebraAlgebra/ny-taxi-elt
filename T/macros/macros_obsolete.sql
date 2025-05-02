{% macro load_transform_1(year, month) %}
{{
  combined_cleaner(
    2018,
    1, 
    overides={
      "cbd_congestion_fee_usd": "NULL"
    }
  )
}}
{% endmacro %}

{% macro load_transform_2(year, month) %}
{%- set currency_type = "numeric(7, 2)" %}

select
    passenger_count::smallint,
    tpep_pickup_datetime::timestamptz as pickup_datetime,
    tpep_dropoff_datetime::timestamptz as dropoff_datetime,
    "PULocationID"::smallint as pickup_location_id,
    "DOLocationID"::smallint as dropoff_location_id,
    trip_distance::double precision,
    "VendorID"::smallint as vendor_id,
    coalesce("RatecodeID"::smallint, 99)::smallint as rate_code_id,
    payment_type::smallint as payment_type_id,
    case
        when store_and_fwd_flag = 'Y' then 1
        when store_and_fwd_flag = 'N' then 0
    end::smallint as store_forward_flag,
    fare_amount::{{ currency_type }} as fare_amount_usd,
    extra::{{ currency_type }} as extra_charges_usd,
    mta_tax::{{ currency_type }} as mta_tax_usd,
    tip_amount::{{ currency_type }} as tip_amount_usd,
    tolls_amount::{{ currency_type }} as tolls_amount_usd,
    total_amount::{{ currency_type }} as total_amount_usd,
    improvement_surcharge::{{ currency_type }} as improvement_surcharge_usd,
    congestion_surcharge::{{ currency_type }} as congestion_surcharge_usd,
    "Airport_fee"::{{ currency_type }} as airport_fee_usd,
    NULL::{{ currency_type }} as cbd_congestion_fee_usd
from
    {{ source('sources', 'yellow_' ~ year ~ '_' ~ "%02d"|format(month)) }}
where
    fare_amount::double precision <= 10000 and
    extra::double precision <= 10000 and
    mta_tax::double precision <= 10000 and
    tip_amount::double precision <= 10000 and
    tolls_amount::double precision <= 10000 and
    total_amount::double precision <= 10000 and
    improvement_surcharge::double precision <= 10000 and
    congestion_surcharge::double precision <= 10000 and
    "Airport_fee"::double precision <= 10000 and
    tpep_pickup_datetime::timestamptz <= tpep_dropoff_datetime::timestamptz and
    tpep_pickup_datetime::timestamptz < {{ "'" ~ (year + month // 12) ~ "-" ~ (month + 1 - 12 * (month // 12)) ~ "-01'" }}::timestamptz and
    tpep_pickup_datetime::timestamptz >= {{ "'" ~ year ~ "-" ~ month ~ "-01'" }}::timestamptz 

{% endmacro %}

{% macro load_transform_3(year, month) %}
{%- set currency_type = "numeric(7, 2)" %}

select
    passenger_count::smallint,
    tpep_pickup_datetime::timestamptz as pickup_datetime,
    tpep_dropoff_datetime::timestamptz as dropoff_datetime,
    "PULocationID"::smallint as pickup_location_id,
    "DOLocationID"::smallint as dropoff_location_id,
    trip_distance::double precision,
    "VendorID"::smallint as vendor_id,
    coalesce("RatecodeID"::smallint, 99)::smallint as rate_code_id,
    payment_type::smallint as payment_type_id,
    case
        when store_and_fwd_flag = 'Y' then 1
        when store_and_fwd_flag = 'N' then 0
    end::smallint as store_forward_flag,
    fare_amount::{{ currency_type }} as fare_amount_usd,
    extra::{{ currency_type }} as extra_charges_usd,
    mta_tax::{{ currency_type }} as mta_tax_usd,
    tip_amount::{{ currency_type }} as tip_amount_usd,
    tolls_amount::{{ currency_type }} as tolls_amount_usd,
    total_amount::{{ currency_type }} as total_amount_usd,
    improvement_surcharge::{{ currency_type }} as improvement_surcharge_usd,
    congestion_surcharge::{{ currency_type }} as congestion_surcharge_usd,
    "Airport_fee"::{{ currency_type }} as airport_fee_usd,
    cbd_congestion_fee::{{ currency_type }} as cbd_congestion_fee_usd
from
    {{ source('sources', 'yellow_' ~ year ~ '_' ~ "%02d"|format(month)) }}
where
    fare_amount::double precision <= 10000 and
    extra::double precision <= 10000 and
    mta_tax::double precision <= 10000 and
    tip_amount::double precision <= 10000 and
    tolls_amount::double precision <= 10000 and
    total_amount::double precision <= 10000 and
    improvement_surcharge::double precision <= 10000 and
    congestion_surcharge::double precision <= 10000 and
    "Airport_fee"::double precision <= 10000 and
    cbd_congestion_fee::double precision <= 10000 and
    tpep_pickup_datetime::timestamptz <= tpep_dropoff_datetime::timestamptz and
    tpep_pickup_datetime::timestamptz < {{ "'" ~ (year + month // 12) ~ "-" ~ (month + 1 - 12 * (month // 12)) ~ "-01'" }}::timestamptz and
    tpep_pickup_datetime::timestamptz >= {{ "'" ~ year ~ "-" ~ month ~ "-01'" }}::timestamptz 

{% endmacro %}
