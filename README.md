# cardiovascular
An epidemiological study on cardiovascular diseases 
Source of dataset: Kaggle
Software: MySQL

Database and Table Creation:

A new table named cardiovascular was created in the practise_db database to store the cardiovascular health data.

Data Import:

Data was successfully imported into the cardiovascular table from a CSV file, considering UTF-8-character encoding and standard CSV formatting.

General Overview:

A query to count the total number of entries in the cardiovascular table was executed, providing a basic understanding of the dataset size.

Objective Data Analysis:

The dataset includes both men (gender = 2) and women (gender = 1). Height and weight analyses were conducted, with separate queries for men and women, determining the minimum, average, and maximum values for these metrics. Age was converted from days to years, taking into account leap years, and the ages of the oldest and youngest men and women were determined.

Subjective Data Analysis:

Systolic and diastolic blood pressure readings were analysed, with negative readings presumably filtered out to correct data errors. Cholesterol and glucose levels were categorized into normal, above normal, and well above normal, with distinct counts for both genders.
The proportion of men and women with well above normal cholesterol levels was calculated, giving insight into gender differences regarding cholesterol.

Examination Data Analysis:

Lifestyle factors such as smoking, alcohol intake, and physical activity were examined, including their frequency and percentages within the dataset. The correlation between these lifestyle factors and the presence of cardiovascular disease was investigated, suggesting potential links between lifestyle choices and health outcomes. Prevalence of cardiovascular disease was calculated overall and by gender, providing a clear picture of how widespread the condition is within the sample.

Risk Factor and Lifestyle Analysis:

A detailed analysis of risk factors by gender was performed, examining the average systolic and diastolic blood pressure, cholesterol, glucose levels, smoking rate, alcohol intake rate, and physical activity rate among those with cardiovascular disease. Lifestyle factors were also correlated with cardiovascular disease rates, potentially identifying behaviours that may contribute to health risks.

Blood Pressure and Age Distribution:

Blood pressure analysis was conducted to compare average readings between those with and without cardiovascular disease.
Age distribution among those with cardiovascular disease was examined, likely identifying the most affected age groups.

BMI Analysis:

Body Mass Index (BMI) was calculated and analysed against cardiovascular disease rates, which could indicate the impact of obesity or underweight on cardiovascular health.

Summary:

The analyses covered by the script provide a multifaceted view of the dataset, revealing basic descriptive statistics, gender differences, the influence of lifestyle factors, and the distribution of risk factors among those with cardiovascular disease. The prevalence of the disease and its correlation with factors like BMI, blood pressure, cholesterol, and glucose levels were key focuses of the analysis, which may guide further investigation or interventions targeting cardiovascular health. The script appears to be well-structured and intended to lay the groundwork for a comprehensive epidemiological study of cardiovascular health within the sampled population.
