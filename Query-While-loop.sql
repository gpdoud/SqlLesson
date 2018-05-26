declare @cnt int;
declare @numtimes int;

set @cnt = 1;
set @numtimes = 10;

while @cnt <= @numtimes
	BEGIN
	print 'Do this multiple times'
	set @cnt = @cnt + 1;
	END