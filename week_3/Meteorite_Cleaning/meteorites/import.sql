-- Importing the contents of the CSV into a temporary table
.import --csv meteorites.csv temp

-- Removing the rows with "nametype" as 'Relict'
DELETE FROM "temp"
WHERE "nametype" = 'Relict';

-- Creating "meteorites" Table
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT UNIQUE,
    "class" TEXT,
    "mass" REAL DEFAULT NULL,
    "discovery" TEXT CHECK("discovery" IN ('Fell' , 'Found')),
    "year" INTEGER DEFAULT NULL,
    "lat" REAL  DEFAULT NULL,
    "long" REAL DEFAULT NULL,
    primary key("id")
);


UPDATE "temp"
SET "mass" = NULL
WHERE "mass" == ''
    OR "mass" IS NULL;

UPDATE "temp"
SET "year" = NULL
WHERE "year" == ''
    OR "year" IS NULL;

UPDATE "temp"
SET "lat" = NULL
WHERE "lat" == ''
    OR "lat" IS NULL;

UPDATE "temp"
SET "long" = NULL
WHERE "long" == ''
    OR "long" IS NULL;



INSERT INTO "meteorites" ("name" , "class" , "mass" , "discovery" , "year" , "lat" , "long")
SELECT "name" , "class" , ROUND("mass",2) , "discovery" , "year" , ROUND("lat",2) , ROUND("long",2)
FROM "temp"
ORDER BY "year" , "name" ;


-- Deleting the temporary table
DROP TABLE "temp";
