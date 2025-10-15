with

source as (
    select * from read_parquet('s3://raw/Test_CSV/*.parquet')
)

select 
    *
from source