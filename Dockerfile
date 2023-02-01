# Use an official Python image as the base image
FROM python:3.9

# Set the working directory in the container to /app
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the required packages
RUN pip install -r requirements.txt

# Copy the rest of the application files to the container
COPY . .

# Set environment variables for the Django app
ENV DJANGO_SETTINGS_MODULE=myproject.settings
ENV PYTHONUNBUFFERED=1

# Run migrations and collectstatic files
RUN python manage.py 

# Start the Django development server on port 8000
CMD ["python", "manage.py"]
