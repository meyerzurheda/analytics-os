with

data as (
    select * from {{ ref('stg_data') }}
),

final as (
    select
        *
    from data
)

select * from final