DROP TABLE IF EXISTS mitglied;
DROP TABLE IF EXISTS zuordnung;
DROP TABLE IF EXISTS forum;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS veranstaltung;

DROP TYPE IF EXISTS veranstaltungstyp;
DROP TYPE IF EXISTS forum_status;
DROP TYPE IF EXISTS mitglied_status;

CREATE TABLE account (
    account_id SERIAL,
    passwort VARCHAR(1000) NOT NULL,
    name VARCHAR(45) NOT NULL,
    vorname VARCHAR(45) NOT NULL,
    email VARCHAR(255) NOT NULL,
    geburtsdatum DATE,
    PRIMARY KEY (account_id)
)

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

CREATE TYPE forum_status AS ENUM ('offen', 'geschlossen');

CREATE TABLE forum (
    forum_id SERIAL,
    administrator INTEGER NOT NULL,
    status forum_status NOT NULL,
    thema VARCHAR(100) NOT NULL,
    PRIMARY KEY (forum_id),
    FOREIGN KEY (administrator) REFERENCES account(account_id) 
        ON DELETE NO ACTION 
        ON UPDATE CASCADE
);

CREATE TABLE zuordnung (
    zuordnung_forum INTEGER NOT NULL,
    zuordnung_veranstaltung INTEGER NOT NULL,
    PRIMARY KEY (zuordnung_forum, zuordnung_veranstaltung),
    FOREIGN KEY (zuordnung_forum) REFERENCES forum(forum_id) 
        ON DELETE NO ACTION 
        ON UPDATE CASCADE,
    FOREIGN KEY (zuordnung_veranstaltung) REFERENCES veranstaltung(veranstaltung_id)
        ON DELETE NO ACTION 
        ON UPDATE CASCADE
);

CREATE TYPE mitglied_status AS ENUM ('standard', 'verwarnt', 'gesperrt');

CREATE TABLE mitglied (
    forum_id INTEGER NOT NULL,
    account_id INTEGER NOT NULL,
    status mitglied_status NOT NULL,
    PRIMARY KEY (forum_id, account_id),
    FOREIGN KEY (forum_id) REFERENCES forum(forum_id) 
        ON DELETE NO ACTION 
        ON UPDATE CASCADE,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
        ON DELETE NO ACTION 
        ON UPDATE CASCADE
)