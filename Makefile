up:
	docker-compose up -d  

down:
	docker-compose down

migrate:
	python src/manage.py migrate

fill:
	python src/manage.py fill

fill_short:
	python src/manage.py fill_short

create_db:
	docker-compose exec store psql "user=user password=random" -c "create database homework WITH ENCODING 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';"

drop_db:
	docker-compose exec store psql "user=user password=random" -c "drop database homework;"


test:
	pytest src
