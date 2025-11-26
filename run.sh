#!/bin/bash

export UID
if [ -z "$GID" ] ; then
  export GID=`id -g`
fi
export GID

if [ "$1" == "build" ] ; then
  #
  # Build image
  #
  shift
  BUILD_OPTS="--no-cache --progress=plain"
  docker compose build ${BUILD_OPTS} "$@" --build-arg UID=${UID} --build-arg USER=${USER} --build-arg GID=${GID}
  docker compose stop gemini
  docker container rm -f gemini
fi

# start container
docker compose create
# docker compose run --rm gemini
docker compose run --rm gemini
