# bigdata_test

## docker Build

```shell
# Docker Build(arm)
docker build --platform linux/arm64 -t hadoop:1 . -f Dockerfile_arm;

# Docker Build(x86_64)
docker build --platform linux/amd64 -t hadoop:1 . -f ./Dockerfile_x86_64;

# test 환경 Build
docker build -t hadoop:1 . -f ./Dockerfile_test;
```


## docker compose up

```shell
docker compose up -d;
```


## install and run

```shell
./1_install.sh;
./2_run.sh;
```