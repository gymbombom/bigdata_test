# bigdata_test

```shell
# Docker Build(arm)
docker build -t hes:1 . -f Dockerfile_arm;

# Docker Build(x86_64)
docker build -t hes:1 . -f ./Dockerfile_x86_64;

# test 환경 Build
docker build -t hes:1 . -f ./Dockerfile_test;
```
