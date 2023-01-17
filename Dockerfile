#FROM docker.io/library/python:3.8-slim-buster
FROM docker.io/library/python:3.8-slim

# Install dependencies
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

WORKDIR /app

# Fixing permission denied error that occurs in openshift because no container runs as root
# https://stackoverflow.com/questions/42363105/permission-denied-mkdir-in-container-on-openshift
RUN adduser node
RUN adduser node root

# Copy the requirements.txt file
COPY . .

# Fixing permission denied error that occurs in openshift because no container runs as root
RUN chmod -R 777 /app
RUN chown -R node:root /app

RUN chmod -R 777 run.sh
# RUN chmod -R 777 /usr/local/lib/python3.8
# RUN chown -R node:root /usr/local/lib/python3.8

# Expose the port
EXPOSE 5000
EXPOSE 6000


USER node

# Install the requirements
RUN pip install --no-cache-dir -r requirements.txt

CMD ./run.sh