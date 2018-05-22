alter procedure HelloWorldSproc
	@Name nvarchar(15) = 'everyone',
	@Nbr int = 0
AS
BEGIN
	PRINT 'Hello, world to ' + @Name + ' whose favorite number is ' 
		+ CAST(@nbr as varchar);
END
go
EXEC HelloWorldSproc @Name='Greg', @nbr=8;