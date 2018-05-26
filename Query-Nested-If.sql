declare @statecode nvarchar(2);

set @statecode = 'KY';

declare @op1 int;
declare @op2 int;

if @statecode = 'OH'
	BEGIN
	set @op1 = 1000;
	set @op2 = 500;
	END
ELSE
	if @statecode = 'KY'
		BEGIN
		set @op1 = 900;
		set @op2 = 400;
		END
	ELSE
		if @statecode = 'IN'
			BEGIN
			set @op1 = 950;
			set @op2 = 450;
			END

select * from orders o
	join customers c on o.CustomerId = c.Id
	where c.State = @statecode and 
		o.Amount > @op2 and o.Amount < @op1
