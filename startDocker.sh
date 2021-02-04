#!/bin/bash

docker run --name sdem-eureka-server -d -p 8762:8762 sdem-eureka-server:latest && docker logs -f sdem-eureka-server