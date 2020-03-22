#!/bin/bash

echo waiting for lportal...;
sleep 180;

while ! docker-compose exec postgres psql lportal -U liferay -c "select userid, screenname, emailaddress from user_";
do
    echo waiting for lportal...;
    sleep 60;
done;
echo lportal database is populated;

