{% test test_in_range(model, column_name, lower_bound, upper_bound) %}

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
        test_col < {{ lower_bound }}
        or
        test_col > {{ upper_bound }}

)

select *
from test_table

{% endtest %}
