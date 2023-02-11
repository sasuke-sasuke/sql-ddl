-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL,
  planet_id INTEGER REFERENCES planets NOT NULL
);

INSERT INTO stars (name)
VALUES 
 ('The Sun'),
 ('Proxima Centauri'),
 ('Gliese 876'); 
 
INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 1, 'Milky Way'),
  ('Mars', 1.88, 1, 'Milky Way'),
  ('Venus', 0.62, 1, 'Milky Way'),
  ('Neptune', 164.8, 1, 'Milky Way'),
  ('Proxima Centauri b', 0.03, 2, 'Milky Way'),
  ('Gliese 876 b', 0.23, 3, 'Milky Way');

INSERT INTO moons
  (name, planet_id)
VALUES
  ('{"The Moon"}', 1),
  ('{"Phobos", "Deimos"}', 2),
  ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}', 4);