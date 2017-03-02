/* create a new table for sneakers */

CREATE TABLE sneakers (
id SERIAL PRIMARY KEY,
brand VARCHAR(80) NOT NULL,
color VARCHAR(80) NOT NULL
);

/* add some sneakers to the table */

INSERT INTO sneakers (brand,color)
VALUES ('nike','black'),
('new balance','grey'),
('sketchers','blue'),
('Doc Martins','jet black');

/* make sure things look ok */

SELECT *
FROM sneakers;


/* here's our people table */

CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(80),
  last_name VARCHAR(80)
);

INSERT INTO people (first_name, last_name)
VALUES ('Luke', 'Schlangen'),
('Melissa', 'Hare'),
('Jeremy', 'Leif'),
('Christine', 'Pogatchnik');

/*make sure everything looks ok */

SELECT *
FROM people;

/* here's our junction table */

CREATE TABLE people_sneakers (
id SERIAL PRIMARY KEY,
people_id INT REFERENCES people,
sneakers_id INT REFERENCES sneakers
);

/*make sure everything looks ok*/

SELECT *
FROM people_sneakers;

/* let's populate our junction table for the many-to-many relationships */

INSERT INTO people_sneakers (people_id, sneakers_id)
VALUES (1,2),
(2,1),
(3,1),
(2,4),
(4,1),
(4,2),
(4,3),
(4,4);

/* NOW LET'S HAVE SOME FUN */


SELECT *
FROM people
JOIN people_sneakers ON people_sneakers.people_id=people.id
JOIN sneakers ON people_sneakers.sneakers_id=sneakers.id;

/* NEXT STEP:  Add some more people...and some more sneakers...but we
will then play around with results when some people don't own any sneakers
and some sneakers are not owned by anyone */

/* after that, we can break out the color column...because isn't that a many-to-many?*/

/* we could also do sizes */
