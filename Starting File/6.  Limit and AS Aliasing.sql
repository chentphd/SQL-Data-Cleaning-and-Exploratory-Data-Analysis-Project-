SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;  #Oldest People 

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1 ; #Get top 2 then get only 1 row below it 

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 1, 2 ; #Get top 1 and then get 2 rows below it 

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 1, 3; #Get top 1 and then get 3 rows below it 



-- Aliasiang - Change name of column 
SELECT gender, avg(age) 
FROM employee_demographics
GROUP BY gender 
;

SELECT gender, avg(age) 
FROM employee_demographics
GROUP BY gender 
HAVING AVG(age) > 40 ;


SELECT gender, avg(age) AS avg_age #AS change the name of the column 
FROM employee_demographics
GROUP BY gender 
HAVING avg_age > 40 ;

SELECT gender, avg(age) avg_age #AS change the name of the column 
FROM employee_demographics
GROUP BY gender 
HAVING avg_age > 40 ;