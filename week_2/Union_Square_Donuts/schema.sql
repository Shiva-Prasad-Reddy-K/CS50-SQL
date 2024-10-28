CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT,
    "price_per_unit" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "gluten-free" TEXT NOT NULL CHECK("gluten-free" IN ('Yes', 'No')),
    "price_per_donut" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "Donut_Ingredients" (
    "id" INTEGER,
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders" (
    "order_id" INTEGER ,
    "customer_id" INTEGER,
    PRIMARY KEY("order_id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "donuts_in_order" (
    "id" INTEGER,
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("order_id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "orders" INTEGER,
    PRIMARY KEY("id")
);


