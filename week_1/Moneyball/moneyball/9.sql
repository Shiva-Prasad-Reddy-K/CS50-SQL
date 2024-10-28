SELECT "teams"."name" , ROUND(AVG("salaries"."salary") , 2)
FROM "salaries"
JOIN "teams" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
GROUP BY "salaries"."team_id"
ORDER BY "salary"
LIMIT 5;

