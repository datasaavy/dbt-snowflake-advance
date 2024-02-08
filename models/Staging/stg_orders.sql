with

orders as (

    SELECT * FROM {{ source('ECOM_SRC', 'ORDERS') }}

)

SELECT * FROM orders

ORDER BY ORDER_ID