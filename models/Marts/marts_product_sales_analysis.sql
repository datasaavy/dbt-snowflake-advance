with
    order_items as (select * from {{ ref("int_order_items") }}),

    inventory_items as (select * from {{ ref("int_inventory_items") }}),

    customers_table as (select * from {{ ref("stg_customer") }}),

    product_sales as (
        select * from order_items join inventory_items using (product_id)
    ),

    marts_product_sales_analysis as (
        select * from customers_table left join product_sales using (user_id)
    )

select *
from marts_product_sales_analysis