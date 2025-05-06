{% docs agg_hourly_trips_stats %}
Aggregates `int_trips__all` table to hour level.

This is created as an incremental model.

Note: same hour in different days are not counted the same in this table.
{% enddocs %}

{% docs agg_zones_pairwise__year %}
Projects `int_trips__all` table to `(year, pickup_location_id, dropoff_location_id)`.

Note: same year in different days are counted the same in this table.
{% enddocs %}

{% docs agg_zones_pairwise__season %}
Projects `int_trips__all` table to `(season, pickup_location_id, dropoff_location_id)`.

Note: same season in different days are counted the same in this table.
{% enddocs %}

{% docs agg_zones_pairwise__month %}
Projects `int_trips__all` table to `(month, pickup_location_id, dropoff_location_id)`.

Note: same month in different days are counted the same in this table.
{% enddocs %}

{% docs agg_zones_pairwise__dow %}
Projects `int_trips__all` table to `(dow, pickup_location_id, dropoff_location_id)` (dow meaning day of week).

Note: same dow in different days are counted the same in this table.
{% enddocs %}

{% docs agg_zones_pairwise__period %}
Projects `int_trips__all` table to `(period, pickup_location_id, dropoff_location_id)`.

Note: same period in different days are counted the same in this table.
{% enddocs %}

{% docs agg_zones_pairwise__hour %}
Projects `int_trips__all` table to `(hour, pickup_location_id, dropoff_location_id)`.

Note: same hour in different days are counted the same in this table.
{% enddocs %}
