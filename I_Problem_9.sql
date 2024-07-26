/* 
From the weather table, fetch all the records when London had 
extremely cold temperature for 3 consecutive days or more.
*/

create table IF NOT EXISTS problem_9
(
    id int,
    city char(20),
    temperature int,
    day date
)


insert into problem_9 values
(1, 'London', -1, to_date('2021-01-01','yyyy-mm-dd')),
(2, 'London', -2, to_date('2021-01-02','yyyy-mm-dd')),
(3, 'London', 4, to_date('2021-01-03','yyyy-mm-dd')),
(4, 'London', 1, to_date('2021-01-04','yyyy-mm-dd')),
(5, 'London', -2, to_date('2021-01-05','yyyy-mm-dd')),
(6, 'London', -5, to_date('2021-01-06','yyyy-mm-dd')),
(7, 'London', -7, to_date('2021-01-07','yyyy-mm-dd')),
(8, 'London', 5, to_date('2021-01-08','yyyy-mm-dd'));


select id,city,temperature,day from (select *, 
CASE
when temperature < 0 and lead(temperature,1) over() < 0 and lead(temperature,2) over() < 0 
then 'Yes'
when temperature < 0 and lead(temperature,1) over() < 0 and lag(temperature,1) over() < 0 
then 'Yes'
when temperature < 0 and lag(temperature,1) over() < 0 and lag(temperature,2) over() < 0 
then 'Yes'
else NULL
end as something
from problem_9) x
where x.something = 'Yes';

