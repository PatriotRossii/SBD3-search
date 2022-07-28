from faker import Faker
from faker.providers.person.ru_RU import Provider as PersonProvider
from faker.providers.company.ru_RU import Provider as CompanyProvider
from faker.providers.job.ru_RU import Provider as JobProvider
from faker.providers.phone_number.ru_RU import Provider as PhoneProvider


def fake():

    ff = Faker()
    ff.add_provider(PersonProvider)
    ff.add_provider(CompanyProvider)
    ff.add_provider(JobProvider)
    ff.add_provider(PhoneProvider)

    return ff
