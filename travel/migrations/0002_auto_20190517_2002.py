# Generated by Django 2.2 on 2019-05-17 12:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('travel', '0001_initial'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Position',
        ),
        migrations.DeleteModel(
            name='PositionArea',
        ),
        migrations.DeleteModel(
            name='PositionCity',
        ),
    ]
