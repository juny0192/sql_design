-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE name
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE location
(
  id SERIAL PRIMARY KEY,
  city_id INT REFERENCES city,
  country_id INT REFERENCES country
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  name_id INT REFERENCES name,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airline,
  from_location_id INT REFERENCES location,
  to_location_id INT REFERENCES location,
);

INSERT INTO name
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'), ('Waneta', 'Skeleton'), ('Berkie', 'Wycliff'), ('Alvin', 'Leathes'), ('Cory', 'Squibbes');

INSERT INTO country
  (name)
VALUES
  ('United States'), ('Japan'), ('United Kingdom'), ('Mexico'), ('France'), ('Morocco'), ('UAE'), ('China'), ('Brazil'), ('Chile');

INSERT INTO city
  (name)
VALUES
  ('Washington DC'), ('Seattle'), ('Tokyo'), ('London'), ('Los Angeles'), ('Las Vegas'), ('Mexico City'), ('Paris'), ('Casablanca'), ('Dubai'), ('Beijing'), ('New York'), 
  ('Charlotte'), ('Cedar Rapids'), ('Chicago'), ('New Orleans'), ('Sao Paolo'), ('Santiago');

INSERT INTO location
  (city_id, country_id)
VALUES
  (1, 1), (2, 1), (3, 2), (4, 3), (5, 1), (6, 1), (7, 4), (8, 5), (9, 6), (10, 7), (11, 8), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1), (17, 9), (18, 10);

INSERT INTO airline
  (name)
VALUES
  ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

INSERT INTO tickets
  (name_id, seat, departure, arrival, airline_id, from_location_id, to_location_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 7),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 16),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 18);