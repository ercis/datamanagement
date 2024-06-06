DROP TABLE IF EXISTS COMMENT;

CREATE TABLE COMMENT (
    content TEXT
);

SELECT
    *
FROM
    COMMENT;

INSERT INTO comment VALUES ('Wow amazing weather today!');

SELECT
    *
FROM
    COMMENT;

/*markdown
INSERT INTO comment VALUES ('hello'); DELETE FROM comment; INSERT INTO comment VALUES ('Hacked!');
*/

INSERT INTO
    COMMENT
VALUES
    ('hello');

DELETE FROM
    COMMENT;

INSERT INTO
    COMMENT
VALUES
    ('Hacked!');

SELECT
    *
FROM
    COMMENT;