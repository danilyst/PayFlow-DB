-- customers
insert into customers (customer_id, name, country, email)
select
    row_number() over (order by rc.customer_id) as customer_id,
    rc.customer_id as name,
    'Brazil' as country,
    concat (rc.customer_id, '@customer.payflow.com') as email
from (
    -- Get unique customers (some appear multiple times in raw data)
    select distinct  customer_id
    from raw_customer
) rc;

-- merchants
insert into merchants (merchant_id, business_name, category, country)
select
    row_number() over (order by rs.seller_id) as merchant_id,
    rs.seller_id as business_name,
    'ecommerce' as category,
    'Brazil' as country
from (
    -- Get unique sellers
    select distinct seller_id
    from raw_seller
) rs;


--transactions
insert into transactions (customer_id, merchant_id, amount, status, transaction_timestamp)
select
    dense_rank() over (order by ro.customer_id) as customer_id,
    dense_rank() over (order by roi.seller_id) as merchant_id,
    roi.price as amount,
    ro.order_status as status,
    ro.order_purchase_timestamp as transaction_timestamp  
from 
	raw_orders ro
inner join 
	raw_order_items roi on ro.order_id = roi.order_id
left join 
	raw_order_payments rop on ro.order_id = rop.order_id
where 
	rop.payment_sequential = 1 or rop.payment_sequential is null
order by ro.order_purchase_timestamp, ro.order_id, roi.order_item_id_sequence;
