{%- set ym_list = [
  (2019, 1),
  (2019, 2),
  (2019, 3),
  (2019, 4),
  (2019, 5),
  (2019, 6),
  (2019, 7),
  (2019, 8),
  (2019, 9),
  (2019, 10),
  (2019, 11),
  (2019, 12)
] -%}
{%- for year, month in ym_list -%}
{{- transform_yellow_tripdata_1(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
