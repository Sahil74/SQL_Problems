create table problem_3 (
    id int,
    p_id int
);

insert into problem_3 values(1);
insert into problem_3 values(2,1);
insert into problem_3 values(3,1);
insert into problem_3 values(4,2);
insert into problem_3 values(5,2);



select id,
        case
            when p_id is NULL then 'Root'
            when id NOT In (select distinct p_id from problem_3 where p_id is Not NULL) then 'Leaf'
        else 'Inner'
        END
from problem_3
