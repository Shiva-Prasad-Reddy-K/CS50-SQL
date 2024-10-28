SELECT "players"."first_name" , "players"."last_name" ,
        ("salaries"."salary"/"performances"."H") AS "dollars per hit"
FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id" ,
     "performances" ON "performances"."player_id" = "salaries"."player_id"
        AND "performances"."year" = "salaries"."year"
WHERE "salaries"."year" = 2001 AND "H" > 0
GROUP BY "performances"."player_id"
ORDER BY "dollars per hit" , "players"."first_name" , "players"."last_name"
LIMIT 10;
