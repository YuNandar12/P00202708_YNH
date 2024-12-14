from django.urls import path
from . import views
from myapp.views import login_view  # Import the login_view function from myapp.views

urlpatterns = [
    path('dashboard/', views.Dashboard, name='Dashboard'),
    # path('imageslider/', views.ImageSliderList, name='ImageSliderList'),
    path('login/', login_view, name='login_view'),  # Use the imported login_view
    path('doctors/', views.doctor_list, name='doctor_list'),
    path('doctors/create/', views.create_doctor, name='create_doctor'),
    path('doctors/update/<int:pk>/', views.update_doctor, name='update_doctor'),
    path('doctors/delete/<int:pk>/', views.delete_doctor, name='delete_doctor'),
    path('service_list/', views.service_list, name='service_list'),
    path('create/', views.service_create, name='service_create'),
    path('update/<int:pk>/', views.service_update, name='service_update'),
    path('delete/<int:pk>/', views.service_delete, name='service_delete'),
    path('user_list/', views.user_list, name='user_list'),
    path('delete_user/<int:user_id>/', views.delete_user, name='delete_user'),
    path('appointment_list/', views.appointment_list, name='appointment_list'),  # Appointment list page
    path('delete_appointment/<int:appointment_id>/', views.delete_appointment, name='delete_appointment'),  # Delete appointment
    path('info_list/', views.info_list, name='info_list'),
    path('info_create/', views.info_create, name='info_create'),
    path('info_update/<int:pk>/', views.info_update, name='info_update'),
    path('info_delete/<int:pk>/', views.info_delete, name='info_delete'),
    path('review_list/', views.review_list, name='review_list'),
    path('delete_review/<int:id>/', views.delete_review, name='delete_review'),
    path('set-theme/', views.set_theme, name='set-theme'),
]



