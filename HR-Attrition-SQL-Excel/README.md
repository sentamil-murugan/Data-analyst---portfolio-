# HR Employee Attrition Analysis

SQL + Excel analysis of the IBM HR Employee Attrition dataset (1,470 employees) 
to identify what drives employee attrition and where the company should focus retention efforts.

## Summary
Overall attrition rate is 16.1%, heavily concentrated in a specific persona: 
young, single, underpaid Sales Representatives working overtime with long commutes.

## Key Findings
1. **Job Role** — Sales Representatives leave at 39.8% vs 2.5% for Research Directors (16x gap)
2. **OverTime** — 30.5% vs 10.4% for non-overtime employees
3. **Age Group** — 18-24 year-olds leave at 39.2% vs 10.1% for 35-44 year-olds
4. **Work-Life Balance** — "Bad" balance sees 31.3% attrition vs 14.2% for "Better"
5. **Marital Status** — Singles leave at 25.5% vs 10.1% for divorced employees
6. **Salary** — Lowest earners leave at 20.1% vs 3.8% for top earners
7. **Distance From Home** — 27.4% attrition at 21-25km commute vs 13.8% at 1-5km
8. **Years in Current Role** — 29.9% attrition under 1 year in-role, dropping to 7.7% at 11-15 years

## Recommendations
- Review overtime policy and workload distribution, especially in Sales
- Audit entry-level compensation, particularly for Sales Representatives
- Strengthen onboarding/support in the first year of any role or promotion
- Consider remote/hybrid flexibility for employees with long commutes

## Tools Used
- **SQL (SQLite)** — 17 business questions covering aggregation, CASE bucketing, and subqueries
- **Excel** — dashboard with KPI cards and 8 visualizations

## Files
- `queries.sql` — all SQL queries used in the analysis
- `HR_Attrition_Dashboard.xlsx` — interactive Excel dashboard
- `dashboard_preview.png` — dashboard screenshot

## Dashboard Preview
![Dashboard](dashboard_preview.png)
