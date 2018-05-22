use master
go
drop database if exists PRSTEST
go
create database PRSTEST
go
use PRSTEST
go
create table [User] (
	Id int primary key identity(1,1),
	UserName nvarchar(30) not null unique,
	Password nvarchar(30) not null,
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	Phone nvarchar(12) not null,
	Email nvarchar(80) not null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0,
	Active bit not null default 1
)
go
create table [Vendor] (
	Id int primary key identity(1,1),
	Code nvarchar(10) not null unique,
	Name nvarchar(30) not null,
	Address nvarchar(30) not null,
	City nvarchar(30) not null,
	State nvarchar(2) not null,
	Zip nvarchar(10) not null,
	Phone nvarchar(12) not null,
	Email nvarchar(80) not null,
	IsRecommended bit not null default 0,
	Active bit not null default 1
)
go
create table [Product] (
	Id int primary key identity(1,1),
	Name nvarchar(130) not null,
	VendorPartNumber nvarchar(50) not null,
	Price decimal(10,2) not null default 0,
	Unit nvarchar(10) not null default 'Each',
	PhotoPath nvarchar(255),
	VendorId int not null references Vendor(Id),
	Active bit not null default 1
)
go
create table [PurchaseRequest] (
	Id int primary key identity(1,1),
	Description nvarchar(80) not null,
	Justification nvarchar(255),
	DateNeeded datetime not null default getdate()+7,
	DeliveryMode nvarchar(25),
	Status nvarchar(10) not null default 'NEW',
	Total decimal(14,2) not null default 0.0,
	UserId int not null references [User](Id),
	Active bit not null default 1
)
go
create table [PurchaseRequestLineItem] (
	Id int primary key identity(1,1),
	PurchaseRequestId int not null references PurchaseRequest(Id),
	ProductId int not null references Product(Id),
	Quantity int not null default 1
)
go
insert into [User] 
(UserName, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin, Active) 
values ('sa','sa','Super','Admin','','',1,1,1)
insert into [User] 
(UserName, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin, Active) 
values ('rv','rv','PR','Reviewer','','',1,0,1)
insert into [User] 
(UserName, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin, Active) 
values ('us','us','Normal','User','','',0,0,1)

declare @said int, @rvid int, @usid int

select @said = id from [user] where username = 'sa'
select @rvid = id from [user] where username = 'rv'
select @usid = id from [user] where username = 'us'

insert into [Vendor] 
(Code, Name, Address, City, State, Zip, Phone, Email, IsRecommended, Active)
values ('AM','Amazon','','','','','','',1,1)
insert into [Vendor] 
(Code, Name, Address, City, State, Zip, Phone, Email, IsRecommended, Active)
values ('GO','Google','','','','','','',1,1)
insert into [Vendor] 
(Code, Name, Address, City, State, Zip, Phone, Email, IsRecommended, Active)
values ('TG','Target','','','','','','',1,1)

declare @amazonid int, @googleid int, @targetid int

select @amazonid = id from vendor where code = 'AM'
select @googleid = id from vendor where code = 'GO'
select @targetid = id from vendor where code = 'TG'

insert into [Product] 
(Name, VendorPartNumber, Price, Unit, PhotoPath, VendorId, Active)
values ('Echo','',99.99,'EA','',@amazonid,1)
insert into [Product] 
(Name, VendorPartNumber, Price, Unit, PhotoPath, VendorId, Active)
values ('Echo Dot','',49.99,'EA','',@amazonid,1)
insert into [Product] 
(Name, VendorPartNumber, Price, Unit, PhotoPath, VendorId, Active)
values ('Google Home','',129.99,'EA','',@googleid,1)
insert into [Product] 
(Name, VendorPartNumber, Price, Unit, PhotoPath, VendorId, Active)
values ('iPad','',549.99,'EA','',@targetid,1)

declare @echoid int, @dotid int, @homeid int, @ipadid int

select @echoid = id from [Product] where Name = 'Echo'
select @dotid = id from [Product] where Name = 'Echo Dot'
select @homeid = id from [Product] where Name = 'Google Home'
select @ipadid = id from [Product] where Name = 'iPad'

insert into [PurchaseRequest] 
(Description, Justification, DateNeeded, DeliveryMode, Status, Total, UserId, Active)
values ('PR1','',getdate()+7,'','NEW',0,@said,1)
insert into [PurchaseRequest] 
(Description, Justification, DateNeeded, DeliveryMode, Status, Total, UserId, Active)
values ('PR2','',getdate()+7,'','NEW',0,@said,1)

declare @pr1id int, @pr2id int

select @pr1id = id from [PurchaseRequest] where Description = 'PR1'
select @pr2id = id from [PurchaseRequest] where Description = 'PR2'

insert into [PurchaseRequestLineItem] 
(PurchaseRequestId, ProductId, Quantity)
values (@pr1id,@echoid,2)
insert into [PurchaseRequestLineItem] 
(PurchaseRequestId, ProductId, Quantity)
values (@pr1id,@homeid,5)
insert into [PurchaseRequestLineItem] 
(PurchaseRequestId, ProductId, Quantity)
values (@pr1id,@ipadid,3)
insert into [PurchaseRequestLineItem] 
(PurchaseRequestId, ProductId, Quantity)
values (@pr2id,@dotid,4)
go
-- total for PR1

select concat('Nbr of lines is ', count(prli.id), 
		' and total quantity is ', sum(prli.quantity),
		' and PR Total is ', sum(p.Price * prli.Quantity))
from [PurchaseRequest] pr
join [PurchaseRequestLineItem] prli
	on prli.PurchaseRequestId = pr.Id
join [Product] p
	on p.id = prli.ProductId
where pr.Description = 'PR1'
