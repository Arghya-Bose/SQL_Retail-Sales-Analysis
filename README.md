# Retail Sales Data Analysis using SQL

A SQL-based data analysis project focused on analyzing retail sales transactions to identify sales trends, customer behavior, product category performance, and actionable business insights.

---

## Project Overview

This project uses a retail sales dataset to perform data cleaning, exploratory data analysis, and business-oriented analysis using MySQL.

The analysis focuses on:

- Sales performance
- Customer behavior
- Product categories
- Gender-wise transactions
- Monthly sales trends
- Top customers
- Unique customers
- Time-based order patterns

---

## Objectives

The main objectives of this project are:

- Clean and prepare raw retail sales data
- Identify and handle missing values
- Explore the structure and characteristics of the dataset
- Analyze sales performance across different categories
- Understand customer purchasing behavior
- Identify high-value customers
- Analyze monthly and yearly sales patterns
- Identify order patterns based on time of day
- Generate insights that can support business decision-making

---

## Dataset Structure

The project uses a retail sales transaction table named `retail_sales`.

| Column | Data Type | Description |
|---|---|---|
| `transactions_id` | INT | Unique transaction identifier |
| `sale_date` | DATE | Date of the transaction |
| `sale_time` | TIME | Time of the transaction |
| `customer_id` | INT | Unique customer identifier |
| `gender` | VARCHAR | Customer gender |
| `age` | INT | Customer age |
| `category` | VARCHAR | Product category |
| `quantity` | INT | Number of items purchased |
| `price_per_unit` | DECIMAL | Price per unit |
| `cogs` | DECIMAL | Cost of goods sold |
| `total_sale` | DECIMAL | Total transaction value |

---

## Technologies Used

- MySQL
- SQL
- Relational Database
- Data Cleaning
- Exploratory Data Analysis
- Business Analytics

---

## Data Cleaning

The dataset was checked for missing values across important columns.

The project identifies records containing NULL values in:

- Sale date
- Sale time
- Customer ID
- Gender
- Age
- Category
- Quantity
- Price per unit
- COGS

Records with missing critical information were removed before performing the analysis.






