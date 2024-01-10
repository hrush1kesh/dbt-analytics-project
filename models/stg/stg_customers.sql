SELECT
    {{ dbt_utils.star(
        from = ref('CUSTOMERS')
    ) }},
FROM
    {{ source('RB_DATA','CUSTOMERS') }}