from django.db import models

# Create your models here.



class Review(models.Model):
    email = models.EmailField(null=True)
    review_text = models.TextField(max_length=500)
    rating = models.PositiveIntegerField(default=0) # Default rating is 0
    created_at = models.DateTimeField(auto_now_add=True, null=True)  # Add this field

    def __str__(self):
        return f'Review by {self.email} with rating {self.rating}'




class Appointment(models.Model):
    GENDER_CHOICES = [
        ('Male', 'Male'),
        ('Female', 'Female'),
        ('Transgender', 'Transgender'),
    ]
    
    full_name = models.CharField(max_length=100)
    email = models.EmailField()
    phone_number = models.CharField(max_length=15)
    preferred_date = models.DateField()
    preferred_time = models.TimeField()
    preferred_doctor = models.CharField(max_length=100)
    gender = models.CharField(max_length=15, choices=GENDER_CHOICES)

    def __str__(self):
        return f"{self.full_name} - {self.preferred_date} at {self.preferred_time}"


