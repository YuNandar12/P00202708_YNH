# Generated by Django 4.2 on 2024-12-06 14:26

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('myapp', '0002_userprofile'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='health_info',
            field=models.CharField(choices=[('1', 'Health Info 1'), ('2', 'Health Info 2'), ('3', 'Health Info 3'), ('4', 'Health Info 4'), ('5', 'Health Info 5')], default='1', max_length=10),
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('health_info', models.CharField(choices=[('1', 'Health Info 1'), ('2', 'Health Info 2'), ('3', 'Health Info 3'), ('4', 'Health Info 4'), ('5', 'Health Info 5')], default='1', max_length=10)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]