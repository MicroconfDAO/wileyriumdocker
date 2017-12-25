#!/usr/bin/env bash

if [ -f "container" ]
    then
    container=`cat container`

    started=`docker ps | grep $(cat container | sed "s/\(.\{12\}\).\+/\1/") | wc -l`
    if [ $started -eq 1 ]
        then
            echo "container $container is working"
        else
            echo "start container $container"
            docker container start container1
    fi

else
    container=`docker run -itd --name container1 test1 /bin/bash`
    echo "created new container $container"
fi

echo "container $container"

docker exec -d $container sh entrypoint.sh $1 $2
echo $container > container
