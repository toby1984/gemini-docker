#!/bin/bash

export UID
if [ -z "$GID" ] ; then
  export GID=`id -g`
fi
export GID

#
# Build image
#

# BUILD_OPTS="--no-cache --progress=plain"
# BUILD_OPTS="--progress=plain"
docker compose build ${BUILD_OPTS} "$@" --build-arg UID=${UID} --build-arg USER=${USER} --build-arg GID=${GID}

# start container
docker compose create
docker compose run --rm gemini
