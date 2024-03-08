/*markdown
Delete old tables, if they are already in the database
*/

DROP TABLE IF EXISTS product;

/*markdown
Table definition (Data Definition)
*/

CREATE TABLE product (
    product_id INTEGER,
    name TEXT,
    price DECIMAL
);

/*markdown
Insert example values (Data Manipulation)
*/

INSERT INTO
    product (product_id, name, price)
VALUES
    (1, 'Apple', 0.5),
    (2, 'Banana', 0.3),
    (3, 'Orange', 0.4),
    (4, 'Pineapple', 1.2),
    (5, 'Mango', 1.5);

/*markdown
Query all products (Data Query)
*/

SELECT * FROM product;