use baitap_17_01_2022;
-- 
create table book(
id int primary key auto_increment,
name varchar(60) not null,
price int not null,
quantily int ,
type varchar(50) ,
author varchar(60),
publicationdate date
);
-- 
insert into book (name, price, quantily, type, author, publicationdate)values
('toan', 23000, 10, 'sgk', 'nsbVN', '2002/03/07'); 
-- 
insert into book (name, price, quantily, type, author, publicationdate)values
('hoa', 22000, 5, 'sgk', 'nsbVN', '2004/03/07'),
('sinh hoc', 20000, 7, 'sgk', 'nsbVN', '2004/03/07'),
('ngu van', 18000, 9, 'sgk', 'nsbVN', '2004/03/07'),
('tu dien anh van', 55000, 20, 'tu dien', 'nsbVN', '2010/12/09'),
('doraemon', 25000, 89, 'truyen tranh', 'Fujiko Fujio', '1969/12/24'),
('Than Dong Dat Viet', 11500, 228, 'truyen tranh', 'Le Linh', '2002/02/16')
; 
-- 
select b.* from book b;
-- 
select sum(price* quantily) as 'tổng giá tiền của tất cả sách' 
from book;
-- 
select b.* 
from book b
where b.price =  (select max(price) from book);
-- 
select b.* 
from book b
where b.price =  (select min(price) from book);
-- 
select round(avg(b.price),0) as 'don gia tb'
from book b
where b.type = 'sgk';
-- 
select b.*
from book b
where b.author = 'nsbVN';
-- 
select b.*
from book b
where b.price between 20000 and 30000;
-- 
select b.*
from book b
where b.type = 'truyen tranh';
-- 
select b.*
from book b
where b.price = 11500;
-- 
select b.*
from book b
where b.publicationdate = '2004-03-07';
-- 
select b.*
from book b
where b.publicationdate between '1999-12-25' and '2004-03-07';