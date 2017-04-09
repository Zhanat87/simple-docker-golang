#!/usr/bin/env bash

rm simple-docker-golang
go build
git add .
git commit -m 'deploy changes'
git push origin master