import random

from django.core.management.base import BaseCommand, CommandError
from factories.users import CompanyFactory, JobFactory, UserFactory
from fake.en_EN import fake as en_fake


class Command(BaseCommand):
    help = 'Генерация пользователей'

    def handle(self, *args, **options):

        fake = en_fake()

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
