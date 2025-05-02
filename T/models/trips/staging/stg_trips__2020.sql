{%- set ymo_list = [
  (2020, 1, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 2, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 3, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 4, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 5, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 6, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 7, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 8, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 9, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 10, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 11, {"cbd_congestion_fee_usd": "NULL"}),
  (2020, 12, {"cbd_congestion_fee_usd": "NULL"}),
] -%}

{%- for y, m, o in ymo_list -%}
select * from (
{{- combined_cleaner(y, m, overides=o) -}}
)
  {% if not loop.last %}
UNION ALL
  {% endif %}
{%- endfor -%}

