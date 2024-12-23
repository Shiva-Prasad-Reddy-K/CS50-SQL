SELECT "city", COUNT("type")
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING COUNT("type") < 4
ORDER BY COUNT("type") DESC, "city";
