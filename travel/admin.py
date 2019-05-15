from django.contrib import admin
from .models import Article, ArticleImg, Banner, Flow, Hotel, HotelImg, HotelPrice, News, NewsImg, Position, Type, \
    PositionArea, PositionCity


# Register your models here.

class ArticleAdmin(admin.ModelAdmin):
    list_display = ('article_id', 'recommend_id', 'position_id', 'title', 'user', 'created_time')
    list_per_page = 20
    ordering = ('-article_id',)
    list_editable = ['position_id', 'recommend_id', 'title', 'user']


admin.site.register(ArticleImg)
admin.site.register(Type)
admin.site.register(Article, ArticleAdmin)
admin.site.register(HotelPrice)
admin.site.register(HotelImg)
admin.site.register(Hotel)
admin.site.register(Flow)
admin.site.register(Position)
admin.site.register(Banner)
admin.site.register(NewsImg)
admin.site.register(News)
admin.site.register(PositionArea)
admin.site.register(PositionCity)
