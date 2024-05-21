DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS tablename;

/*markdown
NUMERIC types
*/

/*markdown
Serial (auto increment)
*/

CREATE TABLE tablename (
    colname SERIAL
);

DROP TABLE IF EXISTS tablename;

CREATE SEQUENCE tablename_colname_seq AS INTEGER;

CREATE TABLE tablename (
    colname integer NOT NULL DEFAULT nextval('tablename_colname_seq')
);

ALTER SEQUENCE tablename_colname_seq OWNED BY tablename.colname;

/*markdown
## CHARACTER Types
*/

CREATE TABLE person (
    first_name VARCHAR(100),
    last_name CHAR(100)
);

INSERT INTO
    person (first_name, last_name)
VALUES
    ('John', 'Doe'),
    ('Alice', 'Smith');

SELECT
    *
FROM
    person;

/*markdown
DATE/TIME types
*/

CREATE TABLE customer (
    customer_id INTEGER,
    name TEXT,
    registered_at TIMESTAMP
);

INSERT INTO
    customer (customer_id, name, registered_at)
VALUES
    (1, 'John Doe', '2024-01-01 00:00:00'),
    (2, 'Jane Doe', NOW()),
    (3, 'Alice', CURRENT_TIMESTAMP);

SELECT
    *
FROM
    customer;