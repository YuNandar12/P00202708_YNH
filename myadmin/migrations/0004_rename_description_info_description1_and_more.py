# Generated by Django 4.2 on 2024-12-11 12:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myadmin', '0003_info'),
    ]

    operations = [
        migrations.RenameField(
            model_name='info',
            old_name='description',
            new_name='description1',
        ),
        migrations.AddField(
            model_name='info',
            name='description2',
            field=models.TextField(null=True),
        ),
        migrations.AddField(
            model_name='info',
            name='description3',
            field=models.TextField(null=True),
        ),
    ]
