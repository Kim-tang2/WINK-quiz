from django.urls import path, include
from .views import helloAPI

urlpatterns = [
    path("hello/", helloAPI)
]

