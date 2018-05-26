drop table Players;
drop table Teams;

create table Teams (

	Id int not null identity(1, 1) primary key,
	Name nvarchar(50) not null,
	City nvarchar(25) not null,
	State nvarchar(2) not null,
	WonSuperBowl bit not null default 0,
	YearsInExistence int not null default 0,
	Sport nvarchar(30) not null default 'Football'

);

create table Players (

	Id int not null identity(1, 1) primary key,
	TeamsId int foreign key references Teams(Id),
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Position nvarchar(30),
	Number nvarchar(3),
	YearsInSport int not null default 0,
	Salary decimal(10,2)

);

go

insert into Teams 
(name, city, state, WonSuperBowl, YearsInExistence) 
values
('Bengals', 'Cincy', 'OH', 0, 50);

insert into Players
(TeamsId, Firstname, Lastname, Position, Number, YearsInSport, Salary)
values
(1, 'Andy', 'Dalton', 'QB', '14', 7, 10000000);

insert into Players
(TeamsId, Firstname, Lastname, Position, Number, YearsInSport, Salary)
values
(1, 'Gino', 'Atkins', 'DT', '97', 8, 8000000);