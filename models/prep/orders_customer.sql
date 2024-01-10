{{ config(
    materialized = 'view'
) }}

WITH ORDERS AS (

    SELECT
        *
    FROM
        {{ ref('STG_ORDERS') }}
),
CUSTOMERS AS (
    SELECT
        *
    FROM
        {{ ref('STG_CUSTOMER') }}
)
SELECT
    O.ORDER_ID,
    O.CUSTOMER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT,
    C.CUSTOMER_NAME,
    C.EMAIL,
    C.COUNTRY
FROM
    ORDERS O
    JOIN CUSTOMERS C
    ON O.CUSTOMER_ID = C.CUSTOMER_ID
