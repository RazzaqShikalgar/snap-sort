# FROM python:3.10.11

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     cmake \
#     && rm -rf /var/lib/apt/lists/*

# ENV PYTHONBUFFERED=1
# ENV PYTHONDONTWRITEBYTECODE 1

# # Clone the dlib repository
# RUN git clone https://github.com/davisking/dlib.git /tmp/dlib

# # Build dlib
# WORKDIR /tmp/dlib
# RUN python setup.py install

# # Clean up
# RUN rm -rf /tmp/dlib

# # Create a directory in the container to store the binary file
# RUN mkdir /app

# # Copy the dlib binary file from your project directory into the Docker container
# COPY dlib-19.22.99-cp310-cp310-win_amd64.whl /app/

# RUN pip3 install -U pip wheel cmake


# # Install dlib from the binary file
# # RUN pip3 install /app/dlib-19.22.99-cp310-cp310-win_amd64.whl

# # Set the working directory in the container
# WORKDIR /app/

# # Copy the rest of the application code into the container at /app/
# COPY requirements.txt requirements.txt
# COPY . .

# # Install project dependencies
# RUN pip3 install -r requirements.txt

# # Command to run the Django application
# CMD python3 backend/manage.py runserver 0.0.0.0:8080

############final##################

FROM python:3.10.11

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y libgl1-mesa-glx


RUN pip install --upgrade pip

# Clone the dlib repository
RUN git clone https://github.com/davisking/dlib.git /tmp/dlib

# Build dlib
WORKDIR /tmp/dlib
RUN python setup.py install

# Clean up
RUN rm -rf /tmp/dlib

RUN pip3 install -U pip wheel cmake


COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY ./backend /app

WORKDIR /app

COPY ./setup.sh /
ENTRYPOINT ["sh","/setup.sh"]