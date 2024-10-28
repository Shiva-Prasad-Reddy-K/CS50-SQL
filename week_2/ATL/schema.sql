CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" NOT NULL,
    "last_name" NOT NULL,
    "age" NOT NULL CHECK("age" != 0),
    PRIMARY KEY("id")
);

CREATE TABLE "CheckIn" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id")
);

CREATE TABLE "airlines" (
    "airline_name" TEXT,
    "concourse" TEXT CHECK("concourse" IN ('A','B','C','D','E','F','T'))
);

CREATE TABLE "flights" (
    "flight_number" INTEGER,
    "airline" TEXT,
    "departing_AC" TEXT,
    "heading_AC" TEXT,
    "expected_datetime" NUMERIC,
    "expected_arrival" NUMERIC,
    FOREIGN KEY("airline") REFERENCES "airlines"("concourse")
);
