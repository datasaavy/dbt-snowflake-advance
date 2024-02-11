with 
order_items as (
    SELECT * FROM {{ ref('stg_order_items') }}
),

cln_order_items as (
    SELECT 
            ID
            ,ORDER_ID
            ,USER_ID
            ,PRODUCT_ID
            ,INVENTORY_ITEM_ID
            ,STATUS
            /*,CREATED_AT as ORDERED_DATE*/
            ,to_date(CREATED_AT) as order_date
            ,EXTRACT(YEAR FROM order_date) AS order_year
            ,EXTRACT(MONTH FROM order_date) AS order_month_number
            ,TO_CHAR(order_date, 'Mon') AS order_month
            /*,LEFT(order_month_name, LEN(order_month_name) - 2) AS modified_value */
           /* ,ROUND(SALE_PRICE, 2) as SALE */
    FROM
    order_items
)


SELECT * FROM cln_order_items
ORDER BY PRODUCT_ID