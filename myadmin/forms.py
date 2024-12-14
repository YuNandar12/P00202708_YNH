from django import forms
from .models import Doctor
from .models import Service
from .models import Info


class DoctorForm(forms.ModelForm):
    class Meta:
        model = Doctor
        fields = ['name', 'specialization', 'email', 'phone', 'preferred_time_start','preferred_time_end','profile_picture']
        widgets = {
            'preferred_time_start': forms.TimeInput(attrs={'type': 'time', 'class': 'form-control'}),
            'preferred_time_end': forms.TimeInput(attrs={'type': 'time', 'class': 'form-control'}),
        }



class ServiceForm(forms.ModelForm):
    class Meta:
        model = Service
        fields = ['name', 'description']


class InfoForm(forms.ModelForm):
    class Meta:
        model = Info
        fields = ['name', 'Avoid', 'Risk_Factors', 'What_to_Do']
