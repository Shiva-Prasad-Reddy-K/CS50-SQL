SELECT "salaries"."salary" FROM "salaries"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
WHERE "performances"."HR" = (
    SELECT MAX("HR") FROM "performances"
)
AND "salaries"."year" = 2001;
