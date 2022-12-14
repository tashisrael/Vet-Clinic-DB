/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT * from animals WHERE neutered IS true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* update the animals table by setting the species column to unspecified */

/* Begin Transaction A */
BEGIN;

update animals set species = 'unspecified';

/* Verify that change was made */
SELECT * from animals;

/* Rollback changes */
ROLLBACK;

/* Verify changes */
SELECT * from animals;

/* Begin Transaction B */
BEGIN;

/* update species col for animals with names ending in mon */
update animals set species = 'digimon' where name like '%mon';

/* update species col for animals with names not ending in mon */
update animals set species = 'pokemon' where species IS null;

/* commit changes */
COMMIT;

/* Verify that change was made and persists after commit */
SELECT * from animals;

/* Delete all records in the animals table transaction C */
/* Begin Transaction C */
BEGIN;

/* delete all records */
DELETE from animals;

/* verify all records are deleted */
SELECT * from animals;

/* Rollback changes */
ROLLBACK;

/* verify all records still exist */
SELECT * from animals;