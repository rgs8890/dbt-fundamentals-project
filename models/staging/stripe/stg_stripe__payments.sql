select
    id,
    orderid as order_id,
    paymentmethod,
    status,
    amount / 100 as amount,
    created
from dbt_rsunku.stripe_payments
