select 
    id as id,
    "orderID" as orderID,
    "paymentMethod" as paymentMethod,
    amount as amount
from {{ source('stripe', 'payment')}}