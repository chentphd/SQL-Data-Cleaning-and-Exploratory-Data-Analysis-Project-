-- CTE - Common Table Expressions 

WITH CTE_Example AS 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal,COUNT(salary) count_sal
FROM employee_demographics as dem 
JOIN employee_salary as sal 
	ON dem .employee_id = sal.employee_id
GROUP BY gender
) 
SELECT *
FROM CTE_Example
;

WITH CTE_Example AS 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal,COUNT(salary) count_sal
FROM employee_demographics as dem 
JOIN employee_salary as sal 
	ON dem .employee_id = sal.employee_id
GROUP BY gender
) 
SELECT avg(avg_sal) 
FROM CTE_Example
;
###
#VS  OLD 
SELECT avg(avg_sal) 
FROM (SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal,COUNT(salary) count_sal
FROM employee_demographics as dem 
JOIN employee_salary as sal 
	ON dem .employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;

#Cant Memorize Example CTE
#SELECT AVG(avg_sal)
#FROM CTE_example; #ERROR 



WITH CTE_Example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
where birth_date > "1985-01-01"
),
CTE_Example2 AS 
(
SELECT employee_id, salary 
FROM employee_salary
WHERE salary > 50000 
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON 	CTE_Example.employee_id = CTE_Example2.employee_id ;

#Standrd Example 
WITH CTE_Example AS 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal,COUNT(salary) count_sal
FROM employee_demographics as dem 
JOIN employee_salary as sal 
	ON dem .employee_id = sal.employee_id
GROUP BY gender
) 
SELECT * 
FROM CTE_Example
;

WITH CTE_Example(Gender, AVG_SAL, MAX_SAL,MIN_SAL,COUNT_SAL)  AS #Name is overwritten 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal,COUNT(salary) count_sal
FROM employee_demographics as dem 
JOIN employee_salary as sal 
	ON dem .employee_id = sal.employee_id
GROUP BY gender
) 
SELECT * 
FROM CTE_Example
;