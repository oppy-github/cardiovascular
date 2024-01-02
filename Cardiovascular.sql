USE practise_db;

CREATE table cardiovascular (
id	INT,
age	INT,
gender	INT,
height	INT,
weight	INT,
systolic_hi_bp	INT,
diastolic_lo_bp	INT,
cholesterol	INT,
glucose	INT,
smoke	INT,
alcohol_intake	INT,
physical_activity	INT,
cardiovascular_disease INT 
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cardio_train_cleaned.csv'
INTO TABLE cardiovascular
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT *
FROM Cardiovascular;

/* total number of entries */
SELECT COUNT(*)
FROM Cardiovascular;


/*
The dataset will be explored under three major categories.
Objective: factual information; basic information about each patient
Subjective: information given by the patient; information gathered from the patients
Examination: results of medical examination; Result obtained my medical examiner.
*/

/*
Objective: factual information; basic information about each patient
*/

/* gener 1 = women, 2 = men */
SELECT DISTINCT gender 
FROM Cardiovascular;

/* MIN, AVG MAX height (cm) */
SELECT MIN(height) AS min_heigth, AVG(height) AS avg_height, MAX(height) AS max_height
FROM Cardiovascular;

/* height of women */
SELECT MIN(height) AS min_heigth, AVG(height) AS avg_height, MAX(height) AS max_height
FROM Cardiovascular
WHERE gender = 1;

/* height of men */
SELECT MIN(height) AS min_heigth, AVG(height) AS avg_height, MAX(height) AS max_height
FROM Cardiovascular
WHERE gender = 2;

/* MIN, AVG MAX weight (kg) */
SELECT MIN(weight) AS min_weight, AVG(weight) AS avg_weight, MAX(weight) AS max_weight
FROM Cardiovascular;

/* women's weight (kg) */
SELECT MIN(weight) AS min_weight, AVG(weight) AS avg_weight, MAX(weight) AS max_weight
FROM Cardiovascular
WHERE gender = 1;

/* men's weight (kg) */
SELECT MIN(weight) AS min_weight, AVG(weight) AS avg_weight, MAX(weight) AS max_weight
FROM Cardiovascular
WHERE gender = 2;

/* MIN, AVG MAX age */
/* use the FLOOR command to convert age in days into the actual age */
/* to divide by 365.25 helps us consider leap years */

SELECT FLOOR(MIN(age)/265.25) AS min_age, FLOOR(AVG(age)/265.25) AS avg_age, FLOOR(MAX(age)/265.25) AS max_age
FROM cardiovascular;

/* oldest woman's age */
SELECT FLOOR(age / 265.25) AS women_oldest_age
FROM cardiovascular
WHERE gender = 1
ORDER BY age DESC
LIMIT 5;

/* youngest woman's age */
SELECT FLOOR(age / 265.25) AS women_youngest_age
FROM cardiovascular
WHERE gender = 1
ORDER BY age
LIMIT 5;

/* oldest man's age */
SELECT FLOOR(age / 265.25) AS men_oldest_age
FROM cardiovascular
WHERE gender = 2
ORDER BY age DESC
LIMIT 5;

/* youngest man's age */
SELECT FLOOR(age / 265.25) AS men_youngest_age
FROM cardiovascular
WHERE gender = 2
ORDER BY age
LIMIT 5;

/*
Subjective: information given by the patient; information gathered from the patients
*/

/* MIN, AVG MAX systolic_hi_bp */
SELECT MIN(systolic_hi_bp), AVG(systolic_hi_bp), MAX(systolic_hi_bp)
FROM Cardiovascular;

/* the dataset has negative blood pressure reading, which are errors */
/* women MIN, MAX systolic_hi_bp */
SELECT MIN(systolic_hi_bp) AS women_min_systolic_bp, MAX(systolic_hi_bp) AS women_max_systolic_bp
FROM Cardiovascular
WHERE gender = 1 AND systolic_hi_bp > 0 ;

/* men MIN, MAX systolic_hi_bp */
SELECT MIN(systolic_hi_bp) AS men_min_systolic_bp, MAX(systolic_hi_bp) AS men_max_systolic_bp
FROM Cardiovascular
WHERE gender = 2 AND systolic_hi_bp > 0 ;

/* MIN, AVG MAX diastolic_lo_bp */
SELECT MIN(diastolic_lo_bp), AVG(diastolic_lo_bp), MAX(diastolic_lo_bp)
FROM Cardiovascular;

/* women MIN, MAX diastolic_lo_bp */
SELECT MIN(diastolic_lo_bp) AS women_min_diastolic_bp, MAX(diastolic_lo_bp) AS women_min_diastolic_bp
FROM Cardiovascular
WHERE gender = 1 AND diastolic_lo_bp > 0;

/* men MIN, MAX diastolic_lo_bp */
SELECT MIN(diastolic_lo_bp) AS men_min_diastolic_bp, MAX(diastolic_lo_bp) AS men_min_diastolic_bp
FROM Cardiovascular
WHERE gender = 2 AND diastolic_lo_bp > 0;

/* 1 = normal, 2 = above normal, 3 = well above normal */
SELECT DISTINCT cholesterol AS cholesterol_level
FROM Cardiovascular;

/* what proportion of women had well above normal cholesterol_level */
SELECT COUNT(cholesterol) AS women_cholesterol_level,
       (COUNT(cholesterol) / (SELECT COUNT(cholesterol) FROM Cardiovascular)) * 100 AS percentage_cholesterol_level
FROM Cardiovascular
WHERE gender = 1;

/* what proportion of men had well above normal cholesterol_level */
SELECT COUNT(cholesterol) AS men_cholesterol_level,
       (COUNT(cholesterol) / (SELECT COUNT(cholesterol) FROM Cardiovascular)) * 100 AS percentage_cholesterol_level
FROM Cardiovascular
WHERE gender = 2;

/* 1 = normal, 2 = above normal, 3 = well above normal */
SELECT DISTINCT glucose AS glucose_level
FROM Cardiovascular;

/*
Examination: results of medical examination; Result obtained my medical examiner.
*/

/* smoke 0 = no, 1 = yes */
SELECT DISTINCT smoke AS smoking
FROM Cardiovascular;

/* alcohol_intake 0 = no, 1 = yes */
SELECT DISTINCT alcohol_intake
FROM Cardiovascular;

/* physical_activity 0 = no, 1 = yes */
SELECT DISTINCT physical_activity
FROM Cardiovascular;

/* analysis on smoke, alcohol_intake, and physical_activity */

/* Frequency Counts: */
SELECT 
    SUM(smoke) AS number_of_smokers,
    SUM(alcohol_intake) AS number_of_alcohol_users,
    SUM(physical_activity) AS number_of_physically_active_individuals
FROM Cardiovascular;

/* Proportions and Percentages */
SELECT 
    (SUM(smoke) / COUNT(*)) * 100 AS percent_smokers,
    (SUM(alcohol_intake) / COUNT(*)) * 100 AS percent_alcohol_users,
    (SUM(physical_activity) / COUNT(*)) * 100 AS percent_physically_active
FROM Cardiovascular;

/* Correlation with Cardiovascular Disease */
SELECT 
    AVG(smoke) AS avg_smoking_with_disease,
    AVG(alcohol_intake) AS avg_alcohol_with_disease,
    AVG(physical_activity) AS avg_activity_with_disease
FROM Cardiovascular
WHERE cardiovascular_disease = 1;

/* Group Comparison */
SELECT 
    gender,
    AVG(smoke) AS avg_smoking,
    AVG(alcohol_intake) AS avg_alcohol,
    AVG(physical_activity) AS avg_physical_activity
FROM Cardiovascular
GROUP BY gender;

/* Risk Factor Analysis */
SELECT 
    smoke, 
    alcohol_intake, 
    physical_activity, 
    AVG(cardiovascular_disease) * 100 AS disease_prevalence
FROM Cardiovascular
GROUP BY smoke, alcohol_intake, physical_activity;


/* cardiovascular_disease 0 = no_cardiovascular_disease, 1 = yes_cardiovascular_disease */
SELECT DISTINCT cardiovascular_disease
FROM Cardiovascular;

/* Prevalence of Cardiovascular Disease */
SELECT AVG(cardiovascular_disease) * 100 AS prevalence_percentage
FROM Cardiovascular;

/* Prevalence by Gender */
SELECT gender, AVG(cardiovascular_disease) * 100 AS prevalence_percentage
FROM Cardiovascular
GROUP BY gender;

/* Risk Factor Analysis by Gender*/
SELECT gender, AVG(systolic_hi_bp) AS avg_systolic_bp, AVG(diastolic_lo_bp) AS avg_diastolic_bp,
       AVG(cholesterol) AS avg_cholesterol, AVG(glucose) AS avg_glucose,
       AVG(smoke) AS smoking_rate, AVG(alcohol_intake) AS alcohol_rate,
       AVG(physical_activity) AS physical_activity_rate
FROM cardiovascular
WHERE cardiovascular_disease = 1
GROUP BY gender;

/*Lifestyle Analysis */
SELECT smoke, alcohol_intake, physical_activity, AVG(cardiovascular_disease) * 100 AS disease_rate
FROM cardiovascular
GROUP BY smoke, alcohol_intake, physical_activity;

/* Blood Pressure Analysis */
SELECT cardiovascular_disease, AVG(systolic_hi_bp) AS avg_systolic_bp, AVG(diastolic_lo_bp) AS avg_diastolic_bp
FROM cardiovascular
GROUP BY cardiovascular_disease;

/* Age Distribution and Disease */
SELECT FLOOR(age / 265.23), COUNT(*) AS count
FROM cardiovascular
WHERE cardiovascular_disease = 1
GROUP BY age
ORDER BY count DESC;

/* BMI and Disease Correlatio */
SELECT ROUND(weight / ((height / 100) * (height / 100)), 2) AS bmi, AVG(cardiovascular_disease) * 100 AS disease_rate
FROM cardiovascular
GROUP BY bmi;