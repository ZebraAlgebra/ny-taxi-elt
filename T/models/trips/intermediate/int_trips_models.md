{% docs int_trips__all %}
Intermediate model (a view) derived from the staging model `stg_trips__all` (an incremental model).

This models truncates `pickup_datetime` to `pickup_hour`,
replaces `dropoff_datetime` by `trip_duration`,
and adds a column `tip_amount_usd_percentage` for tip percentage.

Other columns are pertained.
{% enddocs %}

{% docs int_lookups__pairwise_zones %}
All availabel pairwise location ids, used for computing `agg_zone_pairwise__proj` projections,
produced with cross join.
{% enddocs %}
