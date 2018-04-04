#!/bin/bash

if [ -z "$1" ]
  then
    echo "ERROR: Please input docker container name (use command: docker ps)"
    exit
fi

if [ -z "$2" ]
  then
    echo "ERROR: Please input command while will be executed on container $1"
    exit
fi

cmd=$(echo "${@:2}")
projectDir=$(echo $PWD | sed "s#.*/##")
path=$(echo "/var/www/$projectDir")

eval "docker exec -it $1 /bin/sh -c \"[ -d $path ] && cd $path; $cmd\""
