-- How many students are in the dataset overall, and how many are international vs domestic?
--Total number of students
SELECT COUNT(*) AS total_students
FROM dbo.students_raw;


--International VS Domestic
SELECT
    inter_dom,
    COUNT(*) AS student_count
FROM dbo.students_raw
GROUP BY inter_dom;

--For international students only, what are the top 3 most common stay values?
SELECT TOP 3 COUNT(*) AS total_students, stay
FROM dbo.students_raw
WHERE Inter_dom = 'Inter'
GROUP BY stay
ORDER BY COUNT(stay) DESC;

-- For international students, what is the average PHQ-9 (todep) score for each length of stay (stay)?
-- (Group by stay, average todep, sort by stay.)
-- For international students, average PHQ-9 (todep) by length of stay
SELECT
    stay AS length_of_stay,
    ROUND(AVG(CAST(todep AS FLOAT)), 2) AS avg_todep
FROM dbo.students_raw
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY avg_todep DESC;

-- For international students, what is the average SCS (tosc) score for each length of stay (stay)?
SELECT
    stay AS length_of_stay,
    ROUND(AVG(CAST(tosc AS FLOAT)),2) AS avg_tosc
FROM dbo.students_raw
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;

-- Male and Female sucide pattern
SELECT
    gender,
    suicide,
    COUNT(*) AS student_count
FROM dbo.students_raw
GROUP BY gender, suicide
ORDER BY suicide DESC;

-- Suicide cases by gender (international students only)
SELECT
    gender,
    COUNT(*) AS suicide_cases
FROM dbo.students_raw
WHERE inter_dom = 'Inter'
  AND suicide = 'Yes'
GROUP BY gender
ORDER BY suicide_cases DESC;

-- Suicide cases by gender and student type

SELECT
    inter_dom,
    gender,
    COUNT(*) AS suicide_cases
FROM dbo.students_raw
WHERE suicide = 'Yes'
GROUP BY inter_dom, gender
ORDER BY inter_dom, suicide_cases DESC;

-- Suicide Rate

SELECT
    inter_dom,
    gender,
    COUNT(*) AS total_students,
    SUM(CASE WHEN suicide = 'Yes' THEN 1 ELSE 0 END) AS suicide_cases,
    ROUND(
        SUM(CASE WHEN suicide = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS suicide_rate_percent
FROM dbo.students_raw
WHERE inter_dom IN ('Inter', 'Dom')
GROUP BY inter_dom, gender
ORDER BY inter_dom, suicide_rate_percent DESC;

-- Return a table with nine rows and five columns.
-- The five columns should be aliased as: stay, count_int, average_phq, average_scs, and average_as, in that order.
-- The average columns should contain the average of the todep (PHQ-9 test), tosc (SCS test), and toas (ASISS test) columns for each length of stay, rounded to two decimal places.
-- The count_int column should be the number of international students for each length of stay.
-- Sort the results by the length of stay in descending order.

SELECT
    stay,
    COUNT(*) AS count_int,
    ROUND(AVG(CAST(todep AS FLOAT)), 2) AS average_phq,
    ROUND(AVG(CAST(tosc  AS FLOAT)), 2) AS average_scs,
    ROUND(AVG(CAST(toas  AS FLOAT)), 2) AS average_as
FROM dbo.students_raw
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY CAST(stay AS INT) DESC;

















