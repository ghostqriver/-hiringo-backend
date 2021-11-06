from django.shortcuts import render
from django.http import HttpResponse,Http404
# Create your views here.
def test(request):
    try:
        return HttpResponse('test sucessfully')
    except:
        return error()
def error(request):
    raise Http404("The page not exist")