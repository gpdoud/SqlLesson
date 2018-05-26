if EXISTS (select 1 from customers)
	print 'KY customers have bought something'
else
	print 'No sales in KY'


select top 1 1 from orders
	order by amount desc