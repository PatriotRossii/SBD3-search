build:
	docker build -f deploy/local/Dockerfile -t fruits/service .


up:
	docker-compose up -d  

down:
	docker-compose down

migrate:
	docker-compose exec service python manage.py migrate

fill:
	docker-compose exec service python manage.py fill

create_db:
	docker-compose exec store psql "user=user password=random" -c "create database homework WITH ENCODING 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';"

restore_db:
	docker-compose exec -T store psql "dbname=homework user=user password=random" <dump.sql

drop_db:
	docker-compose exec store psql "user=user password=random" -c "drop database homework;"

logs:
	docker-compose logs -f

test:
	docker-compose exec service pytest --durations=0
