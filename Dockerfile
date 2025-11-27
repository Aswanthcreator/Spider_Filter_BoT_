FROM python:3.10.8-slim-buster

# Install system updates & git
RUN apt update && apt install -y git && apt clean

# Copy requirements first (better layer caching)
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip3 install --upgrade pip \
    && pip3 install --no-cache-dir -r /requirements.txt

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Start the bot
CMD ["python3", "bot.py"]
