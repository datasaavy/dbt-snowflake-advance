 with order_items as (
    SELECT * FROM {{ ref('int_order_items') }}
 ),

 inventory_items as (
    SELECT * FROM {{ ref('int_inventory_items') }}
 ),
 
 product_sales as (
    SELECT 
    * 
    FROM
        order_items
        JOIN
        inventory_items
        USING(PRODUCT_ID)
 )

 SELECT * FROM product_sales