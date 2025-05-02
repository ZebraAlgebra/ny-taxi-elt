{%- set pairs = [
    ("fare_amount", 10000),
    ("extra_charges", 10000),
    ("mta_tax", 10000),
    ("tip_amount", 10000), 
    ("tolls_amount", 10000), 
    ("total_amount", 10000), 
    ("improvement_surcharge", 10000), 
    ("congestion_surcharge", 10000), 
    ("airport_fee", 10000), 
    ("cbd_congestion_fee", 10000)
] %}
{%- set year = 2018 -%}

select count(*)
from
    {{ ref("stg_trips__2018") }}
where
    {%- for col, thresh in pairs %}
        {{ col ~ "_usd" }} >= {{ thresh }}
        {%- if not loop.last %}
            or
        {%- endif %}
    {%- endfor %}
