#!/bin/bash

docker-compose exec postgres psql lportal -U liferay -P pager -c "\d" > all-tables;
tail -n +4 all-tables | cut -d' ' -f4 > names

mkdir -p content
for name in $(cat names); 
do
    echo $name;
    docker-compose exec postgres psql lportal -U liferay -P pager -c "select * from $name" > content/$name.csv;
done

echo Number of tables with content:
grep -L "0 rows" content/* | wc -l