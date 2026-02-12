"""
URL configuration for drs project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
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
from django.urls import path

from drs_app import views

urlpatterns = [
    path('', views.login, name="login"),
    path('admin_home', views.admin_home, name="admin_home"),
    path('manage_playlist', views.manage_playlist, name="manage_playlist"),
    path('add_new', views.add_new, name="add_new"),
    path('view_user', views.view_user, name="view_user"),
    path('view_drowsiness', views.view_drowsiness, name="view_drowsiness"),
    path('login_post', views.login_post, name="login_post"),
    path('new_music', views.new_music, name="new_music"),
    path('edit/<int:id>', views.edit, name="edit"),
    path('edit_post', views.edit_post, name="edit_post"),
    path('search_mupl', views.search_mupl, name="search_mupl"),
    path('delete/<int:id>', views.delete, name="delete"),
    path('logout', views.logout, name="logout"),



    # 444444444444444444444444444web-service
    path('logincode', views.logincode, name="logincode"),
    path('registration', views.registration, name="registration"),
    path('addmusic', views.addmusic, name="addmusic"),
    path('edittmusic', views.edittmusic, name="edittmusic"),
    path('addplaylist', views.addplaylist, name="addplaylist"),
    path('rplaylist', views.rplaylist, name="rplaylist"),
    path('viewplaylist', views.viewplaylist, name="viewplaylist"),
    path('capture', views.capture, name="capture"),
    path('dd', views.dd, name="dd"),
    path('drowsiness', views.drowsiness, name="drowsiness"),
]
