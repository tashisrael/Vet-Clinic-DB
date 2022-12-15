/* Database schema to keep the structure of entire database. */

create database vet_clinic;

CREATE TABLE animals (
    id serial PRIMARY KEY NOT NULL,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD COLUMN species varchar(250);

/* Create owners table */
CREATE TABLE owners (id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL, full_name varchar(250), age int);

/* Create species table */
CREATE TABLE species (id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL, name varchar(250));

/* Modify animals table (ID already set to auto_increment while creating the table on line no.5) */
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id int;
ALTER TABLE animals ADD CONSTRAINT fk_name FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id int;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

/* Vets Table */
CREATE TABLE vets (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(250), age INT, date_of_graduation DATE);

/* Specializations Table */
CREATE TABLE specializations (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 vets_id INT,
 species_id INT,
 CONSTRAINT vet_fk FOREIGN KEY(vets_id) REFERENCES vets(id),
 CONSTRAINT species_fk FOREIGN KEY(species_id) REFERENCES species(id)
);

/* Visits Table */
CREATE TABLE visits (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 animals_id INT,
 vets_id INT,
 date_of_visit DATE,
 CONSTRAINT vet_fk FOREIGN KEY(vets_id) REFERENCES vets(id),
 CONSTRAINT animals_fk FOREIGN KEY(animals_id) REFERENCES animals(id)
);
