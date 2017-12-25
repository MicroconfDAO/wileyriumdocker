#!/usr/bin/env bash

if [ -f "container" ]
    then
    container=`cat container`

    started=`docker ps | grep $(cat container | sed "s/\(.\{12\}\).\+/\1/") | wc -l`
    if [ $started -eq 1 ]
        then
            echo "container is working"
        else
            echo "start container1"
            container=`docker container start container1`
    fi

    else
    container=`docker run -d --name container1 -v test1vol:/app test1 /bin/bash`
fi

docker exec -d $container sh entrypoint.sh $1 $2
echo $container > container
