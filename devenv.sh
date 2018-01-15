#!/bin/bash

# Environment list with associate docker container names
ENVS=(  "laravel:redis,mysql,laravel"
        "nodejs:mongo,nodejs"
      )

case "$1" in
     --help)
          echo "DevEnv - Starter of docker containers for environment"
          echo -e "Usage: devenv [command]\n"
          echo "Command list:"
          echo "    ls      List environments"
          echo "    start   Start environment docker containers"
          echo "    stop    Stop environment docker containers"
          ;;
     ls)
          echo "Environment list:"
          for env in "${ENVS[@]}"
          do
            echo "${env%%:*}"
          done
          ;;
      start)
          ;;
      stop)
          ;;
      *)
          echo "devenv: $1: invalid command"
          echo "See 'devenv --help'"
          ;;
esac

if [ $1 == "start" ] || [ $1 == "stop" ]
  then

    if [ -z "$2" ]
      then
        echo "'devenv $1' requires at least 1 argument."
        echo "Usage: devenv $1 [environment]"
        echo "See environment list 'devenv ls'"
        exit
    fi


    for env in "${ENVS[@]}"
    do
      if [ "$2" == "${env%%:*}" ]
        then
          containers=${env#*:}
          containers=(${containers//,/ })
          for container in "${containers[@]}"
          do
              eval "docker $1 ${container[i]}"
          done
          exit
      fi
    done

    echo "ERROR: environment not found."
    echo "See environment list 'devenv ls'"
fi
