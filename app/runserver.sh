#!/bin/sh
set -e

wget -qO- https://raw.githubusercontent.com/eficode/wait-for/v2.1.0/wait-for | sh -s -- $DB_HOST:3306 -- echo database daemon ready

python AgendaContatosBackend/manage.py migrate

# Development
if [ $ENV = "dev" ]
  then
    echo Starting dev...
    pip install -e AgendaContatosBackend/
    django-admin runserver 0.0.0.0:80 --settings=AgendaContatosBackend.settings
fi

# Production
if [ $ENV = 'prod' ]
  then
    echo Starting prod...
    pip install gunicorn
    pip install AgendaContatosBackend/
    gunicorn -b 0.0.0.0:80 AgendaContatosBackend.wsgi
fi

echo Running with $ENV environment