from django.db import models


class Contact(models.Model):
    name = models.CharField(max_length=200)
    gender = models.CharField(max_length=6)
    phone = models.CharField(max_length=20)
    email = models.EmailField()

    class Meta:
        db_table = "CONTATOS"
