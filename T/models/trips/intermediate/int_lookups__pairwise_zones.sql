with t as (
  select
    location_id
  from
    {{ ref("taxi_zone_lookups") }}
)

select
  t1.location_id as pickup_location_id,
  t2.location_id as dropoff_location_id
from
  t as t1
cross join
  t as t2
order by
  1, 2
