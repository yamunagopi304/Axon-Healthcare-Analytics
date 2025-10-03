CREATE Database Healthcare_Project;

# 1. Total Patients
SELECT COUNT(*) AS Total_Patients
FROM Patient;

# 2. Total Doctors
SELECT COUNT(*) AS Total_Doctors
FROM Doctor;

# 3. Total Visits
SELECT COUNT(*) AS Total_Visits
FROM Visit;

# 4. Average Age of Patients
SELECT AVG(Age) AS Average_Age
FROM Patient;

# 5. Top 5 Diagnosed Conditions
SELECT Diagnosis, COUNT(*) AS Diagnosis_Count
FROM visit
GROUP BY Diagnosis
ORDER BY Diagnosis_Count DESC
LIMIT 5;

# 6. Follow-Up Rate
SELECT ROUND(COUNT(*) / (SELECT COUNT(*) FROM Visit) * 100, 2) AS Follow_Up_Rate
FROM Visit
WHERE `Follow Up Required` = 'Yes';

# 7. Average Treatment Cost Per Visit
SELECT ROUND(AVG(`Treatment Cost`), 2) AS Average_Treatment_Cost_Per_Visit
FROM Treatment;

# 8. Total Lab Test Conducted
SELECT COUNT(*) AS Total_Lab_Test
FROM Lab;

# 9. Percentage of Abnormal Lab Results
SELECT ROUND(COUNT(*) / (SELECT COUNT(*) FROM Lab) * 100, 2) AS Percentage_of_Abnormal_Lab_Results
FROM Lab
WHERE `Test Result` = 'Abnormal';

# 10. Doctor Workload (Average Patients Per Doctor)
SELECT ROUND(COUNT(*) / COUNT(DISTINCT `Doctor ID`), 2) AS Doctor_Workload
FROM Visit;

# 11. Total Revenue
SELECT ROUND(SUM("Treatment Cost") + SUM(Cost), 2) AS Total_Revenue
FROM Treatment;