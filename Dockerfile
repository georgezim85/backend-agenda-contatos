FROM docker.io/python:3.10.0a7-alpine3.13

ENV APP_DIR=/usr/src/app

RUN apk update && apk add \
    git \
    gcc \
    g++ \
    python3-dev \
    musl-dev \
    mariadb-connector-c-dev \
    libffi-dev \
    openssl-dev \
    cargo

RUN adduser user -D

WORKDIR ${APP_DIR}

COPY ./app ./

RUN install -g user -o user -d ${APP_DIR}

RUN find ${APP_DIR} -type d -exec chmod g+s {} \;

RUN pip install --upgrade pip

USER user

ENV PATH=$PATH:/home/user/.local/bin

RUN python3 -m venv env/

RUN pip install --no-cache-dir -r requirements.txt

RUN echo Python Version: $(python --version)

RUN echo Python-admin Version: $(django-admin --version)

RUN echo Django Version: $(python -m django --version)

CMD [ "./runserver.sh"]