select c.Name, 
		concat(c.city, ', ', c.state) as 'Address',
		c.IsCorpAcct as 'Corp?',
		format(o.Amount, 'C') as 'Amount',
		format(c.CreditLimit, 'C') as 'Credit Limit',
		format(o.Date, 'd'),
		c.Active
from [order] o
join customer c
	on o.CustomerId = c.Id
order by o.Amount desc
