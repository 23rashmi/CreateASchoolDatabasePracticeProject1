create database RschoolDatabase;

use RschoolDatabase;



-- create table Classes
create table Classes(
ClassID int primary key,
ClassName varchar(50) not null,
);
--insert a new Class
insert into Classes(ClassID, ClassName)
values (1,'Class A'),(2,'Class B'),(3,'Class C');
-- update the name of a class
update Classes
set ClassName = 'Class One'
where ClassID = 1;
update Classes
set ClassName ='Class Two'
where ClassID = 2;
update Classes
set ClassName ='Class Three'
where ClassID = 3;
--delete a class
delete from Classes
where ClassID = 1;
--retrieve class name by ID
select ClassName
from Classes
where ClassID = 1;
select ClassName
from Classes
where ClassID = 2;
--retrieve the number of classes
select count(*) as NumberOfClasses
from Classes;
--retrieve classes starting with a specific letter
select * from Classes where ClassName like 'A %';
--retrieve classes ordered alphabetically
select * from Classes order by ClassName;




-- create Subjects table
create table Subjects(
SubjectID int primary key,
SubjectName varchar(50) not null
);
--insert a new Subjects
insert into Subjects (SubjectID, SubjectName)
values (1, 'Mathematics'),(2, 'Computer'),(3, 'English');
-- update the name of a subject
update Subjects
set SubjectName = 'Advanced Mathematics'
where SubjectID = 1;
--delete a subject
delete from Subjects where SubjectID = 1;
--retrieve the list of subjects
select * from Subjects;
--retrieve subject name by ID
select SubjectName from Subjects where SubjectID = 2;
--retrieve the number of subjects
select count(*) as NumberOfSubjects from Subjects;
--retrieve subjects starting with a specifier letter
select * from Subjects where SubjectName like 'E%';
--retrieve subjects ordered alphabetically
select * from Subjects order by SubjectName;





-- create Students table
create table Students(
StudentID int primary key,
FirstName varchar(50) not null,
LastName varchar(50) not null,
Gender char(1),
DateOfBirth date,
ClassID int foreign key references Classes(ClassID)
);
--insert a new Student
insert into Students (StudentID, FirstName, LastName, Gender, DateOfBirth)
values (9,'Rashmi','Priya','F', '1998-12-23'), (8,'Prakash','Kumar','M', '2000-06-30'), (7,'Shubham','Kumar','M', '2001-08-23');
----------------
insert into Students (StudentID, FirstName, LastName, Gender, DateOfBirth)
values (4,'Rashi','Priya','F', '1997-12-23'), (3,'PrakashM','Kumar','M', '2000-06-29'), (2,'Shubha','Kumari','F', '2001-08-25');
--update student information
update Students
set FirstName = 'Janhvi', LastName = 'Priyanshi', Gender = 'F', DateOfBirth = '1998-12-25'
where StudentID = 9;
--delete a student
delete from Students
where StudentID = 9;
-- retrieve the list of students
select * from Students;
--retrieve student information by ID
select * from Students where StudentID = 8;
select * from Students where StudentID = 2;
select * from Students where StudentID = 3;
select * from Students where StudentID = 4;
--retrieve female students
select * from Students where Gender = 'F';
select * from Students where Gender = 'M';
--retrieve students born after a specific date
select * from Students where DateOfBirth > '2000-01-01';
select * from Students where DateOfBirth < '2000-01-01';



--create an index on Student LastName
create index IX_Students_LastName on Students(LastName);
