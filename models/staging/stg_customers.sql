with
    source_data as (
        select
            customer_id
            , country
            , city
            , fax
            , postal_code   
            , address
            , region
            , contact_name
            , phone
            , company_name
            , contact_title
        from {{ source('northwind', 'customers') }}
    )

select *
from source_data