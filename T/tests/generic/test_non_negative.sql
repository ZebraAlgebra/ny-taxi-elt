{% test test_non_negative(model, column_name) %}

with cte as (
    select
        {{ column_name }} as test_col
    from
        {{ model }}
),

test_table as (

    select
        test_col

    from cte
    where 
        test_col < 0

)

select *
from test_table

{% endtest %}
