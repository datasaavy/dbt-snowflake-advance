with 
inventory_items as (

    SELECT * FROM {{ ref('stg_inventory_items') }}
),

cln1_inventory_items AS (
    
    SELECT
       
        PRODUCT_ID
        /*,to_date(SOLD_AT) AS PROD_SALE_DATE */
        ,ROUND(COST, 2) AS COST
        ,PRODUCT_CATEGORY
        ,PRODUCT_NAME
        ,PRODUCT_BRAND
        ,ROUND(PRODUCT_RETAIL_PRICE, 2) AS PROD_RETAIL_PRICE
        ,PRODUCT_DEPARTMENT
        ,PRODUCT_DISTRIBUTION_CENTER_ID AS DISTRIBUTION_CENTER_ID
    FROM inventory_items
)
,

cln_inventory_items AS (
    SELECT DISTINCT *
    FROM cln1_inventory_items
    ORDER BY PRODUCT_ID
)

SELECT * FROM cln_inventory_items