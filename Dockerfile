FROM python:3.9-buster

# Set the working directory in the container
WORKDIR /app/

# Copy the rest of the application code into the container at /app/
COPY . .

# Install project dependencies
RUN pip install -r requirements.txt

# Command to run the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
