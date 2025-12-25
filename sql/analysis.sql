-- Анализ выручки по месяцам
select 
	date_trunc('month', o.order_purchase_timestamp)::date as month, 
	sum(oi.price) as total_revenue
from orders o
join order_items oi on o.order_id = oi.order_id 
where o.order_status='delivered'
group by month
order by month;
-- ТОП-5 категорий товаров по выручке
select
	ct.product_category_name_english as category,
	sum(oi.price) as total_category_revenue
from order_items oi 
join products p on oi.product_id = p.product_id
join category_translation ct on p.product_category_name = ct.product_category_name 
group by category
order by total_category_revenue desc
limit 5;
-- Опоздания
select
	case 
		when order_delivered_customer_date <= order_estimated_delivery_date then 'on_time'
		else 'late'
	end as delivery_status,
	count(*) as total_orders
from orders
where order_status = 'delivered' and order_delivered_customer_date is not null
group by delivery_status;