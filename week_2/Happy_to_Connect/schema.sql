CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT UNIQUE,
    "password" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "education" (
    "id" INTEGER,
    "name" TEXT UNIQUE,
    "type" TEXT,
    "location" TEXT,
    "year_founded" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT UNIQUE,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "people_connections" (
    "id" INTEGER,
    "user_id" INTEGER,
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

CREATE TABLE "school_connections" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC NOT NULL,
    "degree_type" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "education"("id")
);

CREATE TABLE "company_connection" (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC NOT NULL,
    "jon_title" TEXT ,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")

)


