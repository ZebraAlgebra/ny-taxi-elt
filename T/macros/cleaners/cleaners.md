{% docs col_rename(y, m, overides={}) %}
Macro for renaming source columns,
used for first step of transformation.
{% enddocs %}

{% docs row_filter(tname, y, m) %}
Macro for filtering out bad rows,
including unusally large fares,
out-of-range `pickup_datetime`,
used after `col_rename` macro.
{% enddocs %}

{% docs col_recast(tname) %}
Macro for recasting columns,
used after `row_filter` macro.
{% enddocs %}

{% docs combined_cleaner(y, n, overides={}) %}
Macro for combining the macros `col_rename`, `row_filter`, `col_recast` sequentially,
which is sufficient for the cleaning logic for cleaning monthly source data.
{% enddocs %}
