select
    {{ dbt_utils.generate_surrogate_key(['shipper_id']) }} as shipper_sk
    , shipper_id
    , company_name
    , phone
from {{ ref('stg_shippers') }}