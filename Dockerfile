FROM python:3.10-alpine

# Установка LibreOffice и шрифтов
RUN apk update 
RUN apk add libreoffice

RUN apk add ttf-dejavu

RUN apk add --no-cache tesseract-ocr tesseract-ocr-data-rus

WORKDIR /app
VOLUME /app

COPY ./app/main.py /app/main.py
COPY ./app/start.sh /app/start.sh
COPY requirements.txt requirements.txt

ENV PYTHONUNBUFFERED=1
RUN apk add --update python3 py3-pip
# RUN pip3 install --no-cache pytesseract>=0.2.6
# RUN pip3 install --no-cache pillow
RUN pip3 install -r requirements.txt
CMD ["sh", "/app/start.sh"]
# CMD ["python3" "main.py"]

# # Установка пакетов для Tesseract OCR
# RUN apt-get install -y tesseract-ocr tesseract-ocr-rus

# # Установка пакетов для разработки (zlib1g-dev, libjpeg-dev)
# RUN apt-get install -y zlib1g-dev libjpeg-dev

# # Установка библиотек для Tesseract
# RUN apt-get install -y libtesseract-dev libleptonica-dev libsm6 libxext6 libxrender-dev


