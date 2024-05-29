-- Customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    cs_name VARCHAR(20) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    cs_phone_num INT NOT NULL,
    account VARCHAR(30) NOT NULL,
    cs_address VARCHAR(30) NOT NULL
);

-- Supplier table
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    sp_name VARCHAR(20) NOT NULL
);

-- Store table
CREATE TABLE Store (
    store_id INT PRIMARY KEY,
    store_Address VARCHAR(30) NOT NULL,
    st_name VARCHAR(20) NOT NULL
);

-- Store phone number table
CREATE TABLE Store_phoneNUM (
    store_id INT,
    st_phone_num INT,
    PRIMARY KEY(store_id, st_phone_num),
    CONSTRAINT store_id_fk FOREIGN KEY (store_id) REFERENCES Store(store_id)
);

-- Product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    pr_name VARCHAR(20) NOT NULL,
    pr_availability VARCHAR(5) NOT NULL,
    store_id INT NOT NULL,
    supplier_id INT NOT NULL,
    CONSTRAINT store_id_fk2 FOREIGN KEY (store_id) REFERENCES Store(store_id),
    CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Order table
CREATE TABLE Cs_order (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    CONSTRAINT customer_id_fk FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- OrderProduct junction table to handle many-to-many relationship
CREATE TABLE OrderProduct (
    order_id INT NOT NULL,
	order_date varchar(20) NOT NULL,
    product_id INT NOT NULL,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    PRIMARY KEY(order_id, product_id),
    CONSTRAINT order_id_fk FOREIGN KEY (order_id) REFERENCES Cs_order(order_id),
    CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES Product(product_id)
);