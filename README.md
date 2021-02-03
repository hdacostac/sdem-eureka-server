# Spring cloud config server

## Usage
#### Eclipse
Right button on the project > Run as > Spring Boot App

When eclipse asks for the class to run, select RestServicesApplication
#### Java
Build the project using maven (mvn clean package or install)
```sh
$ mvn clean package -Pdocker [-Dmaven.test.skip=true]
```
enter into target directory and run the resultant jar with the command: 
```sh
$ java -jar <name of the jar>
```
#### Docker

First you must compile and package the project with docker profile with:
```sh
$ mvn clean package -Pdocker [-Dmaven.test.skip=true]
```
And after that you can do
```sh
$ docker build --no-cache -t eureka-server:latest .
$ docker run --name eureka-server -d -p 8761:8761 eureka-server:latest
$ docker logs eureka-server
$ docker exec -it eureka-server bash

$ docker-compose build
$ docker-compose up -d
```
