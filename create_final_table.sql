-- final customers table
create table customers (
	customer_id serial primary key,
	name varchar (100),
	country varchar (50),
	email varchar (100)
);

-- final merchants table
create table merchants (
	merchant_id serial primary key,
	business_name varchar (100),
	category varchar (100),
	country varchar (50)
);

--final transactions table
create table transactions (
	transaction_id serial primary key,
	customer_id int,
	merchant_id int,
	amount decimal (10, 2),
	status varchar (20),
	transaction_timestamp timestamp
);
