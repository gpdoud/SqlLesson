use test
go
drop table if exists employee
go
create table employee(
	EmplId char(4) not null primary key,
	Name varchar(30) not null,
	IsManager bit not null default 0,
	ManagerId char(4) references employee(emplid) 
)
go
insert into Employee (EmplId, Name, IsManager, ManagerId)
	Values ('F001', 'Christina', 1, null)
insert into Employee (EmplId, Name, IsManager, ManagerId)
	Values ('D001', 'Greg', 0, 'F001')
insert into Employee (EmplId, Name, IsManager, ManagerId)
	Values ('S001', 'Lisa', 0, 'F001')
go
select * 
from employee mgr
join employee empl
	on mgr.EmplId = empl.ManagerId

select * 
from employee empl
join employee mgr
	on mgr.EmplId = empl.ManagerId
where empl.EmplId = 'D001'