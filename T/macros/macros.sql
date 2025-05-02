{% macro load_transform_1(year, month) %}
    {%- set currency_type = "numeric(7, 2)" %}

select
    passenger_count::smallint,
    tpep_pickup_datetime::timestamp as pickup_datetime,
    tpep_dropoff_datetime::timestamp as dropoff_datetime,
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
    airport_fee::{{ currency_type }} as airport_fee_usd,
    NULL as cbd_congestion_fee_usd
from
    {{ source('sources', 'yellow_' ~ year ~ '_' ~ "%02d"|format(month)) }}

{% endmacro %}

{% macro load_transform_2(year, month) %}
    {%- set currency_type = "numeric(7, 2)" %}

select
    passenger_count::smallint,
    tpep_pickup_datetime::timestamp as pickup_datetime,
    tpep_dropoff_datetime::timestamp as dropoff_datetime,
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
    NULL as cbd_congestion_fee_usd
from
    {{ source('sources', 'yellow_' ~ year ~ '_' ~ "%02d"|format(month)) }}

{% endmacro %}

{% macro load_transform_3(year, month) %}
    {%- set currency_type = "numeric(7, 2)" %}

select
    passenger_count::smallint,
    tpep_pickup_datetime::timestamp as pickup_datetime,
    tpep_dropoff_datetime::timestamp as dropoff_datetime,
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
    cbd_congestion_fee as cbd_congestion_fee_usd
from
    {{ source('sources', 'yellow_' ~ year ~ '_' ~ "%02d"|format(month)) }}

{% endmacro %}
