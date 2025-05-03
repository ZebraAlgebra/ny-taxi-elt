{%- set ymo_list = [
  (2018, 1, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 2, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 3, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 4, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 5, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 6, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 7, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 8, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 9, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 10, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 11, {"cbd_congestion_fee_usd": "NULL"}),
  (2018, 12, {"cbd_congestion_fee_usd": "NULL"}),
] -%}

{%- for y, m, o in ymo_list -%}
select * from (
{{- combined_cleaner(y, m, overides=o) -}}
)
  {% if not loop.last %}
UNION ALL
  {% endif %}
{%- endfor -%}

