# Agenda Contatos Backend

Backend application for the Agenda Contatos mobile app.

Development environment requirements
------------------------------------
* [Docker](https://docs.docker.com/engine/install/)
* [Docker-compose](https://docs.docker.com/compose/install/)

How to start
------------
Please, make sure:
- you are using a Linux operational system compatible with docker (CentOS, Debian, Fedora or Ubuntu).
- you have docker, and docker-compose installed.
- your user has the required permission for to use docker and docker-compose commands.
- you have a stable internet connection when downloading and building the docker images.
Run docker-compose up:
```shell
docker-compose up -d
```
Create the superuser:
```shell
docker-compose exec backend python \
  AgendaContatosBackend/manage.py createsuperuser \
  --email admin@example.com \
  --username admin
```
Or, inside the container shell:
```shell
docker-compose exec backend sh

python AgendaContatosBackend/manage.py createsuperuser \
  --email admin@example.com \
  --username admin
```


Accessing backend container shell
---------------------------------
The Docker python image is generated from the small Linux Alpine OS.
If you need to access the **container shell** as `root` you can do like this:
```shell
docker-compose exec --user="root" backend sh
```
If you want to access the **container shell** as the app owner named `user` (default user), you can just:
```shell
docker-compose exec backend sh
```
**Obs: The above instructions will only work if you have already started the docker-compose thru `docker-compose up` or by the script `./run.sh`.**

URLs
----
After running `docker-compose up`:
- **Django administration**: http://localhost:8000/admin/
- **OpenApi schema download**: http://localhost:8000/api/schema/
- **OpenAPI/Swagger-generated API Reference Documentation**: http://localhost:8000/api/schema/redoc/
- **Swagger-ui**: http://localhost:8000/api/schema/swagger-ui/
