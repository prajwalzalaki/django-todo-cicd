# Use a stable Python version
FROM python:3.10

# Set the working directory
WORKDIR /app

# Install required system dependencies
RUN apt-get update && apt-get install -y python3-distutils python3-setuptools

# Upgrade pip and install Django explicitly
RUN pip install --upgrade pip setuptools wheel
RUN pip install django==3.2

# Copy project files
COPY . .

# Check installed packages for debugging
RUN pip list  

# Run migrations after installing dependencies
RUN python manage.py migrate

# Expose the application port
EXPOSE 8000

# Start the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
