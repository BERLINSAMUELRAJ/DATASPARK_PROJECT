# 📊 DataSpark: Illuminating Insights for Global Electronics  

![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/resource-cs-dataspark_dwmbhq.webp)

## 🚀 Project Overview  
This project is part of **Global Electronics’ Data Analytics initiative** to leverage customer, product, sales, and store data for actionable business insights. Using **SQL Server, Python, and Power BI**, we built an end-to-end pipeline from raw CSVs → cleaned datasets → SQL integration → interactive Power BI dashboards.  

The dashboards enable business users to analyze **customers, products, sales trends, and store performance** across multiple geographies and timeframes, ultimately helping Global Electronics **increase customer satisfaction, optimize operations, and drive business growth**.  

---

## 🛠️ Tools & Technologies  
- **Python (VS Code):** Data cleaning & preprocessing  
- **SQL Server (SSMS):** Data storage & management  
- **Power BI:** Interactive dashboarding & visualization  
- **CSV files:** Initial raw datasets  

---

## 📂 Project Workflow  
1. **Data Cleaning (Python)**  
   - Handled missing values & duplicates  
   - Converted datatypes (dates, currency, numeric fields)  
   - Standardized categorical values

2. **Data Management (SQL Server)**  
   - Created relational tables for Customers, Products, Sales, Stores, Exchange Rates  
   - Loaded cleaned datasets into SQL Server  
   - Designed SQL queries for KPIs & business questions

### 📑 Database Schema

```sql
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers
(
    CustomerKey   INT,
    Gender        VARCHAR(10),
    Name          NVARCHAR(255),
    City          NVARCHAR(255),
    StateCode     VARCHAR(50),
    State         NVARCHAR(255),
    ZipCode       VARCHAR(20),
    Country       VARCHAR(100),
    Continent     VARCHAR(50),
    Birthday      DATE
);

DROP TABLE IF EXISTS Exchange_Rates;
CREATE TABLE Exchange_Rates
(
    Date      DATE,
    Currency  VARCHAR(50),
    Exchange  FLOAT
);

DROP TABLE IF EXISTS Products;
CREATE TABLE Products
(
    ProductKey       INT,
    [Product Name]   VARCHAR(255),
    Brand            VARCHAR(100),
    Color            VARCHAR(100),
    [Unit Cost USD]  FLOAT,
    [Unit Price USD] FLOAT,
    SubcategoryKey   INT,
    Subcategory      VARCHAR(255),
    CategoryKey      INT,
    Category         VARCHAR(255)
);

DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales
(
    [Order Number]   INT,
    [Line Item]      INT,
    [Order Date]     DATE,
    [Delivery Date]  DATE,
    CustomerKey      INT,
    StoreKey         INT,
    ProductKey       INT,
    Quantity         INT,
    [Currency Code]  NVARCHAR(10)
);

DROP TABLE IF EXISTS Stores;
CREATE TABLE Stores
(
    StoreKey        INT,
    Country         NVARCHAR(100),
    State           NVARCHAR(100),
    [Square Meters] INT,
    [Open Date]     DATE
);
```

3. **Visualization (Power BI)**  
   - Connected SQL database to Power BI  
   - Built **interactive dashboards** with drill-through, filters, KPIs, and advanced DAX measures  

---

## 📊 DataSpark: Exploratory Data Analysis (EDA)

This repository contains the **Exploratory Data Analysis (EDA)** for the Global Electronics project. The EDA was performed using **Python (Pandas, Matplotlib, Seaborn)** on the following tables:

- `Customers`  
- `Sales`  
- `Products`  
- `Stores`  
- `Exchange_Rates`  

The goal was to uncover insights, calculate key metrics, and prepare the data for **dashboarding in Power BI**.

---

### 🧑 Customer Insights
- **Total Customers:** `customers.shape[0]`  
- **Gender Distribution:** Pie chart  

![Gender Distribution](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_gender_distribution.png)

- **Age Distribution & Age Groups:** Histogram and bar chart  
  - `<20`, `21-30`, `31-40`, `41-50`, `51-60`, `60+`  

![Age Groups](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_age_groups.png)

- **Customers per Country (Top 10):** Bar chart  

![Customers by Country](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_customers_country.png)

- **Customer Lifetime Value (CLV):** Total revenue per customer  
- **Average Order Size:** Average quantity per customer  
- **Total Orders per Customer:** Number of unique orders  

---

### 💰 Sales & Product Insights
- **Total Revenue:** Sum of `Quantity * Unit Price USD` across all sales  
- **Revenue by Product Category:** Bar chart  

![Revenue by Category](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_revenue_category.png)

- **Top 10 Products by Revenue:** Bar chart  

![Top Products](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_top_products.png)

- **Price vs Revenue Correlation:** Scatter plot  

![Price vs Revenue](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_price_vs_revenue.png)

- **Average Order Value (AOV) per Customer:** Mean revenue per order  

---

### 🏬 Store Insights
- **Total Stores:** `stores.shape[0]`  
- **Stores by Country (Top 10):** Bar chart  

![Stores by Country](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_stores_country.png)

- **Average Store Size per Country:** Bar chart  

![Average Store Size](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_avg_store_size.png)

- **Stores Opened Over Time:** Line chart  

![Stores Opened Over Time](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_stores_opened.png)

- **Top 10 Stores by Revenue:** Bar chart  

![Top Stores by Revenue](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_top_stores.png)

---

### 💱 Exchange Rate Insights
- **Number of Records per Currency:** Bar chart  

![Exchange Records](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_exchange_records.png)

- **Trend of EUR Exchange Rate:** Line chart  

![EUR Trend](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_eur_trend.png)

- **Exchange Rate Volatility:** Standard deviation by currency

![EUR Trend](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/EDA_Visuals/eda_exchange_volatility.png)

---

### 🔹 Key Observations from EDA
- Customers are well distributed across age groups, with strong representation in `21-40` age range.  
- Revenue is concentrated in **Computers & Electronics**, with top products driving majority of sales.  
- Larger stores in high-revenue countries contribute significantly to total revenue.  
- Exchange rate fluctuations (especially EUR, GBP) affect international sales and pricing strategies.  

---

### 📌 Notes
- All plots were generated using **Python** (`Matplotlib`, `Seaborn`)  
- Images are stored in the `images/EDA/` folder and linked in this README  
- These insights were used to build the **Power BI dashboards** for Global Electronics


## 📊 Dashboards  

### 🔹 **1. Performance Dashboard**  
- KPIs: Customers, Orders, Revenue, Profit, AOV  
- **Category Revenue Performance** (Pie Chart)  
- **Annual Order Trends** (Line Chart with moving averages)  
- **Category → Product Revenue Breakdown** (Bar Chart)
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(83).png)  

### 🔹 **2. Customer Analysis Dashboard**  
- KPIs: Total Customers, Male/Female Split, Avg. Age, Retention Rate  
- **Brand-wise Customer Distribution** (Bar Chart)  
- **Customer Demographics** by Continent, Country, State, City  
- **Customer Distribution Table** (Subcategory, Quantity, Customers)  
- **Customer CLV Table** with Order details
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(84).png)  

### 🔹 **3. Sales Analysis Dashboard**  
- KPIs: Sales, Profit, Orders, Gross Margin %, On-time Delivery %  
- **Revenue Distribution Across Age Groups** (Donut Chart)  
- **Annual Sales & Profit Trends** (Line Chart)  
- **Category Sales & Profit Breakdown** (Bar Chart)  
- **Geographic Revenue Distribution (Continent → City)** (Map)
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(86).png)  

### 🔹 **4. Product Analysis Dashboard**  
- KPIs: Products, Top Product, Top Product Revenue  
- **Top Sold Products** (Dynamic Top-N with parameter slider)  
- **Product Profit Performance** (Funnel Chart)  
- **Product Order Trends** (Pie Chart)  
- **Global Product Order Trends** (Map)
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(87).png)  

### 🔹 **5. Store Analysis Dashboard**  
- KPIs: Stores, Store Revenue, Store Profit, Avg. Order Value  
- **Geographical Store Count** (Tree Map)  
- **Stores Across Geographies** (Map → drill-down Continent → City)  
- **Store Overall Sales Performance** (Table with revenue, orders, margin)  
- **Store-based Product Order Trends** (Multi-Card)
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(88).png)  

---

## 📌 Key Insights
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/Customer-Journey-Map-Diagram-Brainstorm-1024x576.webp)

- **Customer Behavior:** Balanced male-female split, strong retention (~61%)  
- **Sales Trends:** Peak in 2019, drop post-2020  
- **Products:** Computers dominate revenue, while Games & Toys underperform  
- **Stores:** USA & Online channels drive majority of sales  
- **Currency:** Exchange rates impact international sales performance  

---

## 🧾 Deliverables  
- ✔️ Cleaned & integrated datasets  
- ✔️ SQL queries for KPIs  
- ✔️ Power BI dashboards for **Customers, Sales, Products, and Stores**  
- ✔️ Actionable recommendations to improve marketing, product strategy, and operations  

---

## 📅 Timeline  
- Data Cleaning & SQL Setup → **2 days**  
- Dashboard Development → **3 days**  
- Insights & Documentation → **2 days**  

---

## 📌 References  
- [Exploratory Data Analysis Guide](https://docs.google.com/document/d/1tHiTU1X9UwXSLySpJ-FVCohlf_8xpXwa75vlK9S6wl8/edit?usp=sharing)  
- [Power BI Session Recordings](https://drive.google.com/drive/folders/1Ag9pAbXmPtBVz6pDHa_yGI_wzK61TTao?usp=sharing)  

---

✅ With these dashboards, **Global Electronics leadership can track KPIs, drill into geographies, monitor product profitability, and optimize store strategies in real time.**
