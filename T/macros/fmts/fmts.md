{% docs fmt_new_ym %}
Returns tuple of year and month of the next month from given year and month.

Example:
```
fmt_new_ym(2025, 12) = (2026, 1)
fmt_new_ym(2024, 10) = (2024, 11)
```
{% enddocs %}

{% docs fmt_datetime_from_ym %}
Returns a string used for formatting a `timestamptz`
at the start of the year and month
from given year and month.

Example:
```
fmt_datetime_from_ym(2025, 12) = "'2025-12-01 00:00:00'::timestamptz"
```
{% enddocs %}

{% docs fmt_source(year, month) %}
Returns a string used for passing into `source` macro
from given year and month.

Example:
```
fmt_source(2025, 2) = "yellow_2025_02"
fmt_source(2023, 11) = "yellow_2023_11"
```
{% enddocs %}

{% docs fmt_store_forward_flag %}
Returns a string used for encoding `store_forward_flag` column into 0 and 1.

Example:
```
fmt_store_forward_flag() = 
      """case
           when store_forward_flag = 'Y' then 1
           when store_forward_flag = 'N' then 0
       end"""
```
{% enddocs %}

{% docs fmt_rate_code_id %}
Returns a string used for coalescing `rate_code_id` column.

Example:
```
fmt_rate_code_id() = "coalesce(rate_code_id::smallint, 99)"
```
{% enddocs %}

