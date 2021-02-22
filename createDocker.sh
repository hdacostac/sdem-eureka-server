#!/bin/bash

mvn clean package -Pdocker -Dmaven.test.skip=true && docker build --no-cache -t sdem-eureka-server:latest .