#!/usr/bin/env bash
docker rmi test1 --force
docker build -t test1 .
docker run -i test1 sh entrypoint.sh mail pass