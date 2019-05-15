from django.shortcuts import render, HttpResponse
from .models import Article, ArticleImg, Banner, Flow, Hotel, HotelImg, HotelPrice, News, NewsImg, Position, Type


# Create your views here.
# todo 查询所有的数据作为demo
def selectAll(request):
    AllArticle = Article.objects.all()
    AllArticleImg = ArticleImg.objects.all()
    AllBanner = Banner.objects.all()
    AllFlow = Flow.objects.all()
    AllHotel = Hotel.objects.all()
    AllHotelImg = HotelImg.objects.all()
    AllHotelPrice = HotelPrice.objects.all()
    AllNews = News.objects.all()
    AllNewsImg = NewsImg.objects.all()
    AllPosition = Position.objects.all()
    AllType = Type.objects.all()

    context = {
        'AllArticle': AllArticle,
        'AllArticleImg': AllArticleImg,
        'AllBanner': AllBanner,
        'AllFlow': AllFlow,
        'AllHotel': AllHotel,
        'AllHotelImg': AllHotelImg,
        'AllHotelPrice': AllHotelPrice,
        'AllNews': AllNews,
        'AllNewsImg': AllNewsImg,
        'AllPosition': AllPosition,
        'AllType': AllType,
    }
    return render(request, 'index.html', context)
