CREATE table problem2_source
(
    id int,
    name char(1)
);
CREATE table problem2_target
(
    id int,
    name char(1)
);

Insert into problem2_source VALUES(1,'A');
Insert into problem2_source VALUES(2,'B');
Insert into problem2_source VALUES(3,'C');
Insert into problem2_source VALUES(4,'D');

Insert into problem2_target VALUES(1,'A');
Insert into problem2_target VALUES(2,'B');
Insert into problem2_target VALUES(4,'X');
Insert into problem2_target VALUES(5,'F');


select s.id, 'New in Source' as comment from problem2_source as s LEFT JOIN problem2_target as t
    ON s.id = t.id where t.id is NULL 
    union
select s.id,'Mismatch' as ans from problem2_source s join problem2_target t 
    on s.id = t.id and s.name <> t.name
    union
select t.id, 'New in target' as comment from problem2_source as s RIGHT JOIN problem2_target as t
    ON s.id = t.id where s.id is NULL
     