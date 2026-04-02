Northwind BI Case Study: Modernizing a Legacy Dataset

Overview

This project reimagines the classic Northwind dataset through a modern BI lens. Using SQL for data exploration and Power BI for modeling and visualization, the goal was to evaluate employee performance, geographic coverage, and operational reliability — while exposing structural issues in the original data model that limit meaningful analysis.

This case study demonstrates how legacy, snowflaked data can be transformed into a clean, analytics‑ready star schema that supports clear insights and business decision‑making.

🧱 Schema Redesign: From Snowflake to Star
The original Northwind dataset uses a snowflake schema, with product, category, employee, and order information spread across multiple normalized tables. While appropriate for transactional systems, this structure creates unnecessary complexity for BI tools.

To support clean analytics, the model was intentionally flattened into a star schema, consolidating related attributes into dimension tables and ensuring all measures flow from a single fact table.

Key transformations:
Merged Products and Categories into a single DimProduct

Combined Orders and Order Details into a clean FactSales

Treated Employees as a dimension rather than a snowflaked hierarchy

Removed unreliable geographic fields (Region/Territory)

Ensured all relationships are one‑to‑many, single‑direction, and unambiguous

📌 Insert screenshot here:  
/model/model.png (Power BI Model View)

🧪 SQL Exploration & Data Preparation
1. Total Sales by Employee
Validated revenue totals before building BI visuals.

📌 Insert screenshot:
/sql_screenshots/total_sales_by_employee.png

2. Countries Served per Employee
Count of distinct shipping countries handled by each rep.

📌 Insert screenshot:
/sql_screenshots/countries_served.png

3. Late Shipments
Identifies orders shipped after the RequiredDate.

📌 Insert screenshot:
/sql_screenshots/late_shipments.png

4. Late Shipment Percentage
Shows the percentage of each employee’s orders that shipped late.

📌 Insert screenshot:
/sql_screenshots/late_shipment_pct.png

5. Drill‑Down Query: Sales × Country × Employee
A multi‑CTE SQL query used to build the BI drill‑down visuals.

📌 Insert screenshot:
/sql_screenshots/drilldown_query.png

📈 Power BI Dashboards
1. Product Performance
Highlights revenue concentration by product category and employee.

📌 Insert screenshot:
/dashboards/product_performance.png

2. Employee Performance
Compares:

Total sales

Countries served

Average sales per country

Scatter plot showing efficiency differences

📌 Insert screenshot:
/dashboards/employee_performance.png

🚨 Operational Insight: Late Shipments
Late Shipments: A Visible Problem With No Actionable Root Cause
The dataset contains 58 late shipments, which initially appears to be a meaningful operational KPI. However, the dataset lacks a valid geographic hierarchy — Region and Territory fields are inconsistent and unusable.

Because of this, late‑shipment counts vary by employee, but we cannot determine:

whether delays are geographic

whether certain territories are underserved

whether workload distribution is uneven

whether logistics issues are localized

Without defined territories, the metric becomes descriptive but not diagnostic.

📦 Missing DeliveredDate Limits True Delivery Analysis
While we can identify late shipments, we cannot measure late deliveries, which is the metric that impacts customers.

The dataset does not include a DeliveredDate field, preventing the business from answering:

Were orders delivered on time even if they shipped late?

Which routes or regions experience the most delivery delays?

Are certain carriers underperforming?

Are customers in specific countries disproportionately affected?

To build meaningful logistics KPIs, the business must begin capturing DeliveredDate at the order or shipment level.

🧭 Why Territory Redesign Is Required
The existing geographic fields in Northwind are not usable for performance analysis.
To enable:

fair employee comparisons

territory‑based KPIs

delivery performance metrics

workload balancing

regional forecasting

…the business must implement a clean, consistent territory model.

This project demonstrates how the lack of a proper geographic hierarchy limits operational insight — and why BI teams must validate data structures before building KPIs.

📂 Repository Structure
Code
/sql_screenshots
    total_sales_by_employee.png
    countries_served.png
    late_shipments.png
    late_shipment_pct.png
    drilldown_query.png

/model
    model.png

/dashboards
    product_performance.png
    employee_performance.png

README.md
Northwind.pbix
✔️ Summary
This project demonstrates:

Strong SQL exploration

Clean BI modeling

Schema redesign from snowflake to star

Insight‑driven dashboard design

Identification of structural data issues

Clear communication of business limitations

Recommendations for data governance improvements
