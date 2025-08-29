with
    source_data as (
        select
            shipper_id
            , company_name
            , phone
        from {{ source('northwind', 'shippers') }}
    )

select *
from source_data