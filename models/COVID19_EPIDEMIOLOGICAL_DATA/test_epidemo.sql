with pop as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),

country as (
    select * from {{ref('country_code')}}
),

pop_country as (
    select * 
    FROM pop p 
    LEFT JOIN country c ON c.code = p.ISO3166_1 
)

select county, name from pop_country