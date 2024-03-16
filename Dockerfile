FROM python:3.10-alpine

# Установка LibreOffice и шрифтов
RUN apk update 

RUN apk add libreoffice

RUN apk add ttf-dejavu

# Установка tesseract и ocr-data-rus
RUN apk add --no-cache tesseract-ocr tesseract-ocr-data-rus

WORKDIR /app

VOLUME /app

COPY ./app/main.py /app/main.py

COPY ./app/start.sh /app/start.sh

COPY requirements.txt requirements.txt

# Установка библиотек python
ENV PYTHONUNBUFFERED=1

RUN apk add --update python3 py3-pip

RUN pip3 install -r requirements.txt

CMD ["sh", "/app/start.sh"]


