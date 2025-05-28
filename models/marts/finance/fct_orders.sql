with payments as
(
    select 
        order_id,
        amount
    from {{ ref('stg_stripe__payment') }}
)
, customers as
(
    select
        customer_id,
        order_id
    from {{ref("stg_jaffle_shop__orders")}}
)
, final as
(
    select
        customers.customer_id,
        payments.order_id,
        payments.amount
    from payments
    left join customers using (order_id)
)
select * from final