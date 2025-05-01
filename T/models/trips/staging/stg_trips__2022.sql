{%- set ym_list = [
  (2022, 1),
  (2022, 2),
  (2022, 3),
  (2022, 4),
  (2022, 5),
  (2022, 6),
  (2022, 7),
  (2022, 8),
  (2022, 9),
  (2022, 10),
  (2022, 11),
  (2022, 12)
] -%}
{%- for year, month in ym_list -%}
{{- transform_yellow_tripdata_1(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
