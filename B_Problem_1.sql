/* 
Problem Statement :-

Find the distance travelled by each car per day:

Suppose you have a car travelling certain distance and the data is presented as follows -
Day 1 - 50 km
Day 2 - 100 km  -- cumulative sum is day2 = day1+day2 so day 2 is 50
Day 3 - 200 km  -- -- cumulative sum is day2 = day2+day3 so day 3 is 100

Now the distance is a cumulative sum as in:
        row2 = (kms travelled on that day + row1 kms)

How should I get the table in the form of kms travelled by the car on a given day and 
not the sum of the total distance? 
*/

create table IF NOT EXISTS problem1 (
    cars char(10),
    days char(10),
    cumulative_distance int
);

insert INTO problem1(cars, days, cumulative_distance) values('car1', 'day1', 50);
insert INTO problem1(cars, days, cumulative_distance) values('car1', 'day2', 100);
insert INTO problem1(cars, days, cumulative_distance) values('car1', 'day3', 200);
insert INTO problem1(cars, days, cumulative_distance) values('car2', 'day1', 0);
insert INTO problem1(cars, days, cumulative_distance) values('car3', 'day1', 0);
insert INTO problem1(cars, days, cumulative_distance) values('car3', 'day2', 50);
insert INTO problem1(cars, days, cumulative_distance) values('car3', 'day3', 50);
insert INTO problem1(cars, days, cumulative_distance) values('car3', 'day4', 100);

create view Hello as
select cars,days, cumulative_distance, (cumulative_distance - lag(cumulative_distance, 1, 0) OVER(PARTITION BY cars ORDER BY days)) as real_distance from problem1

select *, concat(cars, days) as mix from Hello
