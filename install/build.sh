#!/bin/bash

docker build -t stephaneeybert/user-rest-mysql --rm=true mysql/
if [ $? -eq 0 ]; then
docker tag stephaneeybert/user-rest-mysql localhost:5000/user-rest-mysql
docker push localhost:5000/user-rest-mysql
docker tag stephaneeybert/user-rest-mysql thalasoft.com:5000/user-rest-mysql
#docker push thalasoft.com:5000/user-rest-mysql
fi
#!/bin/bash

docker build -t stephaneeybert/user-rest-postgresql --rm=true postgresql/
if [ $? -eq 0 ]; then
docker tag stephaneeybert/user-rest-postgresql localhost:5000/user-rest-postgresql
docker push localhost:5000/user-rest-postgresql
docker tag stephaneeybert/user-rest-postgresql thalasoft.com:5000/user-rest-postgresql
#docker push thalasoft.com:5000/user-rest-postgresql
fi

docker build -t stephaneeybert/user-rest-install --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/user-rest-install localhost:5000/user-rest-install
docker push localhost:5000/user-rest-install
docker tag stephaneeybert/user-rest-install thalasoft.com:5000/user-rest-install
#docker push thalasoft.com:5000/user-rest-install
fi
