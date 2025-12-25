-- 1. Таблица заказов
create table orders (
	order_id varchar(50) primary key,
	customer_id varchar(50),
	order_status varchar(50),
	order_purchase_timestamp timestamp,
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,
	order_estimated_delivery_date timestamp
);
-- 2. Таблица клиентов
create table customers (
	customer_id varchar(50) primary key,
	customer_unique_id varchar(50),
	customer_zip_code_prefix varchar(10),
	customer_city varchar(100),
	customer_state varchar(5)
);
-- 3. Таблица деталей заказов
create table order_items (
	order_id varchar(50),
	order_item_id int,
	product_id varchar(50),
	seller_id varchar(50),
	shipping_limit_date timestamp,
	price decimal(10, 2),
	freight_value decimal(10, 2)
);
-- 4. Таблица платежей 
create table order_payments (
	order_id varchar(50),
	payment_sequential int,
	payment_type varchar(50),
	payment_installments int,
	payment_value decimal(10, 2)
);
-- 5. Таблица отзывов
create table order_reviews (
	review_id varchar(50),
	order_id varchar(50),
	review_score int,
	review_comment_title text,
	review_comment_message text,
	review_creation_date timestamp,
	review_answer_timestamp timestamp
);
-- 6. Таблица товаров
create table products (
	product_id varchar(50) primary key,
	product_category_name varchar(100),
	product_name_lenght int,
	product_description_lenght int,
	product_photos_qty int,
	product_weight_g int,
	product_length_cm int,
	product_height_cm int,
	product_width_cm int
);
-- 7. Таблица продавцов 
create table sellers (
	seller_id varchar(50) primary key,
	seller_zip_code_prefix varchar(10),
	seller_city varchar(100),
	seller_state varchar(5)
);
--8. Таблица геопозиции
create table geolocation (
	geolocation_zip_code_prefix varchar(10),
	geolocation_lat decimal(18, 15),
	geolocation_lng decimal(18, 15),
	geolocation_city varchar(100),
	geolocation_state varchar(5)
);
-- 9. Таблица перевода категорий
create table category_translation (
	product_category_name varchar(100),
	product_category_name_english varchar(100)
);