{% macro fmt_new_ym(y, m) %}
    {%- set new_y = y + m // 12 %}
    {%- set new_m = (m + 1 - 12 * (m // 12)) %}
    {{ return((new_y, new_m)) }}
{% endmacro %}

{% macro fmt_datetime_from_ym(y, m) %}
    {{ return ("'" ~ y ~ "-" ~ m ~ "-01 00:00:00'::timestamptz") }}
{% endmacro %}

{% macro fmt_source(year, month) %}
    {# /* format parts of source string */ #}
    {{ return('yellow_' ~ year ~ '_' ~ "%02d"|format(month)) }}
{% endmacro %}

{% macro fmt_store_forward_flag() %}
    {# /* format store_forward_flag selector */ #}
    {{ return(
      """case
             when store_forward_flag = 'Y' then 1
             when store_forward_flag = 'N' then 0
         end""") }}
{% endmacro %}

{% macro fmt_rate_code_id() %}
    {# /* format rate_code_id selector */ #}
    {{ return("coalesce(rate_code_id::smallint, 99)") }}
{% endmacro %}

