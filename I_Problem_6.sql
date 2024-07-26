/*
From the doctors table, fetch the details of doctors who work in the same hospital 
but in different specialty.
*/
CREATE table if not exists problem_6
(
    id int primary key,
    name char(15),
    speciality char(15),
    hospital char(15),
    city char(15),
    consulation_fee int
);


insert into problem_6 values
(1, 'Dr. Shashank', 'Ayurveda', 'Apollo Hospital', 'Bangalore', 2500),
(2, 'Dr. Abdul', 'Homeopathy', 'Fortis Hospital', 'Bangalore', 2000),
(3, 'Dr. Shwetha', 'Homeopathy', 'KMC Hospital', 'Manipal', 1000),
(4, 'Dr. Murphy', 'Dermatology', 'KMC Hospital', 'Manipal', 1500),
(5, 'Dr. Farhana', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1700),
(6, 'Dr. Maryam', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1500);

select one.* from problem_6 as one JOIN problem_6 as two 
    on one.hospital = two.hospital 
    and one.id <> two.id
    and one.speciality <> two.speciality;


/*
Write SQL query to fetch the doctors who work in same hospital irrespective of their specialty.
*/
select one.* from problem_6 as one JOIN problem_6 as two 
    on one.hospital = two.hospital 
    and one.id <> two.id

