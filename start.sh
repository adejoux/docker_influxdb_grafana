#!/bin/bash

i# start grafana server
/etc/init.d/grafana-server start

# run InfluxDB
/usr/bin/influxdb -config /opt/influxdb/shared/config.toml

