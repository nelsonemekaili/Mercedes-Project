# Mercedes-Project
# 🚗 Mercedes-Benz Vehicle Data Analysis

# SQL + Python (EDA & Data Cleaning Project)

# 📌 Overview

This project analyzes a dataset of Mercedes-Benz vehicle listings using both SQL and Python.
It combines:
* Data cleaning and transformation
* Exploratory Data Analysis (EDA)
* Statistical insights
* Advanced SQL analytics
The goal is to uncover patterns in **pricing, mileage, vehicle age, and model performance**.


# 📂 Dataset Description
The dataset includes detailed information about Mercedes vehicles, such as:
* Vehicle Name
* Model Series
* Year
* Price (USD)
* Mileage (Miles)
* Vehicle Age
* Body Type
* Price Per Mile
* Price Category

# 🧹 Data Cleaning (SQL + Python)

# 🔹 SQL Cleaning

* Added a unique primary key (`Nos`)
* Removed duplicate vehicles using `ROW_NUMBER()`
* Standardized `Price_Per_Mile` to 2 decimal places

# 🔹 Python Cleaning

* Removed duplicate `Vehicle_Name` entries
* Checked for missing values across all columns
* Converted and validated data types
* Set `Vehicle_Name` as index for easier analysis

# 📊 Exploratory Data Analysis (Python)

# Key steps performed:

* Summary statistics using `.describe()`
* Correlation analysis between numerical variables
* Skewness detection and transformation
* Outlier detection using IQR method
* Outlier treatment using clipping

### 📈 Visualizations:

* Scatter plot: **Vehicle Age vs Mileage**
* Joint plots (regression relationships)
* Correlation heatmap

---

## 🔍 Key Findings from EDA

* Strong positive correlation between **Vehicle Age and Mileage** (~0.79)
* Minimal correlation between price and most other variables
* Presence of outliers in mileage and age (successfully handled)
* Some numerical features were highly skewed and required transformation

---

## 🛠️ SQL Analysis (Advanced Queries)

### Business Questions Solved:

1. **Price ranking within each model series**
2. **Running total of vehicle listings over time**
3. **Best model series based on price-per-mile efficiency**
4. **Price percentile ranking across all vehicles**

### Techniques Used:

* Window Functions (`RANK`, `ROW_NUMBER`, `PERCENT_RANK`)
* Common Table Expressions (CTEs)
* Aggregations (`SUM`, `AVG`, `COUNT`)
* Data cleaning with SQL

---

## 📊 Key Insights

* High-end Mercedes models dominate the top price rankings
* Some mid-range models offer better **price-per-mile value**
* Vehicle listings increase steadily over the years
* Premium vehicles fall within the **top 90–100 percentile** range
* Mileage strongly increases with vehicle age

---

## 📁 Project Structure

```id="nb0g11"
📦 mercedes-analysis
 ┣ 📜 mercedes_analysis.sql        # SQL queries & data cleaning
 ┣ 📓 mercedes.ipynb              # Python EDA & visualization
 ┣ 📄 README.md                   # Project documentation
 ┗ 📊 dataset (optional)
```

---

## 🚀 Tools & Technologies

* **SQL (MySQL)** – Data querying & analysis
* **Python** – Data analysis
* **Pandas & NumPy** – Data manipulation
* **Seaborn & Matplotlib** – Data visualization

---

## ▶️ How to Run the Project

### SQL Part:

1. Import dataset into MySQL
2. Run `mercedes_analysis.sql` step-by-step

### Python Part:

1. Open `mercedes.ipynb`
2. Update dataset file path
3. Run all cells

---

## 💡 Future Improvements

* Build an interactive dashboard (Power BI / Tableau)
* Apply machine learning for price prediction
* Add feature engineering for deeper insights
* Perform time-series analysis on pricing trends

---

## 🧠 Author

# EMEKAILI NELSON
Aspiring Data Analyst*
SQL • Python • Data Visualization

---
