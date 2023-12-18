CREATE DATABASE SEPHORA;
USE SEPHORA;


CREATE TABLE Categories ( 
category_Name VARCHAR(255)  ,  
Category_NO INT NOT NULL UNIQUE,
PRIMARY KEY (category_Name)
);


CREATE TABLE Brands (
Brand_ID INT NOT NULL UNIQUE ,
Brand_Name VARCHAR(255),
PRIMARY KEY (Brand_ID)
);

CREATE TABLE Product_Info (
Product_ID INT NOT NULL UNIQUE ,
Product_Name VARCHAR(255) Null, 
Purchases FLOAT NULL,
Product_Price FLOAT Null , 
Rating FLOAT NULL, 
Number_Of_Reviews FLOAT NULL,
category_Name VARCHAR(255),
Brand_ID INT,
PRIMARY KEY (Product_ID),
FOREIGN KEY (category_Name) REFERENCES Categories(category_Name),
FOREIGN KEY (Brand_ID) REFERENCES Brands(Brand_ID)
);



 SELECT COUNT(category_Name) from  Categories ;
 
 
 SELECT * from Product_Info;
  
 SELECT sum(Purchases) from Product_Info  ;

ALTER TABLE Product_Info ADD COLUMN Sales FLOAT ; 
 
 UPDATE Product_Info SET Sales = Purchases * Product_Price WHERE Product_ID >0 ;
 
 SELECT sum(Sales) from Product_Info  ;
 
SELECT  * from Product_Info ORDER BY Product_Price DESC LIMIT 5;

SELECT P.Product_Price, P.Sales, P.Product_Name, B.Brand_Name , category_Name
FROM  Product_Info P
JOIN Brands B  ON  B.Brand_ID = P.Brand_ID 
ORDER BY Product_Price ASC LIMIT 5;

SELECT  * from Product_Info where Number_Of_Reviews = 0 and Rating != 0  ;

SELECT Product_Name, Product_ID , Number_Of_Reviews FROM Product_Info where  Number_Of_Reviews = 1  ; 

 SELECT * from Product_Info;
 

SELECT COUNT(distinct Brand_ID) from Product_Info where Number_Of_Reviews  !=0 and Rating =5 ;

CREATE VIEW Bview  AS  
SELECT B.Brand_Name , sum(sales) SS , sum(Number_Of_Reviews), COUNT(*) as Num_product
FROM Brands B
Inner JOIN Product_Info P ON B.Brand_ID = P.Brand_ID 
WHERE P.Rating > 0
GROUP BY B.Brand_Name 
order by Num_product DESC;

SELECT  sum(Number_Of_Reviews) FROM  Brands B 
INNER JOIN Product_Info P ON B.Brand_ID = P.Brand_ID  
WHERE  P.Rating = 5 AND B.Brand_Name = 'dae';

select sum(Num_product)From Brands_R_R; 

SELECT B.Brand_Name, sum(Number_Of_Reviews), COUNT(Rating) from Brands B 
JOIN Product_Info P ON B.Brand_ID = P.Brand_ID 
WHERE B.Brand_Name = 'SEPHORA COLLECTION' and Rating != 0 ;

Select Sum(SS) from Bview ;

SELECT  B.Brand_Name ,  sum(sales) SS , sum(Number_Of_Reviews), COUNT(*) as Num_product
FROM Brands B
Inner JOIN Product_Info P ON B.Brand_ID = P.Brand_ID 
WHERE P.Rating > 0
GROUP BY B.Brand_Name 
order by SS DESC LIMIT 10;

CREATE VIEW no_Sales as 
SELECT Product_Name , Product_ID,  Rating , category_Name FROM Product_Info 
WHERE Purchases = 0 
order by category_Name; 

CREATE VIEW Cateogry_sales as 
SELECT category_Name , sum(Sales) cat_sales from Product_Info 
group by category_Name
order by  cat_sales DESC ;

SELECT Product_Name, Purchases, category_Name From Product_Info 
order by  Purchases    DESC limit 10;

# Top five rated products from the top five brands in sales

# 1 top five brands in sales 

Create view  UNDER_10 AS
  SELECT Product_ID , Product_Name, Product_Price, Purchases ,sales, Rating, Brand_Name , category_Name From Product_Info P
  INNER JOIN Brands B on B.Brand_ID = P.Brand_ID
  Where Product_Price <= 10 
  order by Product_Price DESC; 

CREATE VIEW AFFORDABLE AS
 SELECT Product_ID , Product_Name, Product_Price, Purchases ,sales, Rating, Brand_Name, category_Name From Product_Info P
  INNER JOIN Brands B on B.Brand_ID = P.Brand_ID
Where Product_Price BETWEEN 10.1 AND 50
ORDER BY Product_Price ASC; 
  
CREATE VIEW LUXURY AS
 SELECT Product_ID , Product_Name, Product_Price, Purchases ,sales, Rating, Brand_Name , category_Name From Product_Info P
  INNER JOIN Brands B on B.Brand_ID = P.Brand_ID
Where Product_Price > 50
ORDER BY Product_Price ASC; 


SELECT avg(Product_Price) AVERAGE_PRICE  FROM Product_Info
WHERE category_Name = 'Men' ;


SELECT Product_Name , Brand_Name , sales , category_Name ,  From Product_Info P
INNER JOIN Brands B on B.Brand_ID = P.Brand_ID


Select Sum(Purchases) from Under_10 ;


Select Sum(Purchases) from Affordable ;


Select Sum(Purchases) from luxury ;

SELECT sum(Purchases) from Product_Info  ;

SELECT AVG(Product_Price) from Product_Info
WHERE Brand_ID = '3806' ;



