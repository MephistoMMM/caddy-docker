#!/bin/bash
# Build some necessary docker image, then create service_dir if it doesn't exist
# and finally run the caddy server in docker container.
#
# Author: Mephis Pheies <mephistommm@gmail.com>
# Date:   2018.7.19

# set service_dir
service_dir="~/caddy_service_dir"
if [ "$1" == "" ]; then
    echo "Usage: ./init.sh <service_dir>"
    exit 1
fi
service_dir=$1

# check docker
type -a docker > /dev/null
if [ $? -eq 1 ];then
    echo "Please install docker first."
    exit 1
fi

# check docker-compose
type -a docker-compose > /dev/null
if [ $? -eq 1 ];then
    echo "Please install docker-compose first."
    exit 1
fi

# build caddy:builder
cd ./builder/
docker build -t caddy:builder .

# build caddy:1.0
cd ..
docker build -t caddy:1.0 .

# create service_dir then copy files from example to service_dir
mkdir -p $service_dir
cp -R ./example/* $service_dir

# Run caddy server in docker container
cd $service_dir
docker-compose up -d

echo "Run Caddy Server Success."
