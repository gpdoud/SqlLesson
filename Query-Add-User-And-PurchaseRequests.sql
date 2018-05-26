INSERT into [User]
(Username, Password, Firstname, Lastname, Phone, Email)
values ('uid5','uid5','uid5','uid5','','')
go

declare @uid int
SELECT @uid = id from [user] where Username = 'uid5'

INSERT into PurchaseRequest
(UserId, Description, Justification, DeliveryMode)
values
(@uid, 'Test PR5-1', 'None needed', 'Pickup');

INSERT into PurchaseRequest
(UserId, Description, Justification, DeliveryMode)
values
(@uid, 'Test PR5-2', 'None needed', 'Pickup');

select * from [user] where id = @uid;
select * from PurchaseRequest where UserId = @uid;