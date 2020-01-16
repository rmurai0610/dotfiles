#!/usr/bin/env bash
# Check if docker is installed
if ! docker -v > /dev/null; then
  echo "docker is not installed. Please install docker."
  exit 1
fi
CMD_DIR=`pwd`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Check if we want to force rebuild
if [ "$1" == '-f' ] || [ "$1" == '--force' ]; then
  cd $DIR
  docker build -t latex --no-cache --rm .
  # Clean up the none images
  docker image prune -f
  cd $CMD_DIR
fi

# Check if the latex image is already built
if [ -z $(docker images -q latex) ]; then
  cd $DIR
  docker build -t latex --rm .
  cd $CMD_DIR
fi
