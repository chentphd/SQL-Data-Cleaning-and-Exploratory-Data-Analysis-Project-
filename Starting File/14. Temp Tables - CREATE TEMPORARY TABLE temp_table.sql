-- Temporary Tables

CREATE TEMPORARY TABLE temp_table 
(first_name varchar(50),
last_name varchar(50),
favorite_move varchar(50)
); 

SELECT * 
FROM temp_table;

#insert data 
INSERT INTO temp_table 
VALUE("Alex" , "Freberg", "Lord of the Rings:The Two Towers" ) ;

SELECT * 
FROM temp_table;





SELECT* 
FROM employee_salary; 


CREATE TEMPORARY TABLE salary_over_50k 
SELECT *
FROM employee_salary
WHERE salary >= 50000; 

SELECT* 
FROM salary_over_50k;	




#CTEs are meant for simple 
#Temp tables more advance 