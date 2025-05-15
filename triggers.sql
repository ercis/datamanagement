DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS logs;

DROP FUNCTION IF EXISTS log_new_products;
DROP TRIGGER IF EXISTS log_new_products_trigger ON product;

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

SELECT
    *
FROM
    product;

/*markdown
### Logging of new products
*/

CREATE TABLE logs (
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    message TEXT NOT NULL
);

CREATE FUNCTION log_new_products()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO logs(message)
    VALUES (NEW.name || ' added to product table');
    
    RETURN NEW;
END
$$;

CREATE TRIGGER log_new_products_trigger
AFTER INSERT
ON product
FOR EACH ROW
EXECUTE FUNCTION log_new_products();

select * from product;

select * from logs;

INSERT INTO product 
    (name, price)
VALUES
    ('Bluetooth Speaker', 99.99);

select * from product;

select * from logs;

/*markdown
## Price history
*/

CREATE TABLE product_price_history (
    product_id INTEGER,
    old_price NUMERIC,
    new_price NUMERIC,
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (product_id, change_timestamp),
    CHECK (old_price <> new_price),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE FUNCTION store_price() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 
BEGIN
    INSERT INTO
        product_price_history (product_id, old_price, new_price)
    VALUES
        (NEW.product_id, OLD.price, NEW.price);

    RETURN NEW;

END $$;

CREATE TRIGGER store_price_changes_trigger
AFTER UPDATE
ON product
FOR EACH ROW
EXECUTE FUNCTION store_price();

SELECT
    *
FROM
    product;

SELECT
    *
FROM
    product_price_history;

UPDATE product
SET price = 899.99
WHERE product_id = 1;

SELECT
    *
FROM
    product_price_history;

