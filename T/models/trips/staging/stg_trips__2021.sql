{%- set ym_list = [
  (2021, 1),
  (2021, 2),
  (2021, 3),
  (2021, 4),
  (2021, 5),
  (2021, 6),
  (2021, 7),
  (2021, 8),
  (2021, 9),
  (2021, 10),
  (2021, 11),
  (2021, 12)
] -%}
{%- for year, month in ym_list -%}
{{- load_transform_1(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
