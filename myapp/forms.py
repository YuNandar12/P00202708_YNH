from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Appointment
from django.core.exceptions import ValidationError
from datetime import datetime, timedelta
from .models import Review
from  myadmin.models import Doctor


class AppointmentForm(forms.ModelForm):
    preferred_doctor = forms.ModelChoiceField(
        queryset=Doctor.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=True,
        empty_label="Select a Doctor"
    )

    class Meta:
        model = Appointment
        fields = ['full_name', 'email', 'phone_number', 'preferred_date', 'preferred_time', 'preferred_doctor', 'gender']
        widgets = {
            'full_name': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'phone_number': forms.TextInput(attrs={'class': 'form-control'}),
            'preferred_date': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
            'preferred_time': forms.TimeInput(attrs={'type': 'time', 'class': 'form-control'}),
            'gender': forms.RadioSelect(),
        }

    def clean(self):
        cleaned_data = super().clean()
        preferred_doctor = cleaned_data.get('preferred_doctor')
        preferred_date = cleaned_data.get('preferred_date')
        preferred_time = cleaned_data.get('preferred_time')

        # Validate doctor availability
        if preferred_doctor:
            doctor_start = preferred_doctor.preferred_time_start
            doctor_end = preferred_doctor.preferred_time_end

            if doctor_start and doctor_end:
                # Format the time to 12-hour format with AM/PM
                doctor_start_str = doctor_start.strftime('%I:%M %p')
                doctor_end_str = doctor_end.strftime('%I:%M %p')
                if not (doctor_start <= preferred_time <= doctor_end):
                    self.add_error(
                        'preferred_time',
                        f"{preferred_doctor.name} is available only between {doctor_start_str} and {doctor_end_str}."
                    )

        # Ensure 1-hour gap between appointments
        if preferred_doctor and preferred_date and preferred_time:
            appointment_time_start = datetime.combine(preferred_date, preferred_time)
            appointment_time_end = appointment_time_start + timedelta(hours=1)

            overlapping_appointments = Appointment.objects.filter(
                preferred_doctor=preferred_doctor,
                preferred_date=preferred_date,
                preferred_time__gte=(appointment_time_start - timedelta(hours=1)).time(),
                preferred_time__lt=appointment_time_end.time()
            )

            if overlapping_appointments.exists():
                self.add_error(
                    'preferred_time',
                    "This doctor is already booked within one hour of the selected time. Please choose another time."
            )


        return cleaned_data




class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = ['email', 'review_text', 'rating']






class SignUpForm(UserCreationForm):
    email = forms.EmailField(required=True)
    username = forms.CharField(
        max_length=150,
        required=True,
    )
    password1 = forms.CharField(
        label="Password",
        widget=forms.PasswordInput,
        help_text="""
        <ul style="text-align:left; margin-left: 0; padding-left: 1.2em;">
            <li>Your password can’t be too similar to your other personal information.</li>
            <li>Your password must contain at least 8 characters.</li>
            <li>Your password can’t be a commonly used password.</li>
            <li>Your password can’t be entirely numeric.</li>
        </ul>
        """
    )
    password2 = forms.CharField(
        label="Password confirmation",
        widget=forms.PasswordInput,
        help_text="Enter the same password as before, for verification."
    )

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

    def clean_username(self):
        username = self.cleaned_data['username']
        if not username.replace(" ", "").isalnum():
            raise forms.ValidationError(
                "Username can only contain letters, digits, and spaces."
            )
        return username

    def save(self, commit=True):
        user = super().save(commit=False)
        user.email = self.cleaned_data['email']
        if commit:
            user.save()
        return user
