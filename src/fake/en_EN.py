from faker import Faker
from faker.providers.person import Provider as PersonProvider
from faker.providers.company import Provider as CompanyProvider
from faker.providers.job import Provider as JobProvider
from faker.providers.phone_number import Provider as PhoneProvider


def fake():

    ff = Faker()
    ff.add_provider(PersonProvider)
    ff.add_provider(CompanyProvider)
    ff.add_provider(JobProvider)
    ff.add_provider(PhoneProvider)

    return ff
