-- PL/SQL block to retrieve top 5 customers by spending in last 6 months

DECLARE
    -- Cursor to get top 5 customers by total spending in last 6 months
    CURSOR c_top_customers IS
        SELECT 
            c.customer_id,
            c.name,
            SUM(o.total_amount) as total_spent
        FROM Customers c
        INNER JOIN Orders o ON c.customer_id = o.customer_id
        WHERE o.order_date >= ADD_MONTHS(SYSDATE, -6)  -- Last 6 months filter
        GROUP BY c.customer_id, c.name
        ORDER BY total_spent DESC
        FETCH FIRST 5 ROWS ONLY;  -- Get top 5 customers
    
    -- Cursor to get product details for a specific customer
    CURSOR c_customer_products(p_customer_id NUMBER) IS
        SELECT 
            p.product_name,
            SUM(oi.quantity) as total_quantity
        FROM Orders o
        INNER JOIN Order_Items oi ON o.order_id = oi.order_id
        INNER JOIN Products p ON oi.product_id = p.product_id
        WHERE o.customer_id = p_customer_id
        AND o.order_date >= ADD_MONTHS(SYSDATE, -6)  -- Last 6 months filter
        GROUP BY p.product_name
        ORDER BY total_quantity DESC;
    
    -- Variables to store customer information
    v_customer_id Customers.customer_id%TYPE;
    v_customer_name Customers.name%TYPE;
    v_total_spent NUMBER(10,2);
    v_product_name Products.product_name%TYPE;
    v_quantity NUMBER;
    v_counter NUMBER := 1;
    
BEGIN
    -- Display report header
    DBMS_OUTPUT.PUT_LINE('=================================================');
    DBMS_OUTPUT.PUT_LINE('TOP 5 CUSTOMERS BY SPENDING (LAST 6 MONTHS)');
    DBMS_OUTPUT.PUT_LINE('Report Generated: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('=================================================');
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Loop through top 5 customers
    FOR customer_rec IN c_top_customers LOOP
        -- Display customer information
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || customer_rec.customer_id);
        DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_rec.name);
        DBMS_OUTPUT.PUT_LINE('Total Amount Spent: $' || TO_CHAR(customer_rec.total_spent, '999,999.99'));
        DBMS_OUTPUT.PUT_LINE('Products Purchased:');
        
        -- Get and display products for current customer
        FOR product_rec IN c_customer_products(customer_rec.customer_id) LOOP
            DBMS_OUTPUT.PUT_LINE('    - ' || product_rec.product_name || ': ' || 
                               product_rec.total_quantity || ' units');
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE(''); -- Empty line for readability
        
        -- Increment counter for display purposes
        v_counter := v_counter + 1;
    END LOOP;
    
    -- Check if no customers found
    IF v_counter = 1 THEN
        DBMS_OUTPUT.PUT_LINE('No customers found with orders in the last 6 months.');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('=================================================');
    DBMS_OUTPUT.PUT_LINE('Report Complete');
    DBMS_OUTPUT.PUT_LINE('=================================================');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No data found for the specified criteria.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/