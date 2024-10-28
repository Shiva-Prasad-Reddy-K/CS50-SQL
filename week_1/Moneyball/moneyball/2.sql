SELECT "year" , "salary" FROM "SALARIES" where "player_id" = (
    SELECT "id" FROM "players" WHERE "first_name" = 'Cal' AND "last_name" = 'Ripken'
)
ORDER BY "year" DESC;
