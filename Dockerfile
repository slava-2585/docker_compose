FROM python:3.11-slim

SHELL ["/bin/bash", "-c"]

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN useradd -rms /bin/bash nik && chmod 777 /opt /run

WORKDIR /code

RUN mkdir /code/static && mkdir /code/media && chown -R nik:nik /code && chmod 755 /code
ADD . /code/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

USER nik

#CMD gunicorn stocks_products.wsgi:application -b 0.0.0.0:8000