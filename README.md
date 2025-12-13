# 2Market: Retail sales, demographic and advertising effectiveness analysis
June 2025

Grade: Distinction
# Context/Business Questions

Retail sales analysis using Tableau dashboards and business intelligence reporting
Date: June 2025
Tools Used: Excel, SQL (PostgreSQL), Tableau, PowerPoint

2Market is a global supermarket chain operating in eight countries with both physical and online storefronts.
The purpose of this analytics project is to help the business understand:

- Who are their customers (demographics: age, marital status etc)

- Which product categories generate the most revenue

- How demographics influence purchasing patterns

- Which advertising channels are most effective

- How customer behaviour varies by geography


# Data Cleaning & Preparation

The raw CSV was imported into Excel and cleaned extensively:

Standardised formatting, removed duplicates and inconsistencies

Created calculated fields such as Age and Total_Spend

Cleaned date formats, removed invalid ages (124+ years)

Resolved inconsistent/erroneous labels in Marital_Status

Identified income outliers and adjusted analysis accordingly

Updated product category names for clarity

Imported cleaned data into PostgreSQL for analysis

# Database Structure

The project uses two PostgreSQL tables:

Marketing_Data

Includes demographics, purchase details, and customer behaviour metrics such as:
Age, Income, Total_Spend, Education, Marital_Status, Country, Kids/Teens, product category spend, and more.

ad_data

Contains binary indicators showing whether a customer was exposed to each advertising channel:
Twitter, Instagram, Bulkmail, Facebook, Brochure

# Analytical Approach (SQL)

SQL was used to:

Calculate revenue by country

Identify top product categories globally and by country

Analyse purchasing behaviour across demographics

Evaluate which advertising methods drive the most successful customer responses

Combine exposure + conversion metrics to determine channel effectiveness

Segment customers by marital status and presence of children/teens

Assign customers a simplified Media label for deeper spend comparisons

Example SQL tasks included:

Use of GREATEST() and LEAST() to identify best/worst performing product categories and ad channels

Multi-table joins to combine demographic and advertising data

CASE logic for categorising customers

Aggregations to compute spend patterns, averages, and customer counts

# Tableau Dashboard

The Tableau dashboard (included as .twbx) includes:

Customer age distribution

Marital status & education breakdowns

Income distributions

Geographic map of customer locations & density

Revenue and product category performance

Advertising channel effectiveness summaries

The design uses a calm blue palette with clear typography to support executive-level presentations.

# Key Insights
📌 Customer Demographics

Customer ages range from 28 to 84, average age 55

Majority are married or living with a partner

Most customers have a graduate-level education or higher

📌 Product Sales

Alcohol is the top-selling category, accounting for 50% of sales

Followed by meat, fish, and commodities

Vegetables and chocolate are the lowest performers

This trend is consistent across most countries

📌 Geographic Insights

Spain: largest customer base + highest revenue

Germany: highest average spend per customer

Montenegro: extremely low customer count → potential market concern

📌 Advertising Effectiveness

Twitter is the most successful advertising channel overall

Followed by Instagram and Facebook

Bulk email surprisingly performs well among single customers

Brochure advertising is consistently the least effective

# Recommendations

Increase inventory in high-revenue categories like Alcohol and Meat

Invest more in high-performing ad channels (Twitter, Instagram)

Scale back brochure advertising

Consider targeted bulk email campaigns for specific demographics

Reevaluate investment in underperforming markets like Montenegro

Tailor campaigns using customer segmentation by age, income, and education
