# Start from official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app files
COPY ./app ./app

# Set working dir inside container
WORKDIR /app

# Run the app
CMD ["python", "main.py"]
# wait until it runs

