FROM python:3.9-buster

ENV PYTHONBUFFERED=1

# Set the working directory in the container
WORKDIR /app/

# Copy the rest of the application code into the container at /app/
COPY requirements.txt requirements.txt

# Install project dependencies
RUN pip3 install -r requirements.txt

COPY . .
# Command to run the Django application
CMD python3 backend/manage.py runserver 0.0.0.0:8000
