-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/tyFpm3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS "Contacts" CASCADE;
DROP TABLE IF EXISTS "Campaign" CASCADE;
DROP TABLE IF EXISTS "Category" CASCADE;
DROP TABLE IF EXISTS "SubCategory" CASCADE;


CREATE TABLE "Contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "email" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "Campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description" text   NOT NULL,
    "goal" numeric(10,2)   NOT NULL,
    "pledged" numeric(10,2)   NOT NULL,
    "outcome" varchar(50)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" varchar(10)   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "Category" (
    "Cat_ids" VARCHAR   NOT NULL,
    "Cat" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "Cat_ids"
     )
);

CREATE TABLE "SubCategory" (
    "subcat_ids" VARCHAR   NOT NULL,
    "SubCategory" VARCHAR   NOT NULL,
    CONSTRAINT "pk_SubCategory" PRIMARY KEY (
        "subcat_ids"
     )
);

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("Cat_ids");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "SubCategory" ("subcat_ids");

COPY "Contacts" FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\Resources\contacts.csv' WITH CSV HEADER;
COPY "Campaign" FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\Resources\campaign.csv' WITH CSV HEADER;
Copy "Category" FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\Resources\category.csv' WITH CSV HEADER;
COPY "SubCategory" FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\Resources\subcategory.csv' WITH CSV HEADER;


