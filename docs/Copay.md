# Summary

Modify the open source wallet, [Copay](https://github.com/bitpay/copay).

First, read [the Cheat Sheet](CheatSheet.md).

# Docker Container Preparation

```bash
export REPOCACHE='--build-arg proxy="repository.it.samurai-fintech.com:3142" '
export WORKDIR=~/localwork/
git clone https://github.com/samurai-fintech/basic-practice
cd basic-practice
docker build -t nodejs-work:1 -f docker/Dockerfile.js.amd64 --build-arg useruid=$(id -u $USER) $REPOCACHE  .
```


# Download Copay

```bash
cd $WORKDIR
git clone https://github.com/bitpay/copay
cd copay
docker run --name copay.run -p 8100:8100 -v $(pwd):/usr/src/copay -u builder --rm=true --workdir=/usr/src/copay -it nodejs-work:1 /bin/bash
```

# Build Copay

```bash
npm run apply:copay
npm start
```

# Modifying

Take a look at *app-templates*. 
