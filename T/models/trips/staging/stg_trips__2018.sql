{%- set ym_list = [
  (2018, 1),
  (2018, 2),
  (2018, 3),
  (2018, 4),
  (2018, 5),
  (2018, 6),
  (2018, 7),
  (2018, 8),
  (2018, 9),
  (2018, 10),
  (2018, 11),
  (2018, 12)
] -%}
{%- for year, month in ym_list -%}
{{- transform_yellow_tripdata_1(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
