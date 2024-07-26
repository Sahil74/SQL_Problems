/*
Find the top 2 accounts with the maximum number of unique patients on a monthly basis.
*/


create TABLE IF NOT EXISTS problem_11(
    account_id int,
    date date,
    patient_id int
);

insert into problem_11 values 
(1, to_date('02-01-2020','dd-mm-yyyy'), 100),
(1, to_date('27-01-2020','dd-mm-yyyy'), 200),
(2, to_date('01-01-2020','dd-mm-yyyy'), 300),
(2, to_date('21-01-2020','dd-mm-yyyy'), 400),
(2, to_date('21-01-2020','dd-mm-yyyy'), 300),
 (2, to_date('01-01-2020','dd-mm-yyyy'), 500),
 (3, to_date('20-01-2020','dd-mm-yyyy'), 400),
(1, to_date('04-03-2020','dd-mm-yyyy'), 500),
 (3, to_date('20-01-2020','dd-mm-yyyy'), 450);


with cte as(
select *,row_number() OVER(partition by month order by users desc) as rn FROM
(select EXTRACT(month from date) as Month, 
        count(distinct patient_id) as users,
        account_id 
from problem_11 
group by EXTRACT(month from date),
            account_id)
)

select month, account_id, users from cte where rn = 1 or rn =2;