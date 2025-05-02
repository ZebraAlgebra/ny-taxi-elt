{% macro col_rename(year, month, overides={}) %}
    {# /* renames columns, tweaks by additional columns */ #}
{%- set base_config = {
    "passenger_count": "passenger_count",
    "pickup_datetime": "tpep_pickup_datetime",
    "dropoff_datetime": "tpep_dropoff_datetime",
    "pickup_location_id": '"PULocationID"',
    "dropoff_location_id": '"DOLocationID"',
    "trip_distance": "trip_distance",
    "vendor_id": '"VendorID"',
    "rate_code_id": '"RatecodeID"',
    "payment_type_id": "payment_type",
    "store_forward_flag": "store_and_fwd_flag",
    "fare_amount_usd": "fare_amount",
    "extra_charges_usd": "extra", 
    "mta_tax_usd": "mta_tax", 
    "tip_amount_usd": "tip_amount", 
    "tolls_amount_usd": "tolls_amount", 
    "total_amount_usd": "total_amount", 
    "improvement_surcharge_usd": "improvement_surcharge", 
    "congestion_surcharge_usd": "congestion_surcharge",
    "airport_fee_usd": "airport_fee",
    "cbd_congestion_fee_usd": "cbd_congestion_fee"
} -%}
    {%- set _ = base_config.update(overides) -%}
    select
    {% for colname_new, colname_old in base_config.items() %}
        {{ colname_old }} as {{ colname_new }}{%- if not loop.last %},{%- endif %}
    {%- endfor %}

    from
        {{ source("sources", fmt_source(year, month)) }}
{% endmacro %}

{% macro row_filter(tname, year, month) %}
    {# /* renames columns, tweaks by additional columns */ #}
{%- set (new_y, new_m) = fmt_new_ym(year, month) %}
{%- set filters = [
    "pickup_datetime::timestamptz <= dropoff_datetime::timestamptz", 
    "pickup_datetime::timestamptz >= " ~ fmt_datetime_from_ym(year, month), 
    "pickup_datetime::timestamptz < " ~ fmt_datetime_from_ym(new_y, new_m), 
    "coalesce(trip_distance::double precision, 0) >= 0",
    "coalesce(fare_amount_usd::double precision, 0) <= 10000",
    "coalesce(extra_charges_usd::double precision, 0) <= 10000",
    "coalesce(mta_tax_usd::double precision, 0) <= 10000",
    "coalesce(tip_amount_usd::double precision, 0) <= 10000",
    "coalesce(tolls_amount_usd::double precision, 0) <= 10000",
    "coalesce(total_amount_usd::double precision, 0) <= 10000",
    "coalesce(improvement_surcharge_usd::double precision, 0) <= 10000",
    "coalesce(congestion_surcharge_usd::double precision, 0) <= 10000",
    "coalesce(airport_fee_usd::double precision, 0) <= 10000",
    "coalesce(cbd_congestion_fee_usd::double precision, 0) <= 10000",
] -%}
    select *
    from
        {{ tname }}
    where
    {%- for filter in filters %}
        {{ filter }}
        {%- if not loop.last %} and {% endif %}
    {%- endfor %}

{% endmacro %}

{% macro col_recast(tname) %}
    {# /* renames columns, tweaks by additional columns */ #}
{%- set base_config = {
    "passenger_count": "smallint",
    "pickup_datetime": "timestamptz",
    "dropoff_datetime": "timestamptz",
    "pickup_location_id": "smallint",
    "dropoff_location_id": "smallint",
    "trip_distance": "double precision",
    "vendor_id": "smallint",
    "rate_code_id": "smallint",
    "payment_type_id": "smallint",
    "store_forward_flag": "smallint",
    "fare_amount_usd": "numeric(7, 2)",
    "extra_charges_usd": "numeric(7, 2)", 
    "mta_tax_usd": "numeric(7, 2)", 
    "tip_amount_usd": "numeric(7, 2)", 
    "tolls_amount_usd": "numeric(7, 2)", 
    "total_amount_usd": "numeric(7, 2)", 
    "improvement_surcharge_usd": "numeric(7, 2)", 
    "congestion_surcharge_usd": "numeric(7, 2)",
    "airport_fee_usd": "numeric(7, 2)",
    "cbd_congestion_fee_usd": "numeric(7, 2)"
} -%}
    select
    {%- for colname, target_type in base_config.items() %}
        {%- if colname == "store_forward_flag" %}
        {{ fmt_store_forward_flag() }}::{{ target_type }} as {{colname}}
        {%- elif colname == "rate_code_id" %}
        {{ fmt_rate_code_id() }}::{{ target_type }} as {{colname}}
        {%- else %}
        {{ colname }}::{{ target_type }}
        {%- endif %}{%- if not loop.last -%},{%- endif %}
    {%- endfor %}

    from
        {{ tname }}
{% endmacro %}

{% macro combined_cleaner(year, month, overides={}) %}
with t_renamed as (
{{ col_rename(year, month, overides) }}
),

t_filtered as (
{{ row_filter("t_renamed", year, month) }}
),

t_recasted as (
{{ col_recast("t_filtered") }}
)

select * from t_recasted

{% endmacro %}
