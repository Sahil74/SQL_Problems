/*
From the login_details table, fetch the users who logged in consecutively 3 or more times
*/


create table IF NOT EXISTS problem_7
(
    login_id int primary key,
    user_name char(20),
    login_date date
);

insert into problem_7 values
(101, 'Michael', current_date),
(102, 'James', current_date),
(103, 'Stewart', current_date+1),
(104, 'Stewart', current_date+1),
(105, 'Stewart', current_date+1),
(106, 'Michael', current_date+2),
(107, 'Michael', current_date+2),
(108, 'Stewart', current_date+3),
(109, 'Stewart', current_date+3),
(110, 'James', current_date+4),
(111, 'James', current_date+4),
(112, 'James', current_date+5),
(113, 'James', current_date+6);

select DISTINCT user_name from
(select *,
case 
    when user_name = lead(user_name) over(order BY login_id) and
    user_name = lead(user_name,2) over(order BY login_id) 
    then user_name 
    else NULL
end as repeated
from problem_7) x
where x.repeated is NOT NULL;

