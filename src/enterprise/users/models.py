from django.db import models


class Company(models.Model):
    title = models.CharField("Title", max_length=100)
    address = models.CharField("Address", max_length=200)

    def __str__(self) -> str:
        return f"<{self.id}: {self.title}>"

class Job(models.Model):
    title = models.CharField("Title", max_length=100)

    def __str__(self) -> str:
        return f"<{self.id}: {self.title}>"


class User(models.Model):

    first_name = models.CharField("First name", max_length=100)
    second_name = models.CharField("First name", max_length=100)
    last_name = models.CharField("First name", max_length=100)
    email = models.EmailField("Email", max_length=100)
    address = models.CharField("Address", max_length=200)
    phone_number = models.CharField("Phone number", max_length=20)
    company = models.ForeignKey(Company, on_delete=models.PROTECT, related_name="users")
    job = models.ForeignKey(Job, on_delete=models.PROTECT, related_name="+")

    def __str__(self) -> str:
        return f"<{self.id}: {self.last_name} {self.first_name} {self.second_name}>"
