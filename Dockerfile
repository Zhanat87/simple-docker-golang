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
# RUN godep restore
# Build the stack-auth command inside the container.
#RUN go install github.com/Zhanat87/go
# Run the stack-auth command when the container starts.
#ENTRYPOINT /go/bin/go

ADD simple-docker-golang /go/simple-docker-golang
ENTRYPOINT /go/simple-docker-golang

# Service listens on port 8999.
EXPOSE 8080

# https://docs.docker.com/engine/getstarted/step_five/#step-2-verify-your-email-and-add-a-repository
# https://docs.docker.com/engine/getstarted/step_four/#step-4-run-your-new-docker-whale
# https://docs.docker.com/engine/getstarted/step_six/#step-1-tag-and-push-the-image
# go build
# docker build -t simple-docker-golang .
# docker images
# docker run -d -p 8080:8080 simple-docker-golang
# curl http://localhost:8080
# docker ps
# docker stop <container_id>
# docker stop $(docker ps -q --filter ancestor=simple-docker-golang)
# docker images
# docker tag <container_id> zhanat87/simple-docker-golang:latest
# docker images
# docker login
# docker push zhanat87/simple-docker-golang
# sh deploy.sh


