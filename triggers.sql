DROP TABLE IF EXISTS product;

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC NOT NULL
);

INSERT INTO product
    (name, price)
VALUES
    ('Laptop', 999.99),
    ('Smartphone', 499.99),
    ('Tablet', 299.99),
    ('Smartwatch', 199.99),
    ('Headphones', 149.99);