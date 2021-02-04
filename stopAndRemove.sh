#!/bin/bash

docker stop sdem-eureka-server && docker ps -a | awk '{ print $1,$2 }' | grep sdem-eureka-server:latest | awk '{print $1 }' | xargs -I {} docker rm {}