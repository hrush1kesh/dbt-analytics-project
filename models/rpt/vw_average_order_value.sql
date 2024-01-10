{{ config(
    materialized = 'view'
) }}

SELECT
    OC.CUSTOMER_ID,
    OP.CATEGORY,
    AVG(
        OC.TOTAL_AMOUNT
    ) AS AVG_ORDER_VALUE
FROM
    {{ ref('ORDERS_CUSTOMER') }}
    OC
    INNER JOIN {{ ref('ORDERS_PRODUCTS') }}
    OP
    ON OC.ORDER_ID = OP.ORDER_ID
GROUP BY
    OC.CUSTOMER_ID,
    OP.CATEGORY
