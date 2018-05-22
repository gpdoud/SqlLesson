alter view ClassesForStudent as
select concat(s.firstname, ' ', s.lastname) as 'Name',
		s.gpa, s.sat,
		m.Description as 'Major',
		c.Description as 'Class'
from student s
join major m
	on m.id = s.majorid
join schedule sc
	on sc.StudentId = s.Id
join class c
	on c.id = sc.ClassId
--order by s.lastname, c.Description

select * from ClassesForStudent where Name = 'Aaron Zell' order by class desc