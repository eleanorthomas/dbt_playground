with

source as (

    select * from {{ source('stripe', 'payment') }}

),

payments as (

    select

        id as payment_id,
        status as payment_status,
        orderid as order_id,
        created as payment_created_at,
        amount / 100 as payment_amount

    from source

)

select * from payments