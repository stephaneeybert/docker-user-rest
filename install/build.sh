#!/bin/bash -x

docker build -t stephaneeybert/user-rest-install --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/user-rest-install localhost:5000/user-rest-install
docker push localhost:5000/user-rest-install
docker tag stephaneeybert/user-rest-install thalasoft.com:5000/user-rest-install
docker push thalasoft.com:5000/user-rest-install
fi
