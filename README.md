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

![Star Schema](https://github.com/celiamriggs-BI/northwind-sales-analytics/blob/main/BI%20PROJECT%20Screenshots/star%20schema.png?raw=true)

🧪 SQL Exploration & Data Preparation
1. Total Sales by Employee
Validated revenue totals before building BI visuals.

![Total Sales by Employee](https://github.com/celiamriggs-BI/northwind-sales-analytics/blob/main/BI%20PROJECT%20SQL/employees%20ranked%20by%20sales.png?raw=true)


2. Countries Served per Employee
Count of distinct shipping countries handled by each rep.

![Countries Served by Employee](https://github.com/celiamriggs-BI/northwind-sales-analytics/blob/main/BI%20PROJECT%20SQL/employees%20and%20countries%20serviced%20-%20ranked.png?raw=true)


3. Late Shipments
Identifies orders shipped after the RequiredDate.

![Late Shipments](https://github.com/celiamriggs-BI/northwind-sales-analytics/blob/main/BI%20PROJECT%20SQL/late%20shipments%20per%20employee.png?raw=true)

4. Late Shipment Percentage
Shows the percentage of each employee’s orders that shipped late.

![Late Shipment Percentage](https://github.com/celiamriggs-BI/northwind-sales-analytics/blob/main/BI%20PROJECT%20SQL/percentage%20of%20late%20orders.png?raw=true)

5. Drill‑Down Query: Sales × Country × Employee
A multi‑CTE SQL query used to build the BI drill‑down visuals.

![Drill-Down Query](https://github.com/celiamriggs-BI/northwind-sales-analytics/blob/main/BI%20PROJECT%20SQL/average%20sales%20per%20country%20per%20employee.png?raw=true)


📈 Power BI Dashboards
1. Category Performance
Highlights revenue concentration by product category and employee.

![Category Performance](https://github.com/celiamriggs-BI/northwind-sales-analytics/blob/main/BI%20PROJECT%20Screenshots/region%20by%20category.png?raw=true)

2. Employee Performance
Compares:

Total sales

Countries served

Average sales per country

Scatter plot showing efficiency differences

![Employee Performance](https://github.com/celiamriggs-BI/northwind-sales-analytics/blob/main/BI%20PROJECT%20Screenshots/region%20by%20country.png?raw=true)

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
/BI_Project_SQL
    Average_Sales_per_country_per_employee.png
    Checking_For_Late_Shipments.png
    Count_Employees.png
    countries_we_service.png
    employee_servicing_each_country_count.png
    employees_and_countries_serviced-ranked.png
    employees_grouped_by_Country_to_figure_out_regions.png
    employees_ranked_by_sales.png
    percentage_of_late_orders.png
   
/BI_Project_Screenshots
    Executive_overview.png
    measures_and_relationships.png
    region_by_category.png
    Region_by_country.png
    star_schema.png

README.md
Northwind_Territory_Strategy_Summary.pbix
average_sales_per_country_per_employee.sql
✔️ Summary
This project demonstrates:

Strong SQL exploration

Clean BI modeling

Schema redesign from snowflake to star

Insight‑driven dashboard design

Identification of structural data issues

Clear communication of business limitations

Recommendations for data governance improvements
