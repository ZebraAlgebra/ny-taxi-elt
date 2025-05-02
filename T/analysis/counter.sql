{%- set my_col = 'rate_code_id' -%}
{%- set year = 2018 -%}

with vlookup as (
    select
        column_value,
        value_description
    from
        {{ ref("value_lookups") }}
    where
        column_name = '{{ my_col }}'
),

agg as (
    select
        count({{ my_col }}) as {{ my_col }}_count,
        {{ my_col }}
    from
        {{ ref("stg_trips__" ~ year) }}
    group by
        {{ my_col }}
)

select
    agg.{{ my_col }}_count,
    vlookup.value_description as rate_type
from
    agg
inner join
    vlookup
    on
        vlookup.column_value = agg.{{ my_col }}
