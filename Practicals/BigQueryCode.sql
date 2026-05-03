SELECT * FROM `golden-bloom-493417-f3.RetailSales.SalesSales` LIMIT 1000;

## Q1: Filter all transactions that occurred in the year 2023
SELECT *
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`
WHERE EXTRACT(YEAR FROM `Date`) = 2023;

## Q2: Transactions where Total Amount > average Total Amount

SELECT *
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`
WHERE `Total Amount` >
      (SELECT AVG(`Total Amount`)
       FROM `golden-bloom-493417-f3.RetailSales.SalesSales`);

## Q3: Calculate total revenue

SELECT
  SUM(`Total Amount`) AS Total_Revenue
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`;

## Q4: Display distinct product categories
SELECT DISTINCT
  `Product Category`
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`;

## Q5: Total quantity sold per product category
SELECT
  `Product Category`,
  SUM(`Quantity`) AS Total_Quantity
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`
GROUP BY `Product Category`;

## Q6: Create Age_Group
SELECT
  `Customer ID`,
  `Age`,
  CASE
    WHEN `Age` < 30 THEN 'Youth'
    WHEN `Age` BETWEEN 30 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS Age_Group
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`;

## Q7: High-value transactions (>500) per gender
SELECT
  `Gender`,
  COUNTIF(`Total Amount` > 500) AS High_Value_Transactions
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`
GROUP BY `Gender`;

## Q8: Product categories with revenue > 5000
SELECT
  `Product Category`,
  SUM(`Total Amount`) AS Total_Revenue
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

## Q9: Unit cost category
SELECT
  `Transaction ID`,
  `Price per Unit`,
  CASE
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
  END AS Unit_Cost_Category
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`;

## Q10: Customers aged 40+ with spending level
SELECT
  `Customer ID`,
  `Age`,
  `Total Amount`,
  CASE
    WHEN `Total Amount` > 1000 THEN 'High'
    ELSE 'Low'
  END AS Spending_Level
FROM `golden-bloom-493417-f3.RetailSales.SalesSales`
WHERE `Age` >= 40;
