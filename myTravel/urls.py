"""myTravel URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.views.static import serve
from django.urls import path, include
from django.conf.urls import url
from travel import views
from myTravel.settings import MEDIA_ROOT, STATICFILES_DIRS

urlpatterns = [
    path('admin/', admin.site.urls),
    path('ueditor/', include('DjangoUeditor.urls')),  # 添加DjangoUeditor的URL
    path('', views.selectAll),
    path('index.php', views.BootStrap),
    path('detail.php', views.detail),
    path('sightsrecommand.php', views.sightsRecommand),
    path('news.php', views.news),
    url(r'^media/(?P<path>.*)', serve, {"document_root": MEDIA_ROOT}),
    url(r'^static/(?P<path>.*)', serve, {"document_root": STATICFILES_DIRS}),
    url(r'^search-post', views.search_post),
    url(r'^test.php',views.test),
    url(r'^demo.php', views.flow),
]
