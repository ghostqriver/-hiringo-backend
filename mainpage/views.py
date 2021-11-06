from django.http import HttpResponse
from django.shortcuts import render
from . import  models
# Create your views here.
def mainpage(request):
    return render(request,'mainpage.html')

def studentsignup(request):
    return render(request,'studentsignup.html')
def studentinsert(request):
    ub=models.UserBasic()
    ub.user_id=request.POST['sname']
    ub.user_password=request.POST['spassword']
    ub.is_superuser=0
    ub.is_teacher=0
    ub.save()
    return HttpResponse("Sucessful!")
def teachersignup(request):
    return render(request,'teachersignup.html')
def teacherinsert(request):
    ub=models.UserBasic()
    ub.user_id=request.POST['sname']
    ub.user_password=request.POST['spassword']
    ub.is_superuser=0
    ub.is_teacher=1
    ub.save()
    return HttpResponse("Sucessful!")