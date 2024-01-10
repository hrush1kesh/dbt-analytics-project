SELECT
    {{ dbt_utils.star(
        from = ref('SS_PRODUCTS')
    ) }},
    {{ discounted_price }}
FROM
    {{ ref('SS_PRODUCTS') }}
WHERE
    DBT_VALID_TO = NULL