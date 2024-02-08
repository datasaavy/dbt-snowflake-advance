
with order_items as (
    SELECT * FROM {{ source('ECOM_SRC', 'ORDER_ITEMS') }}
    )
SELECT * FROM order_items
