#!/usr/bin/env bash
container=`cat container`
docker stop $container
docker rm $container
rm container