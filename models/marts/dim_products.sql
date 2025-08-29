with
    products as (
        select
            product_id
            , product_name
            , supplier_id
            , category_id
            , quantity_per_unit
            , unit_price
            , units_in_stock
            , units_on_order
            , reorder_level
            , discontinued
        from {{ ref('stg_products') }}
    )

    , transformed as (
        select
            {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk
            , product_id
            , product_name
            , units_in_stock
            , category_id
            , unit_price
            , reorder_level
            , supplier_id
            , units_on_order
            , case 
                when discontinued = 1 then 'Yes'
                else 'No' 
            end as is_discontinued
        from products
    )

select *
from transformed