{% macro dim_template(colname, has_details=false) %}
with cte as (
  select
    *
  from
    {{ ref("value_lookups") }}
)

select
  column_value as {{ colname }},
  value_description
{%- if has_details -%}
  ,
  value_details
{% endif %}
from
  cte
where
  column_name = '{{ colname }}'
order by
  1 ASC
{% endmacro %}

{% macro agg_zones_pairwise__proj_template(granularity, limit=none, offset=none) %}
{%- set quartiles = [0.25, 0.50, 0.75] %}

with fact as (
  select
    *
  from
    {{ ref("int_trips__all") }}
{% if limit is not none -%}
  limit
    {{ limit }}
{%- endif %}
{% if offset is not none -%}
  offset
    {{ offset }}
{%- endif %}
),

fact_agg as (
  select
{% if granularity in ("year", "month", "hour") -%}
    extract({{ granularity }} from f.pickup_hour) as {{ granularity }},
{% elif granularity == "dow" -%}
    extract(isodow from f.pickup_hour) as {{ granularity }},
{% elif granularity == "period" -%}
    case
      when extract(hour from pickup_hour) between 0 and 4 then 7
      when extract(hour from pickup_hour) between 5 and 7 then 1
      when extract(hour from pickup_hour) between 8 and 9 then 2
      when extract(hour from pickup_hour) between 10 and 15 then 3
      when extract(hour from pickup_hour) between 16 and 18 then 4
      when extract(hour from pickup_hour) between 19 and 21 then 5
      else 6
    end as {{ granularity }},
{% elif granularity == "season" -%}
    case
      when extract(month from pickup_hour) in (12, 1, 2) then 4
      when extract(month from pickup_hour) in (3, 4, 5) then 1
      when extract(month from pickup_hour) in (6, 7, 8) then 2
      when extract(month from pickup_hour) in (9, 10, 11) then 3
    end as season,
{%- endif %}
    f.pickup_location_id,
    f.dropoff_location_id,
    count(f.pickup_location_id) as trip_count,
    {{ gen_percentile_cols("trip_duration", percentiles=quartiles) }},
    {{ gen_percentile_cols("trip_distance", percentiles=quartiles) }},
    {{ gen_percentile_cols("total_amount_usd", percentiles=quartiles) }},
    {{ gen_percentile_cols("fare_amount_usd", percentiles=quartiles) }},
    {{ gen_sum_col("tip_amount_usd") }},
    {{ gen_percentile_cols("tip_amount_usd_percentage", percentiles=quartiles, gen_sum=False) }},
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
    fact as f
  group by
    1, 2, 3
),

date_dim as (
  select
    distinct {{ granularity }}
  from
    fact_agg
),

triple as (
  select
    *
  from
    {{ ref("int_lookups__pairwise_zones") }}
  cross join
    date_dim
)

select 
  t.{{ granularity }},
  t.pickup_location_id,
  t.dropoff_location_id,
  coalesce(f.trip_count, 0) as trip_count,
  {{ gen_percentile_colnames("f", "trip_duration", percentiles=quartiles) }},
  {{ gen_percentile_colnames("f", "trip_distance", percentiles=quartiles) }},
  {{ gen_percentile_colnames("f", "total_amount_usd", percentiles=quartiles) }},
  {{ gen_percentile_colnames("f", "fare_amount_usd", percentiles=quartiles) }},
  {{ gen_sum_colname("f", "tip_amount_usd") }},
  {{ gen_percentile_colnames("f", "tip_amount_usd_percentage", percentiles=quartiles, gen_sum=False) }},
  {{ gen_sum_colname("f", "tolls_amount_usd") }},
  {{ gen_sum_colname("f", "improvement_surcharge_usd") }},
  {{ gen_sum_colname("f", "congestion_surcharge_usd") }},
  {{ gen_sum_colname("f", "airport_fee_usd") }},
  {{ gen_sum_colname("f", "cbd_congestion_fee_usd") }},
  {{ gen_value_count_colnames("f", "vendor_id", [1, 2, 4, 5, 6, 7]) }},
  {{ gen_value_count_colnames("f", "rate_code_id", [1, 2, 3, 4, 5, 6, 99]) }},
  {{ gen_value_count_colnames("f", "store_forward_flag", [0, 1]) }},
  {{ gen_value_count_colnames("f", "payment_type_id", [1, 2, 3, 4, 5, 6]) }}
from
  fact_agg as f
right join
  triple as t
on
  t.{{ granularity }} = f.{{ granularity }}
  and t.pickup_location_id = f.pickup_location_id
  and t.dropoff_location_id = f.dropoff_location_id
order by
  1, 4 DESC, 2, 3

{% endmacro %}
