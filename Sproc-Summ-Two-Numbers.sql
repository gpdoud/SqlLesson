alter procedure summ
	@nbr1 int = 0,
	@nbr2 int = 0
as
BEGIN
	PRINT CONCAT('The sum of ', @nbr1, ' and ', @nbr2, ' is ', @nbr1+@nbr2);
END
go
exec summ @nbr1=5, @nbr2=7
/*
alter procedure DoubleMe
	@Nbr int = 3
as
BEGIN
	PRINT CAST(@nbr as varchar) + ' * 2 = ' + CAST(@nbr*2 as varchar)
END
go
exec DoubleMe; -- @nbr=15;
*/