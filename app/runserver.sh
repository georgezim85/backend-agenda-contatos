#!/bin/sh
set -e

wget -qO- https://raw.githubusercontent.com/eficode/wait-for/v2.1.0/wait-for | sh -s -- $DB_HOST:3306 -- echo database daemon ready

python AgendaContatosBackend/manage.py migrate

# Create the superuser
cat <<EOF | python AgendaContatosBackend/manage.py shell
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token

User = get_user_model()

if User.objects.filter(username='admin').exists() != True:
    superuser = User.objects.create_superuser('admin', 'admin@example.com', 'changepass')
#    superuser = get_user_model().objects.first()
    token = Token.objects.create(user=superuser)
    print(token.key)

EOF

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