-- If sum of quantity in March-1998 is not 4065, throws an error
 
with
   sum_quantity as (
        select
            sum(quantity) as cnt
        from {{ ref ('fct_order_detail') }}
        where order_date
        between '1998-03-01' and '1998-03-31'
   )
 
select * from sum_quantity where cnt != 4065