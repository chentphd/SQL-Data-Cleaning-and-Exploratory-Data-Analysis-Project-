 -- JOINS
 
 SELECT * 
 FROM employee_demographics;
 
 SELECT * 
 FROM employee_salary;
 
 
 ## INNER JOIN ### 
 
 SELECT *	
 FROM employee_demographics
 INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id #MISSING ID NUMBER 2 
 ; 
 
SELECT *	
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id #MISSING ID NUMBER 2 
 ; 
 
 
 SELECT *	
 FROM employee_salary AS sal
 INNER JOIN employee_demographics AS dem
	ON dem.employee_id = sal.employee_id #SWITCHED 
 ; 

 
SELECT dem.employee_id, age, occupation
 FROM employee_demographics AS dem 
 INNER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id #MISSING ID NUMBER 2 
 ; 
 
 
 SELECT * 
 FROM employee_demographics AS dem 
 INNER JOIN employee_salary AS sal 
	ON dem.first_name = sal.first_name #By first name??? 
;

 SELECT * 
 FROM employee_demographics AS dem 
 INNER JOIN employee_salary AS sal 
	ON dem.last_name = sal.last_name#By last name 
;

##############################################################
-- OUTER JOINS 
#left outter everything in the left table even no match , matches to right 
SELECT *
 FROM employee_demographics AS dem 
LEFT OUTER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id #MISSING ID NUMBER 2 
 ; 
 
 SELECT *
 FROM employee_demographics AS dem 
RIGHT OUTER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id # FILLS ID #2 WITH NULLS 
 ; 
 
 
SELECT * 
FROM employee_salary AS sal 
LEFT OUTER JOIN employee_demographics as dem
	ON sal.employee_id = dem.employee_id
;

#################
-- SELF JOIN 
SELECT * 
FROM employee_salary; 

SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1= emp2.employee_id; 
    
    
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa, 
emp1.last_name AS last_name_santa, 

emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp, 
emp2.last_name AS last_name_emp 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1= emp2.employee_id; 
    
    
    
    
    
    
    
    
###########################
    
-- JOINING MULTIPLE TABLES TOGETHER 
 SELECT *
 FROM parks_departments; 
 
SELECT *
 FROM employee_demographics AS dem 
 INNER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id #MISSING ID NUMBER 2 
INNER JOIN parks_departments pd 
	ON sal.dept_id = pd.department_id
 ; 
 
##############################
SELECT * 
FROM employee_demographics AS dem  
RIGHT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
LEFT OUTER JOIN parks_departments AS park
	ON sal.dept_id = park.department_id
;