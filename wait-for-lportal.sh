#!/bin/bash

echo waiting for lportal...;
sleep 180;

while ! docker-compose exec postgres psql lportal -U liferay -c "select userid, screenname, emailaddress from user_";
do
    sleep 15;
done;
echo lportal database is ready;

docker-compose down
