# graphite-scaling-examples

This project contains examples of scaling [Graphite](https://github.com/graphite-project/). It uses [Docker Compose](https://docs.docker.com/compose/) to let you easily spin-up and play around with different Graphite configurations.

The examples are all based on the configurations described in Chapter 8 of [Monitoring with Graphite](http://shop.oreilly.com/product/0636920035794.do), which is an excellent resource for learning about scaling Graphite.

## Running the examples

All of the examples use a common Docker image for Graphite and StatsD. Before running any of the examples, you'll need to build these images locally.

To do this, you can just run:

```
make
```

You can then `cd` into one of the example directories and run:

```
docker-compose up
```

The examples all expose a StatsD server on the same local port (8125), so you'll need to stop any running containers when moving from one example to another:

```
docker-compose stop
```

## The examples

* [`multiple-cache-instances`](examples/multiple-cache-instances)

## Reading list

* [Monitoring with Graphite](http://shop.oreilly.com/product/0636920035794.do) (_Chapter 8_)
