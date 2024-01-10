{{ config(
    materialized = 'incremental',
    unique_key = "order_date",
    incremental_strategy = 'delete+insert',
    on_schema_change = 'sync_all_columns'
) }}

SELECT
    order_id,
    customer,
    order_date,
    total_amount,
    product_id
FROM
    {{ ref('ORDERS') }}

{%- if is_incremental() %}
WHERE
    order_date >=
SELECT
    MAX(order_date)
FROM
    {{ this }}
)
{%- endif %}