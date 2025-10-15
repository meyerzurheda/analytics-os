{{ config(
    materialized='external',
    location='s3://raw/Test_CSV/*.parquet'
) }}

SELECT 
    NAME                as name,	
    GENDER              as gender,	
    AGE                 as age,	
    DATE::date          as date,	
    COUNTRY             as country
FROM read_parquet('s3://raw/Test_CSV/*.parquet')