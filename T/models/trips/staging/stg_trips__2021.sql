{%- set ymo_list = [
  (2021, 1, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 2, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 3, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 4, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 5, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 6, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 7, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 8, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 9, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 10, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 11, {"cbd_congestion_fee_usd": "NULL"}),
  (2021, 12, {"cbd_congestion_fee_usd": "NULL"}),
] -%}

{%- for y, m, o in ymo_list -%}
select * from (
{{- combined_cleaner(y, m, overides=o) -}}
)
  {% if not loop.last %}
UNION ALL
  {% endif %}
{%- endfor -%}

