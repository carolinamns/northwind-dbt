with
    employees as (
        select
            employee_id
            , first_name
            , last_name
            , full_name
            , birth_date
            , hire_date
            , address
            , city
            , region
            , postal_code
            , country
            , notes
            , reports_to as manager_id
        from {{ ref('stg_employees') }}
    )

    , managers as (
        select
            employee_id as manager_employee_id
            , full_name as manager_full_name
        from {{ ref('stg_employees') }}
    )

    , join_employee_to_managers as (
        select
            {{ dbt_utils.generate_surrogate_key(['employees.employee_id']) }} as employee_sk
            , employees.employee_id
            , employees.manager_id
            , employees.first_name
            , employees.last_name
            , employees.full_name
            , managers.manager_full_name
            , employees.birth_date
            , employees.hire_date
            , employees.address
            , employees.city
            , employees.region
            , employees.postal_code
            , employees.country
            , employees.notes
        from employees
        left join managers on employees.manager_id = managers.manager_employee_id
    )

select *
from join_employee_to_managers