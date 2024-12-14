from django.urls import path
from . import views
from .views import sign_up
from .views import book_appointment, appointment_success

urlpatterns = [
    path('home/', views.Home, name='Home'),
    path('sign-up/', sign_up, name='sign_up'),
    path('appointment/', book_appointment, name='book_appointment'),
    path('appointment-success/', appointment_success, name='appointment_success'),
    path('login/', views.login_view, name='login_view'), 
    path('aboutus/', views.aboutus, name='aboutus'),
    path('service/', views.services_page, name='services_page'),
    path('review/', views.review_list, name='review_list'),
    path('review_create/', views.review_create, name='review_create'),
    path('info/', views.info, name='info'),
    path('doctor/', views.doctor_list, name='doctor_list'),
    path('search/', views.search, name='search'),
]
