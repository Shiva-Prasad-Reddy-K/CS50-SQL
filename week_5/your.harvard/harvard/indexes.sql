CREATE INDEX "students_id" ON "students"("id");

CREATE INDEX "course_id" ON "enrollments"("course_id");

CREATE INDEX "department" ON "courses"("departments");

CREATE INDEX "name" ON "requirements"("name");

CREATE INDEX "semester" ON "courses"("semester");