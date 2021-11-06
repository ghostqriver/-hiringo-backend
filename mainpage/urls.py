from django.urls import path
from . import views

urlpatterns = [
    path('',views.mainpage,name='mainpage'),
    path('studentsignup',views.studentsignup,name='studentsignup'),
    path('studentinsert',views.studentinsert,name='studentinsert'),
    path('teahcersignup', views.teachersignup, name='teachersignup'),
    path('teahcerinsert', views.teacherinsert, name='teacherinsert'),
]