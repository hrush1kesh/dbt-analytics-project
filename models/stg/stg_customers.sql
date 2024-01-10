SELECT
    {{ dbt_utils.star(
        from = ref('CUSTOMERS')
    ) }},
FROM
    {{ ref('CUSTOMERS') }}