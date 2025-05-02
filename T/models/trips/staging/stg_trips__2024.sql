{%- set ymo_list = [
  (2024, 1, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 2, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 3, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 4, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 5, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 6, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 7, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 8, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 9, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 10, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 11, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2024, 12, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
] -%}

{%- for y, m, o in ymo_list -%}
select * from (
{{- combined_cleaner(y, m, overides=o) -}}
)
  {% if not loop.last %}
UNION ALL
  {% endif %}
{%- endfor -%}

