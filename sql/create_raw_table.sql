-- Raw Customers Table
create table raw_customer(
	customer_id varchar(50),
	customer_unique_id varchar(50),
	customer_zip_code_prefix varchar(50),
	customer_city varchar(50),
	customer_state varchar(50)
);
-- Raw Sellers Table
create table raw_seller(
	seller_id varchar(50),
	seller_zip_code_prefix	varchar(50),
	seller_city	varchar(50),
	seller_state varchar(50)
);
-- Raw Orders Table
create table raw_orders(
	order_id varchar(50),
	customer_id	varchar(50),
	order_status varchar(50),	
	order_purchase_timestamp timestamp,	
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,	
	order_estimated_delivery_date timestamp
);
-- Raw Order_items Table
create table raw_order_items (
	order_id varchar(50),
	order_item_id_sequence int,
	product_id	varchar(50),
	seller_id varchar(50),
	shipping_limit_date	timestamp,
	price decimal (10, 2),
	freight_value decimal (10, 2)
);
-- Raw Order_payments Table
create table raw_order_payments(
	order_id varchar(50),
	payment_sequential int,
	payment_type varchar(50),
	payment_installments int,
	payment_value decimal (10, 2)
);


