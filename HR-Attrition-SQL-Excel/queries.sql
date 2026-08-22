/* ============================================================
   HR EMPLOYEE ATTRITION ANALYSIS — SQL QUERIES
   Dataset: IBM HR Employee Attrition (1,470 employees)
   Tool: SQLite
   ============================================================ */


/* Q1: Which age group has the highest attrition? */
SELECT 
  CASE 
    WHEN age < 25 THEN '18-24'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
    WHEN age > 54 THEN '54+'
  END AS agegroup,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY agegroup
ORDER BY round_perc DESC;


/* Q2: Does Business Travel frequency affect attrition? */
SELECT 
  businesstravel,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS attrition_perc
FROM HREmployeeAttrition
GROUP BY businesstravel
ORDER BY attrition_perc DESC;


/* Q3: Which department has the highest attrition? */
SELECT 
  department,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY department
ORDER BY round_perc DESC;


/* Q4: Does distance from home affect attrition? */
SELECT 
  CASE 
    WHEN distancefromhome BETWEEN 1 AND 5 THEN '1-5'
    WHEN distancefromhome BETWEEN 6 AND 10 THEN '6-10'
    WHEN distancefromhome BETWEEN 11 AND 15 THEN '11-15'
    WHEN distancefromhome BETWEEN 16 AND 20 THEN '16-20'
    WHEN distancefromhome BETWEEN 21 AND 25 THEN '21-25'
    WHEN distancefromhome > 25 THEN '25+'
  END AS distancegroup,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY distancegroup
ORDER BY round_perc DESC;


/* Q7 / Q20: Does Environment Satisfaction affect attrition?
   1 = Low, 2 = Medium, 3 = High, 4 = Very High */
SELECT 
  CASE environmentsatisfaction
    WHEN 1 THEN 'Low'
    WHEN 2 THEN 'Medium'
    WHEN 3 THEN 'High'
    WHEN 4 THEN 'Very High'
  END AS env_satisfaction,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY env_satisfaction
ORDER BY round_perc DESC;


/* Q8: Which gender leaves the most? */
SELECT 
  gender,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS gender_perc
FROM HREmployeeAttrition
GROUP BY gender
ORDER BY gender_perc DESC;


/* Q11: Does Job Level affect attrition? */
SELECT 
  joblevel,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY joblevel
ORDER BY round_perc DESC;


/* Q12: Which Job Role has the highest attrition? */
SELECT 
  jobrole,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY jobrole
ORDER BY round_perc DESC;


/* Q13: Does marital status affect attrition? */
SELECT 
  maritalstatus,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY maritalstatus
ORDER BY round_perc DESC;


/* Q14: Does monthly income affect attrition? */
SELECT 
  CASE 
    WHEN monthlyincome BETWEEN 1009 AND 5550 THEN '1000-5550'
    WHEN monthlyincome BETWEEN 5550 AND 10000 THEN '5550-10000'
    WHEN monthlyincome BETWEEN 10000 AND 15000 THEN '10000-15000'
    WHEN monthlyincome > 15000 THEN '15000+'
  END AS salary,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY salary
ORDER BY round_perc DESC;


/* Q15: Does working overtime affect attrition? */
SELECT 
  overtime,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY overtime;


/* Q16: Does performance rating affect attrition?
   Note: IBM dataset only contains ratings 3 (Excellent) and 4 (Outstanding) */
SELECT 
  CASE performancerating
    WHEN 3 THEN 'Excellent'
    WHEN 4 THEN 'Outstanding'
  END AS performance,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY performance
ORDER BY round_perc DESC;


/* Q17: Does relationship satisfaction affect attrition?
   1 = Low, 2 = Medium, 3 = High, 4 = Very High */
SELECT 
  CASE relationshipsatisfaction
    WHEN 1 THEN 'Low'
    WHEN 2 THEN 'Medium'
    WHEN 3 THEN 'High'
    WHEN 4 THEN 'Very High'
  END AS rel_satisfaction,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY rel_satisfaction
ORDER BY round_perc DESC;


/* Q19: Does the number of training sessions affect attrition? */
SELECT 
  CASE 
    WHEN trainingtimeslastyear < 1 THEN 'zero'
    WHEN trainingtimeslastyear BETWEEN 1 AND 2 THEN '1-2'
    WHEN trainingtimeslastyear BETWEEN 3 AND 4 THEN '3-4'
    WHEN trainingtimeslastyear BETWEEN 5 AND 6 THEN '5-6'
  END AS traininghr,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY traininghr
ORDER BY round_perc DESC;


/* Q20: Does work-life balance affect attrition?
   1 = Bad, 2 = Good, 3 = Better, 4 = Best */
SELECT 
  CASE worklifebalance
    WHEN 1 THEN 'Bad'
    WHEN 2 THEN 'Good'
    WHEN 3 THEN 'Better'
    WHEN 4 THEN 'Best'
  END AS worklifebalance_label,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY worklifebalance_label
ORDER BY round_perc DESC;


/* Q21: Does total working experience (years) affect attrition? */
SELECT 
  CASE 
    WHEN totalworkingyears < 1 THEN 'zero hours'
    WHEN totalworkingyears BETWEEN 1 AND 12 THEN '1-12'
    WHEN totalworkingyears BETWEEN 12 AND 24 THEN '12-24'
    WHEN totalworkingyears BETWEEN 25 AND 37 THEN '25-37'
    WHEN totalworkingyears > 37 THEN '37+'
  END AS workinghr,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY workinghr
ORDER BY round_perc DESC;


/* Q21b: Does years in current role affect attrition? */
SELECT 
  CASE 
    WHEN yearsincurrentrole < 1 THEN 'below 1'
    WHEN yearsincurrentrole BETWEEN 1 AND 5 THEN '1-5'
    WHEN yearsincurrentrole BETWEEN 6 AND 10 THEN '6-10'
    WHEN yearsincurrentrole BETWEEN 11 AND 15 THEN '11-15'
    WHEN yearsincurrentrole BETWEEN 16 AND 18 THEN '16-18'
  END AS yearsincurrent,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY yearsincurrent
ORDER BY round_perc DESC;


/* Q23: Does time since last promotion affect attrition? */
SELECT 
  CASE 
    WHEN yearssincelastpromotion = 0 THEN '0 (this year)'
    WHEN yearssincelastpromotion BETWEEN 1 AND 3 THEN '1-3'
    WHEN yearssincelastpromotion BETWEEN 4 AND 6 THEN '4-6'
    WHEN yearssincelastpromotion BETWEEN 7 AND 9 THEN '7-9'
    WHEN yearssincelastpromotion > 9 THEN '10+'
  END AS promo_group,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY promo_group
ORDER BY round_perc DESC;


/* Q24: Does years with current manager affect attrition? */
SELECT 
  CASE 
    WHEN yearswithcurrmanager < 1 THEN 'below 1'
    WHEN yearswithcurrmanager BETWEEN 1 AND 5 THEN '1-5'
    WHEN yearswithcurrmanager BETWEEN 6 AND 10 THEN '6-10'
    WHEN yearswithcurrmanager BETWEEN 11 AND 15 THEN '11-15'
    WHEN yearswithcurrmanager BETWEEN 16 AND 17 THEN '16-17'
  END AS currentmanager,
  COUNT(*) AS total,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leftcount,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS round_perc
FROM HREmployeeAttrition
GROUP BY currentmanager
ORDER BY round_perc DESC;


/* ============================================================
   Overall attrition rate (used as dashboard KPI)
   ============================================================ */
SELECT 
  COUNT(*) AS total_employees,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS total_left,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS overall_attrition_rate
FROM HREmployeeAttrition;
