
create table baitap_2.classes(
Id int primary key auto_increment ,
Name varchar(50) not null unique
);

create table baitap_2.student_management(
Id int primary key auto_increment,
Name varchar(50) not null,
Address varchar(50) not null,
sex int not null default 1,
Age int not null check (Age>=18 and Age<=25),
Email varchar(50) not null unique,
Phone varchar(10) not null
);

alter table student_management
add column ClassId int,
add constraint foreign key (ClassId) references classes(Id);

insert into classes (`Name`) values ('C10'),('C11'),('C12'),('C1');

insert into student_management (`Name`,`Address`,`sex`,`Age`,`Email`,`Phone`) values 
('tuyen','NB','1','19','tuyen@gmail.com','0964431051'),
('fhy','NB','0','19','fhyn@gmail.com','0366557524'),
('thy','HN','0','22','Thy@gmail.com','037777524'),
('bick','BK','0','20','bickn@gmail.com','0368857524'),
('thor','HN','1','25','thor@gmail.com','0366997524');

UPDATE student_management SET `ClassId` = '1' WHERE (`Id` = '1');
UPDATE student_management SET `ClassId` = '1' WHERE (`Id` = '2');
UPDATE student_management SET `ClassId` = '2' WHERE (`Id` = '3');
UPDATE student_management SET `ClassId` = '3' WHERE (`Id` = '4');
UPDATE student_management SET `ClassId` = '4' WHERE (`Id` = '5');

select * from student_management
order by Name desc;

select * from student_management
order by Age asc;

select COUNT(Name), ClassId
from student_management
group by ClassId;

select classes.Name,student_management.Name from student_management
join classes
on student_management.ClassId = classes.Id;

SELECT student_management.ClassId , classes.Name , COUNT(student_management.Id) AS 'Số lượng học sinh'
FROM `baitap_2`.`student_management`, `baitap_2`.`classes`
where student_management.ClassId = classes.Id
group by student_management.ClassId, classes.name;

SELECT student_management.ClassId , classes.Name , COUNT(student_management.Id) AS 'Số lượng học sinh'
FROM `baitap_2`.`student_management`, `baitap_2`.`classes`
where student_management.ClassId = classes.Id 
group by student_management.ClassId, classes.name
having COUNT(student_management.Id) >= 2;

select Address, count(Id)
from student_management
group by Address
having count(Id) >= 2;

select * from student_management
where Age = (select max(Age) from student_management);

select * from student_management
where Age = (select min(Age) from student_management);

UPDATE `baitap_2`.`student_management` SET `sex` = '0' WHERE (Address like 'HN');

delete from `baitap_2`.`student_management`  where (Address like 'HN');


SELECT student_management.ClassId , classes.Name , COUNT(*) AS totalStudent
FROM `baitap_2`.`student_management`, `baitap_2`.`classes`
where student_management.ClassId = classes.Id 
group by student_management.ClassId, classes.name
having totalStudent = 
(select max(a.totalStudent) from 
(select student_management.ClassId , classes.Name , COUNT(*) AS totalStudent
from `baitap_2`.`student_management`, `baitap_2`.`classes`
where student_management.ClassId = classes.Id
group by student_management.ClassId, classes.name)a);

SELECT student_management.ClassId , classes.Name , COUNT(*) AS totalStudent
FROM `baitap_2`.`student_management`, `baitap_2`.`classes`
where student_management.ClassId = classes.Id 
group by student_management.ClassId, classes.name
having totalStudent = 
(select min(a.totalStudent) from 
(select student_management.ClassId , classes.Name , COUNT(*) AS totalStudent
from `baitap_2`.`student_management`, `baitap_2`.`classes`
where student_management.ClassId = classes.Id
group by student_management.ClassId, classes.name)a);

select * from student_management
where Age = (select max(Age)
from student_management
where Age < (select max(Age) from student_management));

select * from student_management
where Age = (select min(Age)
from student_management
where Age > (select min(Age) from student_management));
