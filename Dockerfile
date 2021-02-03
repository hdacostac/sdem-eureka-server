FROM openjdk:11.0.9.1-jdk

ENV HTTP_PORT 8761

ENV CONFIG_SERVER_URL http://config-server:8888
ENV BRANCH develop
ENV PROFILE prod

ENV EUREKA_SERVER_URL http://eureka-server:8761/eureka/

ENV PROXY_OPTS "" 
ENV REGION_OPTS -Duser.timezone=UTC -Duser.language=en
ENV JAVA_OPTS "-Xms256m -Xmx256m -Xss256k -XX:+UseG1GC -XX:+UseStringDeduplication -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8 $PROXY_OPTS $REGION_OPTS -server"

RUN echo 'root:Docker!' | chpasswd

#RUN apt-get update
#RUN apt upgrade -y

RUN addgroup --gid 1024 microservice
RUN adduser --disabled-password --gecos "" --ingroup microservice app

USER app
WORKDIR /home/app

COPY target/eureka-server.jar /tmp
COPY scripts/entrypoint.sh /tmp

RUN cp -r /tmp/eureka-server.jar /home/app/
RUN cp -r /tmp/entrypoint.sh /home/app/

RUN sed -i 's/\r$//' entrypoint.sh

RUN ["chmod", "+x", "entrypoint.sh"]

EXPOSE ${HTTP_PORT}

ENTRYPOINT ["./entrypoint.sh"]
