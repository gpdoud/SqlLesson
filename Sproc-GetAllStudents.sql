alter procedure GetAllStudents
	@GpaGreaterThanOrEqualTo decimal(4,1) = 0.0,
	@SatGTE int = 400,
	@lastname varchar(30)
as
BEGIN
	SELECT Id, concat(firstname, ' ', lastname) as 'Name', gpa, sat 
		from Student
		where gpa >= @GpaGreaterThanOrEqualTo
			and sat >= @SatGTE
			and LastName = @lastname
		order by lastname
END
go
exec GetAllStudents @LASTNAME='doud', @GpaGreaterThanOrEqualTo=3.9;