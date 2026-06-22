# Table_structure
DESCRIBE workspace.default.supply_chain_500;

# Objective_1_Profit_Analysis
SELECT
  `Category Id`,
  AVG(`Benefit per order`) AS avg_profit
FROM workspace.default.supply_chain_500
GROUP BY `Category Id`
ORDER BY avg_profit DESC;

# Objective_2_Delivery_Analysis
SELECT
  `Delivery Status`,
  COUNT(*) AS total_orders
FROM workspace.default.supply_chain_500
GROUP BY `Delivery Status`
ORDER BY total_orders DESC;

#Sales_by_Category
SELECT
`Category Name`,
SUM(`Sales per customer`) AS Total_Sales
FROM workspace.default.supply_chain_500
GROUP BY `Category Name`
ORDER BY Total_Sales DESC;

#Bronze Layer -RawCount
SELECT COUNT(*) 
FROM workspace.default.supply_chain_500;

#gold_avg_profit_analysis
CREATE OR REPLACE VIEW workspace.default.gold_profit_analysis AS
SELECT
  `Category Id`,
  AVG(`Benefit per order`) AS avg_profit
FROM workspace.default.supply_chain_500
GROUP BY `Category Id`;

#Silver Layer
CREATE OR REPLACE VIEW workspace.default.silver_supply_chain AS
SELECT *
FROM workspace.default.supply_chain_500;

#Gold Layer
CREATE OR REPLACE VIEW workspace.default.gold_profit_analysis AS
SELECT
  `Category Name`,
  SUM(`Benefit per order`) AS Total_Profit,
  SUM(`Sales per customer`) AS Total_Sales
FROM workspace.default.silver_supply_chain
GROUP BY `Category Name`;

#Avg_profit_by_category
SELECT *
FROM workspace.default.gold_profit_analysis
ORDER BY avg_profit DESC;

#Total Profit
SELECT
SUM(`Benefit per order`) AS Total_Profit
FROM workspace.default.supply_chain_500;

#Total Sales
SELECT
SUM(`Sales per customer`) AS Total_Sales
FROM workspace.default.supply_chain_500;

#Average Profit
SELECT AVG(`Benefit per order`) AS Avg_Profit
FROM workspace.default.supply_chain_500;

#Testing_Project_with_new_data
INSERT INTO workspace.default.supply_chain_500
SELECT *
FROM workspace.default.supply_chain_500
LIMIT 100;

#Shipping_mode_Distribution
SELECT
  `Shipping Mode`,
  COUNT(*) AS Total_Orders
FROM workspace.default.supply_chain_500
GROUP BY `Shipping Mode`

#ShowTables
SHOW TABLES;

#Website Visits byCategory
SELECT
category,
COUNT(*) AS visits
FROM workspace.default.access_logs_500
GROUP BY category
ORDER BY visits DESC;

#Silver_layer_Validation
DESCRIBE EXTENDED silver_supply_chain;

#validation
DESCRIBE EXTENDED supply_chain_500;

#Gold_layer_validation
DESCRIBE EXTENDED gold_profit_analysis;




