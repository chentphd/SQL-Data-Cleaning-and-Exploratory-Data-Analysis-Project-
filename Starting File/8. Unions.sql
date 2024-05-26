-- Unions combine rows from seperate tables 


SELECT age, gender
FROM employee_demographics
UNION

SELECT first_name, last_name
FROM employee_salary
;



SELECT first_name, last_name
FROM employee_demographics
UNION #DEFAULT IS DINSTINCT 
SELECT first_name, last_name
FROM employee_salary
;


SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;












#Use case: 

SELECT first_name, last_name, "Old Man" AS Label_Name
FROM employee_demographics
WHERE age > 40 and GENDER = "Male"
UNION 

SELECT first_name, last_name, "Old Lady" AS Classification
FROM employee_demographics
WHERE age > 40 and GENDER = "Female"

UNION  
SELECT first_name, last_name, "Highly Paid Employee" AS Label_Name
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name ;