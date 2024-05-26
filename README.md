# SQL Data Cleaning and Exploratory Data Analysis Project

## Overview

This project involves data cleaning and exploratory data analysis (EDA) on a dataset containing information about layoffs in 2022. The dataset is sourced from [Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022).

## Dataset

The dataset includes various details about layoffs such as company name, industry, location, number of employees laid off, and more. It provides a valuable resource for analyzing trends and patterns in layoffs during 2022.

## Project Structure

The project consists of the following files:

- `Data Cleaning and Exploratory Data Analysis Project.sql`: Main SQL file for data cleaning and EDA.
- `Starting File/`: Directory containing additional SQL scripts used in the project.
  - `1. Beginner - Parks_and_Rec_Create_db.sql`
  - `2. Select Statement Tutorial.sql`
  - `3. Where Statements.sql`
  - `4. Group By Statements.sql`
  - `5. Having VS Where Statements.sql`
  - `6. Limit and AS Aliasing.sql`
  - `7. Joins.sql`
  - `8. Unions.sql`
  - `9. String Functions - LENGTH, UPPER, LOWER, TRIM, SUBSTRING, REPLACE, LOCATE, CONCAT.sql`
  - `10. Case Statements.sql`
  - `11. Subqueries - IN, FROM.sql`
  - `12. Window Function AVG(salary) OVER(partition by gender), ROW_NUMBER() OVER(partition by gender DESC).sql`
  - `13. CTE TABLE - Nicer Way of table.sql`
  - `14. Temp Tables - CREATE TEMPORARY TABLE temp_table.sql`
  - `15. Stored Procedures - CREATE PROCEDURE large_salaries() CALL large_salaries().sql`
  - `16. Triggers and Events.sql`
  - `17. Data Cleaning.sql`

## Setup

To run the SQL scripts, you need to have a MySQL server set up. Follow these steps:

1. **Install MySQL**:
   - Download and install MySQL from the official [MySQL website](https://dev.mysql.com/downloads/).

2. **Load the Dataset**:
   - Download the dataset from [Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022).
   - Load the dataset into your MySQL database.

3. **Run SQL Scripts**:
   - Use a MySQL client (such as MySQL Workbench) to execute the provided SQL scripts.

## Data Cleaning

The data cleaning process includes:
- Removing duplicates.
- Handling missing values.
- Standardizing date formats.
- Correcting data types.

## Exploratory Data Analysis

The exploratory data analysis involves:
- Summary statistics.
- Data visualizations.
- Identifying trends and patterns in layoffs.
- Analyzing layoffs by industry, location, and other factors.

## Results

The findings from the data cleaning and exploratory data analysis are documented in the SQL scripts and can be used to derive insights about the layoffs in 2022.

## Contributions

Feel free to contribute to this project by submitting a pull request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License.

## Acknowledgments

- Thanks to [Kaggle](https://www.kaggle.com/) for providing the dataset.
- The dataset can be found [here](https://www.kaggle.com/datasets/swaptr/layoffs-2022).

---

*This project is part of a data analysis and visualization initiative aimed at understanding employment trends and their impact on the economy.*
