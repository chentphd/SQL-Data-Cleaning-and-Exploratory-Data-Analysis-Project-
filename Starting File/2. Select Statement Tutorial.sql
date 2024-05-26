SELECT * 
FROM employee_demographics; 
/* We assume that the database parks_and recreation is clicked on and is black */ 

/*
SELECT * 
FROM parks_and_recreation.employee_demographics; 
# If we dont click on the data base and is not highlighted black 
 */ 
 
 
 
 
 SELECT first_name,
 last_name, 
 birth_date,
 age, 
 (age + 10) * 10  # PEMDAS 
 FROM parks_and_recreation.employee_demographics;

 SELECT gender
 FROM parks_and_recreation.employee_demographics;
 
 SELECT DISTINCT gender
 FROM parks_and_recreation.employee_demographics;
 
 SELECT DISTINCT first_name, gender #First name and gender will always be unique in this case 
 #Takes the combination of unique names and gender 
 #Example: April , Female 
 #Counter Example: April, Female
 #April, Female 
 FROM parks_and_recreation.employee_demographics;