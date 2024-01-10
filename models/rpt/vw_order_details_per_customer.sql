{{ config(
    materialized = 'view'
) }}

SELECT
    *
FROM
    {{ ref('ORDERS_CUSTOMER') }}
