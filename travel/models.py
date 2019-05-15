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
    article = models.ForeignKey('Type', models.DO_NOTHING, primary_key=True)
    position_id = models.IntegerField()
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
    position_city_id = models.IntegerField()
    position_area_id = models.IntegerField()
    detail_area = models.CharField(max_length=100)
    lon = models.FloatField()
    lat = models.FloatField()

    class Meta:
        managed = False
        db_table = 'article'
        verbose_name = '文章'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.article_id) + ': ' + self.title


class ArticleImg(models.Model):
    article_id = models.IntegerField()
    img = models.ImageField(upload_to='ArticleImg/%Y/%m/%d')

    class Meta:
        managed = False
        db_table = 'article_img'
        verbose_name = '文章图片'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': 文章' + str(self.article_id) + '的图片'


# class AuthGroup(models.Model):
#     name = models.CharField(unique=True, max_length=150)
#
#     class Meta:
#         managed = False
#         db_table = 'auth_group'
#
#
# class AuthGroupPermissions(models.Model):
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
#     permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)
#
#     class Meta:
#         managed = False
#         db_table = 'auth_group_permissions'
#         unique_together = (('group', 'permission'),)
#
#
# class AuthPermission(models.Model):
#     name = models.CharField(max_length=255)
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
#     codename = models.CharField(max_length=100)
#
#     class Meta:
#         managed = False
#         db_table = 'auth_permission'
#         unique_together = (('content_type', 'codename'),)


# class AuthUser(models.Model):
#     password = models.CharField(max_length=128)
#     last_login = models.DateTimeField(blank=True, null=True)
#     is_superuser = models.IntegerField()
#     username = models.CharField(unique=True, max_length=150)
#     first_name = models.CharField(max_length=30)
#     last_name = models.CharField(max_length=150)
#     email = models.CharField(max_length=254)
#     is_staff = models.IntegerField()
#     is_active = models.IntegerField()
#     date_joined = models.DateTimeField()
#
#     class Meta:
#         managed = False
#         db_table = 'auth_user'
#
#
# class AuthUserGroups(models.Model):
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
#
#     class Meta:
#         managed = False
#         db_table = 'auth_user_groups'
#         unique_together = (('user', 'group'),)
#
#
# class AuthUserUserPermissions(models.Model):
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)
#
#     class Meta:
#         managed = False
#         db_table = 'auth_user_user_permissions'
#         unique_together = (('user', 'permission'),)


class Banner(models.Model):
    text_info = models.TextField()
    img = models.CharField(max_length=2083)
    link_url = models.CharField(max_length=2083)
    is_use = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'banner'
        verbose_name = '幻灯片'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': ' + self.text_info


# class DjangoAdminLog(models.Model):
#     action_time = models.DateTimeField()
#     object_id = models.TextField(blank=True, null=True)
#     object_repr = models.CharField(max_length=200)
#     action_flag = models.PositiveSmallIntegerField()
#     change_message = models.TextField()
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#
#     class Meta:
#         managed = False
#         db_table = 'django_admin_log'
#
#
# class DjangoContentType(models.Model):
#     app_label = models.CharField(max_length=100)
#     model = models.CharField(max_length=100)
#
#     class Meta:
#         managed = False
#         db_table = 'django_content_type'
#         unique_together = (('app_label', 'model'),)
#
#
# class DjangoMigrations(models.Model):
#     app = models.CharField(max_length=255)
#     name = models.CharField(max_length=255)
#     applied = models.DateTimeField()
#
#     class Meta:
#         managed = False
#         db_table = 'django_migrations'
#
#
# class DjangoSession(models.Model):
#     session_key = models.CharField(primary_key=True, max_length=40)
#     session_data = models.TextField()
#     expire_date = models.DateTimeField()
#
#     class Meta:
#         managed = False
#         db_table = 'django_session'


class Flow(models.Model):
    article_id = models.IntegerField()
    flow = models.BigIntegerField()
    name = models.CharField(max_length=40)
    max = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'flow'
        verbose_name = '景点人流量'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': ' + self.name


class Hotel(models.Model):
    hotel = models.ForeignKey('HotelPrice', models.DO_NOTHING, primary_key=True)
    position_id = models.IntegerField()
    name = models.CharField(max_length=40)
    position_city_id = models.IntegerField()
    position_area_id = models.IntegerField()
    detail_massage = models.CharField(max_length=100)
    lon = models.FloatField()
    lat = models.FloatField()

    class Meta:
        managed = False
        db_table = 'hotel'
        verbose_name = '旅馆'
        verbose_name_plural = verbose_name


def __str__(self):
    return str(self.hotel) + ': ' + str(self.name)  # 使用hotel作为自增id


class HotelImg(models.Model):
    hotel_id = models.IntegerField()
    img = models.ImageField(upload_to='HotelImg/%Y/%m/%d')

    class Meta:
        managed = False
        db_table = 'hotel_img'
        verbose_name = '旅馆图片'
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
        verbose_name = '旅馆价格'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id) + ': 酒店' + str(self.hotel_id) + '的价格'


class News(models.Model):
    id = models.ForeignKey('NewsImg', models.DO_NOTHING, db_column='id', primary_key=True)
    news_title = models.CharField(max_length=40)
    news_body = models.TextField()

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


class Position(models.Model):
    position = models.ForeignKey('PositionCity', models.DO_NOTHING, primary_key=True)
    province = models.CharField(max_length=100)
    province_url = models.CharField(max_length=2083)

    class Meta:
        managed = False
        db_table = 'position'
        verbose_name = '省-区域'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.position_id) + ': ' + str(self.province)


class PositionArea(models.Model):
    position_area_id = models.AutoField(primary_key=True)
    position_city_id = models.IntegerField()
    area = models.CharField(max_length=255)
    lon = models.FloatField()
    lat = models.FloatField()

    class Meta:
        managed = False
        db_table = 'position_area'
        verbose_name = '区-区域'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.position_area_id) + ': ' + str(self.area)


class PositionCity(models.Model):
    position_city = models.ForeignKey(PositionArea, models.DO_NOTHING, primary_key=True)
    position_id = models.IntegerField()
    city = models.CharField(max_length=40)

    class Meta:
        managed = False
        db_table = 'position_city'
        verbose_name = '市-区域'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.position_city_id) + ': ' + str(self.city)


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
