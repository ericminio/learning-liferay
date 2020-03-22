#!/bin/bash

echo waiting for mysql...;
while ! docker-compose exec mysql mysql domain -udomain -pdomain -e "select database()";
do
    sleep 1;
done;
echo mysql database domain is ready

echo waiting for postgres...;
while ! docker-compose exec postgres psql lportal -U liferay -c "select current_database()";
do
    sleep 1;
done;
echo postgres database lportal is ready;
