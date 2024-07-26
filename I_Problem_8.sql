/*
From the students table, write a SQL query to interchange the adjacent student names.
*/
create table if not exists problem_8
(
    id int primary key,
    student_name char(15)
);

Insert into problem_8 VALUES 
(1,'James'),
(2,'Micheal'),
(3,'George'),
(4,'stewart'),
(5,'Robin');

select id, student_name,
case 
WHEN id %2 = 0 then lag(student_name, 1) over()
WHEN id %2 <> 0 then lead(student_name, 1,student_name) over()
else "student_name"
end as answer
from problem_8

