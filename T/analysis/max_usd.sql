{%- set cols = ["fare_amount", "extra_charges", "mta_tax", "tip_amount", "tolls_amount", "total_amount", "improvement_surcharge", "congestion_surcharge", "airport_fee", "cbd_congestion_fee" ] %}
{%- set stat = "avg" %}
{%- set year = 2018 -%}
select
{%- for col in cols %}
  {{ stat ~ "(" ~ col ~ "_usd) as s_" ~ col ~ "_usd"}}{%- if not loop.last %},{% endif %}
{%- endfor %}
from
    {{ ref("stg_trips__" ~ year) }}

