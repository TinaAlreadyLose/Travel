# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from DjangoUeditor.models import UEditorField  # 头部增加这行代码导入UEditorField


class Article(models.Model):
    article_id = models.AutoField(primary_key=True)
    position = models.CharField(max_length=40)
    recommend_id = models.IntegerField()
    title = models.CharField(max_length=40)
    body = UEditorField('内容', width=800, height=500,
                        toolbars="full", imagePath="UeditorImg/", filePath="UeditorFile/",
                        upload_settings={"imageMaxSize": 9204000},
                        settings={}, command=None, blank=True
                        )
    user = models.CharField(max_length=40)
    views = models.IntegerField()
    created_time = models.DateTimeField()
    url = models.CharField(max_length=2083)
    position_city = models.CharField(max_length=40)
    position_area = models.CharField(max_length=40)
    detail_area = models.CharField(max_length=100)
    lon = models.FloatField()
    lat = models.FloatField()
    summary = models.CharField(max_length=40)
    article_img = models.ImageField(upload_to='ArticleImg/%Y/%m/%d')

    class Meta:
        managed = False
        db_table = 'article'
        verbose_name = '景点介绍'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.article_id) + ': ' + self.title


class ArticleImg(models.Model):
    article_id = models.IntegerField()
    img = models.ImageField(upload_to='ArticleImg/%Y/%m/%d')

    class Meta:
        managed = False
        db_table = 'article_img'
        verbose_name = '景点图片'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': 文章' + str(self.article_id) + '的图片'


class Banner(models.Model):
    text_info = models.TextField()
    img = models.CharField(max_length=2083)
    link_url = models.CharField(max_length=2083)
    is_use = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'banner'
        verbose_name = '首页轮播图'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': ' + self.text_info


class Flow(models.Model):
    article_id = models.IntegerField()
    name = models.CharField(max_length=40)
    max = models.FloatField()
    time1_flow = models.FloatField()
    time2_flow = models.FloatField()
    time3_flow = models.FloatField()
    time4_flow = models.FloatField()
    time5_flow = models.FloatField()
    time6_flow = models.FloatField()
    flow_img = models.CharField(max_length=2083)

    class Meta:
        managed = False
        db_table = 'flow'
        verbose_name = '景点人流量'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': ' + self.name


class Hotel(models.Model):
    hotel_id = models.AutoField(primary_key=True)
    position = models.CharField(max_length=40)
    name = models.CharField(max_length=40)
    position_city = models.CharField(max_length=40)
    position_area = models.CharField(max_length=40)
    detail_massage = UEditorField('内容', width=800, height=500,
                                  toolbars="full", imagePath="UeditorImg/", filePath="UeditorFile/",
                                  upload_settings={"imageMaxSize": 9204000},
                                  settings={}, command=None, blank=True
                                  )
    lon = models.FloatField()
    lat = models.FloatField()
    detail_area = models.CharField(max_length=100)
    url = models.CharField(max_length=2083)
    avg_price = models.FloatField()
    summary = models.CharField(max_length=100)
    img=models.ImageField(upload_to='HotelImg/%Y/%m/%d')

    class Meta:
        managed = False
        db_table = 'hotel'
        verbose_name = '酒店'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.hotel_id) + ':' + str(self.name)


def __str__(self):
    return str(self.hotel) + ': ' + str(self.name)  # 使用hotel作为自增id


class HotelImg(models.Model):
    hotel_id = models.IntegerField()
    img = models.ImageField(upload_to='HotelImg/%Y/%m/%d')

    class Meta:
        managed = False
        db_table = 'hotel_img'
        verbose_name = '酒店图片'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': 酒店' + str(self.hotel_id) + '的图片'


class HotelPrice(models.Model):
    hotel_id = models.IntegerField()
    price = models.FloatField()
    url = models.CharField(max_length=2083)

    class Meta:
        managed = False
        db_table = 'hotel_price'
        verbose_name = '酒店价格'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': 酒店' + str(self.hotel_id) + '的价格'


class News(models.Model):
    news_title = models.CharField(max_length=40)
    news_body = UEditorField('内容', width=800, height=500,
                             toolbars="full", imagePath="UeditorImg/", filePath="UeditorFile/",
                             upload_settings={"imageMaxSize": 9204000},
                             settings={}, command=None, blank=True
                             )
    recommend_id = models.CharField(max_length=2083)  # add new on 17/05/2017
    news_img = models.ImageField(upload_to='NewsImg/%Y/%m/%d')  # add new on 17/05/2017
    url = models.CharField(max_length=2083)  # add new on 17/05/2017
    summary = models.CharField(max_length=100)  # add new on 17/05/2017

    class Meta:
        managed = False
        db_table = 'news'
        verbose_name = '新闻'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': ' + self.news_title


class NewsImg(models.Model):
    news_id = models.IntegerField()
    img = models.ImageField(upload_to='NewsImg/%Y/%m/%d')

    class Meta:
        managed = False
        db_table = 'news_img'
        verbose_name = '新闻图片'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': 新闻' + str(self.news_id) + '的图片'


class Type(models.Model):
    article_id = models.IntegerField()
    type = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'type'
        verbose_name = '景点类型'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': 文章' + str(self.article_id) + '的类型'
