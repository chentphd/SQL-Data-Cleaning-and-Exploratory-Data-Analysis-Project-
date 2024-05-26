-- String Functions 
#built in functions to use strings 


SELECT LENGTH("skyfall");


SELECT *
FROM employee_demographics;

SELECT first_name, LENGTH(first_name) as LENGTH#Lenth of first name
FROM employee_demographics
ORDER BY LENGTH;


#Upper

SELECT UPPER("sky");
SELECT LOWER("SKY");


SELECT first_name, UPPER(first_name) #Lenth of first name
FROM employee_demographics
;


##Trip  - gets rid of front of back white spac 
SELECT ("                     sky                    ");
SELECT trim("                     sky                 ");
SELECT Ltrim("                     sky                 ");
SELECT Rtrim("                     sky                 ");




###Substring 
##left and right 


SELECT first_name, LEFT(first_name,4) #How many characters from the left hand side do we want to keep 
FROM employee_demographics;

SELECT first_name, right(first_name,4) #How many characters from the right hand side do we want to keep 
FROM employee_demographics;
#Never using this 



####Substring 
SELECT first_name, 
left(first_name,4),
right(first_name,4), 
substring(first_name, 3, 2), #Start at 3rd position, go 2 right 
birth_date,
substring(birth_date, 6,2) AS birth_month
FROM employee_demographics;



#######Replace 
SELECT first_name, replace(first_name, "a", "z")  #what u want to replace, replacement 
FROM employee_demographics;


##Locate 

SELECT locate("x", "Alexander"); #tells the index of x 

SELECT first_name, locate("An",first_name)  
FROM employee_demographics;


##CONCAT
SELECT first_name, last_name, 
concat(first_name, " ", last_name) AS full_name
FROM employee_demographics;


