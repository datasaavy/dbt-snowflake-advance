with stg_customers as (
    select * from {{ source('ECOM_SRC', 'CUSTOMERS') }}
),

customers_tab as (
    select
    ID as User_Id,
    Email,
    Age,
    Gender,
    State,
    City,
    Country,
    Latitude,
    Longitude,
    TRAFFIC_SOURCE,
    CREATED_AT as Joined_In
    from
    stg_customers
)

select * from customers_tab
