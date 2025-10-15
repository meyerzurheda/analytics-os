{{ config(
    materialized='table',
    database=env_var('DBT_PG_DBNAME'),
    schema='marts'
) }}

with

sales as (
    select * from {{ ref('stg_sales_data') }}
),

final as (
    select
        name,
        date,
        gender
    from sales
)

select * from final