# Use an official Python runtime as a base image
FROM python:3.10-slim

# Set environment variables to prevent Python from writing pyc files and buffering
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Set working directory
WORKDIR /usr/src/app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the entry point to your CLI script
ENTRYPOINT ["python", "-m", "extract"]
