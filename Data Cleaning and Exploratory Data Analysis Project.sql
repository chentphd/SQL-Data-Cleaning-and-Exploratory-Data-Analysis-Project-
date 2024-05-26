#Data Cleaning 
-- 1. Remove Duplicates 
-- 2. Standardize the Date - spelling, dates
-- 3. NULL Values or Blank Values 
-- 4. Remove Any Columns or Rows that are not necessary 

# Load in the data 
# Original Data Set 
SELECT * 
FROM layoffs;


-- 1. Remove Duplicates 
# Make a new table 
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
FROM layoffs_staging2
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 0;

#Delete those that have duplicates 
DELETE
FROM layoffs_staging2
WHERE row_num > 1;


#Check should be blank 
SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

#Checked removed duplicate data 
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

#Update the company name using Trim 
UPDATE layoffs_staging2
SET company = TRIM(company)
;


##Industry 
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1; #Cyprto, Crypto Currency, CryptoCurrency is basically the same

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = "Crypto"
WHERE industry LIKE 'Crypto%'; 

#Check that Cyprto is the only one 
SELECT distinct industry 
FROM layoffs_staging2; 


##Location 
SELECT distinct location #Looks fine 
FROM layoffs_staging2
ORDER BY 1;



##Country 
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

#Check that United States doesn't have . (period after it) 
SELECT distinct country, TRIM(TRAILING '.' 	FROM country)
FROM layoffs_staging2
ORDER BY 1;




##Date
SELECT `date`, 
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2; 

#Update Dates using STR_TO_DATE()
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y') ; 

SELECT date
FROM layoffs_staging2; #date is still a string

#Solution: Use MODIFY COLUMN `date` DATE 
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE; 



-- 3. Null and Blank Values 

SELECT * 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; 


SELECT *
FROM layoffs_staging2
WHERE industry IS NULL 
OR industry = ""; 

SELECT *
FROM layoffs_staging2
WHERE company = "Airbnb";  #Notice that one has industry and one doesn't 

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

#Check Example 
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

##Delete the last column 
ALTER TABLE layoffs_staging2
DROP COLUMN row_num; 
-- Data Cleaning is Completed above 
###################################################################################################################
-- Exploratory Data Analysis 
SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off) #1 = 100% of the company laid off
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC
;


SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC
;

SELECT company, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company 
ORDER BY 2 DESC;


SELECT MIN(`date`), MAX(`date`) 
FROM layoffs_staging2;

SELECT industry, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY industry 
ORDER BY 2 DESC;

SELECT *
FROM layoffs_staging2;



SELECT country, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY country 
ORDER BY 2 DESC;

SELECT `date`, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY `date` 
ORDER BY 1 DESC;

SELECT YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY YEAR(`date`) 
ORDER BY 1 DESC;


SELECT stage, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY stage 
ORDER BY 2 DESC;

##Using Percentages 
SELECT company, AVG(percentage_laid_off) 
FROM layoffs_staging2
GROUP BY company 
ORDER BY 2 DESC;



-- Rolling Total 
SELECT SUBSTRING(`date`,1,7) as `MONTH`, SUM( total_laid_off)  AS  total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH` 
ORDER BY 1 ASC;


WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`,1,7) as `MONTH`, SUM( total_laid_off)  AS  total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH` 
ORDER BY 1 ASC
)
SELECT `MONTH`,total_off, SUM( total_off) OVER(ORDER BY `MONTH` ) AS rolling_total
FROM Rolling_Total; #Rolling Total 



SELECT company, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company 
ORDER BY 2 DESC;


SELECT company ,YEAR(`date`) , SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY company ASC;

SELECT company ,YEAR(`date`) , SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC;







WITH Company_Year(company, years, total_laid_off)  AS 
(
SELECT company ,YEAR(`date`) , SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
) 
SELECT *, DENSE_RANK() OVER( partition by years ORDER BY total_laid_off DESC)  AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
#ORDER BY Ranking ASC
;


WITH Company_Year(company, years, total_laid_off)  AS 
(
SELECT company ,YEAR(`date`) , SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
) , Company_Year_Rank AS 
(
SELECT *, DENSE_RANK() OVER( partition by years ORDER BY total_laid_off DESC)  AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT * 
FROM Company_Year_Rank
WHERE Ranking <=5
;
