alter view StudentsInAClass as
select c.Description as 'Class',
		concat(s.firstname, ' ', s.lastname) as 'Name'
from class c
join schedule sc
	on sc.ClassId = c.Id
join student s
	on s.id = sc.StudentId
go
select Name, Class from StudentsInAClass where class = 'Math 103'