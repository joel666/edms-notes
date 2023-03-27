# EDMS Notes

Update favicon ico use this location inside docker container 
/opt/mayan-edms/static/appearance/


docker notes for running in the container.
cat WTcX7.sql | docker exec -i mayan-postgresql-1 psql -U mayan


docker exec -ti mayan-postgresql-1 bash
docker exec -ti mayan-app-1 bash

docker compose exec mayan-postgresql-1 psql -U mayan -d mayan -c “DROP DATABASE mayan;”

docker exec -it mayan-postgresql-1 psql -U mayan -W mayan

docker exec -it  <container-name> psql -U <dataBaseUserName> <dataBaseName>
docker exec -it  mayan-postgresql-1 psql -U mayan mayan
