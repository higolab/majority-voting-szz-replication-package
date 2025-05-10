# Setup Docker images

## ghq

Use [ghq](https://github.com/x-motemen/ghq) to clone the repository.

```bash
cd ghq
docker build -t ghq:latest .
```

## defects4j

```bash
cd defects4j
docker build -t defects4j .
```

## cregit

### Java8 + sbt

Build Java8 + sbt image for cregit with the following command:

```bash
docker build \
  --build-arg BASE_IMAGE_TAG="8-jdk-focal" \
  --build-arg SBT_VERSION="1.7.1" \
  --build-arg SCALA_VERSION="3.2.0" \
  --build-arg USER_ID=1001 \
  --build-arg GROUP_ID=1001 \
  -t sbtscala/scala-sbt:8-jdk-focal \
  -f eclipse-temurin/Dockerfile \
  "github.com/sbt/docker-sbt.git"
```

### cregit

Build cregit image using `cregit/Dockerfile`.

```bash
cd cregit
docker build -t cregit:8-jdk-focal .
```
