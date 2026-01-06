# Student Mental Health Analysis (SQL)

## 📌 Project Overview
This project explores the mental health of university students, with a focus on how **length of stay** and **student type (international vs domestic)** relate to mental health outcomes.

The analysis was completed using **SQL (SQL Server)** as part of a DataCamp-style exploratory project.

---

## 📊 Dataset
The dataset contains survey responses from students, including:
- Demographics (gender, region, student type)
- Length of stay
- Mental health diagnostic scores:
  - **PHQ-9** (Depression)
  - **SCS** (Social Connectedness)
  - **ASISS** (Anxiety / Stress)
- Support indicators (friends, parents, internet, etc.)

---

## 🎯 Key Questions Answered
- How many students are international vs domestic?
- How does length of stay impact average mental health scores?
- Are suicide rates different by gender?
- Do suicide rates differ between international and domestic students?
- How do rates compare after controlling for group size?

---

## 🧠 Key Insights
- International students report higher suicidal ideation rates than domestic students.
- Among international students, females show higher reported suicide rates than males.
- Rate-based analysis was used instead of raw counts to account for unequal group sizes.
- Length of stay shows variation in average mental health scores.

---

## 🛠️ SQL Techniques Used
- Filtering with `WHERE`
- Aggregations using `COUNT`, `AVG`, `SUM`
- Conditional aggregation with `CASE WHEN`
- Rate calculation
- Data cleaning (handling NULLs and invalid values)
- Sorting numeric values stored as text

---

## 📌 Example Query
```sql
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
