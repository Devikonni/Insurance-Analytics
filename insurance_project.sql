create database insuarance_pro; 
use insuarance_pro;
select * from meeting ; 
           ### kpi2 meeting count year wise ###
 SELECT 
    Year AS year, 
    COUNT(*) AS No_Meeting_Count
FROM 
    meeting
WHERE 
    Year IS NOT NULL
GROUP BY 
    Year;

            ### kpi5 no. of meetings by account excutive ###
SELECT Account_Executive, COUNT(*) AS No_Meeting_Count
FROM meeting
GROUP BY Account_Executive
ORDER BY No_Meeting_Count DESC;
		### kpi1 no. of invoice by account executive ###
        
SELECT Account_Executive, COUNT(*) AS No_Invoice_Count
FROM invoice
GROUP BY Account_Executive
ORDER BY No_Invoice_Count DESC;
   ### kpi 1 with filter by income class ###
   SELECT Account_Executive, Income_Class, COUNT(*) AS No_Invoice_Count
FROM invoice
WHERE Income_Class = 'New'  
GROUP BY Account_Executive, Income_Class
ORDER BY No_Invoice_Count DESC;
 ### kpi 6 top open opportunity ###
 SELECT Account_Executive,ï»¿opportunity_name,revenue_amount , Stage
FROM opportunity
WHERE Stage IN ('Qualify Opportunity', 'Propose Solution') 
ORDER BY revenue_amount   desc
LIMIT 5;  
  ### stage funnel by revenue ###
  SELECT Stage, SUM(revenue_amount) AS Total_Revenue
FROM opportunity
WHERE Stage IN ('Qualify Opportunity', 'Negotiate', 'Propose Solution')  
GROUP BY Stage
ORDER BY Total_Revenue DESC;  


### kpi 3.1 achived , invoice and target ammount for new income class ###

select b.income_class , round(sum(b.Amount)) Acheived,
(select sum(i.Amount)
from invoice i
where i.income_class = 'new') as Invoice,
(select sum(New_Budget)
from `individual_budgets`) Target
from brokerage_v b 
where b.income_class = 'new'
group by b.income_class ; 

### kpi 3.2 achived , invoice and target ammount for cross sell income class ###
select b.income_class , round(sum(b.Amount)) Acheived,
(select sum(i.Amount)
from invoice i
where i.income_class = 'cross sell') as Invoice,
(select sum(Cross_sell_bugdet)
from `individual_budgets`) Target
from brokerage_v b 
where b.income_class = 'cross sell'
group by b.income_class ;

### kpi 3.3 achived , invoice and target ammount for renewal income class ###

 select b.income_class , round(sum(b.Amount)) Acheived,
(select sum(i.Amount)
from invoice i
where i.income_class = 'Renewal') as Invoice,
(select sum(Renewal_Budget)
from `individual_budgets`) Target
from brokerage_v b 
where b.income_class = 'renewal'
group by b.income_class ; 

    #KPI_8 Oppty Product Distribution
SELECT product_group, count(revenue_amount) Revenue_amt
FROM opportunity
group by product_group;


 ### KPI_9 Top Open Opportunity by revenue ###
  select ï»¿opportunity_name , revenue_amount
  from opportunity
  where stage = 'Qualify Opportunity'
  order by revenue_amount desc
  limit 4;