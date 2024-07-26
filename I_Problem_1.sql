create table problem_1
(
    id int,
    comment char(100),
    translation char(100)
);

Insert into problem_1 VALUES(1, 'very good');
Insert into problem_1 VALUES(2, 'good');
Insert into problem_1 VALUES(3, 'bad');
Insert into problem_1 VALUES(4, 'ordinary');
Insert into problem_1 VALUES(5, 'cdcdcdcd','very bad');
Insert into problem_1 VALUES(6, 'excellent');
Insert into problem_1 VALUES(7, 'ababab', 'not satisfied');
Insert into problem_1 VALUES(8, 'satisfied');
Insert into problem_1 VALUES(9, 'cbcbcbccc', 'extraordinary');
Insert into problem_1 VALUES(10, 'edededed', 'medium');

select 
        case
            when translation is NULL then comment
        else translation
        END as output
from problem_1

--- with inbuilt function
select coalesce(translation,comment) as output 
from problem_1
