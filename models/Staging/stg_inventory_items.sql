with 
    src_inventory_items AS (
        SELECT 
        * 
        FROM {{ source('ECOM_SRC', 'INVENTORY_ITEMS') }}
    )

       

SELECT * FROM src_inventory_items






