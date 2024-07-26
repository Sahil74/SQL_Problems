/* 
We have input table and we want to make a output table from input table
INPUT 
ID  Name
1   Emp1
2   Emp2
3   Emp3
4   Emp4
5   Emp5
6   Emp6
7   Emp7
8   Emp8

OUTPUT
RESULT
1 Emp1, 2 Emp2
3 Emp3, 4 Emp4
5 Emp5, 6 Emp6
7 Emp7, 8 Emp8


-- string_agg function - to merge multile rows into the single column.
-- we need to make 4 buckets each bucket contains 2
-- window function ntile
*/

create table IF NOT EXISTS problem2 (
    id int,
    name char(10)
)

insert into problem2 values(1, 'Emp1');
insert into problem2 values(2, 'Emp2');
insert into problem2 values(3, 'Emp3');
insert into problem2 values(4, 'Emp4');
insert into problem2 values(5, 'Emp5');
insert into problem2 values(6, 'Emp6');
insert into problem2 values(7, 'Emp7');
insert into problem2 values(8, 'Emp8');


--ntile function = based on how many records do you have in your table it equally splits the records in
-- the mentioned buckets.

with cte as
    (
    select concat(id,' ', name) as name2, 
            ntile(4) over(order by id) as buckets 
    from problem2 
    )
select string_agg(cte.name2, ', ') as col from cte group by buckets order by col

-- all in one column
with cte as
(SELECT concat(id,' ',name) as name2 from problem2)
select string_agg(cte.name2, ', ') as col from cte  





