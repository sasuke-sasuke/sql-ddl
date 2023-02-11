DROP DATABASE IF EXISTS soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    age INTEGER NOT NULL,
    pos VARCHAR(5) NOT NULL,
    years_exp INTEGER CHECK (years_exp > -1) DEFAULT 0,
    team INTEGER REFERENCES teams
);

CREATE TABLE refs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    age INTEGER NOT NULL,
    years_exp INTEGER CHECK (years_exp > -1) DEFAULT 0
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    name INTEGER REFERENCES players,
    goals INTEGER NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team_a_id INTEGER REFERENCES teams NOT NULL,
    a_score INTEGER NOT NULL,
    team_b_id INTEGER REFERENCES teams NOT NULL,
    b_score INTEGER NOT NULL,
    ref_id INTEGER NOT NULL
)