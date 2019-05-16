from django.shortcuts import render, HttpResponse
from .models import Article, ArticleImg, Banner, Flow, Hotel, HotelImg, HotelPrice, News, NewsImg, Position, Type
import requests

from django.shortcuts import render
from math import radians, cos, sin, asin, sqrt, pi, fabs
from django.http import HttpResponse
from django.views.decorators import csrf
from urllib import parse  # 经纬度转化
import requests
import json
import hashlib
# 流量分析图
import sys
import matplotlib
import matplotlib.pyplot as plt  # 使用mateplotlib生成折线图
from pylab import *

mpl.rcParams['font.sans-serif'] = ['Microsoft YaHei']


# Create your views here.

# 查询所有的数据作为demo
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


# 首页路由请求
def BootStrap(request):
    return render(request, 'bootStrap.html')


# 详细网页路由请求
def detail(request):
    return render(request, 'detail.html')


# 景区路由请求
def sightsRecommand(request):
    return render(request, 'sightsRecommend.html')


# 新闻路由请求
def news(request):
    return render(request, 'news.html')


###^----------------庆------------^###

#    两点键位置信息具体测定   #
EARTH_RADIUS = 6371  # 地球平均半径，6371km


# Create your views here.
#      对输入的两个经纬度信息进行测距   #
def hav(theta):
    s = sin(theta / 2)
    return s * s


def get_distance_hav(lat0, lng0, lat1, lng1):
    "用haversine公式计算球面两点间的距离。"
    # 经纬度转换成弧度

    lat0 = radians(lat0)
    lat1 = radians(lat1)
    lng0 = radians(lng0)
    lng1 = radians(lng1)

    dlng = fabs(lng0 - lng1)
    dlat = fabs(lat0 - lat1)
    h = hav(dlat) + cos(lat0) * cos(lat1) * hav(dlng)
    distance = 2 * EARTH_RADIUS * asin(sqrt(h))
    return distance


#            流量分析图                   #
def flow_index(names, y, title):
    x = range(len(names))
    plt.plot(x, y, marker='o', mec='r', mfc='w', label=u'flow')
    plt.legend()  # 让图例生效
    plt.xticks(x, names, rotation=45)
    plt.margins(0)
    plt.subplots_adjust(bottom=0.15)
    plt.xlabel(u"日期")  # x轴标签
    plt.ylabel("流量")  # y轴标签
    plt.title(title + "风景区")  # 标题
    plt.savefig('media/FlowImg/' + title + '.jpg')
    return


def flow(request):
    names = ["2019-01", "2019-02", "2019-03", "2019-04", "2019-05", "2019-6"]
    y = [1000, 3000, 2000, 4000, 7000, 3000]
    title = "泰山"
    flow_index(names, y, title)
    plt.rc('font', family=['Microsoft YaHei'])
    return HttpResponse(plt.show())


#     获取详细地址的经纬度信息函数        #

def address(address):
    address_index = {}
    queryStr = '/geocoder/v2/?address=%s&output=json&ak=leDOPGBU5Gwk6D3wGZigrNk560zN50GX' % address
    encodeStr = parse.quote(queryStr, safe="/:=&?#+!$,;@'()*[]")
    rawStr = encodeStr + 'leDOPGBU5Gwk6D3wGZigrNk560zN50GX'
    sn = (hashlib.md5(parse.quote_plus(rawStr).encode("utf8")).hexdigest())
    url = parse.quote("http://api.map.baidu.com" + queryStr + "&sn=" + sn, safe="/:=&?#+!$,;'@()*[]")
    res = requests.get(url)
    json_data = json.loads(res.text)
    longitude = json_data['result']['location']['lng']  # 经度
    latitude = json_data['result']['location']['lat']  # 维度
    address_index['lng'] = longitude
    address_index['lat'] = latitude
    return address_index  # 返回携带具体经纬度信息的字典


# post表单请求


def search_post(request):
    ctx = {}
    if request.POST:
        ctx['address1'] = request.POST['address1']
        ctx['address2'] = request.POST['address2']
        # address(ctx['address1'])   #获取第一个经纬度信息
        # address(ctx['address2'])   #获取第二个经纬度信息
        ctx['lng1'] = address(ctx['address1'])['lng']  # 经度
        ctx['lat1'] = address(ctx['address1'])['lat']  # 维度
        ctx['lng2'] = address(ctx['address2'])['lng']  # 经度
        ctx['lat2'] = address(ctx['address2'])['lat']  # 维度
        d = get_distance_hav(ctx['lat1'], ctx
        ['lng1'], ctx['lat2'], ctx['lng2'])

    return render(request, 'test.html', {
        # 'address1_lng': ctx['lng1'],
        # 'address1_lat': ctx['lat1'],
        # 'address2_lng': ctx['lng2'],
        # 'address2_lat': ctx['lat2']
        'd': d,
    })


#     当输入一个地点值的时候，进行获取具体的经纬度信息       #
def request_address(request):
    detail = {}  # 定义字典，接收携带有经纬度信息的字典
    detail = address('山东省临沂市兰山区')
    lng = detail['lng']  # 获取字典中的经度
    lat = detail['lat']  # 获取字典中的维度
    return HttpResponse("aaa")


#       获取到经纬度测距信息#
def test(request):
    return render(request, 'test.html')
