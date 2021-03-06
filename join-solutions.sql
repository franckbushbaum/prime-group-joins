-- Get all customers and their addresses.
SELECT * FROM "customers" JOIN "addresses"
ON "customers"."id" = "addresses"."customer_id";

-- Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders" JOIN "line_items"
ON "orders"."id" = "line_items"."order_id";

-- Which warehouses have cheetos?
SELECT * FROM "products" 
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos'

4. Which warehouses have diet pepsi?
SELECT * FROM "products" 
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" on "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "products"."description" = 'diet pepsi'

5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."id", count("orders"."address_id")
FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "customers"."id";

6. How many customers do we have?
SELECT count(*) FROM "customers";

7. How many products do we carry?
SELECT count(*) FROM "products";

8. What is the total available on-hand quantity of diet pepsi?
SELECT sum("warehouse_product"."on_hand")
FROM "warehouse_product"
WHERE "warehouse_product"."product_id" = 6
