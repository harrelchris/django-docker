# Django Docker

Dockerized Django application

## Build

```shell
docker build -t app .
```

## Run
```shell
docker run -d -p 8000:8000 --name app app
```

## Stop

```shell
docker stop app
```

## Remove

```shell
docker rm app
docker rmi app
```
