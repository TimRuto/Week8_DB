-- Table: Locations
-- Stores sales locations with address and contact info
-- ============================================
CREATE TABLE Locations (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    Street VARCHAR(100) NOT NULL,
    Number VARCHAR(20) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Phone VARCHAR(20)
);

-- ============================================
-- Table: Categories
-- Car categories like Economy, Luxury, SUV, etc.
-- ============================================
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    Label VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT
);

-- ============================================
-- Table: Cars
-- Stores cars available for sale
-- ============================================
CREATE TABLE Cars (
    Chasis VARCHAR(17) PRIMARY KEY, -- Chasis Number
    Color VARCHAR(30),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    DateOfPurchase DATE,
    CategoryID INT NOT NULL,
    LocationID INT NOT NULL,
    Status ENUM('Available', 'Sold', 'Maintenance') DEFAULT 'Available',
    Price DECIMAL(10,2) NOT NULL, -- Sale price
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

-- ============================================
-- Table: Customers
-- Stores customer information
-- ============================================
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    MobilePhone VARCHAR(20),
    State VARCHAR(50),
    Country VARCHAR(50) NOT NULL
);

-- ============================================
-- Table: Payments
-- Records payments made by customers for car purchases
-- ============================================
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    Chasis VARCHAR(17) NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod ('Credit Card', 'Debit Card', 'Cash', 'Online') NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (Chasis) REFERENCES Cars(Chasis)
);

-- ============================================
-- End of Car Sales System SQL script (Sales only)
-- ============================================