# multiple-cache-nodes

This example uses three nodes, each running one of the carbon processes. A single carbon relay node receives metrics from StatsD and, using Graphite's `consistent-hashing` method, shards metrics between the two backend carbon cache nodes.

![Diagram](diagram.png)
