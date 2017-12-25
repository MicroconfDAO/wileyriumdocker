#!/usr/bin/env bash

if [ -f "container" ]
then
container=`cat container`
else
container=`docker run -d --name container1 -v test1vol:/app test1 /bin/bash`
fi

docker exec -d $container sh entrypoint.sh $1 $2
echo $container > container
