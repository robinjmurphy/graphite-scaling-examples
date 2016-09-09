# graphite-scaling-example

This project is an example of scaling Graphite with a single carbon relay node and two carbon cache nodes using Docker Compose.

* The carbon relay node receives metrics from StatsD and, using Graphite's `consistent-hashing` method, shards metrics between the two backend cache nodes
* The carbon cache nodes operate independently and persists metrics in Whisper files

> See Chapter 8 of [Monitoring with Graphite](http://shop.oreilly.com/product/0636920035794.do) for a great walkthrough of scaling out Graphite

## Usage

```
docker-compose up
```

You should then be able to access the Graphite webapp at [http://localhost:8080](http://localhost:8080).

## Example

You can use the [`stats.sh`](stats.sh) script to send some metrics to StatsD.

```
sh stats.sh
```

These should appear in the Graphite UI:

![Screenshot](screenshot.png)

You can verify that they've been sharded across the two carbon cache nodes by examining the whisper files on each container:

```bash
docker-compose exec cache_1 tree -r /opt/graphite/storage/whisper/stats/counters/characters
# /opt/graphite/storage/whisper/stats/counters/characters
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

```bash
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
