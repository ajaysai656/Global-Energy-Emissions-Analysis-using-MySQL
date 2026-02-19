-- ==========================================
-- Database Creation
-- ==========================================

CREATE DATABASE ENERGYDB2;
USE ENERGYDB2;

-- ==========================================
-- 1. Country Table
-- ==========================================

CREATE TABLE country (
    CID VARCHAR(10) PRIMARY KEY,
    Country VARCHAR(100) UNIQUE
);

-- ==========================================
-- 2. Emission Table
-- ==========================================

CREATE TABLE emission_3 (
    country VARCHAR(100),
    energy_type VARCHAR(50),
    year INT,
    emission INT,
    per_capita_emission DOUBLE,
    FOREIGN KEY (country) REFERENCES country(Country)
);

-- ==========================================
-- 3. Population Table
-- ==========================================

CREATE TABLE population (
    countries VARCHAR(100),
    year INT,
    Value DOUBLE,
    FOREIGN KEY (countries) REFERENCES country(Country)
);

-- ==========================================
-- 4. Production Table
-- ==========================================

CREATE TABLE production (
    country VARCHAR(100),
    energy VARCHAR(50),
    year INT,
    production INT,
    FOREIGN KEY (country) REFERENCES country(Country)
);

-- ==========================================
-- 5. GDP Table
-- ==========================================

CREATE TABLE gdp_3 (
    Country VARCHAR(100),
    year INT,
    Value DOUBLE,
    FOREIGN KEY (Country) REFERENCES country(Country)
);

-- ==========================================
-- 6. Consumption Table
-- ==========================================

CREATE TABLE consumption (
    country VARCHAR(100),
    energy VARCHAR(50),
    year INT,
    consumption INT,
    FOREIGN KEY (country) REFERENCES country(Country)
);
