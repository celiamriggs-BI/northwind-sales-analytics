With countries_per_employee as (select employeeid, Count(distinct shipcountry) as countries_served
from orders1
group by employeeid),
order_total as (Select orderid, SUM(Unitprice * Quantity) as total_amount
FROM order_details
Group by OrderID),
sales_per_country as (select o.employeeid, o.ShipCountry, SUM(ot.total_amount) as country_total_amount
from orders1 as o
left join order_total as ot
on o.orderid = ot.OrderID
group by o.employeeid, o.ShipCountry),
employee_total_sales AS (
    SELECT 
        employeeid,
        SUM(country_total_amount) AS total_sales
    FROM sales_per_country
    GROUP BY employeeid
)
SELECT 
    ets.employeeid,
    ets.total_sales,
    cpe.countries_served,
    ets.total_sales / cpe.countries_served AS avg_sales_per_country
FROM employee_total_sales ets
JOIN countries_per_employee cpe
    ON ets.employeeid = cpe.employeeid
ORDER BY avg_sales_per_country DESC;


