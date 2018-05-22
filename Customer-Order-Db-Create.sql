use master;
go
drop database if exists SqlTutorial;
go
create database SqlTutorial;
go
use SqlTutorial;
go
create table [Customers] (
	Id int not null primary key identity(1,1),
	Name nvarchar(50) not null,
	City nvarchar(50) not null,
	State nvarchar(2) not null,
	IsCorpAcct bit not null default 0,
	CreditLimit int not null default 0,
	Active bit not null default 1
);
go
Insert into [Customers] (Name, City, State, IsCorpAcct, CreditLimit)
values ('Mercury LTD', 'Newport', 'KY', 0, 100000);
Insert into [Customers] (Name, City, State, IsCorpAcct, CreditLimit)
values ('Venus LLC', 'Dayton', 'OH', 0, 300000);
Insert into [Customers] (Name, City, State, IsCorpAcct, CreditLimit)
values ('Mars INC', 'Cincinnati', 'OH', 1, 1000000);
Insert into [Customers] (Name, City, State, IsCorpAcct, CreditLimit)
values ('Jupiter LPA', 'Covington', 'KY', 0, 250000);
Insert into [Customers] (Name, City, State, IsCorpAcct, CreditLimit)
values ('Saturn INC', 'Batesville', 'IN', 0, 300000);
Insert into [Customers] (Name, City, State, IsCorpAcct, CreditLimit)
values ('Uranus LPA', 'Indianapolis', 'IN', 1, 1000000);
Insert into [Customers] (Name, City, State, IsCorpAcct, CreditLimit)
values ('Neptune INC', 'Cleveland', 'OH', 1, 1000000);
go

create table [Orders] (
	Id int not null primary key identity(1,1),
	Date datetime not null,
	Amount decimal(14,0) not null default 0,
	CustomerId int foreign key references Customers
);
go
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-12-31', 778, 6);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-7-3', 156, 5);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-6-23', 491, 7);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-3-6', 230, 6);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-11-21', 844, 5);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-9-18', 849, 2);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-4-15', 371, 2);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-7-13', 451, 2);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-1-7', 510, 4);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-9-23', 612, 6);
Insert into [Orders] (Date, Amount, CustomerId)
values ('2017-10-11', 736, 5);
go
Create Table [Products] (
	Id int not null primary key identity(1,1),
	Name nvarchar(50) not null,
	Price decimal(9,2) not null default 10.00
);
go
Insert into [Products] (Name, Price)
values ('Echo', 79.99);
Insert into [Products] (Name, Price)
values ('Echo Dot', 39.99);
Insert into [Products] (Name, Price)
values ('Dell XPS Laptop', 1599.99);
Insert into [Products] (Name, Price)
values ('Asus Laptop', 799.99);

go
Create Table [OrderLines] (
	Id int not null primary key identity(1,1),
	OrderId int not null foreign key references Orders(id),
	ProductId int not null foreign key references Products(Id),
	Quantity int not null default 1
);
go
Insert into [OrderLines] (OrderId, ProductId, Quantity)
values (1, 1, 1);
Insert into [OrderLines] (OrderId, ProductId, Quantity)
values (1, 2, 2);
Insert into [OrderLines] (OrderId, ProductId, Quantity)
values (1, 3, 1);
go