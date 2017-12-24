#!/usr/bin/env bash
container=`cat container`
#TODO: save database to the volume
docker stop $container
docker rm $container
rm container