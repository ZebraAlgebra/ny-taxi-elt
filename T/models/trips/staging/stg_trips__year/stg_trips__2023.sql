{%- set ymo_list = [
  (2023, 1, {"cbd_congestion_fee_usd": "NULL"}),
  (2023, 2, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 3, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 4, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 5, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 6, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 7, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 8, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 9, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 10, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 11, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2023, 12, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
] -%}

{%- for y, m, o in ymo_list -%}
select * from (
{{- combined_cleaner(y, m, overides=o) -}}
)
  {% if not loop.last %}
UNION ALL
  {% endif %}
{%- endfor -%}

