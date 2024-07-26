create table problem_3_teams
(
    team_code char(5),
    team_name char(30)
)

insert into problem_3_teams values ('RCB', 'Royal Challengers Bangalore');
insert into problem_3_teams values ('MI', 'Mumbai Indians');
insert into problem_3_teams values ('CSK', 'Chennai Super Kings');
insert into problem_3_teams values ('DC', 'Delhi Capitals');
insert into problem_3_teams values ('RR', 'Rajasthan Royals');
insert into problem_3_teams values ('SRH', 'Sunrisers Hyderbad');
insert into problem_3_teams values ('PBKS', 'Punjab Kings');
insert into problem_3_teams values ('KKR', 'Kolkata Knight Riders');
insert into problem_3_teams values ('GT', 'Gujarat Titans');
insert into problem_3_teams values ('LSG', 'Lucknow Super Giants');

-- We want each team play against every other team once
with cte as 
(select *, row_number() over() as rn from problem_3_teams)
select ctea.team_name, cteb.team_name from cte as ctea JOIN cte as cteb on ctea.rn < cteb.rn;

-- We want each team play against every other team twice
with cte as 
(select *, row_number() over() as rn from problem_3_teams)
select ctea.team_name, cteb.team_name from cte as ctea JOIN cte as cteb on ctea.rn <> cteb.rn;

-- the only difference is operator in first at the end we used lessthan and in 2nd we used not equals to.

