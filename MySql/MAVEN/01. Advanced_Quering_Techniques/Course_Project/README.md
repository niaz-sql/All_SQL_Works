
# ⚾ Advanced MySQL Analytics Project
School, Salary & Player Career Analysis
📌 Project Overview

This project is a comprehensive data analysis case study built using MySQL 8+.

The goal was to analyze historical player, team, school, and salary data to uncover meaningful trends and insights across multiple dimensions.

All analysis was performed using advanced SQL only, without external analytics tools.

###  Skills & Techniques Demonstrated

✅ CTEs (Common Table Expressions)

✅ Window Functions (ROW_NUMBER, DENSE_RANK, NTILE)

✅ Running Totals (Cumulative Sum)

✅ Percentile Analysis (Top 20%)

✅ Top-N per Group Problems

✅ Date & Age Calculations (TIMESTAMPDIFF)

✅ Decade Calculations (FLOOR(year/10)*10)

✅ Complex Joins

✅ Advanced Aggregations

✅ Business-Oriented SQL Analysis

## 📂 Project Breakdown
### 🎓PART I 🎓School Analysis
Key Questions Solved

1. Reviewed school and school details tables

2. Calculated how many schools produced players per decade

3. Identified the Top 5 schools overall producing the most players

4. Determined the Top 3 schools per decade using ranking window functions

5. Techniques Used

6. COUNT(DISTINCT)

7. Decade calculation with FLOOR()

8. DENSE_RANK() for Top-N per group

9. CTE structuring

### 🎓 PART II Salary Analysis
Key Questions Solved

1. Explored team salary data

2. Identified the Top 20% highest spending teams using NTILE()

3. Calculated cumulative team spending over time

4. Determined the first year each team surpassed $1 Billion in cumulative spending

5. Techniques Used

6. NTILE() for percentile grouping

7. Running totals with SUM() OVER

8. Threshold milestone detection

9. Window function partitioning

### 🧑‍💼 PART III — Player Career Analysis
Key Questions Solved

1. Counted total players in the dataset

2. Calculated:

3. Age at debut

4. Age at final game

5. Career length (years)

6. Identified each player's starting and ending team

7. Counted players who:

8. Started and ended on the same team

9. Played more than 10 years

10. Techniques Used

11. TIMESTAMPDIFF() for accurate age calculation

12. Multi-table joins

13. Career duration logic

14. Conditional filtering

### 📊 PART IV — Player Comparison Analysi
Key Questions Solved

1. Identified players sharing the same birthday

2. Created team-level batting hand percentage breakdown

3. Analyzed trends in:

4. Average height at debut

5. Average weight at debut

6. Calculated decade-over-decade changes

7. Techniques Used

8. Window functions

9. Percentage calculations

10. Decade grouping

11. Trend analysis

12. Grouped aggregations

# 📈 Analytical Highlights

✔ Implemented scalable SQL pipelines
✔ Solved real-world percentile problems
✔ Used ranking logic for competitive comparisons
✔ Applied milestone detection in financial data
✔ Performed demographic trend analysis
✔ Structured queries in modular, readable format

🗂 Project Structure
Course_Project/
│
├── final_project_DB_mysql.sql
├── final_project_solved.sql
└── README.md


final_project_DB_mysql.sql → full DataBase. I could not upload it as its big size. Kindly download it (large file; may not preview on GitHub)

final_project_solved.sql → The solution I made

### ⚙️ Requirements

MySQL 8+

Window function support enabled

### 🚀 How to Run This Project

Create a new MySQL database using final_project_DB_mysql.sql to create tables

check solution at final_project_solved.sql

### 💼 Real-World Relevance

This project simulates practical data analytics tasks such as:

✅ Institutional performance benchmarking

✅ Financial trend analysis

✅ Player lifecycle analysis

✅ Competitive ranking evaluation

✅ Demographic trend reporting

✅ Applicable to roles in:

✅ Data Analytics

✅ Business Intelligence

✅ Financial Analysis

✅ Sports Analytics

✅Freelance SQL Consulting

# 🎯 Author Note

This project demonstrates advanced SQL capabilities suitable for real-world analytical problem solving and freelance data work.