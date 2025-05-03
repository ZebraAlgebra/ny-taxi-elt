{% docs col_passenger_count %}
The number of passengers in the vehicle.
{% enddocs %}

{% docs col_pickup_datetime %}
The date and time when the meter was engaged. 
{% enddocs %}

{% docs col_dropoff_datetime %}
The date and time when the meter was disengaged. 
{% enddocs %}

{% docs col_pickup_location_id %}
TLC Taxi Zone in which the taximeter was engaged.

For details of id, see `seeds/taxi_zone_lookups`.
{% enddocs %}

{% docs col_dropoff_location_id %}
TLC Taxi Zone in which the taximeter was disengaged.

For details of id, see `seeds/taxi_zone_lookups`.
{% enddocs %}

{% docs col_trip_distance %}
The elapsed trip distance in miles reported by the taximeter.
{% enddocs %}

{% docs col_vendor_id %}
A code indicating the TPEP provider that provided the record.

For details of id, see `seeds/value_lookups`.
{% enddocs %}

{% docs col_rate_code_id %}
The final rate code in effect at the end of the trip.

For details of id, see `seeds/value_lookups`.
{% enddocs %}

{% docs col_payment_type_id %}
A numeric code signifying how the passenger paid for the trip.

For details of id, see `seeds/value_lookups`.
{% enddocs %}

{% docs col_store_forward_flag %}
This flag indicates whether the trip record was held in vehicle memory before 
sending to the vendor, aka “store and forward,” because the vehicle did not 
have a connection to the server. 

For details of id, see `seeds/value_lookups`.
{% enddocs %}

{% docs col_fare_amount_usd %}
The time-and-distance fare calculated by the meter. For additional 
information on the following columns, see 
[the info on the official website](https://www.nyc.gov/site/tlc/passengers/taxi-fare.page).
{% enddocs %}

{% docs col_extra_charges_usd %}
Miscellaneous extras and surcharges. 
{% enddocs %}

{% docs col_mta_tax_usd %}
Tax that is automatically triggered based on the metered rate in use. 
{% enddocs %}

{% docs col_tip_amount_usd %}
Tip amount – This field is automatically populated for credit card tips.
Cash tips are not included. 
{% enddocs %}

{% docs col_tolls_amount_usd %}
Total amount of all tolls paid in trip.
{% enddocs %}

{% docs col_total_amount_usd %}
The total amount charged to passengers. Does not include cash tips.
{% enddocs %}

{% docs col_improvement_surcharge_usd %}
Improvement surcharge assessed trips at the flag drop. The improvement 
surcharge began being levied in 2015. 
{% enddocs %}

{% docs col_congestion_surcharge_usd %}
Total amount collected in trip for NYS congestion surcharge. 
{% enddocs %}

{% docs col_airport_fee_usd %}
For pick up only at LaGuardia and John F. Kennedy Airports. 
{% enddocs %}

{% docs col_cbd_congestion_fee_usd %}
Per-trip charge for MTA's Congestion Relief Zone starting Jan. 5, 2025. 
{% enddocs %}
