declare @NumStudents int;

set @NumStudents = 1;

if @NumStudents >= 10 AND @NumStudents <= 20 
	BEGIN
	print 'There are 10 students'
	print 'That is a good number'
	END 
ELSE 
	BEGIN
	print 'To bad there is not 10 students'
	END

print 'The end...'