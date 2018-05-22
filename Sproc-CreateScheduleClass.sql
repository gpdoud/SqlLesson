create procedure CreateScheduleClass
	@OldClass varchar(50) = null,
	@NewClass varchar(50) = null
AS
BEGIN
	-- check the parameters
	IF @OldClass = null OR @NewClass = null
	BEGIN
		PRINT N'OldClass or NewClass was not supplied and is required';
		RETURN
	END
	-- if we get here, everything we need we have
	-- add the new class
	INSERT into Class (Description) values (@NewClass);
	--
	select * from schedule s
	join class c on c.Id = s.ClassId
	where c.Description = @OldClass
END
GO
exec CreateScheduleClass;