create table IF NOT EXISTS problem_4
(
    user_id int,
    user_name char(10),
    email char(15)
);

insert INTO problem_4 VALUES(1,'Sumit','sumit@gmail.com');
insert into problem_4 values(2,'Reshma','reshma@gmail.com');
insert into problem_4 values(3,'Farhana','Farhana@gmail.com');
insert into problem_4 values(4,'Robin','Robin@gmail.com');
insert into problem_4 values(5,'Robin','Robin@gmail.com');
insert INTO problem_4 VALUES(6,'Sumit','sumit@gmail.com');
insert into problem_4 values(7,'Reshma','reshma@gmail.com');
insert into problem_4 values(8,'Farhana','Farhana@gmail.com');
insert into problem_4 values(9,'Robin','Robin@gmail.com');
insert into problem_4 values(10,'Robin','Robin@gmail.com');

Alter table problem_4 Alter COLUMN email type char(25);

--remove duplicates (data has unique id)
delete from problem_4 where user_id not in (select min(user_id) from problem_4 group by user_name, email)


-- get the second last record from the table
select * from (select *, row_number() over(order by user_id desc) rn from problem_4 order by user_id)
where rn = 2










