{%- set ym_list_1 = [
  (2023, 1),
] -%}
{%- set ym_list_2 = [
  (2023, 2),
  (2023, 3),
  (2023, 4),
  (2023, 5),
  (2023, 6),
  (2023, 7),
  (2023, 8),
  (2023, 9),
  (2023, 10),
  (2023, 11),
  (2023, 12)
] -%}
{%- for year, month in ym_list_1 -%}
{{- load_transform_1(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
UNION ALL
{%- for year, month in ym_list_2 -%}
{{- load_transform_2(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
