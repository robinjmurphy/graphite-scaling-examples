# multiple-cache-nodes

This example uses three nodes, each running one of the Carbon processes. A single Carbon relay node receives metrics from StatsD and, using Graphite's `consistent-hashing` method, shards metrics between the two backend Carbon cache nodes. Graphite Web is running on each of the nodes. The web application on the relay node will query Graphite Web on the two backend cache nodes in turn to load all of the available metrics.

![Diagram](diagram.png)
