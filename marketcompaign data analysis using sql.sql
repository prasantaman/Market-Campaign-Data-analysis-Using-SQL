CREATE DATABASE MarketingCampaignDB;
use MarketingCampaignDB;
-- Identify the Most Effective Marketing Campaigns
SELECT 
    cd.campaign_id, 
    cd.campaign_type, 
    COUNT(DISTINCT t.customer_id) AS total_customers, 
    SUM(ctd.quantity * ctd.selling_price) AS total_sales,
    AVG(t.redemption_status) * 100 AS redemption_rate
FROM 
    Train t
JOIN 
    Campaign_Data cd ON t.campaign_id = cd.campaign_id
JOIN 
    Customer_Transaction_Data ctd ON t.customer_id = ctd.customer_id
GROUP BY 
    cd.campaign_id, cd.campaign_type
ORDER BY 
    redemption_rate DESC, total_sales DESC;
-- Segment Customers Based on Behavior
SELECT 
    customer_id, 
    SUM(quantity * selling_price) AS total_spent, 
    COUNT(DISTINCT date) AS shopping_frequency
FROM 
    Customer_Transaction_Data
GROUP BY 
    customer_id
ORDER BY 
    total_spent DESC;
 -- Optimize the Coupon Distribution Strategy   
SELECT 
    campaign_id, 
    coupon_id, 
    COUNT(DISTINCT customer_id) AS total_customers, 
    AVG(redemption_status) * 100 AS redemption_rate
FROM 
    Train
GROUP BY 
    campaign_id, coupon_id
ORDER BY 
    redemption_rate DESC;
-- Improve Customer Engagement
SELECT 
    cd.customer_id, 
    cd.age_range, 
    cd.marital_status, 
    cd.family_size, 
    id.category, 
    SUM(ctd.quantity * ctd.selling_price) AS total_spent
FROM 
    Customer_Demographics cd
JOIN 
    Customer_Transaction_Data ctd ON cd.customer_id = ctd.customer_id
JOIN 
    Item_Data id ON ctd.item_id = id.item_id
GROUP BY 
    cd.customer_id, cd.age_range, cd.marital_status, cd.family_size, id.category
ORDER BY 
    total_spent DESC;
 -- Evaluate the Impact of Product Mix on Sales  
 SELECT 
    id.category, 
    SUM(ctd.quantity) AS total_quantity_sold, 
    SUM(ctd.quantity * ctd.selling_price) AS total_sales
FROM 
    Item_Data id
JOIN 
    Customer_Transaction_Data ctd ON id.item_id = ctd.item_id
GROUP BY 
    id.category
ORDER BY 
    total_sales DESC;
-- Analyze Customer Demographics
  SELECT 
    age_range, 
    marital_status, 
    rented, 
    family_size, 
    no_of_children, 
    income_bracket, 
    COUNT(customer_id) AS total_customers
FROM 
    Customer_Demographics
GROUP BY 
    age_range, marital_status, rented, family_size, no_of_children, income_bracket
ORDER BY 
    total_customers DESC;
    -- Continuously Monitor and Analyze the Data
SELECT 
    date, 
    customer_id, 
    item_id, 
    SUM(quantity * selling_price) AS daily_sales
FROM 
    Customer_Transaction_Data
GROUP BY 
    date, customer_id, item_id
ORDER BY 
    date DESC;

    
   



