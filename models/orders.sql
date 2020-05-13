WITH orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select 
        orderID as order_id,
        SUM(amount) as amount
    from {{ ref('stg_payments') }}
    group by orderID
)

select
        orders.order_id as order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        payments.amount
from orders LEFT JOIN payments ON orders.order_id = payments.order_id