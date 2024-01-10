{{ config(
    materialized = 'table'
) }}

WITH ORDERS AS (

    SELECT
        *
    FROM
        {{ ref('STG_ORDERS') }}
),
PRODUCT AS (
    SELECT
        *
    FROM
        {{ ref('STG_PRODUCTS') }}
)
SELECT
    P.PRODUCT_ID,
    O.ORDER_ID,
    O.CUSTOMER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT,
    P.PRODUCT_NAME,
    P.CATEGORY,
    P.PRICE
FROM
    PRODUCT P FULL
    OUTER JOIN ORDERS O
    ON P.PRODUCT_ID = O.PRODUCT_ID
