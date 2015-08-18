--######################################################
--## Belows are the database creation tables
--## busimplified.com
--## Author : Mali Mukesh { malimukeshnitc@gmail.com }
--######################################################
create database buBilling;
use buBilling;
CREATE USER 'buUser'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT,INSERT,UPDATE ON buBilling.* TO 'buUser'@'localhost';

create table `security` (username varchar(200) primary key,pwd TEXT NOT NULL)
create table `productDetail` (productId int AUTO_INCREMENT primary key,
							  productName TEXT, description TEXT,
							  productVendor TEXT,
							  showProduct int NOT NULL DEFAULT 1);

create table `category` (categoryId int AUTO_INCREMENT primary key, categoryName TEXT);							  

create table `productCategory` (productId int,categoryId int, 
								foreign key(productId) references productDetail(productId),
								foreign key(categoryId) references category(categoryId));

create table  `productPrice` (priceOnDate TIMESTAMP,productId int,
							  productPrice double, foreign key(productId) references productCategory(productId));

create table `billing` ( billId int AUTO_INCREMENT primary key,
					     billDate TIMESTAMP,
						 billerName VARCHAR(100),
						 customerName VARCHAR(100),
						 customerContact VARCHAR(100),
						 customerAddress TEXT,
						 billAmount double
						 );

create table `billingInfo` (billId int not null references billing(billId),
							productId int not null references productDetail(productId),
							productPrice double,
							productQuantity int					
							);
insert into security values('mukesh','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8');							