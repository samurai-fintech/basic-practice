# Summary

Create a web front end using Bootstrap Templates from Twitter.

```bash
export WORKDIR=$HOME/localwork
cd $WORKDIR
```

# Download Code

[Bootstrap](https://github.com/BlackrockDigital/startbootstrap-agency)

```bash
git clone https://github.com/BlackrockDigital/startbootstrap-agency bootstrap-agency
cd bootstrap-agency
```

# Docker Prep

Create [this docker image](https://github.com/samurai-fintech/basic-practice/blob/master/docker/Dockerfile.web.amd64):

```bash
wget -qO- https://raw.githubusercontent.com/samurai-fintech/basic-practice/master/docker/Dockerfile.web.amd64 | docker build -t web-checker:training -
```

# Run a Web Server

```bash
docker run --name agency-page -v $(pwd):/var/www/html -p 8080:80 --rm=true -d web-checker:training
```
