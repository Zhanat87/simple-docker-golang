FROM golang:latest
# сначала надо залить все файлы в github
# затем обновить все файлы с github'а
# и тогда обновления появятся в докере
# так же надо все время перезапускать контейнер
# в главном docker-compose.yml файле, restart: always
# note: когда делается go get -u github.com/Zhanat87/go, то собирается bin/go файл
#RUN go get -u github.com/Zhanat87/go
# Copy the local package files to the container’s workspace.
#ADD . /go/src/github.com/Zhanat87/go
# Setting up working directory
#WORKDIR /go/src/github.com/Zhanat87/go
# Get godeps for managing and restoring dependencies
#RUN go get github.com/tools/godep
# Restore godep dependencies
#RUN godep restore
# Build the stack-auth command inside the container.
#RUN go install github.com/Zhanat87/go
# Run the stack-auth command when the container starts.
#ENTRYPOINT /go/bin/go

#RUN apt-get update
#RUN apt-get install -y vim
# has no effect
RUN export GOBIN=$GOPATH/bin
#ADD simple-docker-golang /go/simple-docker-golang
#WORKDIR /go - by default
ADD server.go /go/server.go
RUN go get github.com/dgrijalva/jwt-go
#RUN go get
RUN go build
#ENTRYPOINT /go/simple-docker-golang
ENTRYPOINT /go/go

# Service listens on port 8084.
EXPOSE 8084

# https://docs.docker.com/engine/getstarted/step_five/#step-2-verify-your-email-and-add-a-repository
# https://docs.docker.com/engine/getstarted/step_four/#step-4-run-your-new-docker-whale
# https://docs.docker.com/engine/getstarted/step_six/#step-1-tag-and-push-the-image
# https://docs.docker.com/engine/reference/commandline/commit/#commit-a-container-with-new-cmd-and-expose-instructions
# go build
# docker build -t zhanat87/simple-docker-golang .
# docker images
# docker run -d -p 8084:8084 zhanat87/simple-docker-golang
# curl http://localhost:8084
# docker ps
# docker stop <container_id>
# docker stop $(docker ps -q --filter ancestor=zhanat87/simple-docker-golang)
# docker images
# docker tag <container_id> zhanat87/simple-docker-golang:latest
# docker tag $(docker ps -q --filter ancestor=zhanat87/simple-docker-golang) zhanat87/simple-docker-golang:latest
# docker images
# docker login
# docker push zhanat87/simple-docker-golang
# sh deploy.sh
# history | grep mv
# history 5
# history | grep ssh
# docker commit $(docker ps -q --filter ancestor=zhanat87/simple-docker-golang) zhanat87/simple-docker-golang:latest
# docker rmi $(docker ps -q --filter ancestor=zhanat87/simple-docker-golang)
# docker rmi $(docker ps -q --filter ancestor=zhanat87/simple-docker-golang) -f
# docker pull zhanat87/simple-docker-golang:latest
# docker inspect $(docker ps -q --filter ancestor=zhanat87/simple-docker-golang)
# docker logs $(docker ps -q --filter ancestor=zhanat87/simple-docker-golang)
# docker exec -it $(docker ps -q --filter ancestor=zhanat87/simple-docker-golang) /bin/bash
# go env
# docker rmi -f <container_id>

# after build run:
# docker run -d -p 8084:8084 zhanat87/simple-docker-golang
# inside in /root/zhanat.site/docker
# run drone inside in /root/zhanat.site/docker:
# docker-compose up
# file -> settings -> go libraries => project libraries -> add /home/zhanat/go/src








