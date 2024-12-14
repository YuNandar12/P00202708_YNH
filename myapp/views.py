from django.shortcuts import render,redirect,get_object_or_404
# from myapp.models import Task
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login,logout
from django.db.models import Q
from django.core.paginator import Paginator
from .models import *
from .forms import SignUpForm
from .forms import AppointmentForm
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.utils.timezone import now, make_aware, datetime, timedelta
import datetime as dt  # Import for timestamp conversion
from .models import Review
from .forms import ReviewForm
from  myadmin.models import Doctor 
from  myadmin.models import Service
from  myadmin.models import Info

# Create your views here.





def search(request):
    query = request.GET.get('q', '')  # Get the search query from the URL parameter
    if query:
        # Adjust the filter fields to match your model's fields
        services = Service.objects.filter(
            Q(name__icontains=query) | Q(description__icontains=query)
        )
    else:
        services = Service.objects.all()

    return render(request, 'service.html', {'services': services, 'query': query})




def services_page(request):
    services = Service.objects.all()  # Fetch all services from the database
    return render(request, 'service.html', {'services': services})



def info(request):
    infos = Info.objects.all()  # Fetch all services from the database
    return render(request, 'info.html', {'infos': infos})


def doctor_list(request):
    doctors = Doctor.objects.all()  # Fetch all doctors from the database
    return render(request, 'doctor.html', {'doctors': doctors})




def book_appointment(request):
    if request.method == "POST":
        form = AppointmentForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Your appointment was successfully booked!")
            return redirect('appointment_success')  # Replace with the success page route
        else:
            messages.error(request, "Please correct the errors below and try again.")
    else:
        form = AppointmentForm()

    return render(request, 'book_appointment.html', {'form': form})


def appointment_success(request):
    return render(request, 'appointment_success.html')



def aboutus(request):
    return render(request, 'aboutus.html')



def Home(request):
    return render(request, 'index.html')



def review_list(request):
    reviews = Review.objects.all().order_by('-created_at')
    for review in reviews:
        # Use 0 if rating is None
        review.star_rating = "⭐️" * (review.rating or 0)
    return render(request, 'review.html', {'reviews': reviews})


def review_create(request):
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/myapp/review/')  # Update to your desired redirect URL
    else:
        form = ReviewForm()
    reviews = Review.objects.all().order_by('-created_at')
    return render(request, 'review.html', {'form': form, 'reviews': reviews})



def login_view(request):
    if request.method == "POST":
        email = request.POST.get("email")
        password = request.POST.get("password")
        
        # Check if user exists
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            user = None
        
        # Handle admin login
        if user and user.is_staff and user.check_password(password):
            login(request, user)
            return redirect("/myadmin/dashboard/")  # Redirect to admin homepage
        
        # Handle regular user login
        elif user and user.check_password(password):
            login(request, user)
            return redirect("/myapp/home/")  # Redirect to user homepage
        
        # Failed login logic
        else:
            # Initialize login attempt tracking
            attempt = request.session.get("attempt", 0)
            attempt_time = request.session.get("attempt_time", None)

            if attempt_time:
                # Convert the stored timestamp to an offset-aware datetime
                attempt_time = make_aware(dt.datetime.fromtimestamp(attempt_time))

            # Lock account after 3 failed attempts
            if attempt_time and now() < attempt_time:
                request.session["msg"] = "Login disabled for 3 minutes due to repeated failures."
                form_enabled = False
            else:
                # Increment attempt counter
                request.session["attempt"] = attempt + 1
                if request.session["attempt"] >= 3:
                    request.session["attempt_time"] = (now() + timedelta(minutes=3)).timestamp()  # Change to 3 minutes
                    request.session["msg"] = "3 failed login attempts! Please wait 3 minutes."
                    form_enabled = False
                else:
                    request.session["msg"] = "Invalid Username or Password!"
                    form_enabled = True
            
            context = {
                "msg": request.session.get("msg", ""),
                "form_enabled": form_enabled,  # Send flag to the template
            }
            return render(request, "login.html", context)
    
    # GET request or after redirect
    attempt_time = request.session.get("attempt_time", None)
    form_enabled = True

    if attempt_time:
        attempt_time = make_aware(dt.datetime.fromtimestamp(attempt_time))
        if now() < attempt_time:
            form_enabled = False

    context = {
        "msg": request.session.pop("msg", ""),
        "form_enabled": form_enabled,  # Control form visibility
    }
    return render(request, "login.html", context)


def sign_up(request):
    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Account created successfully! You can now log in.")
            return redirect('/login/')  # Redirect to the login page
    else:
        form = SignUpForm()
    return render(request, 'sign_up.html', {'form': form})







def logout_view(request):
    logout(request)
    return redirect('/login/')


