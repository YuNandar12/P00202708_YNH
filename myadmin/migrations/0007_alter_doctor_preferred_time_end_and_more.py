# Generated by Django 4.2 on 2024-12-14 02:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myadmin', '0006_doctor_preferred_time_end_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='doctor',
            name='preferred_time_end',
            field=models.TimeField(null=True),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='preferred_time_start',
            field=models.TimeField(null=True),
        ),
    ]
