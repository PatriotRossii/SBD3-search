import random

from django.core.management.base import BaseCommand, CommandError
from factories.users import CompanyFactory, JobFactory, UserFactory
from fake.ru_RU import fake as ru_fake


class Command(BaseCommand):
    help = 'Генерация пользователей'

    # def add_arguments(self, parser):
    #     parser.add_argument('poll_ids', nargs='+', type=int)

    def handle(self, *args, **options):

        fake = ru_fake()

        companies = [
            CompanyFactory(title=fake.company(), address=fake.address())
            for _ in range(100)
        ]
        jobs = [JobFactory(title=fake.company()) for _ in range(300)]

        users = [UserFactory(
            first_name=fake.first_name(),
            second_name=fake.middle_name(),
            last_name=fake.last_name(),
            address=fake.address(),
            phone_number=fake.phone_number(),
            company=random.choice(companies),
            job=random.choice(jobs),
        ) for _ in range(1000)]
        self.stdout.write(self.style.SUCCESS('Successfully'))
