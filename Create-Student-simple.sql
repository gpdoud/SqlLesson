
create table Student (
	Id int not null identity(1,1) primary key,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	IsVeteran bit not null default 1,
	FavColor nvarchar(25),
	FavNumber int
)