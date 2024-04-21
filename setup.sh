#!/bin/bash

# python3 manage.py makemigrations
# python3 manage.py collectstatic
python manage.py migrate
gunicorn core.wsgi:application --bind 0.0.0.0:8000
# python3 manage.py runserver ${1}


