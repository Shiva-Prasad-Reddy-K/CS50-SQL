SELECT "players"."first_name" , "players"."last_name" , "salaries"."salary" , "performances"."HR" , "performances"."year" AS "year"
FROM "players"
JOIN "performances" ON "performances"."player_id" = "players"."id",
     "salaries" ON "salaries"."player_id" = "players"."id"
         AND "performances"."year" = "salaries"."year"
ORDER BY "players"."id" ,
         "salaries"."year" DESC ,
         "performances"."HR" DESC ,
         "salaries"."salary" DESC;

