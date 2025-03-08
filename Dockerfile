# Use a stable Python version
FROM python:3.10

# Set the working directory
WORKDIR /app

# Install required system dependencies
RUN apt-get update && apt-get install -y python3-distutils python3-setuptools

# Copy project files
COPY . .

# Install dependencies from requirements.txt
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt

# Run migrations after installing dependencies
RUN python manage.py migrate

# Expose the application port
EXPOSE 8000

# Start the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



