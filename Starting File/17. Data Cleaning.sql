-- Data Cleanring

SELECT *
FROM layoffs;


-- 1. Remove Duplicates 
-- 2. Standardize the Date - spelling, dates
-- 3. NULL Values or Blank Values 
-- 4. Remove Any Columns that are not necessary 
#Create Blank Table
CREATE TABLE layoffs_staging
LIKE layoffs;

#DROP Table layoffs_staging;


SELECT *
FROM layoffs_staging;

#Insert Data into blank table
INSERT layoffs_staging 
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_staging;

-- 1. Remove Duplicates

SELECT *, 
ROW_NUMBER() OVER(partition by company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS 
(
SELECT *, 
ROW_NUMBER() OVER(
partition by company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;

#CHECKING
SELECT *
FROM layoffs_staging
WHERE company = "Oda";

SELECT *
FROM layoffs_staging
WHERE company = "Casper";


#	WITH duplicate_cte AS 
#	(
#	SELECT *, 
#	ROW_NUMBER() OVER(
#	partition by company, location, industry, total_laid_off, 
#	percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
#	FROM layoffs_staging
#	)
#	DELETE
#	FROM duplicate_cte



###
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *, 
ROW_NUMBER() OVER(
partition by company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
;


SELECT *
FROM layoffs_staging2;


SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

#Delete
SET SQL_SAFE_UPDATES = 0;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

#Check should be blank 
SELECT *
FROM layoffs_staging2
WHERE row_num > 1;


SELECT *
FROM layoffs_staging2
;


-- 2. Standardizing Data 
SELECT DISTINCT(company) 
FROM layoffs_staging2; 


SELECT DISTINCT( TRIM(company)) 
FROM layoffs_staging2; 

SELECT company, trim(company)
FROM layoffs_staging2; 


#Update the Trim 
UPDATE layoffs_staging2
SET company = TRIM(company)
;

#Check
SELECT company
FROM layoffs_staging2; 


##Industry 
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1; #Cyprto, Crypto Currency, CryptoCurrency is basically the same


SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = "Cyprto"
WHERE industry LIKE 'Crypto%'; 

UPDATE layoffs_staging2
SET industry = "Crypto"
WHERE industry LIKE 'Cyprto%'; 



SELECT distinct industry 
FROM layoffs_staging2; 
 

#########Location 

SELECT distinct location
FROM layoffs_staging2
ORDER BY 1;


####Country 

SELECT distinct country
FROM layoffs_staging2
ORDER BY 1;


#UPDATE layoffs_staging2
#SET country = "United States"
#WHERE country LIKE "United States%"; 

SELECT distinct country, TRIM(TRAILING '.' 	FROM country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' 	FROM country)
WHERE country LIKE "United States%"
;

#Check
SELECT distinct country, TRIM(TRAILING '.' 	FROM country)
FROM layoffs_staging2
ORDER BY 1;



##############
SELECT *
FROM layoffs_staging2; 
###############Date 
SELECT `date`, 
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2; 

#Update Dates 
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y') ; 

SELECT date
FROM layoffs_staging2;
#date is still a string


ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE; 



SELECT *
FROM layoffs_staging2;

-- 3. Null and Blank Values 

SELECT * 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; 

#Industry 
SELECT DISTINCT industry 
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL 
OR industry = ""; 

SELECT *
FROM layoffs_staging2
WHERE company = "Airbnb"; 


SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location 
WHERE (t1.industry IS NULL OR  t1.industry = '')
AND t2.industry IS NOT NULL
;
#Step 1. Set any blank to NULL 
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT t1.company, t1.location, t1.industry, t2.industry 
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location 
WHERE (t1.industry IS NULL OR  t1.industry = '')
AND t2.industry IS NOT NULL
;

#Step 2. Change all the NULL industry to the industry 
UPDATE layoffs_staging2 AS t1
JOIN layoffs_staging2 AS t2
	ON t1.company = t2.company 
SET t1.industry = t2.industry 
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL
;

#Check Blank 
SELECT t1.company, t1.location, t1.industry, t2.industry 
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location 
WHERE (t1.industry IS NULL OR  t1.industry = '')
AND t2.industry IS NOT NULL
;

SELECT * 
FROM layoffs_staging2;

#Check 
SELECT *
FROM layoffs_staging2
WHERE company LIKE "Bally%"; 



-- 4. Remove Any Columns that are not necessary 
SELECT * 
FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL
;
#Delete Rows that have BOTH total_laid_off and percentage_laid_off is NULL 


DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; 

SELECT *
FROM layoffs_staging2;


##Delete the last colum
ALTER TABLE layoffs_staging2
DROP COLUMN row_num; 

SELECT *
FROM layoffs_staging2;


