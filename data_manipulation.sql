/*markdown
# Setup
*/

DROP TABLE IF EXISTS event;
DROP TYPE IF EXISTS event_type;

CREATE TYPE event_type AS ENUM ('Seminar', 'Lecture', 'Project Seminar');

CREATE TABLE event (
    event_id SERIAL,
    name TEXT NOT NULL,
    description TEXT,
    type event_type NOT NULL,
    PRIMARY KEY (event_id)
)

/*markdown
# Insert
*/

INSERT INTO
    event
VALUES
    (
        DEFAULT,
        'Data Management',
        'Lecture about data modeling, management, and SQL',
        'Lecture'
    );

INSERT INTO
    event (name, TYPE, description)
VALUES
    (
        'Data Management',
        'Lecture',
        'Lecture about data modeling, management, and SQL'
    );

/*markdown
# Update
*/

UPDATE
    event
SET
    type = 'Seminar'
WHERE
    name = 'Data Management';

/*markdown
# Delete
*/

DELETE FROM
    event;

DELETE FROM
    event
WHERE
    name = 'Data Management';