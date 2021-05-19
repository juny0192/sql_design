CREATE TABLE "region" (
  "id" int PRIMARY KEY,
  "name" text
);

CREATE TABLE "users" (
  "id" int PRIMARY KEY,
  "preffered_refion" ref
);

CREATE TABLE "posts" (
  "id" int PRIMARY KEY,
  "title" text NOT NULL,
  "categories" ref NOT NULL,
  "user_id" Ref UNIQUE NOT NULL,
  "location" text,
  "region_id" ref NOT NULL
);

CREATE TABLE "categories" (
  "id" int PRIMARY KEY,
  "subject" text NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("preffered_refion") REFERENCES "region" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "posts" ("user_id");

ALTER TABLE "region" ADD FOREIGN KEY ("id") REFERENCES "posts" ("region_id");

ALTER TABLE "categories" ADD FOREIGN KEY ("id") REFERENCES "posts" ("categories");
