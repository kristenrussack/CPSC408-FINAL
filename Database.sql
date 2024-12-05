CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    SignupDate DATE,
    CardOnFile INT
);

CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(20) NOT NULL,
    OrderID INT NOT NULL,
    PaymentDate DATE,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);

CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    OrderDate DATE NOT NULL,
    ArrivalDate DATE,
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE ProductCategory (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Size VARCHAR(3),
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES ProductCategory(CategoryID)
);

CREATE TABLE StoreInventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    StoreID INT NOT NULL,
    ProductID INT NOT NULL,
    StockQuantity INT NOT NULL,
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Store (
    StoreID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Name VARCHAR(50) NOT NULL
);
