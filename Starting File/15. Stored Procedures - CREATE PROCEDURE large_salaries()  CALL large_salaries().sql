-- Stored Procedures 
SELECT * 
FROM employee_salary; 


SELECT * 
FROM employee_salary
where salary >= 50000; 



CREATE PROCEDURE large_salaries() 
SELECT * 
FROM employee_salary
where salary >= 50000; 

CALL large_salaries(); 


#####################################
CREATE PROCEDURE large_salaries2() 
SELECT * 
FROM employee_salary
where salary >= 50000; 

SELECT * 
FROM employee_salary
where salary >= 10000; 
CALL large_salaries2();


########################################
DELIMITER $$ 
CREATE PROCEDURE large_salaries3() 
BEGIN
	SELECT * 
	FROM employee_salary
	where salary >= 50000; 

	SELECT * 
	FROM employee_salary
	where salary >= 10000; 
END $$ 
DELIMITER ; 

CALL large_salaries3();  


###
CALL new_procedure();
###
######

DELIMITER $$ 
CREATE PROCEDURE large_salaries4(p_id INT) 
BEGIN
	SELECT salary 
	FROM employee_salary
    WHERE employee_id = p_id;
	
END $$ 
DELIMITER ; 

CALL large_salaries4(1);