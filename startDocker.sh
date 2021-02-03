#!/bin/bash

docker run --name eureka-server -d -p 8761:8761 eureka-server:latest && docker logs -f eureka-server