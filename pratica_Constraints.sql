CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL,
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
  "stateId" integer REFERENCES states(id) 
);

CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
  "fullName" TEXT NOT NULL, 
  "cpf" VARCHAR(15) UNIQUE NOT NULL, 
  "email" text NOT NULL UNIQUE,
  "password" TEXT NOT NULL
);

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id),
  "street" TEXT NOT NULL,
  "number" integer NOT NULL ,
  "complement"  text,
  "postalCode" VARCHAR(8) NOT NULL ,
  "cityId" integer REFERENCES cities(id) 
);

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id),
  "number" VARCHAR(11) UNIQUE NOT NULL,
  "type" ENUM(“landline”, “mobile”)
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id),
  "accountNumber" text NOT NULL UNIQUE , 
  "agency" text NOT NULL UNIQUE,
  "openDate" timestamp NOT NULL DEFAULT NOW() ,
  "closeDate" timestamp DEFAULT NULL
);

CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
  "bankAccountId"  integer REFERENCES bankAccountId(id), 
  "amount" integer NOT NULL, 
  "type" ENUM(“deposit”, “withdraw”) ,
  "time" TIMESTAMP WITHOUT TIMEZONE NOT NULL DEFAULT NOW(), 
  "description" , 
  "cancelled" boolean NOT NULL DEFAULT false
);

CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
  "bankAccountId" integer REFERENCES bankAccountId(id), 
	"name" TEXT UNIQUE NOT NULL,
  "number" integer NOT NULL,
  "securityCode" text NOT NULL , 
  "expirationYear" timestamp DEFAULT NULL,
  "password" TEXT NOT NULL ,
  "limit" integer NOT NULL
);
