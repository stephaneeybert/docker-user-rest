- Installing the application  
  
Create the volumes directories
```
volumes/
└── code
```

Deploy the source code  

Build the project
```
cd ./install
./build.sh
cd ../app
./build.sh
```

Build the jar file
```
cd dev/java/projects/user-rest/
mvn clean install
```

Copy the jar file from the `target` directory into the `code` directory
```
cp ~/dev/java/projects/user-rest/target/user-rest-0.0.1-SNAPSHOT.jar volumes/code/
```

Create the secrets
```
cd ./install
./docker-secrets.sh
```

- Installing the database

Configure the database  
Create a symlink to the existing learnintouch database data directory
```
cd volumes/database
ln -s ~/dev/docker/projects/learnintouch/volumes/database/data data
```

Install the database
```
cd ./install
docker stack deploy --compose-file docker-compose-dev.yml user-rest-install
docker stack rm user-rest-install
```

Install the database in production
```
cd ./install
docker stack deploy --compose-file docker-compose.yml user-rest-install
docker stack rm user-rest-install
```

View the completion of the installation
```
docker stack ps --format "{{.Name}}    {{.Error}}" --no-trunc user-rest-install
```

- Running the application  

Start the application
```
cd ./app
docker stack deploy --compose-file docker-compose-dev.yml user-rest
```

Start the application in production
```
cd ./app
docker stack deploy --compose-file docker-compose.yml user-rest
```

Stop the application
```
cd ./app
docker stack rm user-rest
```
