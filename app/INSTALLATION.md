Installation

On the local

Start the application
```
cd ~/dev/docker/projects/user-rest/app
docker stack deploy --compose-file docker-compose-dev.yml user-rest
```

Access the API
```
http://dev.thalasoft.com:8443/api/
```

Stopping the swarm application
```
docker stack rm user-rest
```

On the remote

Start the application
```
cd ~/dev/docker/projects/user-rest/app
docker stack deploy --compose-file docker-compose.yml user-rest
```

Access the API
```
https://www.thalasoft.com:8443/api/
```

