use sql_store;
select * from customers;
select first_name, last_name, points, (points*20)+100-1000 AS discount_factor
from customers
order by first_name,points;
select distinct state
from customers;
select name, unit_price, unit_price * 1.1 AS new_price
from products;
select *
from customers
where points>2000;
select * from orders
where order_date >= '2018-01-01'  ;
select * from customers
where birth_date > '1990-01-01' or points > 2000 and  state= 'VA';
select * from order_items
where order_id = '6' and unit_price * quantity > 30;
select * from customers
where state In ('va','fl','ga');
select * from customers
where state not in ('va','fl','ga');
select * from products
where quantity_in_stock in (49,38,72);
select * from customers
where points between 1000 and 2000;
select * from customers
where birth_date between '1990-01-01' and '2000-01-01';
select * from customers
where address like '%trail%' or address like '%venue%';
select * from customers
where phone like '%9';
select * from customers
where phone not like '%9';
select * from customers
where last_name like '%field%';
select * from customers
where last_name regexp 'field|rose|mac';
select * from customers
where last_name regexp '$field|rose|mac';
select * from customers
where first_name regexp '^field|rose|mac';
select * from customers
where last_name regexp '[gim]e';
select * from customers
where last_name regexp '[a-h]e';
select * from customers
where first_name regexp 'elka|ambur';
select * from customers
where last_name regexp 'ey$|on$';
select * from customers
where last_name regexp '^my|se';
select * from customers
where last_name regexp'b[ru]';
select * from customers
where phone is null;
select * from customers
where phone is not null;
select * from orders
where shipped_date is not null;
select * from orders
where shipped_date is null;
select * from order_items;
select * , quantity*unit_price as total_price
from order_items
where order_id in (2)
order by total_price desc;
select * from customers
limit 5;
select * from customers
limit 5,4;
select * from customers
order by points desc
limit 3;
-- select * from order_items;
select * from products;
-- select * from order_items;
-- select * from products;
select order_items.product_id,order_items.quantity,order_items.unit_price,products.product_id
from order_items 
join products 
on order_items.product_id = products.product_id;
use sql_hr;
select e.employee_id,e.first_name,m.first_name as manager
from employees e
join employees m
on e.reports_to = m.employee_id;
use sql_hr;
select * from employees e
join employees m 
on e.reports_to = m.employee_id;
-- joining multiple tables --
use sql_store;
select * from orders o
join customers c 
on o.customer_id = c.customer_id
join order_statuses os
on o.status = os.order_status_id;
use sql_invoicing;
select p.date , p.invoice_id, p.amount, c.name ,pm.name
from payments p
join clients c 
on c.client_id = p.client_id
join payment_methods pm
on p.payment_method = pm.payment_method_id;
-- joining composite tables --

use sql_store;
select * from order_items oi
join order_item_notes oin
on oi.order_id = oin.order_id
and oi.product_id = oin.product_id;
-- implicit join syntax --
-- explicit syntax is our join operation which we used above it forces to right the join clause so there would be less casualty always use explicit syntax --

select * from orders o , customers c
where o.customer_id = c.customer_id;
-- outer joins --
select p.product_id, p.name, oi.quantity 
from products p
left join order_items oi 
on p.product_id = oi.product_id;
select c.first_name, o.order_id, o.order_date,sh.name,os.name
from customers c
left join orders o
on c.customer_id = o.customer_id
left join shippers sh 
on o.shipper_id = sh.shipper_id
join order_statuses os 
on o.status = os.order_status_id;
-- self outer joins --
-- using clause --
use sql_invoicing;
select p.date,p.amount,pm.name as payment_method,c.name as client
from payments p
join clients c
using(client_id)
left join payment_methods pm
on p.payment_method = pm.payment_method_id;
-- natural joins --
use sql_store;
select * from orders
natural join customers c;
-- cross joins --
-- unions --
select customer_id,first_name,points,'Bronze' as type
from customers
where points < 2000
union
select customer_id,first_name,points,'Silver' as type
from customers
where points between 2000 and 3000
union
select customer_id,first_name,points,'Gold' as type
from customers
where points > 3000
order by first_name;




