CREATE DATABASE RetailDB;
USE RetailDB ;

CREATE TABLE  Products (id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(50) NOT NULL, price DECIMAL(10, 2) NOT NULL,CHECK (price >0),stock INT NOT NULL ,CHECK (stock>=0));

INSERT INTO products(name,price,stock) VALUES
('KIT KAT',10.00,5),
('Milk Bikis',20.00,10),
('ICE CREAM',25.50,15),
('BROWNIE CAKE',50.00,20),
('JUICE',40.00,10);

SELECT * FROM products ;

CREATE TABLE Suppliers(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(50) NOT NULL, contact VARCHAR(50));

INSERT INTO Suppliers (name,contact) VALUES
('sup_1','123456'),
('sup_2','234567'),
('sup_3','345678');

SELECT * FROM Suppliers ;

CREATE TABLE sales (id INT PRIMARY KEY AUTO_INCREMENT,product_id INT ,FOREIGN KEY (product_id) REFERENCES products(id), date DATE NOT NULL, quantity INT NOT NULL,CHECK(quantity>0),total_price DECIMAL(10,2) NOT NULL);

INSERT INTO sales (product_id,date,quantity,total_price) VALUES
(1,'2024-02-10',3,30),
(2,'2024-02-15',7,140),
(3,'2024-02-23',10,510),
(4,'2024-02-27',15,750),
(5,'2024-03-05',5,200);

SELECT * FROM sales ;

-- List all products --

SELECT * FROM products;

-- Show products with stock less than 10 --

SELECT * FROM products WHERE stock<10;

-- List sales with product names and total prices --

SELECT products.name AS product_name,total_price,quantity,date FROM products JOIN sales 
ON products.id = sales.id;

-- Calculate the total sales for each product --

SELECT products.name AS product_name,SUM(sales.total_price) AS total_sales FROM products 
JOIN sales ON products.id = sales.id GROUP BY product_name;










