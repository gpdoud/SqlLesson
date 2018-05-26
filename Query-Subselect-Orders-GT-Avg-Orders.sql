--
select * from orders
	where amount > (select avg(amount) from orders)