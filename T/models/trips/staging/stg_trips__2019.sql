{%- set ymo_list = [
  (2019, 1, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 2, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 3, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 4, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 5, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 6, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 7, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 8, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 9, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 10, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 11, {"cbd_congestion_fee_usd": "NULL"}),
  (2019, 12, {"cbd_congestion_fee_usd": "NULL"}),
] -%}

{%- for y, m, o in ymo_list -%}
select * from (
{{- combined_cleaner(y, m, overides=o) -}}
)
  {% if not loop.last %}
UNION ALL
  {% endif %}
{%- endfor -%}

