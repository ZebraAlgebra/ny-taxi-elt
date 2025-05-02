{%- set ymo_list = [
  (2022, 1, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 2, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 3, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 4, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 5, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 6, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 7, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 8, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 9, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 10, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 11, {"cbd_congestion_fee_usd": "NULL"}),
  (2022, 12, {"cbd_congestion_fee_usd": "NULL"}),
] -%}

{%- for y, m, o in ymo_list -%}
select * from (
{{- combined_cleaner(y, m, overides=o) -}}
)
  {% if not loop.last %}
UNION ALL
  {% endif %}
{%- endfor -%}

