select min(pickup_datetime), max(pickup_datetime)
from {{ ref("stg_trips__2018") }}
