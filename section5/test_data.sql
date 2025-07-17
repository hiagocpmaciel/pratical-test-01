-- Insert test data to demonstrate functionality

-- Insert Customers
INSERT INTO Customers VALUES (customer_seq.NEXTVAL, 'John Doe', 'john.doe@email.com', SYSDATE - 365);
INSERT INTO Customers VALUES (customer_seq.NEXTVAL, 'Jane Smith', 'jane.smith@email.com', SYSDATE - 300);
INSERT INTO Customers VALUES (customer_seq.NEXTVAL, 'Bob Johnson', 'bob.johnson@email.com', SYSDATE - 200);
INSERT INTO Customers VALUES (customer_seq.NEXTVAL, 'Alice Brown', 'alice.brown@email.com', SYSDATE - 150);
INSERT INTO Customers VALUES (customer_seq.NEXTVAL, 'Charlie Wilson', 'charlie.wilson@email.com', SYSDATE - 100);
INSERT INTO Customers VALUES (customer_seq.NEXTVAL, 'Diana Davis', 'diana.davis@email.com', SYSDATE - 50);

-- Insert Products
INSERT INTO Products VALUES (product_seq.NEXTVAL, 'Laptop Pro', 'Electronics');
INSERT INTO Products VALUES (product_seq.NEXTVAL, 'Wireless Mouse', 'Electronics');
INSERT INTO Products VALUES (product_seq.NEXTVAL, 'Office Chair', 'Furniture');
INSERT INTO Products VALUES (product_seq.NEXTVAL, 'Standing Desk', 'Furniture');
INSERT INTO Products VALUES (product_seq.NEXTVAL, 'Coffee Maker', 'Appliances');
INSERT INTO Products VALUES (product_seq.NEXTVAL, 'Monitor 4K', 'Electronics');

-- Insert Orders (within last 6 months)
INSERT INTO Orders VALUES (order_seq.NEXTVAL, 1, SYSDATE - 150, 2500.00);
INSERT INTO Orders VALUES (order_seq.NEXTVAL, 1, SYSDATE - 120, 1200.00);
INSERT INTO Orders VALUES (order_seq.NEXTVAL, 1, SYSDATE - 90, 1800.00);

INSERT INTO Orders VALUES (order_seq.NEXTVAL, 2, SYSDATE - 140, 3200.00);
INSERT INTO Orders VALUES (order_seq.NEXTVAL, 2, SYSDATE - 100, 1500.00);

INSERT INTO Orders VALUES (order_seq.NEXTVAL, 3, SYSDATE - 130, 2800.00);
INSERT INTO Orders VALUES (order_seq.NEXTVAL, 3, SYSDATE - 80, 900.00);

INSERT INTO Orders VALUES (order_seq.NEXTVAL, 4, SYSDATE - 160, 4500.00);
INSERT INTO Orders VALUES (order_seq.NEXTVAL, 4, SYSDATE - 70, 800.00);

INSERT INTO Orders VALUES (order_seq.NEXTVAL, 5, SYSDATE - 110, 1900.00);
INSERT INTO Orders VALUES (order_seq.NEXTVAL, 5, SYSDATE - 60, 2100.00);

INSERT INTO Orders VALUES (order_seq.NEXTVAL, 6, SYSDATE - 40, 3500.00);

-- Insert Order Items
-- John Doe's orders
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 1, 1, 1, 2000.00); -- Laptop Pro
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 1, 2, 2, 250.00);  -- Wireless Mouse
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 2, 3, 1, 800.00);  -- Office Chair
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 2, 2, 1, 400.00);  -- Wireless Mouse
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 3, 6, 1, 1800.00); -- Monitor 4K

-- Jane Smith's orders
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 4, 1, 2, 4000.00); -- Laptop Pro x2
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 5, 4, 1, 1500.00); -- Standing Desk

-- Bob Johnson's orders
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 6, 1, 1, 2000.00); -- Laptop Pro
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 6, 3, 1, 800.00);  -- Office Chair
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 7, 5, 3, 300.00);  -- Coffee Maker x3

-- Alice Brown's orders
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 8, 1, 2, 4000.00); -- Laptop Pro x2
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 8, 6, 1, 500.00);  -- Monitor 4K
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 9, 2, 2, 800.00);  -- Wireless Mouse x2

-- Charlie Wilson's orders
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 10, 4, 1, 1500.00); -- Standing Desk
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 10, 5, 1, 400.00);  -- Coffee Maker
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 11, 1, 1, 2100.00); -- Laptop Pro

-- Diana Davis's orders
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 12, 1, 1, 2000.00); -- Laptop Pro
INSERT INTO Order_Items VALUES (order_item_seq.NEXTVAL, 12, 6, 1, 1500.00); -- Monitor 4K

COMMIT;