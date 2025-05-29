select customer_id
from {{ ref('stg_jaffle_shop__orders') }}
where customer_id not in (
    select customer_id from {{ ref('stg_jaffle_shop__customers') }}
)