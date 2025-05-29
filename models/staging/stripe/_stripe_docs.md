{ % docs stripe_payments %}

One of the following values: 


| **Column**      | **Description**                                                           |
| --------------- | ------------------------------------------------------------------------- |
| `id`            | Unique identifier for the order record                                    |
| `order_id`      | External or business-facing identifier for the order                      |
| `paymentmethod` | The payment method used by the customer (e.g., credit card, PayPal, etc.) |
| `status`        | Current status of the order (e.g., placed, shipped, delivered, returned)  |
| `amount`        | Total monetary amount paid for the order                                  |
| `created`       | Timestamp indicating when the order was created or placed                 |


{ % enddocs % }