#FROM docker.io/library/python:3.8-slim-buster
FROM docker.io/library/python:3.8-slim

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN chgrp -R 0 /app && chmod -R g=u /app

# Expose the port
EXPOSE 5000
EXPOSE 6000

CMD ./run.sh