# Generated by Django 4.2 on 2024-12-14 02:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myadmin', '0005_rename_description1_info_avoid_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='doctor',
            name='preferred_time_end',
            field=models.TimeField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='doctor',
            name='preferred_time_start',
            field=models.TimeField(blank=True, null=True),
        ),
    ]
