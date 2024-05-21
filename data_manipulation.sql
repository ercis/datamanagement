/*markdown
# Setup
*/

DROP TYPE veranstaltungstyp;

CREATE TYPE veranstaltungstyp AS ENUM ('Seminar', 'Vorlesung', 'Projektseminar');

CREATE TABLE veranstaltung (
    veranstaltung_id SERIAL,
    bezeichnung VARCHAR(255) NOT NULL,
    kurzbeschreibung VARCHAR(10),
    typ veranstaltungstyp NOT NULL,
    sws INTEGER NOT NULL,
    beschreibung TEXT,
    PRIMARY KEY (veranstaltung_id)
)

/*markdown
# Insert
*/

INSERT INTO
    veranstaltung
VALUES
    (
        DEFAULT,
        'Datenmanagement',
        'Dama',
        'Vorlesung',
        4,
        'Vorlesung mit Folien zu SQL'
    );

INSERT INTO
    veranstaltung (bezeichnung, typ, sws)
VALUES
    ('Datenmanagement', 'Vorlesung', 4);

/*markdown
# Update
*/

UPDATE
    veranstaltung
SET
    sws = 6
WHERE
    bezeichnung = 'Datenmanagement';

/*markdown
# Delete
*/

DELETE FROM
    veranstaltung;

DELETE FROM
    veranstaltung
WHERE
    kurzbeschreibung = 'Dama';