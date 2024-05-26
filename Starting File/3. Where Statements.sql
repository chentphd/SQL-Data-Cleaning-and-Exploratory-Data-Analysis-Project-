# WHERE Claus 

SELECT * 
FROM employee_salary
WHERE first_name = "Leslie"
;


SELECT * 
FROM employee_salary
WHERE salary <=  50000 
;

SELECT * 
FROM employee_demographics
WHERE gender = "female"
;

SELECT * 
FROM employee_demographics
WHERE birth_date > "1985-01-01"
;


-- AND OR NOT -- LOGICAL OPERATORS 

SELECT *
FROM employee_demographics
WHERE birth_date > "1985-01-01"
AND gender = "male"
;

SELECT *
FROM employee_demographics
WHERE birth_date > "1985-01-01"
OR gender = "male"
;

SELECT *
FROM employee_demographics
WHERE first_name = "Leslie" AND age = 44
;

SELECT *
FROM employee_demographics
WHERE (first_name = "Leslie" AND age = 44) OR age > 55
;

-- LIKE STATEMENT
-- % and _
-- % anything
-- _ specific value
SELECT *
FROM employee_demographics
WHERE first_name = "Jer"
;


SELECT *
FROM employee_demographics
WHERE first_name LIKE "Jer%"
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE "%er%" #Anything that has er inside the word 
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE "a%" #Anything that starts with a 
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE "%a" #Anything that ends with a 
;


SELECT *
FROM employee_demographics
WHERE first_name LIKE "a__" #Anything 2 leters after a
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE "a___" #Anything 3 leters after a
;
SELECT *
FROM employee_demographics
WHERE first_name LIKE "a___%" #Anything 3 leters after a and everything after it 
;

SELECT *
FROM employee_demographics
WHERE birth_date LIKE "1989%"
;

SELECT * 
FROM employee_demographics
WHERE first_name LIKE "a%" 
AND first_name LIKE "%y" ;