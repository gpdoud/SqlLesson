declare @nbr int = 1;

WHILE @nbr <= 10 
BEGIN	
	IF @nbr % 2 = 0 BEGIN
		PRINT concat('The Number ', @nbr, ' is EVEN');
	END ELSE BEGIN
		PRINT concat('The Number ', @nbr, ' is ODD');
	END
	set @nbr = @nbr + 1;
END