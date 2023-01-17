#FROM docker.io/library/python:3.8-slim-buster
FROM docker.io/library/python:3.8-slim

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

WORKDIR /app
#RUN adduser node
#RUN adduser node root

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN chmod -R 777 /app
#RUN chown -R node:root /app

# Expose the port
EXPOSE 5000
EXPOSE 6000


# Install the requirements

CMD ./run.sh