# graphite-docker

> A Docker Compose project for a multi-instance Graphite setup

## Usage

To rebuild and start the containers in a detached state:

```
docker-compose up -d --build
```

You should then be able to access the Graphite webapp at http://localhost:8080.

To send a StatsD metric:

```
echo "foo:1|c" | nc -u -w0 127.0.0.1 8125
```
