from django.shortcuts import render, get_object_or_404, redirect
from .models import Doctor
from .forms import DoctorForm
from .models import Service
from .forms import ServiceForm
from myapp.models import *
from myapp import views as myapp_views
from django.contrib.auth.models import User 
from myapp.models import Appointment
from .models import Info
from .forms import InfoForm
from myapp.models import Review
from django.http import JsonResponse



# Create your views here.


def set_theme(request):
    theme = request.POST.get('theme')
    request.session['theme'] = theme
    return JsonResponse({'status': 'success'})
# def Dashboard(request):
#     user_count = Imageslider.objects.count()
#     about1_count = Imageslider.objects.count()
#     return render(request,'dashboard.html', {
#         'imageslider_count':imageslider_count, 'about1_count':about1_count})


def Dashboard(request):
    return render(request, 'dashboard.html')



def appointment_list(request):
    appointments = Appointment.objects.all()
    return render(request, 'appointment_list.html', {'appointments': appointments})

def delete_appointment(request, appointment_id):
    appointment = get_object_or_404(Appointment, id=appointment_id)
    appointment.delete()
    return redirect('appointment_list')  # Redirect to the list after deletion



def user_list(request):
    users = User.objects.all()
    return render(request, 'user_list.html', {'users': users})


def delete_user(request, user_id):
    user = get_object_or_404(User, id=user_id)
    user.delete()
    return redirect('user_list')



def review_list(request):
    reviews = Review.objects.all().order_by('-created_at')
    for review in reviews:
        # Use 0 if rating is None
        review.star_rating = "⭐️" * (review.rating or 0)
    return render(request, 'review_list.html', {'reviews': reviews})


def delete_review(request, id):
    review = get_object_or_404(Review, id=id)
    review.delete()
    return redirect('/myadmin/review_list/')



# List all doctors
def doctor_list(request):
    doctors = Doctor.objects.all()
    return render(request, 'doctor_list.html', {'doctors': doctors})

# Create a new doctor
def create_doctor(request):
    if request.method == 'POST':
        form = DoctorForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/myadmin/doctors/')
    else:
        form = DoctorForm()
    return render(request, 'doctor_form.html', {'form': form})

# Update doctor information
def update_doctor(request, pk):
    doctor = get_object_or_404(Doctor, pk=pk)
    if request.method == 'POST':
        form = DoctorForm(request.POST, request.FILES, instance=doctor)
        if form.is_valid():
            form.save()
            return redirect('/myadmin/doctors/')
    else:
        form = DoctorForm(instance=doctor)
    return render(request, 'doctor_form.html', {'form': form})

# Delete a doctor
def delete_doctor(request, pk):
    doctor = get_object_or_404(Doctor, pk=pk)
    doctor.delete()
    return redirect('/myadmin/doctors/')
    





# List Services
def service_list(request):
    services = Service.objects.all()
    return render(request, 'service_list.html', {'services': services})

# Create Service
def service_create(request):
    if request.method == 'POST':
        form = ServiceForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/myadmin/service_list/')
    else:
        form = ServiceForm()
    return render(request, 'service_form.html', {'form': form})

# Update Service
def service_update(request, pk):
    service = get_object_or_404(Service, pk=pk)
    if request.method == 'POST':
        form = ServiceForm(request.POST, instance=service)
        if form.is_valid():
            form.save()
            return redirect('/myadmin/service_list/')
    else:
        form = ServiceForm(instance=service)
    return render(request, 'service_form.html', {'form': form})

# Delete Service
def service_delete(request, pk):
    service = get_object_or_404(Service, pk=pk)
    service.delete()
    return redirect('/myadmin/service_list/')





# List Info
def info_list(request):
    infos = Info.objects.all()
    return render(request, 'info_list.html', {'infos': infos})

# Create Info
def info_create(request):
    if request.method == 'POST':
        form = InfoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/myadmin/info_list/')
    else:
        form = InfoForm()
    return render(request, 'info_form.html', {'form': form})

# Update Info
def info_update(request, pk):
    info = get_object_or_404(Info, pk=pk)
    if request.method == 'POST':
        form = InfoForm(request.POST, instance=info)
        if form.is_valid():
            form.save()
            return redirect('/myadmin/info_list/')
    else:
        form = InfoForm(instance=info)
    return render(request, 'info_form.html', {'form': form})

# Delete Info
def info_delete(request, pk):
    info = get_object_or_404(Info, pk=pk)
    info.delete()
    return redirect('/myadmin/info_list/')
    
