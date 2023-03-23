
<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo_text.svg" width="320" alt="Nest Logo" /></a>
</p>
<p align="center">
  <a href="https://www.docker.com/" target="blank"><img src="https://www.docker.com/wp-content/uploads/2022/03/horizontal-logo-monochromatic-white.png" width="320" alt="Nest Logo" /></a>
</p>

# NestJS Dockerize Boilerplate

It uses for dockerize NestJS app, quick setup of the server enviroment and deploy an app to the server.

## Remote enviroment
### Install Docker
```
sudo apt-get update
sudo apt install docker.io
sudo apt install docker-compose
sudo chown $USER /var/run/docker.sock
```
### Login to Docker hub
```
docker login -u itcode -p [password]
```

### Clone GIT repository
```
mkdir /home/ubuntu/srv
cd /home/ubuntu/srv
git clone https://github.com/itcodeio/nestjs-dockerize.git .
```

### Set env param
```
cp .env.example .env
vim .env
```
e.g.

```
APP_DOCKER_REPOSITORY=itcode/[projectname]:[tagname]
APP_PORT=
```

### Run docker container via docker compose
```
docker-compose up -d --build --force-recreate
```

## Local enviroment
### Prepare project configuration
Review example folder and select solution: docker only or docker with pm2.
Copy files from example folder to your project folder.

```
cp example/.dockerignore ./[:poject_folder]
cp example/[:solution]/Dockerfile ./[:poject_folder]
```

### Login to Docker hub as well
```
docker login -u itcode -p [password]
```

### Make a fresh docker image and push to docker hub repository
```
docker build . -t itcode/[projectname]:[tagname]
docker push itcode/[projectname]:[tagname]
```
