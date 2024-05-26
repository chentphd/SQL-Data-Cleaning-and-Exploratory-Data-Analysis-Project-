-- Subqueries 

-- Queries within query 

SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

SELECT * 
FROM parks_departments;

SELECT * 
FROM employee_demographics
WHERE employee_id IN 
				(SELECT employee_id
					FROM employee_salary
                    WHERE dept_id = 1 
); # Matching id 



SELECT first_name, salary, 

(SELECT AVG(salary)  
FROM employee_salary) 

FROM employee_salary
;

#####
SELECT gender, avg(age), Max(age), min(age), count(age) 
FROM employee_demographics
GROUP BY gender; 

#####################################
SELECT  AVG(max_age)
FROM
(SELECT gender, 
avg(age) AS avg_age , 
Max(age) AS max_age, 
min(age) AS min_age, 
count(age) AS count_age 
FROM employee_demographics
GROUP BY gender) AS Agg_table
;