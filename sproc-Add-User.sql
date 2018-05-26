alter procedure adduser 
	@username nvarchar(30),
	@password nvarchar(30),
	@firstname nvarchar(30),
	@lastname nvarchar(30),
	@phone nvarchar(30),
	@email nvarchar(30),
	@isreviewer bit,
	@isadmin bit,
	@active bit
as
begin
	insert into [user]
		(username, password, firstname, lastname, phone, email, isreviewer, isadmin, active)
	values
		(@username, @password, @firstname, @lastname, @phone, @email, @isreviewer, @isadmin, @active)
end
go
delete from [user]
go
exec adduser 'gdoud','p@ssw0rd','Greg','Doud','513-555-1212','gdoud@maxtrain.com',1,1,1;
exec adduser 'kpeace','p@ssw0rd','Kim','Peace','513-555-1212','kim@maxtrain.com',1,0,1;
exec adduser 'jdoe','p@ssw0rd','John','Doe','513-555-1212','jdoe@gmail.com',0,0,1;
go
