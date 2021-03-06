Installation

On the local

Build the images
```
cd ~/dev/docker/projects/user-rest/install;
./build.sh;
cd ~/dev/docker/projects/user-rest/app;
./build.sh;
```

Create some directories
```
mkdir -p ~/dev/docker/projects/user-rest/volumes/code/
```

Build the jar file
```
cd ~/dev/java/projects/user-rest/
mvn clean install
```

Copy the jar file
```
cp ~/dev/java/projects/user-rest/target/user-rest-0.0.1-SNAPSHOT.jar ~/dev/docker/projects/user-rest/volumes/code/
scp ~/dev/java/projects/user-rest/target/user-rest-0.0.1-SNAPSHOT.jar stephane@thalasoft.com:~/dev/docker/projects/user-rest/volumes/code/
```

Copy some files
```
scp ~/dev/docker/projects/user-rest/install/docker-secrets.sh stephane@thalasoft.com:~/dev/docker/projects/user-rest/install
scp ~/dev/docker/projects/user-rest/install/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/user-rest/install
scp ~/dev/docker/projects/user-rest/app/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/user-rest/app
```

Create a docker-secrets.sh file and run it
```
cd ~/dev/docker/projects/user-rest/install/
vi docker-secrets.sh
chmod +x docker-secrets.sh
./docker-secrets.sh
```

Copy the SSL keystore file into the `code` directory  
The keystore is accessed on the classpath and the application does not need to be rebuilt
```
cp ~/.ssh/thalasoft.keystore ~/dev/docker/projects/user-rest/volumes/code/
cp ~/.ssh/user-rest.keystore ~/dev/docker/projects/user-rest/volumes/code/
scp ~/.ssh/thalasoft.keystore stephane@thalasoft.com:~/dev/docker/projects/user-rest/volumes/code/
scp ~/.ssh/user-rest.keystore stephane@thalasoft.com:~/dev/docker/projects/user-rest/volumes/code/
```

Install the database
```
cd ~/dev/docker/projects/user-rest/install
docker stack deploy --compose-file docker-compose-dev.yml user-rest-install
docker stack rm user-rest-install
```

View the completion of the installation
The command should display an Exit 0 state or a Complete value for the container
```
docker stack ps user-rest-install
docker stack rm user-rest-install
```

On the remote

Create some directories
```
mkdir -p ~/dev/docker/projects/user-rest/volumes/code/
```

Open some ports on the firewall

Pull the images
```  
docker pull thalasoft.com:5000/user-rest-install
docker pull thalasoft.com:5000/user-rest
```

Create the secrets
```
cd ~/dev/docker/projects/user-rest/install
./docker-secrets.sh
```

Install the database
```
cd ~/dev/docker/projects/user-rest/install
docker stack deploy --compose-file docker-compose.yml user-rest-install
docker stack rm user-rest-install
```

List the certificates of the keystore
```
keytool -list -v -storetype pkcs12 -keystore ~/dev/docker/projects/user-rest/volumes/code/thalasoft.keystore
keytool -list -v -storetype pkcs12 -keystore ~/dev/docker/projects/user-rest/volumes/code/user-rest.keystore
```
