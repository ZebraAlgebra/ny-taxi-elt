{% docs col_agg__year %}
Projected year column.
{% enddocs %}
{% docs col_agg__season %}
Projected season column. Spring is 1, up to 4 for Winter.
{% enddocs %}
{% docs col_agg__month %}
Projected month column.
{% enddocs %}
{% docs col_agg__dow %}
Projected dow column (day of week).

Note that this is equivalent to Postgres' `isodow` - Monday is 1, up to 7 for Sunday.
{% enddocs %}
{% docs col_agg__period %}
Projected period column (time period of day).
{% enddocs %}
{% docs col_agg__hour %}
Projected hour column.
{% enddocs %}

{% docs col_agg__pickup_location_id %}
TLC Taxi Zone in which the taximeter was engaged.

For details of id, see `seeds/taxi_zone_lookups`.
{% enddocs %}
{% docs col_agg__dropoff_location_id %}
TLC Taxi Zone in which the taximeter was disengaged.

For details of id, see `seeds/taxi_zone_lookups`.
{% enddocs %}


{% docs col_agg__trip_count %}
count of trip
{% enddocs %}
{% docs col_agg__trip_duration_sum %}
sum of trip_duration
{% enddocs %}
{% docs col_agg__trip_duration_p05 %}
p05 of trip_duration
{% enddocs %}
{% docs col_agg__trip_duration_p10 %}
p10 of trip_duration
{% enddocs %}
{% docs col_agg__trip_duration_p25 %}
p25 of trip_duration
{% enddocs %}
{% docs col_agg__trip_duration_p50 %}
p50 of trip_duration
{% enddocs %}
{% docs col_agg__trip_duration_p75 %}
p75 of trip_duration
{% enddocs %}
{% docs col_agg__trip_duration_p90 %}
p90 of trip_duration
{% enddocs %}
{% docs col_agg__trip_duration_p95 %}
p95 of trip_duration
{% enddocs %}
{% docs col_agg__trip_distance_sum %}
sum of trip_distance
{% enddocs %}
{% docs col_agg__trip_distance_p05 %}
p05 of trip_distance
{% enddocs %}
{% docs col_agg__trip_distance_p10 %}
p10 of trip_distance
{% enddocs %}
{% docs col_agg__trip_distance_p25 %}
p25 of trip_distance
{% enddocs %}
{% docs col_agg__trip_distance_p50 %}
p50 of trip_distance
{% enddocs %}
{% docs col_agg__trip_distance_p75 %}
p75 of trip_distance
{% enddocs %}
{% docs col_agg__trip_distance_p90 %}
p90 of trip_distance
{% enddocs %}
{% docs col_agg__trip_distance_p95 %}
p95 of trip_distance
{% enddocs %}
{% docs col_agg__total_amount_usd_sum %}
sum of total_amount_usd
{% enddocs %}
{% docs col_agg__total_amount_usd_p05 %}
p05 of total_amount_usd
{% enddocs %}
{% docs col_agg__total_amount_usd_p10 %}
p10 of total_amount_usd
{% enddocs %}
{% docs col_agg__total_amount_usd_p25 %}
p25 of total_amount_usd
{% enddocs %}
{% docs col_agg__total_amount_usd_p50 %}
p50 of total_amount_usd
{% enddocs %}
{% docs col_agg__total_amount_usd_p75 %}
p75 of total_amount_usd
{% enddocs %}
{% docs col_agg__total_amount_usd_p90 %}
p90 of total_amount_usd
{% enddocs %}
{% docs col_agg__total_amount_usd_p95 %}
p95 of total_amount_usd
{% enddocs %}
{% docs col_agg__fare_amount_usd_sum %}
sum of fare_amount_usd
{% enddocs %}
{% docs col_agg__fare_amount_usd_p05 %}
p05 of fare_amount_usd
{% enddocs %}
{% docs col_agg__fare_amount_usd_p10 %}
p10 of fare_amount_usd
{% enddocs %}
{% docs col_agg__fare_amount_usd_p25 %}
p25 of fare_amount_usd
{% enddocs %}
{% docs col_agg__fare_amount_usd_p50 %}
p50 of fare_amount_usd
{% enddocs %}
{% docs col_agg__fare_amount_usd_p75 %}
p75 of fare_amount_usd
{% enddocs %}
{% docs col_agg__fare_amount_usd_p90 %}
p90 of fare_amount_usd
{% enddocs %}
{% docs col_agg__fare_amount_usd_p95 %}
p95 of fare_amount_usd
{% enddocs %}
{% docs col_agg__tip_amount_usd_sum %}
sum of tip_amount_usd
{% enddocs %}
{% docs col_agg__tip_amount_usd_percentage_p05 %}
p05 of tip_amount_usd_percentage
{% enddocs %}
{% docs col_agg__tip_amount_usd_percentage_p10 %}
p10 of tip_amount_usd_percentage
{% enddocs %}
{% docs col_agg__tip_amount_usd_percentage_p25 %}
p25 of tip_amount_usd_percentage
{% enddocs %}
{% docs col_agg__tip_amount_usd_percentage_p50 %}
p50 of tip_amount_usd_percentage
{% enddocs %}
{% docs col_agg__tip_amount_usd_percentage_p75 %}
p75 of tip_amount_usd_percentage
{% enddocs %}
{% docs col_agg__tip_amount_usd_percentage_p90 %}
p90 of tip_amount_usd_percentage
{% enddocs %}
{% docs col_agg__tip_amount_usd_percentage_p95 %}
p95 of tip_amount_usd_percentage
{% enddocs %}
{% docs col_agg__tolls_amount_usd_sum %}
sum of tolls_amount_usd
{% enddocs %}
{% docs col_agg__improvement_surcharge_usd_sum %}
sum of improvement_surcharge_usd
{% enddocs %}
{% docs col_agg__congestion_surcharge_usd_sum %}
sum of congestion_surcharge_usd
{% enddocs %}
{% docs col_agg__airport_fee_usd_sum %}
sum of airport_fee_usd
{% enddocs %}
{% docs col_agg__cbd_congestion_fee_usd_sum %}
sum of cbd_congestion_fee_usd
{% enddocs %}
{% docs col_agg__vendor_id_value_1_count %}
count of vendor_id_value_1
{% enddocs %}
{% docs col_agg__vendor_id_value_2_count %}
count of vendor_id_value_2
{% enddocs %}
{% docs col_agg__vendor_id_value_4_count %}
count of vendor_id_value_4
{% enddocs %}
{% docs col_agg__vendor_id_value_5_count %}
count of vendor_id_value_5
{% enddocs %}
{% docs col_agg__vendor_id_value_6_count %}
count of vendor_id_value_6
{% enddocs %}
{% docs col_agg__vendor_id_value_7_count %}
count of vendor_id_value_7
{% enddocs %}
{% docs col_agg__rate_code_id_value_1_count %}
count of rate_code_id_value_1
{% enddocs %}
{% docs col_agg__rate_code_id_value_2_count %}
count of rate_code_id_value_2
{% enddocs %}
{% docs col_agg__rate_code_id_value_3_count %}
count of rate_code_id_value_3
{% enddocs %}
{% docs col_agg__rate_code_id_value_4_count %}
count of rate_code_id_value_4
{% enddocs %}
{% docs col_agg__rate_code_id_value_5_count %}
count of rate_code_id_value_5
{% enddocs %}
{% docs col_agg__rate_code_id_value_6_count %}
count of rate_code_id_value_6
{% enddocs %}
{% docs col_agg__rate_code_id_value_99_count %}
count of rate_code_id_value_99
{% enddocs %}
{% docs col_agg__store_forward_flag_value_0_count %}
count of store_forward_flag_value_0
{% enddocs %}
{% docs col_agg__store_forward_flag_value_1_count %}
count of store_forward_flag_value_1
{% enddocs %}
{% docs col_agg__payment_type_id_value_1_count %}
count of payment_type_id_value_1
{% enddocs %}
{% docs col_agg__payment_type_id_value_2_count %}
count of payment_type_id_value_2
{% enddocs %}
{% docs col_agg__payment_type_id_value_3_count %}
count of payment_type_id_value_3
{% enddocs %}
{% docs col_agg__payment_type_id_value_4_count %}
count of payment_type_id_value_4
{% enddocs %}
{% docs col_agg__payment_type_id_value_5_count %}
count of payment_type_id_value_5
{% enddocs %}
{% docs col_agg__payment_type_id_value_6_count %}
count of payment_type_id_value_6
{% enddocs %}
