with customers as (
    select *
    from {{ ref('stg_jaffle_shop__customers') }}
),
orders as (
    select *
    from {{ ref('stg_jaffle_shop__orders') }}
),
payments as (
    select
        customer_id,
        sum(cast(amount as float64)) as total_amount
    from {{ ref('fct_orders') }}
    group by customer_id
),
customers_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders
    from orders
    group by customer_id
),
final as (
    select
        c.customer_id,
        c.first_name,
        c.last_name,
        coalesce(o.first_order_date, null) as first_order_date,
        coalesce(o.most_recent_order_date, null) as most_recent_order_date,
        coalesce(o.number_of_orders, 0) as number_of_orders,
        coalesce(p.total_amount, 0) as total_amount,
        coalesce(o.number_of_orders, 0) * coalesce(p.total_amount, 0) as lifetime_value
    from customers c
    left join customers_orders o on c.customer_id = o.customer_id
    left join payments p on c.customer_id = p.customer_id
)

select * from final