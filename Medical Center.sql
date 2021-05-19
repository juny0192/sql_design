CREATE TABLE "doctor" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "major" text
);

CREATE TABLE "patients" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "birthday" date
);

CREATE TABLE "diseases" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "description" text
);

CREATE TABLE "diagnose" (
  "id" int PRIMARY KEY,
  "patient_id" References,
  "diseases_id" References
);

CREATE TABLE "visit" (
  "id" int PRIMARY KEY,
  "visit_date" date,
  "doctor_id" References,
  "patient_id" References
);

ALTER TABLE "diagnose" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

ALTER TABLE "diagnose" ADD FOREIGN KEY ("diseases_id") REFERENCES "diseases" ("id");

ALTER TABLE "visit" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctor" ("id");

ALTER TABLE "visit" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");
