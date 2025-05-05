DROP TABLE IF EXISTS membership;
DROP TABLE IF EXISTS event_hosted_in_forum;
DROP TABLE IF EXISTS forum;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS event;

DROP TYPE IF EXISTS event_type;
DROP TYPE IF EXISTS forum_state;
DROP TYPE IF EXISTS membership_state;

CREATE TABLE account (
    account_id SERIAL,
    password TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    birthday DATE,
    PRIMARY KEY (account_id)
)

CREATE TYPE event_type AS ENUM ('Seminar', 'Lecture', 'Project Seminar');

CREATE TABLE event (
    event_id SERIAL,
    name TEXT NOT NULL,
    description VARCHAR(10),
    type event_type NOT NULL,
    PRIMARY KEY (event_id)
)

CREATE TYPE forum_state AS ENUM ('open', 'closed');

CREATE TABLE forum (
    forum_id SERIAL,
    administrator INTEGER NOT NULL,
    state forum_state NOT NULL,
    topic TEXT NOT NULL,
    PRIMARY KEY (forum_id),
    FOREIGN KEY (administrator) REFERENCES account(account_id) 
        ON DELETE NO ACTION 
        ON UPDATE CASCADE
);

CREATE TABLE event_hosted_in_forum (
    forum_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    PRIMARY KEY (forum_id, event_id),
    FOREIGN KEY (forum_id) REFERENCES forum(forum_id) 
        ON DELETE NO ACTION 
        ON UPDATE CASCADE,
    FOREIGN KEY (event_id) REFERENCES event(event_id)
        ON DELETE NO ACTION 
        ON UPDATE CASCADE
);

CREATE TYPE membership_state AS ENUM ('standard', 'warned', 'blocked');

CREATE TABLE membership (
    forum_id INTEGER NOT NULL,
    account_id INTEGER NOT NULL,
    status membership_state NOT NULL,
    PRIMARY KEY (forum_id, account_id),
    FOREIGN KEY (forum_id) REFERENCES forum(forum_id) 
        ON DELETE NO ACTION 
        ON UPDATE CASCADE,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
        ON DELETE NO ACTION 
        ON UPDATE CASCADE
)