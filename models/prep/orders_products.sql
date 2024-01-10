{{ config(materialized="table") }}

with
    orders as (select * from {{ ref("STG_ORDERS") }}),
    product as (select * from {{ ref("STG_PRODUCTS") }})
select
    p.product_id,
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    p.product_name,
    p.category,
    p.price
from product p
full outer join orders o on p.product_id = o.product_id
