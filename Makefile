build:
	docker build images/graphite -t graphite
	docker build images/statsd -t statsd

.PHONY: build
