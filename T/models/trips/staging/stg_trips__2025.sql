{%- set ym_list_1 = [
  (2025, 1),
] -%}
{%- set ym_list_2 = [
  (2025, 2),
] -%}
{%- for year, month in ym_list_1 -%}
{{- transform_yellow_tripdata_2(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
UNION ALL
{%- for year, month in ym_list_2 -%}
{{- transform_yellow_tripdata_3(year, month) -}}
  {%- if not loop.last -%}
UNION ALL
  {%- endif %}
{%- endfor -%}
