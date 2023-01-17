FROM python:3.8-slim

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y


WORKDIR /app

COPY backend.py /app
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python3", "backend.py", "--port=5000"]