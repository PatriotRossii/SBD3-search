-- Укажите дополнительные индексы

CREATE INDEX id_idx ON users_user USING HASH (UPPER(id::text));
CREATE INDEX first_name_idx ON users_user(UPPER(first_name::text) varchar_pattern_ops);
CREATE INDEX last_name_idx ON users_user(UPPER(last_name::text) varchar_pattern_ops);

-- DROP

-- DROP INDEX IF EXISTS id_idx;
-- DROP INDEX IF EXISTS first_name_idx;
-- DROP INDEX IF EXISTS last_name_idx;
