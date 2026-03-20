/* =========================================================
   Project: Mercedes Vehicle Data Analysis
   Description: Data cleaning and analytical queries
   ========================================================= */

/* =======================
   1. DATABASE SETUP
   ======================= */
CREATE DATABASE auto;
USE auto;

/* Import your dataset using Table Data Import Wizard before running below */
SELECT * FROM mercedes;


/* =======================
   2. ADD PRIMARY KEY
   ======================= */
ALTER TABLE mercedes
ADD COLUMN Nos INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;


/* =======================
   3. REMOVE DUPLICATES
   (Based on Vehicle_Name)
   ======================= */
DELETE m
FROM mercedes m
JOIN (
    SELECT 
        Nos,
        ROW_NUMBER() OVER (
            PARTITION BY Vehicle_Name 
            ORDER BY Nos
        ) AS rnk
    FROM mercedes
) c 
ON m.Nos = c.Nos
WHERE c.rnk > 1;


/* =======================
   4. DATA CLEANING
   ======================= */
ALTER TABLE mercedes
MODIFY Price_Per_Mile DECIMAL(10,2);

UPDATE mercedes
SET Price_Per_Mile = ROUND(Price_Per_Mile, 2);


/* =======================
   5. PRICE RANK WITHIN MODEL SERIES
   ======================= */
WITH ranked AS (
    SELECT
        Vehicle_Name,
        Model_Series,
        Price_USD,
        RANK() OVER (
            PARTITION BY Model_Series
            ORDER BY Price_USD DESC
        ) AS price_rank
    FROM mercedes
)
SELECT
    Vehicle_Name,
    Model_Series,
    Price_USD,
    price_rank
FROM ranked
ORDER BY Model_Series, price_rank;


/* =======================
   6. RUNNING TOTAL OF VEHICLES BY YEAR
   ======================= */
SELECT
    Year,
    COUNT(*) AS vehicles_that_year,
    SUM(COUNT(*)) OVER (
        ORDER BY Year
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM mercedes
GROUP BY Year
ORDER BY Year;


/* =======================
   7. BEST PRICE-PER-MILE BY MODEL SERIES
   ======================= */
WITH series_ppm AS (
    SELECT
        Model_Series,
        ROUND(AVG(Price_Per_Mile), 2) AS avg_ppm,
        COUNT(*) AS total_vehicles
    FROM mercedes
    GROUP BY Model_Series
),
ranked AS (
    SELECT 
        *,
        RANK() OVER (ORDER BY avg_ppm DESC) AS ppm_rank
    FROM series_ppm
)
SELECT
    Model_Series,
    avg_ppm,
    total_vehicles,
    ppm_rank
FROM ranked
WHERE ppm_rank <= 10
ORDER BY ppm_rank;


/* =======================
   8. PRICE PERCENTILE RANK
   ======================= */
SELECT
    Vehicle_Name,
    Price_USD,
    Price_Category,
    ROUND(
        PERCENT_RANK() OVER (
            ORDER BY Price_USD
        ) * 100, 1
    ) AS price_percentile
FROM mercedes
ORDER BY price_percentile DESC;