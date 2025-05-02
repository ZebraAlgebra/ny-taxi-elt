{%- set ym_list = [
  (2020, 1),
  (2020, 2),
  (2020, 3),
  (2020, 4),
  (2020, 5),
  (2020, 6),
  (2020, 7),
  (2020, 8),
  (2020, 9),
  (2020, 10),
  (2020, 11),
  (2020, 12)
] -%}
{%- for year, month in ym_list -%}
{{- load_transform_1(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
