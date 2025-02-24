/*markdown
# Setup
*/

DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS orders;

CREATE TABLE category (
    category_id SERIAL,
    category_name TEXT NOT NULL,
    PRIMARY KEY (category_id)
)

CREATE TABLE product (
    product_id SERIAL,
    name TEXT NOT NULL,
    price NUMERIC,
    stock INTEGER,
    category_id INTEGER,
    PRIMARY KEY (product_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);

INSERT INTO
    category (category_name)
VALUES
    ('Vegetable'),
    ('Fruit'),
    ('Beverage');

INSERT INTO
    product (name, price, stock, category_id)
VALUES
    ('Apple', 1.39, 243, 2),
    ('Banana', 1.59, 13, 2),
    ('Potato', 0.99, 57, 1),
    ('Tomato', 1.19, 32, 1),
    ('Orange Juice', 2.99, 12, 3),
    ('Milk', 1.99, 43, 3),
    ('Water', 0.99, 100, 3),
    ('Soda', 1.49, 23, 3),
    ('Pineapple', 2.99, 5, 2),
    ('Grapes', 3.99, 8, 2),
    ('Carrot', 0.79, 20, 1),
    ('Cucumber', 0.89, 15, 1),
    ('Lemon', 0.69, 30, 2),
    ('Strawberry', 2.49, 10, 2),
    ('Blueberry', 3.49, 7, 2),
    ('Peach', 1.99, 9, 2),
    ('Pear', 1.79, 11, 2),
    ('Pineapple Juice', 2.99, 6, 3),
    ('Apple Juice', 2.49, 8, 3),
    ('Grape Juice', 3.49, 5, 3),
    ('Lemonade', 1.99, 10, 3),
    ('Tea', 1.29, 15, 3),
    ('Coffee', 1.99, 20, 3),
    ('Energy Drink', 2.49, 7, 3),
    ('Soda Water', 0.99, 30, 3),
    ('Orange', 1.29, 20, 2),
    ('Kiwi', 1.99, 10, 2),
    ('Watermelon', 4.99, 3, 2),
    ('Cantaloupe', 3.99, 4, 2),
    ('Honeydew', 3.49, 5, 2);

/*markdown
# Views
*/

/*markdown
Get all drinks with category name
*/

SELECT
    *
FROM
    product
    LEFT JOIN category ON product.category_id = category.category_id
WHERE
    category_name = 'Beverage';

/*markdown
Get all drinks with category name. Show only the top 5 most expensive drinks
*/

SELECT
    *
FROM
    product
    LEFT JOIN category ON product.category_id = category.category_id
WHERE
    category_name = 'Beverage'
ORDER BY
    price DESC
LIMIT
    5;

/*markdown
### Add a beverages view to simplify future queries
*/

CREATE VIEW beverages AS
SELECT
    *
FROM
    product
    LEFT JOIN category USING(category_id)
WHERE
    category_name = 'Beverage';

SELECT
    *
FROM
    beverages;

/*markdown
WITH VIEW: Get all drinks with category name. Show only the top 5 most expensive drinks.
*/

SELECT
    *
FROM
    beverages
ORDER BY
    price DESC
LIMIT
    5;