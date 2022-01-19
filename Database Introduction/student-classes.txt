-- 1. Tạo bảng student_manager
create table student_manager (
id int auto_increment primary key,
student_name varchar(50) not null,
address varchar(50) not null,
sex int not null default 1,
age int not null check (age > 18 and age < 25),
-- constraint check_age check (age > 18 and age < 25),
email varchar(50) not null unique,
phone varchar(10) not null
);

-- 2. Tạo bảng class
create table classes (
id_class int auto_increment primary key,
class_name varchar(50) not null unique
);

-- 3.4. Thêm cột và ràng buộc khóa ngoại
alter table student_manager
add column classId int,
add constraint foreign key (classId) references classes(id_class);

-- 5. Thêm dữ liệu của bảng class, dạng đơn
insert into classes (`class_name`) value ('C0821H1');
insert into classes (`class_name`) value ('C0821H2');
insert into classes (`class_name`) value ('C0821I1');
insert into classes (`class_name`) value ('C0821I2');
insert into classes (`class_name`) value ('C1021H1');

-- 6. Thêm dữ liệu của bảng student, dạng nhiều value
insert into `hello`.`student_manager` (`student_name`, `address`, `sex`, `age`, `email`, `phone`, `classId`) values 
('Toàn', 'QN', '1', '22', 'toan@codegym.vn', '0326156727', '1'),
('Như Anh', 'TB', '1', '23', 'nhuanh@codegym.vn', '0326456727', '2'),
('C Kiều Anh', 'HN', '1', '24', 'kieuanh@codegym.vn', '0334105727', '3'),
('A Hoàng', 'HN', '1', '27', 'hoang@codegym.vn', '0326876727', '4'),
('Luân', 'HN', '1', '28', 'luan@codegym.vn', '0326198727', '5');

-- Test ràng buộc default
insert into `hello`.`student_manager` (`student_name`, `address`, `age`, `email`, `phone`, `classId`) values 
('A Thanh', 'BN', 35, 'thanh@codegym.vn', '0657165727', '1');

-- Cập nhật giá trị của 1 trường sau khi đã tạo record
update `hello`.`student_manager` set `sex` = 0 where id = 9;
update `hello`.`student_manager` set `sex` = 1 where age > 10 and age < 23;

-- 7. Hiển thị tất cả
select * from `hello`.`student_manager`;

-- 8. Hiển thị tất cả học viên nam
select * from student_manager where sex = 1;

-- 9. Hiển thị các học viên có tuổi < 28
select * from student_manager where age < 28;
select `student_name`,`address` from student_manager where age < 28;

-- 10. Hiển thị theo address
select * from student_manager where address = 'HN';

-- 11. Hiển thị học viên không ở HN
select * from student_manager where not address = 'HN';
select * from student_manager where address != 'HN';
select * from student_manager where address not like 'HN';
select * from student_manager where not address like 'HN';

-- 12. Hiển thị học viên bắt đầu bằng chữ A
select * from student_manager where student_name like 'A%';

-- 13. Hiển thị học viên tên Anh
select * from student_manager where student_name = "Anh";
select * from student_manager where student_name like "% Anh";

-- 14. Hiển thị học viên của lớp C0821H1
select * from student_manager where classId = 1;

select * from student_manager
join classes
on student_manager.classId = classes.id_class
where classes.class_name = "C0821H1";

-- xóa 1 bản ghi / record
DELETE FROM `hello`.`student_manager` WHERE (`id` = '9');

UPDATE `hello`.`student_manager` SET `address` = 'Hello' WHERE (`id` = '9');



