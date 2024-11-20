CREATE TABLE temp (
    "id" INTEGER,
    "sentence" TEXT,
    PRIMARY KEY("id")
);

INSERT INTO "temp" ("sentence")
    SELECT substr("sentence",98,4)
    FROM "sentences"
    WHERE "id" = 14

    UNION ALL

    SELECT substr("sentence",3,5)
    FROM "sentences"
    WHERE "id" = 114

    UNION ALL

    SELECT substr("sentence",72,9)
    FROM "sentences"
    WHERE "id" = 618

    UNION ALL

    SELECT substr("sentence",7,3)
    FROM "sentences"
    WHERE "id" = 630

    UNION ALL

    SELECT substr("sentence",12,5)
    FROM "sentences"
    WHERE "id" = 932

    UNION ALL

    SELECT substr("sentence",50,7)
    FROM "sentences"
    WHERE "id" = 2230

    UNION ALL

    SELECT substr("sentence",44,10)
    FROM "sentences"
    WHERE "id" = 2346

    UNION ALL

    SELECT substr("sentence",14,5)
    FROM "sentences"
    WHERE "id" = 3041
;


CREATE VIEW "message" AS
SELECT GROUP_CONCAT("sentence" , ' ') AS "phrase"
FROM "temp";

bnb

