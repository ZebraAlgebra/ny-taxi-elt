{%- set ym_list = [
  (2024, 1),
  (2024, 2),
  (2024, 3),
  (2024, 4),
  (2024, 5),
  (2024, 6),
  (2024, 7),
  (2024, 8),
  (2024, 9),
  (2024, 10),
  (2024, 11),
  (2024, 12)
] -%}
{%- for year, month in ym_list -%}
{{- load_transform_2(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
