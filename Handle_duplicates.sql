-- We are doing the - handling the duplicates with particular cols (model and brand name)
-- there are six different solutions 
-- check the note in the sql folder for the detail description



-- create a table

/*create table if not exists cars
(
    id      int,
    model   varchar(50),
    brand   varchar(40),
    color   varchar(30),
    make    int
); */ 


-- adding the data
/* insert into cars values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into cars values (2, 'EQS', 'Mercedes-Benz', 'Black', 2022);
insert into cars values (3, 'iX', 'BMW', 'Red', 2022);
insert into cars values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);
insert into cars values (5, 'Model S', 'Tesla', 'Silver', 2018);
insert into cars values (6, 'Ioniq 5', 'Hyundai', 'Green', 2021); */


--Duplicates based on model and brand name.

--1. number one solution - delete using unique identifier
--step 1 - identify/ show duplicates with select and group by
--step 2 - pickup their duplicates and select their id to delete 
--step 3 add delete statement
delete from cars where id in (
select max(id) from cars group by model, brand
having count(*) > 1 )
-- issue with this method it only deletes one record of duplicates if there is 2 duplicates of same record
-- it will not delete. and
-- ID has to be unique

--As we going to number 2 solution we need to put back duplicates
/* insert into cars values(5, 'Model S', 'Tesla','Blue', 2018);
insert into cars values(6, 'Ioniq 5', 'Hyundai','White', 2021); */

 

--2 number two solution - self join
delete from cars where id in (
select c2.id from cars c1 join cars c2 on c1.model = c2.model and c1.brand = c2.brand
where c1.id < c2.id );
--issue = ID has to be unique
  
delete from cars
select * from cars



--3 number three solution - window function
delete from cars where id in(
select id from (select *, row_number() over (partition by model, brand) as rn 
from cars) x
where x.rn >1 );

delete from (select *, row_number() over (partition by model, brand) as rn 
from cars) x 
where x.rn > 1 

--4 number four min function. used for multiple duplicates 
delete from cars where id not in (
select min(id) from cars GROUP BY model, brand)


-- 5 Using a backup table.
-- basically create a new table and drop the existing table
-- in work enviroment you can not do that.

create table cars_bkp
 as 
 select * from cars where 1=2;


INSERT into cars_bkp
select * from cars 
where id in 
    (select min(id) from cars group by model,brand)
drop table cars
alter table cars_bkp rename to cars;

-- shortcut approach to create new table without using create or insert
select * into cars_bkp from cars where id in (select min(id) from cars group by model, brand)


-- 6 USing a backup table. but without dropping original.
create table cars_bk
 as select * from cars where id in (select min(id) from cars group by model,brand)


truncate table cars

insert into cars 
select * from cars_bk

drop table cars_bk


--SCENARIO 2
-- id is also duopliacted


-- Solution 1 : delete using CTID -- RowId in oracle
delete from cars 
where ctid in(
select max(ctid) from cars group by model, brand having count(*)>1
)


-- Solution 2 - by   creating a temporary unique id col.

alter table cars add column row_num int generated always as identity;
delete from cars where row_num in (
select max(row_num) from cars group by model, brand having count(*)>1)



--sol 3 backup table
create table cars_bk as select distinct * from cars

select * from cars_bk
drop table cars
alter table cars_bk rename to cars

select distinct * into cars_bxp from cars

--sol4 backup table without dropping the original table.



