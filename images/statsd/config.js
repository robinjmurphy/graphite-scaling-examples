{
  graphitePort: 2003,
  graphiteHost: "graphite",
  port: 8125,
  backends: ["./backends/graphite"],
  graphite: {
    legacyNamespace: false
  },
  deleteGauges: false,
  deleteCounters: true,
  deleteTimers: true,
  deleteSets: true
}
