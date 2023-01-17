FROM python:3.8-slim-buster

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

#RUN adduser node
#RUN adduser node root

WORKDIR /app
#RUN chmod -R 777 /app
#RUN chown -R node:root /app

ADD . .
RUN pip install -r requirements.txt

EXPOSE 5000

#USER node

CMD ["python3", "backend.py", "--port=5000"]