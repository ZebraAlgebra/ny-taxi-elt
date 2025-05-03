{% docs stg_trips__2018 %}
Staging model for year 2018,
with slight name normalization and datatype transformations.
{% enddocs %}

{% docs stg_trips__2019 %}
Staging model for year 2019,
with slight name normalization and datatype transformations.
{% enddocs %}

{% docs stg_trips__2020 %}
Staging model for year 2020,
with slight name normalization and datatype transformations.
{% enddocs %}

{% docs stg_trips__2021 %}
Staging model for year 2021,
with slight name normalization and datatype transformations.
{% enddocs %}

{% docs stg_trips__2022 %}
Staging model for year 2022,
with slight name normalization and datatype transformations.
{% enddocs %}

{% docs stg_trips__2023 %}
Staging model for year 2023,
with slight name normalization and datatype transformations.
{% enddocs %}

{% docs stg_trips__2024 %}
Staging model for year 2024,
with slight name normalization and datatype transformations.
{% enddocs %}

{% docs stg_trips__2025 %}
Staging model for year 2025,
with slight name normalization and datatype transformations.
{% enddocs %}

{% docs stg_trips__all %}
Staging model for years concatenated,
given by `UNION ALL` the staging models from 2018 to 2025.

This is created as a 
[hypertable using the Timescale extension](https://docs.timescale.com/use-timescale/latest/hypertables/)
in PostgreSQL.
{% enddocs %}
