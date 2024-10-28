SELECT "districts"."name", "expenditures"."per_pupil_expenditure" FROM
"districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id";

