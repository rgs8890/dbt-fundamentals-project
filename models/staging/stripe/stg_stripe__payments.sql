select
    id,
    orderid as order_id,
    paymentmethod,
    status,
    amount,
    created
from dbt_rsunku.stripe_payments
