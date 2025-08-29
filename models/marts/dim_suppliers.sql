select
    {{ dbt_utils.generate_surrogate_key(['supplier_id']) }} as supplier_sk
    , supplier_id
    , company_name
    , contact_name
    , address
    , city
    , region
    , postal_code
    , country
from {{ ref('stg_suppliers') }}