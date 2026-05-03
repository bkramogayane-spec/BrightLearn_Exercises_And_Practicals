------------------------------------------------------------------------------
---1. SELECT Statement
------------------------------------------------------------------------------
--- Q1. Display all columns for all transactions
select * from `workspace`.`default`.`1772863649520_retail_sales_dataset`;

--- Q2. Display only the Transaction ID, Date, and Customer ID for all records.
Select 'Transaction ID', Date, 'Customer ID'
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;
-------------------------------------------------------------------------------
---2. SELECT DISTINCT Statement
-------------------------------------------------------------------------------
--- Q3. Display all the distinct product categories in the dataset.
Select Distinct `Product Category`
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;

--- Q4. Display all the distinct gender values in the dataset.
Select Distinct `Gender`
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;
------------------------------------------------------------------------------
--- 3. WHERE Clause
------------------------------------------------------------------------------
--- Q5. Display all transactions where the Age is greater than 40.
Select Distinct *
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
Where Age > 40;
--- Q6. Display all transactions where the Price per Unit is between 100 and 500. Expected output: All columns
Select *
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
Where `Price per Unit` between 100 AND 500;

--- Q7. Display all transactions where the Product Category is either 'Beauty' or 'Electronics'
Select * 
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
Where`Product Category` IN ('Beauty','Electronics') ;

--- Q8. Display all transactions where the Product Category is not 'Clothing'.
Select *
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
Where `Product Category` != 'Clothing';

--- Q9. Display all transactions where the Quantity is greater than or equal to 3. 
Select *
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
Where `Quantity` >= 3;
-------------------------------------------------------------------------------
--- 4. Aggregate Functions
-------------------------------------------------------------------------------
--- Q10. Count the total number of transactions. 
Select Count(*) as Total_Transactions
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;

--- Q11. Find the average Age of customers. 
Select AVG(`Age`) AS Average_Age
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;

--- Q12. Find the total quantity of products sold.  
Select SUM(`Quantity`) AS Total_Quantity
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;

--- Q13. Find the maximum Total Amount spent in a single transaction.
Select MAX(`Total Amount`)  AS Max_Total_Amount
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;

--- Q14. Find the minimum Price per Unit in the dataset. Expected output: 
Select MIN(`Price per Unit`) AS Min_Price_per_Unit 
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;

--- Q15. Find the number of transactions per Product Category. Expected output: Product Category, 
Select `Product Category`, COUNT(*) AS Transaction_Count
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
GROUP BY `Product Category`;

--- Q16. Find the total revenue (Total Amount) per gender. 
Select `Gender`, SUM(`Total Amount`) AS Total_Revenue
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
GROUP BY `Gender`;

--- Q17. Find the average Price per Unit per product category. 
Select `Product Category`, AVG(`Price per Unit`) AS Average_Price
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
GROUP BY `Product Category`;
----------------------------------------------------------------------------------
--- 6. HAVING Clause
----------------------------------------------------------------------------------
--- Q18. Find the total revenue per product category where total revenue is greater than 10,000. 
Select `Product Category`, SUM(`Price per Unit`) AS Total_Revenue
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
GROUP BY `Product Category`
HAVING  SUM(`Price per Unit`)> 10000;

--- Q19. Find the average quantity per product category where the average is more than 2
Select `Product Category`, AVG(`Quantity`) AS Average_Quantity
From `workspace`.`default`.`1772863649520_retail_sales_dataset`
GROUP BY `Product Category`
HAVING AVG(`Quantity`) > 2;
-----------------------------------------------------------------------------------
--- 7. CASE Statement
-----------------------------------------------------------------------------------
--- Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000, otherwise 'Low'. Expected output: Transaction ID, Total Amount, Spending_Level
Select `Transaction ID`,`Total Amount`,
CASE
   WHEN `Total Amount`> 1000 THEN 'High'
   ELSE 'Low'
END AS Spending_Level
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;

--- Q21. Display a new column called Age_Group that labels customers as:
Select `Customer ID`,`Age`,
CASE
   WHEN `Age`>= 60 THEN 'Senior'
   WHEN `Age` BETWEEN 30 AND 59 THEN 'Adult'
   ELSE 'Youth'
END AS Age_Group
From `workspace`.`default`.`1772863649520_retail_sales_dataset`;
