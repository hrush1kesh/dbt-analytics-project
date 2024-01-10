{% snapshot ss_products %}

{{
    config(
      target_database='RUSHI_DBT_RAW',
      target_schema='jaffle_shop',
      unique_key='PRODUCT_ID',
      strategy='check_cols',
      updated_at='PRICE',
    )
}}

select * from {{ ref('PRODUCTS') }}

{% endsnapshot %}