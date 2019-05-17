from django.contrib import admin
from .models import Article, ArticleImg, Banner, Flow, Hotel, HotelImg, HotelPrice, News, NewsImg, Type


# Register your models here.

class ArticleAdmin(admin.ModelAdmin):
    list_display = (
        'article_id', 'url', 'recommend_id', 'url', 'title', 'summary',
        'user', 'created_time')
    list_per_page = 20
    ordering = ('-article_id',)
    list_editable = ['url', 'recommend_id', 'title', 'user', 'summary']


admin.site.register(ArticleImg)
admin.site.register(Type)
admin.site.register(Article, ArticleAdmin)
admin.site.register(HotelPrice)
admin.site.register(HotelImg)
admin.site.register(Hotel)
admin.site.register(Flow)
admin.site.register(Banner)
admin.site.register(NewsImg)
admin.site.register(News)
