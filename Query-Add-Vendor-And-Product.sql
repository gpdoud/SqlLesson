INSERT into Vendor
(Code, Name, Address, City, State, Zip, Phone, Email, IsPreApproved, Active)
values
('AMAZ', 'Amazon', '123 Any Street', 'Seatle', 'WA', '98101', '555-555-1212', 'info@amazon.com', 1, 1);
Go

declare @vendorid int
select @vendorid = id from vendor where code = 'AMAZ'

INSERT into Product
(VendorId, PartNumber, Name, Price, Unit, PhotoPath, Active)
values
(@vendorid, 'Echo', 'Amazon Echo', 99.99, 'Each', null, 1);
go

