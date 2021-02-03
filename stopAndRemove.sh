#!/bin/bash

docker stop eureka-server && docker ps -a | awk '{ print $1,$2 }' | grep eureka-server:latest | awk '{print $1 }' | xargs -I {} docker rm {}