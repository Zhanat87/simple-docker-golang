#!/usr/bin/env bash

rm simple-docker-golang
go build
docker commit $(docker ps -q --filter ancestor=simple-docker-golang) zhanat87/simple-docker-golang:latest
docker push zhanat87/simple-docker-golang
git add .
git commit -m 'deploy changes'
git push origin master