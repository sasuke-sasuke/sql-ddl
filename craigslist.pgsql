DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region TEXT UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(15) NOT NULL,
    region INTEGER REFERENCES regions NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE NOT NULL,
    post_body TEXT NOT NULL,
    location TEXT,
    region INTEGER REFERENCES regions NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category VARCHAR(15) NOT NULL
);

INSERT INTO regions (region)
VALUES
    ('South East'),
    ('South West'),
    ('North East');

INSERT INTO users 
    (username, password, region)
VALUES
    ('sasuke', 'uchihaforever', 1),
    ('naruto', 'believeit', 2);

INSERT INTO posts 
    (title, user_id, post_body, location, region)
VALUES
    ('Looking for Forest Woman', 1, 'Im looking for a forest uchiha to make my wife', 'home', 1),
    ('Believe it!', 2, 'BELIEVE IT!', 'Leaf Village', 2);

