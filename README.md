# 🌍 Global Energy & Emissions Analysis (MySQL)

## 📌 Project Overview

This project presents a structured relational analysis of global **energy consumption, emissions, GDP, and population data** using MySQL.

The objective was to design a normalized relational database and extract meaningful analytical insights through advanced SQL queries.

This project demonstrates strong fundamentals in:

- Relational database design
- Analytical SQL querying
- Data modeling
- Ratio & per capita analysis
- Translating business questions into structured queries

---

## 🏗️ Database Architecture

A normalized relational schema was designed to ensure data consistency and analytical flexibility.

### Core Tables

- `country`
- `population`
- `gdp`
- `energy_production`
- `energy_consumption`
- `emissions`

### Design Principles Applied

- Primary Keys & Foreign Keys
- Referential Integrity
- Normalization (reducing redundancy)
- Time-series structuring using Year dimension
- Logical separation of economic & environmental indicators

An ER Diagram is included in the repository.

---

## 🛠️ Technology Stack

- **Database:** MySQL  
- **Language:** SQL  

### SQL Concepts Used

- INNER JOIN & LEFT JOIN
- GROUP BY & HAVING
- Aggregate functions (SUM, AVG, COUNT)
- Subqueries
- Derived tables
- Window functions
- Ratio calculations
- Per capita metrics
- Trend analysis

---

## 🎯 Analytical Objectives

The database was queried to answer high-impact analytical questions across three major dimensions:

---

### 1️⃣ Comparative & Trend Analysis

- Total emissions per country (latest available year)
- Top 5 countries by GDP
- Energy production vs consumption comparison
- Year-over-year global emission trends
- GDP growth trend by country
- Population growth vs emission growth analysis

---

### 2️⃣ Ratio & Efficiency Analysis

- Emission-to-GDP ratio
- Emissions per capita
- Energy consumption per capita
- Energy production per capita
- Energy consumption relative to GDP
- Average yearly change in per capita emissions

---

### 3️⃣ Global Impact Assessment

- Global share (%) of emissions by country
- Countries improving per capita emission efficiency
- Correlation between GDP growth and energy production growth
- Top population countries vs emission comparison
- Global averages of GDP, emissions, and population by year

---

## 📊 Key Insights

- Emissions are concentrated among a small number of major economies.
- GDP growth shows strong correlation with energy production and consumption.
- Global emissions have increased over time due to industrial expansion.
- Some economies demonstrate improved energy efficiency through declining emission intensity.
- Population growth significantly impacts total emissions.

---

## 💡 Skills Demonstrated

✔ Relational database modeling  
✔ Schema design & normalization  
✔ Writing complex multi-table JOIN queries  
✔ Aggregation & analytical computation  
✔ Ratio engineering & per capita calculations  
✔ Structured problem-solving using SQL  
✔ Translating analytical questions into database queries  

---

## 📂 Repository Structure

```
/schema.sql
/queries.sql
/ER_diagram.png
/dataset/
/analysis_summary.md
```

---

## 🚀 Future Enhancements

- Integration with Power BI for dashboard visualization
- Python (Pandas + Matplotlib) integration
- Predictive modeling for emission forecasting
- Query performance optimization using indexing
- Cloud-based MySQL deployment

---

## 📎 Conclusion

This project highlights the interconnected nature of global energy consumption, economic growth, and environmental impact.

By leveraging MySQL and relational database design, the project transforms structured datasets into actionable analytical insights, demonstrating practical database and analytical capabilities.

