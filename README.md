# bigdata_test

## docker Build

```shell
# Docker Build(arm)
docker build -t hadoop:1 . -f Dockerfile_arm;

# Docker Build(x86_64)
docker build -t hadoop:1 . -f ./Dockerfile_x86_64;

# test 환경 Build
docker build -t hadoop:1 . -f ./Dockerfile_test;
```


## docker compose up

```shell
docker compose up -d;
```