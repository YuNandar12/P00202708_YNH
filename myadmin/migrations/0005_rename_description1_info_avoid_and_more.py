# Generated by Django 4.2 on 2024-12-11 12:41

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myadmin', '0004_rename_description_info_description1_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='info',
            old_name='description1',
            new_name='Avoid',
        ),
        migrations.RenameField(
            model_name='info',
            old_name='description2',
            new_name='Risk_Factors',
        ),
        migrations.RenameField(
            model_name='info',
            old_name='description3',
            new_name='What_to_Do',
        ),
    ]
