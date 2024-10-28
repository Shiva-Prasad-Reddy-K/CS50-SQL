SELECT "players"."first_name" , "players"."last_name"
FROM "players"
JOIN "performances" ON "performances"."player_id" = "players"."id"
        AND "performances"."year" = "salaries"."year"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "salaries"."year" = 2001
      AND ("salaries"."salary"/"performances"."H") IN (
        SELECT 
      )
ORDER BY "players"."id" , "players"."last_name"
LIMIT 10;



"salaries"."salary"/"performances"."H" ,
         "salaries"."salary"/"performances"."RBI" ,
