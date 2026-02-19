# 🌍 Global Energy & Emissions Analysis (MySQL)

## 📌 Project Overview

This project presents a structured relational analysis of global **energy consumption, emissions, GDP, and population data** using MySQL.

The objective was to design a relational database and extract meaningful analytical insights through advanced SQL queries. The project focuses on understanding the relationship between economic growth, energy usage, population trends, and environmental impact.

This work demonstrates practical database design and analytical problem-solving using structured query language (SQL).

---

## 🏗️ Database Architecture

A relational schema was designed to ensure data consistency and analytical flexibility.

### Core Tables

- `country`
- `emission_3`
- `gdp_3`
- `population`
- `production`
- `consumption`

### Design Principles Applied

- Primary Keys & Foreign Keys
- Referential Integrity
- Logical separation of economic and environmental data
- Year-based time-series structuring
- Structured relational joins across multiple tables

An ER Diagram is included in the repository.

---

## 🛠️ Technology Stack

- **Database:** MySQL  
- **Language:** SQL  

### SQL Concepts Used

- INNER JOIN
- GROUP BY & HAVING
- Aggregate functions (SUM, AVG)
- Subqueries
- Common Table Expressions (CTEs)
- Window functions (LAG)
- Ratio calculations
- Per capita metrics
- Year-over-year growth analysis

---

## 🎯 Analytical Objectives

The database was queried to answer high-impact analytical questions across multiple dimensions.

### 1️⃣ Comparative & Trend Analysis

- Total emissions per country (latest year)
- Top 5 countries by GDP
- Energy production vs consumption comparison
- Year-over-year global emission growth
- GDP growth trend by country
- Population growth vs emission growth analysis

### 2️⃣ Ratio & Efficiency Analysis

- Emission-to-GDP ratio
- Emissions per capita
- Energy consumption per capita
- Energy production per capita
- Energy consumption relative to GDP
- Average yearly change in per capita emissions

### 3️⃣ Global Impact Assessment

- Global share (%) of emissions by country
- Countries reducing per capita emissions
- Correlation between GDP growth and energy production growth
- Top population countries vs emission comparison
- Global averages of GDP, emissions, and population by year

---

## 📊 Key Insights

- Emissions are highly concentrated among a small number of major economies.
- Economic growth shows a strong relationship with energy production and consumption.
- Global emissions have generally increased over time, driven by industrial and population growth.
- Some countries demonstrate improved efficiency through lower emission intensity.
- Per capita metrics reveal differences in environmental impact across economies.

---

## 💡 Skills Demonstrated

- Relational database modeling
- Schema design with foreign key relationships
- Multi-table joins and aggregations
- Time-series and trend analysis
- Window function usage (LAG)
- Ratio and per capita metric engineering
- Translating analytical questions into structured SQL queries

---

## 📂 Repository Structure

```
/schema.sql
/queries.sql
/ER_diagram.png
/dataset/
/analysis_summary_
