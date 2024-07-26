/* Write a SQL query to display only the details of employees who either earn the highest salary or 
the lowest salary in each department from the employee table. */

create TABLE if not EXISTS employee(
    id int,
    name char(10),
    dept_name char(10),
    salary int
);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);


-- get only employees who has hightest or lowest salary in their department

with cte AS
(select min(salary) as mini, max(salary) as maxi, dept_name from employee group BY dept_name)

select number1.id, number1.name, number1.dept_name, number1.salary, cte.mini, cte.maxi from 
(select *, rank() OVER(PARTITION BY dept_name order by salary desc) as r1,rank() OVER(PARTITION BY dept_name order by salary asc) as r2 from employee) as number1
join cte ON number1.dept_name = cte.dept_name
where r1 = 1 or r2 =1;





select min(salary), max(salary), dept_name from employee GROUP BY dept_name