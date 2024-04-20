#!/bin/bash

python3 manage.py makemigrations
python  manage.py collectstatic
python3 manage.py migrate
gunicorn backend.wsgi:application --bind 0.0.0.0:8000
# python3 manage.py runserver ${1}
