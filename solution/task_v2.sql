-- Укажите дополнительные индексы и команды

set statement_timeout to 0;
CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA pg_catalog;

CREATE INDEX IF NOT EXISTS id_idx ON users_user USING HASH (UPPER(id::text));

CREATE INDEX IF NOT EXISTS first_name_idx ON users_user USING gin(UPPER(first_name::text) gin_trgm_ops);
CREATE INDEX IF NOT EXISTS last_name_idx ON users_user USING gin(UPPER(last_name::text) gin_trgm_ops);
CREATE INDEX IF NOT EXISTS email_idx ON users_user USING gin(UPPER(email::text) gin_trgm_ops);

CREATE INDEX IF NOT EXISTS phone_number_idx ON users_user(UPPER(phone_number::text) varchar_pattern_ops);

-- DROP

-- DROP INDEX IF EXISTS id_idx;
-- DROP INDEX IF EXISTS first_name_idx;
-- DROP INDEX IF EXISTS last_name_idx;
-- DROP INDEX IF EXISTS email_idx;
-- DROP INDEX IF EXISTS phone_number_idx;
-- DROP EXTENSION IF EXISTS pg_trgm;