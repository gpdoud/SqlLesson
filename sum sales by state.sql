select customer.State, 
		sum([order].amount) as 'Total Sales'
from [order]
join customer
	on [order].customerid = customer.id
group by customer.state
having sum([order].amount) >= 1000
order by sum([order].amount) desc
