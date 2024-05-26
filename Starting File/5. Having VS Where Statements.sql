-- HAVING VS WHERE 

SELECT *
FROM employee_demographics;

SELECT gender
FROM employee_demographics
GROUP BY gender;

SELECT gender, AVG(age) 
FROM employee_demographics
GROUP BY gender; 


SELECT gender, AVG(age) 
FROM employee_demographics
WHERE AVG(age) > 40 
GROUP BY gender;  #ERROR 

SELECT gender, AVG(age) 
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40 ; 

SELECT gender, AVG(age) 
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 20 ; 




####
SELECT * 
from employee_salary; 


SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE "%manager%" 
GROUP BY occupation; 

SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE "%manager%" 
GROUP BY occupation
HAVING AVG(salary) > 75000; 


#Example 
SELECT *
FROM employee_salary;

SELECT occupation, AVG(salary) , COUNT(occupation)
FROM employee_salary
GROUP BY occupation; 


SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE "%Director%"
GROUP BY occupation; 

SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE "%Director%"
GROUP BY occupation
HAVING AVG(salary) < 70000; 