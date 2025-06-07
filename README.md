# World Bank Global Development Dashboard

An interactive end-to-end Business Intelligence (BI) project that transforms raw World Bank economic and development data into meaningful insights using PostgreSQL, Python (Pandas), and Power BI. The dashboard allows users to explore trends, compare countries, and visualize progress toward development goals from 2000 to 2023.

---

## Dashboard Overview

The Power BI dashboard is structured across 4 interactive pages:

1. **Global Overview**  
   A high-level snapshot of key development indicators across all countries, featuring KPIs, time series, and global comparisons.

2. **Indicator Trends & Country Comparisons**  
   Drill down into specific indicators, compare trends across countries, and explore patterns over time.

3. **Regional & Income Group Analysis**  
   Analyze how indicators vary across world regions and income levels using clustered bar charts and summary tables.

4. **Forecast & Strategic Insights**  
   Project future trends with a custom DAX-based forecasting model and visualize expected growth for development indicators.

---

## Tech Stack

- Data Source: World Bank Open Data  
- Data Cleaning & Transformation: Python (Pandas)  
- Data Warehouse: PostgreSQL with a Star Schema (fact and dimension tables)  
- Visualization: Power BI (including custom DAX measures, slicers, and dynamic visuals)  
- Version Control: Git & GitHub

---

## Data Model (Star Schema)

- Fact Table: `fact_economic_indicators`
- Dimension Tables:
  - `dim_country` (country name, code, region)
  - `dim_indicator` (indicator name, code)
  - `dim_year` (year ID and value)

---

## Project Structure

```bash
world-bank-dashboard/
├── data/
│   └── wdi_series_metadata.csv
├── world_bank_dashboard.ipynb             # Python ETL notebook
├── world_bank_dashboard_schema.sql        # SQL for creating and populating schema
├── Postgres_PowerBI_World_Bank_Data.pbix  # Power BI dashboard
├── README.md
