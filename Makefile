build:
	docker build common/graphite -t graphite-common
	docker build common/statsd -t statsd-common

.PHONY: build
