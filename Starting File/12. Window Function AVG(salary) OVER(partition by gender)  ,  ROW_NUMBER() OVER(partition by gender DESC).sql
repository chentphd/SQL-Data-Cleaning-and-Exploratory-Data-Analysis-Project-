-- Window Functions 

SELECT * 
FROM employee_demographics;

SELECT *
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

SELECT gender, AVG(salary) as avg_salary 
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;


#AVG(salary) OVER(partition by gender)  
SELECT gender, AVG(salary) OVER(partition by gender)  
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

#Testing
SELECT *,  AVG(salary) OVER(partition by gender)  
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;
#


SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(partition by gender)   #avg
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;




SELECT dem.first_name, dem.last_name,gender,SUM(salary) OVER(partition by gender)  #SUM
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.first_name, dem.last_name,gender,salary, SUM(salary) OVER(partition by gender ORDER BY dem.employee_id) AS Rolling_Total   #Rolling total separate gender by id 
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


#Row number 
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(partition by gender)
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(partition by gender order by salary DESC)
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(partition by gender order by salary DESC) as row_num, #Regular row numbers no dups 
RANK() OVER(partition by gender order by salary DESC) as rank_num #Regular rank - gives ties but skips number
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(partition by gender order by salary DESC) as row_num,
RANK() OVER(partition by gender order by salary DESC) as rank_num, #Regular rank - gives ties but skips number
DENSE_RANK() OVER(partition by gender order by salary DESC) as dense_rank_num #Dense Rank, if there is a tie, next number is just the number. Forexample 5 5 then 6 
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;