use master;
go
drop database if exists SqlLesson;
go
create database SqlLesson;
go
use SqlLesson;
go
Create Table Savings (
	Id int not null primary key identity(1,1),
	Date Datetime not null default getdate(),
	Memo nvarchar(80) not null,
	Amount decimal(9,2) not null
);
go
INSERT into Savings (Date, Memo, Amount) values ('2017-01-01', 'Initial Deposit', 500.00);
INSERT into Savings (Date, Memo, Amount) values ('2017-02-15', 'Deposit Check', 250.00);
INSERT into Savings (Date, Memo, Amount) values ('2017-03-07', 'Car Payment', -175.00);
INSERT into Savings (Date, Memo, Amount) values ('2017-04-11', 'Deposit Birthday Money', 200.00);
INSERT into Savings (Date, Memo, Amount) values ('2017-05-25', 'Pay deposit on new stereo', -50.00);
INSERT into Savings (Date, Memo, Amount) values ('2017-12-31', 'Deposit Lotto Winnings', 1000000.00);
go
UPDATE Savings set Amount = -200 where Memo = 'Car Payment';
go
DELETE from Savings where Amount = 1000000;
go
SELECT sum(Amount) as 'Balance' from Savings;
go