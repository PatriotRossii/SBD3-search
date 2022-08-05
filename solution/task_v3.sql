-- Предложите решение с изменением структуры данных и запроса

-- 1. Избавиться от JOIN в запросе

SELECT users_user.id, users_user.first_name, users_user.second_name,
       users_user.last_name, users_user.email, users_user.address,
       users_user.phone_number, users_user.company_id, users_user.job_id,
       (users_user.last_name || ' ' || users_user.first_name || ' ' || users_user.second_name) AS fio
FROM
	users_user
WHERE
	UPPER(users_user.id::text) = UPPER('запрос') OR
	UPPER(users_user.last_name || ' ' || users_user.first_name || ' ' || users_user.second_name) LIKE UPPER('%запрос%') OR
	UPPER(users_user.phone_number::text) LIKE UPPER('%запрос%') OR
	UPPER(users_user.email::text) LIKE UPPER('%запрос%') OR
	users_user.company_id = ANY ((SELECT ARRAY  (SELECT id FROM users_company where UPPER(users_company.title::text) LIKE UPPER('%запрос%')))::BIGINT[]) OR
	users_user.job_id = ANY ((SELECT ARRAY (SELECT id FROM users_job where UPPER(users_job.title::text) LIKE UPPER('%запрос%')))::BIGINT[])
ORDER BY fio ASC;

-- 2. Создать индексы

-- Маленький work_mem способен привести к смерти базы данных при создании индексов
SET work_mem TO '50MB';
CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA pg_catalog;

CREATE INDEX IF NOT EXISTS id_idx ON users_user USING HASH(UPPER(id::text));

CREATE INDEX IF NOT EXISTS last_name_idx ON users_user USING gin(UPPER(last_name::text) gin_trgm_ops);
CREATE INDEX IF NOT EXISTS phone_number_idx ON users_user USING gin(UPPER(phone_number::text) gin_trgm_ops);
CREATE INDEX IF NOT EXISTS email_idx ON users_user USING gin(UPPER(email::text) gin_trgm_ops);
CREATE INDEX IF NOT EXISTS fio_idx ON users_user USING gin(UPPER((last_name || ' ' || first_name || ' ' || second_name)::text) gin_trgm_ops);
CREATE INDEX IF NOT EXISTS company_title_idx ON users_company USING gin(UPPER(title::text) gin_trgm_ops);
CREATE INDEX IF NOT EXISTS job_title_idx ON users_job USING gin(UPPER(title::text) gin_trgm_ops);

CREATE INDEX IF NOT EXISTS first_name_idx ON users_user(UPPER(first_name::text) varchar_pattern_ops);

CREATE INDEX IF NOT EXISTS company_id_idx ON users_user(company_id);
CREATE INDEX IF NOT EXISTS job_id_idx ON users_user(job_id);

-- DROP

-- DROP EXTENSION IF EXISTS pg_trgm;
-- DROP INDEX IF EXISTS id_idx;
-- DROP INDEX IF EXISTS last_name_idx;
-- DROP INDEX IF EXISTS phone_number_idx;
-- DROP INDEX IF EXISTS email_idx;
-- DROP INDEX IF EXISTS fio_idx;
-- DROP INDEX IF EXISTS company_title_idx;
-- DROP INDEX IF EXISTS job_title_idx;
-- DROP INDEX IF EXISTS first_name_idx;
-- DROP INDEX IF EXISTS company_id_idx;
-- DROP INDEX IF EXISTS job_id_idx;
