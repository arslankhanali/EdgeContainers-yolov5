FROM docker.io/library/python:3.8-slim

# Install dependencies
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# Copy the requirements.txt file
COPY requirements.txt .

# Install the requirements
RUN pip install -r requirements.txt

# Fixing permission denied error that occurs in openshift because no container runs as root
# https://stackoverflow.com/questions/42363105/permission-denied-mkdir-in-container-on-openshift
RUN adduser node
RUN adduser node root

# Set the working directory
WORKDIR /app

# Copy the rest of the files
COPY backend.py .

# Fixing permission denied error that occurs in openshift because no container runs as root
RUN chmod -R 777 /app
RUN chown -R node:root /app

# Expose the port
EXPOSE 5000

USER node

CMD ["python3", "backend.py"]