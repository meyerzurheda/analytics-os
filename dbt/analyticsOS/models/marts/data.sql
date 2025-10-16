with

data as (
    select * from {{ ref('stg_data') }}
),

final as (
    select
        country  as country, 
        avg(age) as average_age
    from data
    group by country
    order by 1 desc
)

select * from final