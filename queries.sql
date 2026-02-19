-- =====================================================
-- GLOBAL ENERGY & EMISSIONS ANALYSIS - SQL QUERIES
-- Database: ENERGYDB2
-- =====================================================


-- =====================================================
-- 1) Total Emission Per Country (Most Recent Year Available)
-- =====================================================

SELECT country,
       SUM(emission) AS total_emission
FROM emission_3
GROUP BY country
ORDER BY total_emission DESC
LIMIT 1;



-- =====================================================
-- 2) Top 5 Countries by GDP (Most Recent Year)
-- =====================================================

SELECT Country,
       value AS gdp
FROM gdp_3
WHERE year = (SELECT MAX(year) FROM gdp_3)
ORDER BY gdp DESC
LIMIT 5;



-- =====================================================
-- 3) Energy Production vs Consumption by Country & Year
-- =====================================================

SELECT 
    SUM(p.production) AS total_production,
    SUM(c.consumption) AS total_consumption,
    p.country,
    p.year
FROM production p
JOIN consumption c 
  ON p.country = c.country 
 AND p.year = c.year 
 AND p.energy = c.energy
GROUP BY p.country, p.year
ORDER BY p.country, p.year;



-- =====================================================
-- 4) Energy Types Contributing Most to Emissions
-- =====================================================

SELECT energy_type,
       SUM(emission) AS emission
FROM emission_3 
GROUP BY energy_type 
ORDER BY emission DESC;



-- =====================================================
-- 5) Year-over-Year Global Emission Growth
-- =====================================================

WITH yearly AS (
    SELECT year,
           SUM(emission) AS total_emissions
    FROM emission_3
    GROUP BY year
)

SELECT
    year,
    total_emissions,
    ROUND(
        (total_emissions - LAG(total_emissions) OVER (ORDER BY year))
        / NULLIF(LAG(total_emissions) OVER (ORDER BY year), 0) * 100,
        2
    ) AS yoy_growth_percent
FROM yearly
ORDER BY year;



-- =====================================================
-- 6) GDP Growth Trend by Country
-- =====================================================

SELECT country,
       year,
       SUM(value) AS gdp,
       ROUND(
           (SUM(value) - LAG(SUM(value)) OVER (PARTITION BY country ORDER BY year))
           / NULLIF(LAG(SUM(value)) OVER (PARTITION BY country ORDER BY year), 0) * 100,
           2
       ) AS yoy_growth_percent
FROM gdp_3
GROUP BY country, year
ORDER BY gdp DESC;



-- =====================================================
-- 7) Population Growth vs Emission Growth
-- =====================================================

SELECT 
    p.countries,
    p.year,
    p.value AS popu,
    SUM(e.emission) AS total_em,
    ROUND(
        (SUM(e.emission) - LAG(SUM(e.emission)) OVER (PARTITION BY p.countries ORDER BY p.year))
        / NULLIF(LAG(SUM(e.emission)) OVER (PARTITION BY p.countries ORDER BY p.year), 0) * 100,
        2
    ) AS yoy_emission_growth
FROM population p
JOIN emission_3 e 
  ON p.countries = e.country 
 AND p.year = e.year
GROUP BY p.countries, p.year, p.value
ORDER BY p.countries, p.year;



-- =====================================================
-- 8) Energy Consumption Trend for Major Economies
-- =====================================================

WITH top_economies AS (
    SELECT country
    FROM gdp_3
    GROUP BY country
    ORDER BY MAX(value) DESC
    LIMIT 5
),

country_year AS (
    SELECT
        con.country,
        con.year,
        SUM(con.consumption) AS total_consumption,
        gdp.value AS gdp
    FROM consumption con
    JOIN gdp_3 gdp 
      ON con.country = gdp.country 
     AND con.year   = gdp.year
    WHERE con.country IN (SELECT country FROM top_economies)
    GROUP BY con.country, con.year, gdp.value
)

SELECT
    country,
    year,
    total_consumption,
    gdp,
    total_consumption 
      - LAG(total_consumption) OVER (PARTITION BY country ORDER BY year) AS yoy_change
FROM country_year
ORDER BY country, year;



-- =====================================================
-- 9) Average Yearly Change in Per Capita Emissions
-- =====================================================

WITH yearly_change AS (
    SELECT 
        country,
        year,
        per_capita_emission,
        LAG(per_capita_emission) OVER (PARTITION BY country ORDER BY year) AS prev_year_emission,
        per_capita_emission 
          - LAG(per_capita_emission) OVER (PARTITION BY country ORDER BY year) AS changee
    FROM emission_3
)

SELECT 
    country,
    AVG(changee) AS avg_yearly_change
FROM yearly_change
WHERE changee IS NOT NULL
GROUP BY country
ORDER BY avg_yearly_change DESC;



-- =====================================================
-- 10) Emission-to-GDP Ratio by Country & Year
-- =====================================================

SELECT 
    e.country,
    e.year,
    SUM(e.emission) AS total_emission,
    g.value AS gdp,
    SUM(e.emission) / g.value AS emission_to_gdp_ratio
FROM emission_3 e
JOIN gdp_3 g 
  ON e.country = g.country 
 AND e.year = g.year
GROUP BY e.country, e.year, g.value
ORDER BY e.country, e.year;



-- =====================================================
-- 11) Energy Consumption Per Capita (Last Decade)
-- =====================================================

SELECT 
    c.country,
    c.year,
    c.total_consumption / p.value AS per_capita_En_Consumption
FROM (
    SELECT country,
           year,
           SUM(consumption) AS total_consumption
    FROM consumption
    GROUP BY country, year
) AS c
JOIN population p
  ON c.country = p.countries
 AND c.year = p.year
WHERE c.year >= 2015
ORDER BY c.country, c.year;



-- =====================================================
-- 12) Energy Production Per Capita
-- =====================================================

SELECT 
    p.country,
    p.year,
    total_production / pop.value AS percapita_production
FROM (
    SELECT country,
           year,
           SUM(production) AS total_production
    FROM production
    GROUP BY country, year
) AS p
JOIN population pop
  ON p.country = pop.countries
 AND p.year = pop.year;



-- =====================================================
-- 13) Energy Consumption Relative to GDP
-- =====================================================

WITH latest_year AS (
    SELECT MAX(year) AS max_year FROM consumption
),

country_agg AS (
    SELECT 
        c.country,
        SUM(c.consumption) AS total_consumption,
        SUM(g.value) AS total_gdp
    FROM consumption c
    JOIN gdp_3 g
      ON c.country = g.country 
     AND c.year = g.year
    JOIN latest_year ly
      ON c.year = ly.max_year
    GROUP BY c.country
)

SELECT 
    country,
    total_consumption,
    total_gdp,
    total_consumption / total_gdp AS consumption_per_gdp
FROM country_agg
WHERE total_gdp > 0
ORDER BY consumption_per_gdp DESC;



-- =====================================================
-- 14) GDP Growth Analysis
-- =====================================================

WITH gdp_growth AS (
    SELECT
        country,
        year,
        value AS gdp,
        LAG(value) OVER (PARTITION BY country ORDER BY year) AS prev_gdp,
        (value - LAG(value) OVER (PARTITION BY country ORDER BY year))
          / LAG(value) OVER (PARTITION BY country ORDER BY year) AS gdp_growth
    FROM gdp_3
)

SELECT * 
FROM gdp_growth
WHERE prev_gdp IS NOT NULL;



-- =====================================================
-- 15) Top 10 Countries by Population & Emission Comparison
-- =====================================================

WITH top_10 AS (
    SELECT countries,
           value AS popu
    FROM population
    WHERE year = 2024
    ORDER BY value DESC
    LIMIT 10
)

SELECT 
    t.countries,
    t.popu,
    SUM(e.emission) AS total_emission
FROM top_10 t
JOIN emission_3 e
  ON t.countries = e.country
GROUP BY t.countries, t.popu
ORDER BY t.popu DESC;



-- =====================================================
-- 17) Global Share (%) of Emissions by Country
-- =====================================================

SELECT 
    country,
    (SUM(emission) /
        (SELECT SUM(emission) FROM emission_3)
    ) * 100 AS emission_share
FROM emission_3
GROUP BY country;



-- =====================================================
-- 18) Global Average GDP, Emission & Population by Year
-- =====================================================

SELECT 
    g.year,
    AVG(g.value) AS avg_gdp,
    AVG(e.emission) AS avg_emission,
    AVG(p.Value) AS avg_population
FROM gdp_3 g
JOIN emission_3 e 
  ON g.country = e.country
 AND g.year = e.year
JOIN population p 
  ON g.country = p.countries
 AND g.year = p.year
GROUP BY g.year
ORDER BY g.year;
