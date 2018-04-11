# asterisk-alpine-docker
Run Asterisk on Alpine Linux with Docker.  
A fast and simple way to test a new configuration for your pbx or run with a simple configuration (e.g. at home).  

---

## how to use it

### 1.) BUILD the docker container
```
docker build -t asterisk-alpine-docker .
```

---

### 2.) RUN the container - with sample configuration / generate your own configuration

#### A) run with sample configuration
If you already have asterisk configuration files, then you can skip this step (go on with 3.).  
```
docker run --name asterisk-alpine-docker-sample --net=host -d -t asterisk-alpine-docker
```


#### B) copy sample configuration to generate you own settings
To get started just copy the sample configuration from docker container to your own directory. The container can be deleted after this step.  
```
docker cp asterisk-alpine-docker-sample:/etc/asterisk/. etc-asterisk/
docker rm asterisk-alpine-docker-sample
```
Make your changes to files in "etc-asterisk" directory and use it as docker volume in a new container.  

---

### 3.) RUN the container - with your own configuration in directory "etc-asterisk"
Run docker container with your own configuration and let docker restart it automatically if necessary.  
```
docker run --name asterisk-alpine-docker --net=host -v $(pwd)/etc-asterisk/:/etc/asterisk/ -d -t --restart=always asterisk-alpine-docker
```

---

### 4.) USE the container
To simplify the management you can add the following aliases to `.bash_aliases` or `.bashrc`:  

#### A) show the logs from asterisk console
```
alias astlog='docker logs -f --tail 20 asterisk-alpine-docker'
```

#### B) connect to asterisk cli
```
alias asterisk='docker exec -it asterisk-alpine-docker asterisk' 
```

Then simply use `astlog` or `asterisk -r` in bash console on docker host system.  


---

## project links
[GitHub](https://github.com/christian-becker/asterisk-alpine-docker)
[Docker Hub](https://hub.docker.com/r/christianbecker/asterisk-alpine-docker/)


---

## Authors
* **Christian Becker** - [christian-becker](https://github.com/christian-becker)

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/christian-becker/asterisk-alpine-docker/blob/master/LICENSE) file for details.

