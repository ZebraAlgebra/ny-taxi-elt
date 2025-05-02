{%- set ymo_list = [
  (2025, 1, {"cbd_congestion_fee_usd": "NULL", "airport_fee_usd": '"Airport_fee"'}),
  (2025, 2, {"airport_fee_usd": '"Airport_fee"'}),
] -%}

{%- for y, m, o in ymo_list -%}
select * from (
{{- combined_cleaner(y, m, overides=o) -}}
)
  {% if not loop.last %}
UNION ALL
  {% endif %}
{%- endfor -%}

