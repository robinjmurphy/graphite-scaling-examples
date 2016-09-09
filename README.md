# graphite-docker

> A Docker Compose project for a multi-instance Graphite setup

## Usage

To rebuild and start the containers in a detached state:

```
docker-compose up -d --build
```

You should then be able to access the Graphite webapp at http://localhost:8080.

## Example

You can use the [`stats.sh`](stats.sh) script to send some metrics to StatsD.

```
sh stats.sh
```

These should appear in the Graphite UI:

![Screenshot](screenshot.png)

You can verify that they are sharded across the two carbon cache nodes by examining the whisper files on each container:

```
docker-compose exec cache_1 tree -r /opt/graphite/storage/whisper/stats/counters/characters
/opt/graphite/storage/whisper/stats/counters/characters
# |-- maggie
# |   `-- count.wsp
# |-- lisa
# |   |-- rate.wsp
# |   `-- count.wsp
# |-- homer
# |   `-- count.wsp
# `-- bart
#     |-- rate.wsp
#     `-- count.wsp
#
# 4 directories, 6 files
```

```
docker-compose exec cache_2 tree -r /opt/graphite/storage/whisper/stats/counters/characters
# /opt/graphite/storage/whisper/stats/counters/characters
# |-- marge
# |   |-- rate.wsp
# |   `-- count.wsp
# |-- maggie
# |   `-- rate.wsp
# `-- homer
#     `-- rate.wsp
#
# 3 directories, 4 files
```
