create database Data_Driven_Car_Price_Prediction_and_Analysis;
use Data_Driven_Car_Price_Prediction_and_Analysis;
select * from customer;
RENAME TABLE customer TO cars;

select * from cars;

select max(price) from cars;
select min(price) from cars;
select avg(price) from cars;

select * from cars 
where brand='bmw'
limit 5;

#Find all cars with price less than 5 lakhs
select * from cars 
where price <500000;

#Display unique car brands
select distinct brand
from cars ;

#count of total cars in dataset
SELECT COUNT(*) AS total_cars
FROM cars;

#Find average price by brand
select avg(price) as avg_price
from cars
group by brand;

#Top 5 most expensive cars
SELECT brand, model, price
FROM cars
ORDER BY price DESC
LIMIT 5;

#Top 2
select brand, model, price
from cars 
order by price desc
limit 2;

#count cars by fuel type
SELECT fuel_type, COUNT(*) AS total_cars
FROM cars
GROUP BY fuel_type;

#Cars manufactured after 2018 with mileage > 15
SELECT *
FROM cars
WHERE year > 2018 AND mileage > 15;

#Find the most expensive car for each brand
SELECT brand, model, price
FROM cars c1
WHERE price = (
    SELECT MAX(price)
    FROM cars c2
    WHERE c1.brand = c2.brand
);

#Rank cars by price within each brand
SELECT brand, model, price,
       RANK() OVER (PARTITION BY brand ORDER BY price DESC) AS price_rank
FROM cars;

#Find brands with average price above overall average
SELECT brand
FROM cars
GROUP BY brand
HAVING AVG(price) > (SELECT AVG(price) FROM cars);

#Classify cars into price categories
SELECT brand, model, price,
       CASE
           WHEN price < 500000 THEN 'Budget'
           WHEN price BETWEEN 500000 AND 1000000 THEN 'Mid-Range'
           ELSE 'Premium'
       END AS price_category
FROM cars;

#Find duplicate car records
SELECT brand, model, year, COUNT(*) AS duplicate_count
FROM cars
GROUP BY brand, model, year
HAVING COUNT(*) > 1;



