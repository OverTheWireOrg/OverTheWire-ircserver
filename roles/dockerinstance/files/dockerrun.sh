#!/bin/bash

name=$1
dir=$2
hostip=$(ip addr show dev eth0|grep "inet " | tr "/" " "| awk '{print $2}')

function killdocker() {
    docker kill "$name"
    docker rm "$name"
}

killdocker

trap killdocker EXIT

if [ "$dir" = "" ];
then
    docker run -e "HOSTIP=$hostip" -d --name="$name" "$name"
else
    docker run -e "HOSTIP=$hostip" -d -v "$dir:/data" --name="$name" "$name"
fi

while true; do
    sleep 10;
    test $(docker ps -q -f name="$name"|wc -l) -eq 1 || exit 1
done
