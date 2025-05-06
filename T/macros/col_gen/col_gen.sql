{% macro gen_percentile_cols(colname, percentiles=[0.05, 0.10, 0.25, 0.50, 0.75, 0.90, 0.95], gen_sum=True) %}
{%- if gen_sum -%}
  sum({{ colname }}) as {{ colname }}_sum,
{% endif %}
{%- for percentile in percentiles %}
  percentile_cont({{ percentile }}) within group (order by {{ colname }}) as {{ colname }}_p{{ '%02d' | format(percentile * 100) }}
  {%- if not loop.last -%},{%- endif %}
{%- endfor -%}
{% endmacro %}

{% macro gen_value_count_cols(colname, candidates) %}
{%- for candidate in candidates %}
  SUM(
    CASE 
      WHEN {{ colname }} = {{ candidate }}
      THEN 1
      ELSE 0
    END
  ) AS {{ colname }}_value_{{ candidate }}_count
  {%- if not loop.last -%},{%- endif %}
{%- endfor -%}
{% endmacro %}

{% macro gen_sum_col(colname) %}
  sum({{ colname }}) as {{ colname }}_sum
{% endmacro %}

{% macro gen_percentile_colnames(prefix, colname, percentiles=[0.05, 0.10, 0.25, 0.50, 0.75, 0.90, 0.95], gen_sum=True) %}
{%- if gen_sum -%}
  {{ prefix }}.{{ colname }}_sum,
{% endif %}
{%- for percentile in percentiles %}
  {{ prefix }}.{{ colname }}_p{{ '%02d' | format(percentile * 100) }}
  {%- if not loop.last -%},{%- endif %}
{%- endfor -%}
{% endmacro %}

{% macro gen_value_count_colnames(prefix, colname, candidates) %}
{%- for candidate in candidates %}
  {{ prefix }}.{{ colname }}_value_{{ candidate }}_count
  {%- if not loop.last -%},{%- endif %}
{%- endfor -%}
{% endmacro %}

{% macro gen_sum_colname(prefix, colname) %}
  {{ prefix }}.{{ colname }}_sum
{% endmacro %}
