# Generated by Django 2.1.8 on 2019-05-19 02:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('travel', '0002_auto_20190517_2002'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='articleimg',
            options={'managed': False, 'verbose_name': '景点图片', 'verbose_name_plural': '景点图片'},
        ),
        migrations.AlterModelOptions(
            name='banner',
            options={'managed': False, 'verbose_name': '首页轮播图', 'verbose_name_plural': '首页轮播图'},
        ),
        migrations.AlterModelOptions(
            name='hotelimg',
            options={'managed': False, 'verbose_name': '酒店图片', 'verbose_name_plural': '酒店图片'},
        ),
        migrations.AlterModelOptions(
            name='hotelprice',
            options={'managed': False, 'verbose_name': '酒店价格', 'verbose_name_plural': '酒店价格'},
        ),
    ]