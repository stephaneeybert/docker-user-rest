#!/bin/bash -x

docker build -t stephaneeybert/user-rest --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/user-rest localhost:5000/user-rest
docker push localhost:5000/user-rest
docker tag stephaneeybert/user-rest thalasoft.com:5000/user-rest
#docker push thalasoft.com:5000/user-rest
fi
