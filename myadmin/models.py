from django.db import models

class Doctor(models.Model):
    name = models.CharField(max_length=100)
    specialization = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15)
    preferred_time_start = models.TimeField(null=True)
    preferred_time_end = models.TimeField(null=True)
    profile_picture = models.ImageField(upload_to='doctor_images/', blank=True, null=True)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name





class Service(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name
    

class Info(models.Model):
    name = models.CharField(max_length=100)
    Avoid = models.TextField()
    Risk_Factors = models.TextField(null=True)
    What_to_Do = models.TextField(null=True)

    def __str__(self):
        return self.name
