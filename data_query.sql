/*markdown
# Setup
*/

DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS orders;

CREATE TABLE category (
    cat_id SERIAL,
    category_name TEXT NOT NULL,
    PRIMARY KEY (cat_id)
)

CREATE TABLE product (
    product_id SERIAL,
    name TEXT NOT NULL,
    price NUMERIC,
    stock INTEGER,
    category_id INTEGER,
    PRIMARY KEY (product_id),
    FOREIGN KEY (category_id) REFERENCES category (cat_id) 
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO
    category
VALUES
    (DEFAULT, 'Vegetable'),
    (DEFAULT, 'Fruit'),
    (DEFAULT, 'Beverage');

INSERT INTO
    product
VALUES
    (DEFAULT, 'Apple', 1.39, 243, 2),
    (DEFAULT, 'Banana', 1.59, 13, 2),
    (DEFAULT, 'Potato', 0.99, 57, 1);

/*markdown
# Simple queries
*/

SELECT
    ALL name
FROM
    product;

SELECT
    name,
    price
FROM
    product
WHERE
    stock < 50;

SELECT
    name,
    (price * 1.08) AS price_in_dollar
FROM
    product
WHERE
    name = 'Apple';

SELECT
    name,
    price
FROM
    product
WHERE
    (
        stock < 20
        OR stock > 100
    )
    AND price < 1.99;

SELECT
    name
FROM
    product
WHERE
    stock BETWEEN 13 AND 50;

SELECT
    name
FROM
    product
WHERE
    stock >= 13
    AND stock <= 50;

-- Order matters!
SELECT
    name
FROM
    product
WHERE
    stock BETWEEN 50 AND 13;

SELECT
    *
FROM
    product
WHERE
    price IN (0.99, 1.99, 2.99);

SELECT
    *
FROM
    product
WHERE
    name LIKE '%a%';

-- strings are case-sensitive!
SELECT
    *
FROM
    product
WHERE
    name LIKE '%A%';

SELECT ROUND(42.654321);
SELECT ROUND(42.4382, 2);
SELECT ROUND(1234.56, -1);

SELECT CAST ('100' AS INTEGER);

SELECT CAST ('10D' AS INTEGER);

/*markdown
Alias
*/

SELECT
    p.price
FROM
    product AS p;

SELECT
    price AS price_in_euro
FROM
    product;

/*markdown
Subqueries
*/

SELECT
    *
FROM
    (
        SELECT
            price,
            stock
        FROM
            product
        WHERE
            price > 1
    ) AS mySubQuery;

WITH expensive_products AS (
    SELECT
        price,
        stock
    FROM
        product
    WHERE
        price > 1
)

SELECT
    *
FROM
    expensive_products;

/*markdown
# Multiple tables
*/

SELECT
    *
FROM
    product, category;

-- For two tables equivalent rewrite
SELECT
    *
FROM
    product CROSS JOIN category;


SELECT
    *
FROM
    product,
    category
WHERE
    product.category_id = category.cat_id;

/*markdown
## Inner join
*/

/*markdown
Example modified:
*/

ALTER TABLE
    category RENAME COLUMN cat_id TO category_id;

INSERT INTO
    product (name, price, stock)
VALUES
    ('Fries', 2.30, 90);

SELECT
    *
FROM
    product
    INNER JOIN category ON product.category_id = category.category_id;

-- SELECT
--     *
-- FROM
--     product
--     INNER JOIN category WHERE product.category_id = category.category_id;

-- >> syntax error at or near "WHERE"

SELECT
    *
FROM
    product,
    category
WHERE
    product.category_id = category.category_id;

SELECT
    *
FROM
    product
    INNER JOIN category USING (category_id);

/*markdown
## NATURAL JOIN
*/

SELECT
    *
FROM
    product 
    NATURAL JOIN category;

/*markdown
## OUTER JOIN
*/

/*markdown
Example modified:
*/

INSERT INTO
    category (category_name)
VALUES
    ('Meat');

SELECT
    *
FROM
    product
    LEFT JOIN category ON product.category_id = category.category_id;

SELECT
    *
FROM
    product
    RIGHT JOIN category ON product.category_id = category.category_id;

SELECT
    *
FROM
    product 
    FULL JOIN category ON product.category_id = category.category_id;

/*markdown
## Set operations
*/

DROP TABLE IF EXISTS a;

DROP TABLE IF EXISTS b;

CREATE TABLE a (id INTEGER PRIMARY KEY, name text);

CREATE TABLE b (id INTEGER PRIMARY KEY, name text);

INSERT INTO
    a
VALUES
    (1, 'A'),
    (2, 'B'),
    (3, 'C');

INSERT INTO
    b
VALUES
    (1, 'A'),
    (2, 'D'),
    (3, 'E');

(
    SELECT
        *
    FROM
        a
)
UNION
(
    SELECT
        *
    FROM
        b
);

(
    SELECT
        *
    FROM
        a
)
INTERSECT
(
    SELECT
        *
    FROM
        b
);

(
    SELECT
        *
    FROM
        a
)
EXCEPT
(
    SELECT
        *
    FROM
        b
);

/*markdown
# Complex queries
*/

CREATE TABLE orders (
    order_id SERIAL,
    customer TEXT NOT NULL,
    year INTEGER,
    price NUMERIC,
    PRIMARY KEY (order_id)
)

INSERT INTO
    orders (customer, year, price)
VALUES
    ('Taylor', 2015, 19.90),
    ('Taylor', 2016, 29.00),
    ('Taylor', 2016, 50.90),
    ('Jones', 2016, 23.99),
    ('Jones', 2016, 5.70),
    ('Taylor', 2016, 99.99),
    ('Jones', 2016, 99.99);

SELECT
    *
FROM
    orders;

/*markdown
Overview example:
*/

SELECT
    customer,
    year,
    sum(price) AS total_amount
FROM
    orders
WHERE
    year > 2015
GROUP BY
    customer,
    year;

/*markdown
Rewrite:
*/

-- Only order from 2016
WITH orders_of_2016 AS (
    SELECT
        customer,
        year,
        price
    FROM
        orders
    WHERE
        year > '2015'
) 
-- Group by customer and year while summing up the price
SELECT
    customer,
    year,
    sum(price) AS total_amount
FROM
    orders_of_2016
GROUP BY
    customer,
    year;

/*markdown
Group by:
*/

SELECT
    customer,
    sum(price) AS price_total
FROM
    orders
GROUP BY
    customer;

SELECT
    customer,
    year,
    sum(price) AS price_total
FROM
    orders
GROUP BY
    customer,
    year;

/*markdown
Aggregation functions
*/

SELECT
    count(*)
FROM
    product;

SELECT
    category_id,
    count(product_id)
FROM
    product
GROUP BY
    category_id;

SELECT
    sum(price)
FROM
    orders;

DROP TABLE IF EXISTS avg_example;

CREATE TABLE avg_example (i INTEGER, j INTEGER);

INSERT INTO
    avg_example
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (NULL, 0);

SELECT
    *
FROM
    avg_example;

SELECT
    avg(i)
FROM
    avg_example;

SELECT
    avg(j)
FROM
    avg_example;

/*markdown
Min Max
*/

SELECT
    max(price)
FROM
    product;

select * from product;

-- SELECT
--     product_id,
--     max(price)
-- FROM
--     product;

-- column "product.product_id" must appear in the GROUP BY clause 
-- or be used in an aggregate function

SELECT
    product_id,
    max(price)
FROM
    product
GROUP BY
    product_id;

SELECT
    product_id,
    price
FROM
    product
WHERE
    price = (
        SELECT
            max(price)
        FROM
            product
    );

WITH max_price AS (
    SELECT
        max(price) AS max_price
    FROM
        product
)
SELECT
    product_id,
    price
FROM
    product NATURAL JOIN max_price 
WHERE
    price = max_price;

/*markdown
Having
*/

SELECT
    customer,
    year,
    sum(price) AS price_total
FROM
    orders
GROUP BY
    customer,
    year
HAVING
    sum(price) < 150;

/*markdown
Order By
*/

SELECT
    product_id, name
FROM
    product
ORDER BY
    name;