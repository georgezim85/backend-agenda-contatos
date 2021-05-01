#!/bin/sh

#sleep 1
#while ! docker-compose logs mongo | grep -m1 'mysqld: ready for connections.'; do
#    echo -e " Waiting for mysql daemon to be ready for connections... "
#    sleep 10
#done
wget -qO- https://raw.githubusercontent.com/eficode/wait-for/v2.1.0/wait-for | sh -s -- db:3306 -- echo database daemon ready

cd AgendaContatosBackend
python manage.py migrate
python manage.py runserver 0.0.0.0:8000