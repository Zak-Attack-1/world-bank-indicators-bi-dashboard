-- Create tables
CREATE TABLE dim_country (
    country_id SERIAL PRIMARY KEY,
    country_name TEXT,
    country_code TEXT
);

CREATE TABLE dim_indicator (
    indicator_id SERIAL PRIMARY KEY,
    indicator_name TEXT,
    indicator_code TEXT
);

CREATE TABLE dim_year (
    year INT PRIMARY KEY
);

CREATE TABLE fact_economic_indicators (
    fact_id SERIAL PRIMARY KEY,
    country_id INT REFERENCES dim_country(country_id),
    indicator_id INT REFERENCES dim_indicator(indicator_id),
    year_id INT REFERENCES dim_year(year),
    value NUMERIC
);

-- Populate dimensions
INSERT INTO dim_country (country_name, country_code)
SELECT DISTINCT country_name, country_code FROM world_bank_data;
INSERT INTO dim_indicator (indicator_name, indicator_code)
SELECT DISTINCT series_name, series_code FROM world_bank_data;
INSERT INTO dim_year (year)
SELECT DISTINCT year FROM world_bank_data;

-- Populate fact table
INSERT INTO fact_economic_indicators (country_id, indicator_id, year_id, value)
SELECT dc.country_id, di.indicator_id, dy.year_id, wbd.value
FROM world_bank_data wbd
JOIN dim_country dc ON wbd.country_name = dc.country_name
JOIN dim_indicator di ON wbd.series_name = di.indicator_name
JOIN dim_year dy ON wbd.year = dy.year;