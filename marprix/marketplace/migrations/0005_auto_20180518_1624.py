# Generated by Django 2.0.4 on 2018-05-18 16:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('marketplace', '0004_history'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='seller_location',
            field=models.CharField(blank=True, default=None, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='product',
            name='seller_name',
            field=models.CharField(blank=True, default=None, max_length=255, null=True),
        ),
    ]
