#!/usr/bin/env bash
docker rmi test1 --force
docker build -t test1 .