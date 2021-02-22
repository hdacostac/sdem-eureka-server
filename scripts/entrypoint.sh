#!/bin/bash

echo "==> Configuring the environment..."

cd /home/app

BOOTSTRAT_PROPERTIES_URL=${CONFIG_SERVER_URL}/eureka-server/${PROFILE}/${BRANCH}/sdem-eureka-bootstrap-${PROFILE}.properties

echo JAVA_OPTS=$JAVA_OPTS
echo Trying to download bootstrap.properties from $BOOTSTRAT_PROPERTIES_URL

BOOTSTRAP_FILE_DOWNLOADED=0
RETRY_COUNTER=5

while [ $BOOTSTRAP_FILE_DOWNLOADED -eq 0 ] && [ $RETRY_COUNTER -gt 0 ]
do
  curl --location --retry-connrefused --connect-timeout 120 --max-time 10 --retry 10 --retry-delay 5 -o bootstrap.properties $BOOTSTRAT_PROPERTIES_URL
  
  if [[ -f bootstrap.properties ]]
  then
    BOOTSTRAP_FILE_DOWNLOADED=1
  else
  	echo Retrying cause empty body? Retries left $RETRY_COUNTER
    sleep 5
    (( --RETRY_COUNTER ))
  fi
done

if [[ ! -f bootstrap.properties ]] ; then
  echo 'File "bootstrap.properties" is not there, aborting.'
  exit 1
fi

printf '%b\n' "$(cat bootstrap.properties)"

java $JAVA_OPTS -jar sdem-eureka-server.jar