DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS product;
DROP TABLE customer;

CREATE TABLE product (
    product_id INTEGER,
    name TEXT,
    price DECIMAL,
    PRIMARY KEY (product_id)
);

CREATE TABLE orders (
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    PRIMARY KEY (order_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE RESTRICT
)

CREATE TABLE customer (
    customer_id INTEGER,
    name TEXT,
    registered_at TIMESTAMP
);

INSERT INTO
    customer (customer_id, name, registered_at)
VALUES
    (1, 'John Doe', '2017-01-01 00:00:00'),
    (2, 'Jane Doe', now()),
    (3, 'Alice', current_timestamp),
    (4, 'Bob', '2017-01-01 00:00:00'),
    (5, 'Charlie', '2017-01-01 00:00:00');

SELECT
    customer_id, name
FROM
    customer;

CREATE TABLE product (
    product_id INTEGER,
    name TEXT,
    price DECIMAL,
    CONSTRAINT valid_price CHECK (price > 0)
);

/*markdown
# Modififying tables
*/

/*markdown
Adding/ removing a Column
*/

ALTER TABLE product
    ADD COLUMN description text;

ALTER TABLE product
    DROP COLUMN description CASCADE;

/*markdown
Chaning constraints
*/

ALTER TABLE product
    ALTER COLUMN product_id SET NOT NULL;

ALTER TABLE product
    ALTER COLUMN product_id DROP NOT NULL;

/*markdown
Change default values
*/

ALTER TABLE product
    ALTER COLUMN price SET DEFAULT 7.77;

ALTER TABLE product
    ALTER COLUMN price DROP DEFAULT;

/*markdown
Changing a Column's Data Type
*/

ALTER TABLE product
    ALTER COLUMN price TYPE numeric;

/*markdown
Renaming
*/

ALTER TABLE product
    RENAME COLUMN product_id TO product_number;

ALTER TABLE product
    RENAME TO items;