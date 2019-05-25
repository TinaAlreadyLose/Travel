from django.shortcuts import render, HttpResponse, redirect, HttpResponseRedirect
from .models import Article, ArticleImg, Banner, Flow, Hotel, HotelImg, HotelPrice, News, NewsImg, Type
import requests
import re
from django.shortcuts import render
from math import radians, cos, sin, asin, sqrt, pi, fabs
from django.http import HttpResponse, JsonResponse
from django.views.decorators import csrf
from urllib import parse  # 经纬度转化
import requests
import json
import hashlib
# 流量分析图
import matplotlib

matplotlib.use('TkAgg')
import sys
import matplotlib
import matplotlib.pyplot  # 使用mateplotlib生成折线图
from pylab import *

from django.contrib.auth.models import User  # 创建普通用户
from django.contrib.auth import authenticate, login  # 用户登录

mpl.rcParams['font.sans-serif'] = ['Microsoft YaHei']
city = {}  # 存放city信息


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
        'AllType': AllType,

    }
    return render(request, 'index.html', context)


# 首页路由请求
def BootStrap(request):
    AllArticle = Article.objects.all()
    pro()
    finally_city = city
    # js_city=json.load(open('json/山东省.json'))
    js_city = json.dumps(finally_city, ensure_ascii=False)
    return render(request, 'bootStrap.html', {
        'AllArticle': AllArticle,
        'city': finally_city,
        'js_city': js_city,
    })


# 景区路由请求
def sightsRecommand(request):
    hotArticles = Article.objects.filter(recommend_id=1)
    hotArticles2 = Article.objects.filter(recommend_id=2)
    otherArticles = Article.objects.filter(recommend_id=0)
    context = {
        'hotArticles': hotArticles,
        'hotArticles2': hotArticles2,
        'otherArticles': otherArticles
    }
    return render(request, 'sightsRecommend.html', context)


# 详细网页路由请求
def detail(request, url):
    print(url)
    # print(isinstance(url, str))
    detailArticle = Article.objects.get(url=url)
    banners = ArticleImg.objects.filter(article_id=detailArticle.article_id)
    types = Type.objects.filter(article_id=detailArticle.article_id)
    print(detailArticle.article_id)
    # print(type(banners))
    context = {
        "detailArticle": detailArticle,
        "banners": banners,
        "types": types,
    }
    return render(request, 'detail.html', context)


# 新闻路由请求
def news(request):
    hotNews = News.objects.filter(recommend_id=1)
    otherNews = News.objects.filter(recommend_id=0)
    context = {
        'hotNews': hotNews,
        'otherNews': otherNews,
    }
    return render(request, 'news.html', context)


# 详细新闻路由
def detail_news(request, url):
    print(url)
    detail_news = News.objects.get(url=url)
    banners = NewsImg.objects.filter(news_id=detail_news.id)
    context = {
        'detail_news': detail_news,
        'banners': banners
    }
    return render(request, 'detail_news.html', context)


#            流量分析图                   #
def flow_index(names, y, title, id):
    x = range(len(names))
    plt = matplotlib.pyplot
    plt.cla()
    plt.rc('font', family=['Microsoft YaHei'])
    plt.plot(x, y, marker='o', mec='r', mfc='w', label=u'flow')
    plt.legend()  # 让图例生效
    plt.xticks(x, names, rotation=45)
    plt.margins(0)
    plt.subplots_adjust(bottom=0.15)
    plt.xlabel(u"日期")  # x轴标签
    plt.ylabel("流量")  # y轴标签
    plt.title(title + "风景区")  # 标题
    plt.savefig('media/FlowImg/' + title + '.jpg')
    Flow.objects.filter(article_id=id).update(flow_img='FlowImg/' + title + '.jpg')
    return


# 流量统计路由
def flows(request):
    names = ["2019-01", "2019-02", "2019-03", "2019-04", "2019-05", "2019-6"]
    flows = Flow.objects.all()
    y = []
    for flow in flows:
        if flow.flow_img == '0':
            y.append(flow.time1_flow)
            y.append(flow.time2_flow)
            y.append(flow.time3_flow)
            y.append(flow.time4_flow)
            y.append(flow.time5_flow)
            y.append(flow.time6_flow)
            title = flow.name
            flow_index(names, y, title, int(flow.article_id))
            y.clear()

    newFlows = Flow.objects.all()
    allArticle = []
    for flow in newFlows:
        article = Article.objects.get(article_id=flow.article_id)
        allArticle.append(article)
    articleAndFlow = zip(allArticle, flows)
    context = {
        'articleAndFlow': articleAndFlow
    }
    return render(request, 'flow.html', context)


# 酒店路由
def hotels(request):
    allHotels = Hotel.objects.all()
    context = {
        'allHotels': allHotels,
    }
    return render(request, 'hotels.html', context)


def detail_hotel(request, url):
    detail_hotel = Hotel.objects.get(url=url)
    detail_hotel_prices = HotelPrice.objects.filter(hotel_id=detail_hotel.hotel_id)
    detail_hotel_imgs = HotelImg.objects.filter(hotel_id=detail_hotel.hotel_id)
    context = {
        'detail_hotel': detail_hotel,
        'detail_hotel_prices': detail_hotel_prices,
        'detail_hotel_imgs': detail_hotel_imgs,
    }
    return render(request, 'detail_hotel.html', context)


def aboutUs(request):
    return render(request, 'aboutUs.html')


def contactUs(request):
    return render(request, 'contactUs.html')


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


#  ------庆2- #
#          省区信息查询    #
def pro():
    #      山东省城市            #
    shandong = open('json/山东省.json', encoding='utf-8')
    sd = json.load(shandong)
    sd_city = '山东省'
    for i in sd['cityList']:
        city.setdefault(sd_city, []).append(i['name'])  # 获取山东省的全部城市
    #       山西省城市          #
    shanxi = open('json/山西省.json', encoding='utf-8')
    sx = json.load(shanxi)
    sx_city = '山西省'
    for i in sx['cityList']:
        city.setdefault(sx_city, []).append(i['name'])  # 获取山西省的全部城市
    #      安徽省城市            #
    anhui = open('json/安徽省.json', encoding='utf-8')
    ah = json.load(anhui)
    ah_city = '安徽省'
    for i in ah['cityList']:
        city.setdefault(ah_city, []).append(i['name'])  # 获取安徽省的全部城市
    #      广东省城市            #
    guangdong = open('json/广东省.json', encoding='utf-8')
    gd = json.load(guangdong)
    gd_city = '广东省'
    for i in gd['cityList']:
        city.setdefault(gd_city, []).append(i['name'])  # 获取广东省的全部城市


#     用户注册页面     #
def register(request):
    return render(request, 'register.html')


#     用户注册请求   #
def register_user(request):
    check_user = 1  # 标记user是否存在，1为通过
    check_mail = 1  # 标记email是否存在，1为通过
    user = {}
    if request.POST:
        user['username'] = request.POST['username']
        user['password'] = request.POST['password']
        user['name'] = request.POST['name']
        user['idcard'] = request.POST['idcard']
        user['email'] = request.POST['email']
        user['telphone'] = request.POST['telphone']

    # 判断数据库user中该用户名是否已经存在
    try:
        check_username = User.objects.get(username=user['username'])
        # 若存在该用户名，该值不为0
    except Exception as e:
        check_username = 0
    # 判断数据库email中该邮箱是否已存在
    try:
        check_email = User.objects.get(email=user['email'])
        # 若存在该用户名，该值不为0
    except Exception as e:
        check_email = 0

    # 创建普通用户
    if check_username == 0 and check_email == 0:
        User.objects.create_user(username=user['username'], password=user['password'], email=user['email'])  # 成功创建用户
        return render(request, 'sign_in.html')  # 渲染到登录页
    else:
        if (check_username != 0):
            check_user = 0
        elif (check_email != 0):
            check_mail = 0
        elif (check_email != 0 and check_username != 0):
            check_user = 0
            check_mail = 0

        return render(request, 'register.html', {
            'check_username': check_user,
            'check_email': check_mail,
            "user": user,
        })


#      用户登录页面    #
def sign_in(request):
    return render(request, 'sign_in.html')


#        用户登录      #
def sign_in_user(request):
    check_password = 1
    sign_in_user = {}
    if request.POST:
        sign_in_user['username'] = request.POST['username']
        sign_in_user['password'] = request.POST['password']
    user = authenticate(username=sign_in_user['username'], password=sign_in_user['password'])
    if user is not None:
        login(request, user)
        return HttpResponseRedirect('http://127.0.0.1:8000/')
    else:
        try:
            check_username = User.objects.get(username=sign_in_user['username'])
            # 若存在该用户名，该值不为0
        except Exception as e:
            check_username = 0  # 没有找到该用户名
        print(check_username)
        if check_username != 0:
            check_password = 0  # 密码不对
        print(check_password)

        return render(request, 'sign_in.html', {
            'check_username': check_username,
            'check_password': check_password,
        })


#      景点匹配      #
def get_scenic(request):
    about_article = {}
    if request.POST:
        scenic = request.POST['scenic']
    all_Article = Article.objects.all()  # 获取全部的景点信息
    for article in all_Article:  # 精准性匹配，判断是否存在相同的景点
        if scenic == article.title:
            url = article.url
            return HttpResponseRedirect('http://127.0.0.1:8000/detail/' + url + '.html')
    return render(request, 'about_scenic.html', {
        'scenic': scenic,
        'all_Article': all_Article,
    })


#       酒店匹配请求    #
def get_hotel(request):
    about_hotel = {}
    if request.POST:
        hotel = request.POST['hotel']
    all_hotel = Hotel.objects.all()  # 获取全部酒店信息
    for hotels in all_hotel:  # 精准性匹配，判断是否存在相同的景点
        if hotel == hotels.name:
            url = hotels.url
            return HttpResponseRedirect('http://127.0.0.1:8000/detailhotel/' + url + '.html')
    return render(request, 'about_hotel.html', {
        'about_hotel': all_hotel,
        'hotel': hotel,
    })


#         搜索地点匹配      #
def search_position(request):
    scenic = {}
    if request.POST:
        city = request.POST['city']
        country = request.POST['country']
        area = request.POST['area']
    all_scenic = Article.objects.all()
    print(city)
    print(country)
    for article in all_scenic:
        if re.match(city, article.position):  # 城市匹配成功
            if country == '':  # 市为空
                # city.setdefault(sd_city, []).append(i['name'])
                scenic.setdefault(article.title, []).append(article.title)
            else:
                if re.match(country, article.position_city):  # 与市匹配
                    if area == '':
                        scenic.setdefault(article.title, []).append(article.title)
                    else:
                        if re.match(area, article.position_area):  # 与地区匹配
                            scenic.setdefault(article.title, []).append(article.title)
    # for scenics in scenic:
    #     print(scenics)
    # return     HttpResponse("ok")

    return render(request, 'search_position.html', {
        'scenics': scenic,
        'all_scenic': all_scenic,
    })
