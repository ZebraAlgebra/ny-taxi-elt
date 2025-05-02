SELECT 
  max(dropoff_datetime),
  min(dropoff_datetime) 
FROM 
  {{ ref("stg_trips__2021") }}
