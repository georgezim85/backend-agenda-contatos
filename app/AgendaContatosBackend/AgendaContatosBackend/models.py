from django.db import models

class Contact(models.Model):
    name = models.CharField(max_length = 50)
    gender = models.CharField(max_length = 50)
    phone = models.CharField(max_length = 50)
    email = models.CharField(max_length = 50)
