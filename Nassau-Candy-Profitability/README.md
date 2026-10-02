# Nassau Candy: Product Line Profitability & Margin Analysis

An interactive business analytics dashboard built with Python, Pandas, Matplotlib, and Streamlit to analyze product-level profitability, margins, and performance across Nassau Candy's Chocolate, Sugar, and Other divisions.

🔗 **Live App:** https://candy-profitability.streamlit.app

## Tools Used
- Python
- Pandas
- Matplotlib
- Streamlit

## Problem Statement
Nassau Candy operates across multiple product divisions, but not all products contribute equally to overall profitability. The objective of this project is to analyze transaction-level sales data, identify the products and divisions driving profit, and uncover opportunities to improve margins and product-line performance.

The analysis focuses on understanding **sales, profit, profit margins, product contribution, and divisional performance** to support data-driven business decisions.

---

## Key Findings
### 1. Profit is highly concentrated among a small number of products

The analysis shows that the **top 5 Wonka Bars products contribute approximately 95% of the total profit** within the analyzed product line.

This highlights a significant concentration of profitability, where a relatively small number of products generate the majority of the division's profit.

### 2. Kazookles shows a strong profit margin

**Kazookles** has the **lowest Gross Margin % across all 15 products — just 7.69%**.

This is significantly lower than the top-performing products, which have Gross Margins of around **65–71%**. Despite this low margin, Kazookles ranks **6th highest in Sales at ₹1,205.75**, meaning it is still generating meaningful sales volume.

This suggests a potential **pricing or cost-structure issue**, making Kazookles a product worth reviewing for **repricing or cost renegotiation**.

### 3. Significant margin differences exist across divisions

The **Other division** shows a noticeable margin gap compared with the stronger-performing product lines.

This indicates that revenue alone does not provide a complete picture of business performance. Examining profit margins at both the **product and division level** helps identify areas where pricing, costs, or product mix may need further attention.

---

## Methodology

The project started by cleaning and preparing the transaction-level dataset using **Pandas**. The data was checked for missing values, inconsistent data types, duplicate records, and other issues that could affect the analysis.

After cleaning, additional business metrics and KPIs were created, including:

- Total Sales
- Total Cost
- Total Profit
- Profit Margin %
- Product-level Profit
- Division-level Sales
- Division-level Profit
- Product contribution to overall profit

The analysis was then performed across the **Chocolate, Sugar, and Other** divisions to identify the products and product groups contributing most significantly to revenue and profitability.

Finally, the results were transformed into an interactive **Streamlit dashboard**, allowing users to explore profitability and margin performance through visualizations and key performance indicators.

---

## Dashboard Screenshots
<img width="1025" height="877" alt="image" src="https://github.com/user-attachments/assets/664fab4d-0c02-4c80-9a3c-6d9fda9ccefe" />
<img width="1035" height="601" alt="image" src="https://github.com/user-attachments/assets/c2d2f929-2330-40b4-af57-960c282cc89b" />
<img width="1017" height="553" alt="image" src="https://github.com/user-attachments/assets/6dc1f473-6a1f-4d5f-826d-e0ab75efe039" />




## Dataset
**Source:** Course dataset

The dataset contains **10,194 transactions** across three major divisions:

- 🍫 Chocolate
- 🍬 Sugar
- 📦 Other

### Data Coverage

**January 2024 – December 2025**

The dataset provides transaction-level information that enables analysis of sales, costs, profitability, and margins across different products and divisions.

---
