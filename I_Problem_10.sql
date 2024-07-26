/*
From the following 3 tables (event_category, physician_speciality, patient_treatment), 
write a SQL query to get the histogram of specialties of the unique physicians who have done 
the procedures but never did prescribe anything.
*/

create table IF NOT EXISTS problem_10_patient
(patient_id int, event_name char(20), physician_id int );

create table if not exists problem_10_event
(event_name char(20),category char(15));

create table if not exists problem_10_physician
(physician_id int,speciality char(20));


insert into problem_10_event values 
('Chemotherapy','Procedure'),('Radiation','Procedure'), ('Immunosuppressants','Prescription'),('BTKI','Prescription'),
('Biopsy','Test');

insert into problem_10_physician values 
(1000,'Radiologist'),(2000,'Oncologist'),(3000,'Hermatologist'),(4000,'Oncologist'),(5000,'Pathologist'),
(6000,'Oncologist');

insert into problem_10_patient values 
(1,'Radiation', 1000), (2,'Chemotherapy', 2000), (1,'Biopsy', 1000), (3,'Immunosuppressants', 2000), 
(4,'BTKI', 3000), (5,'Radiation', 4000),(4,'Chemotherapy', 2000), (1,'Biopsy', 5000), (6,'Chemotherapy', 6000);




WITH cte AS (
    SELECT DISTINCT p.physician_id, p.speciality
    FROM problem_10_physician p
    JOIN problem_10_patient pt ON p.physician_id = pt.physician_id
    JOIN problem_10_event ev ON pt.event_name = ev.event_name
    WHERE ev.category = 'Procedure'
    AND p.physican_id NOT IN (
        SELECT pt.physician_id
        FROM problem_10_patient pt
        JOIN problem_10_event ev ON pt.event_name = ev.event_name
        WHERE ev.category = 'Prescription'
    )
)
SELECT speciality, COUNT(*) AS physician_count
FROM cte
GROUP BY speciality;

