drop table cars
go
create table Cars (

	Id int not null primary key identity(1,1),
	Make nvarchar(30) not null,
	Model nvarchar(30) not null,
	TrimPak nvarchar(10),
	Year int not null,
	IsSedan bit not null default 0,
	PurchasePrice decimal(7,2)

);
go
insert into cars (make, model, trimpak, year, issedan, PurchasePrice)
values ('Honda', 'Accord', 'Ex-l', 2012, 0, 29000);