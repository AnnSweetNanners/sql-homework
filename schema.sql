-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/rLbwCv
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "transaction" (
    "t_id" Serial   NOT NULL,
    "date" timestamp   NOT NULL,
    "amount" Float   NOT NULL,
    "card" INT   NOT NULL,
    "id_merchant" INT   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "t_id"
     )
);

CREATE TABLE "card_holder" (
    "ch_id" SERIAL   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "credit_card_holder" INT   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "ch_id"
     )
);

CREATE TABLE "credit_card" (
    "card" VARCHAR(20)   NOT NULL,
    "id_card_holder" INT   NOT NULL
);

CREATE TABLE "merchant_category" (
    "mc_id" Serial   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "mc_id"
     )
);

CREATE TABLE "merchant" (
    "m_id" Serial   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "m_id"
     )
);

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card" FOREIGN KEY("card")
REFERENCES "credit_card" ("card");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchant" ("m_id");

ALTER TABLE "card_holder" ADD CONSTRAINT "fk_card_holder_ch_id" FOREIGN KEY("ch_id")
REFERENCES "credit_card" ("id_card_holder");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("mc_id");

