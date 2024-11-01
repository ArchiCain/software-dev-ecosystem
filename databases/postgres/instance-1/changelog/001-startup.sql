-- Create schema
CREATE SCHEMA IF NOT EXISTS "schema-1";

-- Create table with UUID primary key
CREATE TABLE IF NOT EXISTS "schema-1"."table-1" (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid()
);
