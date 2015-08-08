#!/bin/bash

i# start grafana server
/etc/init.d/grafana-server start

# run InfluxDB
/opt/influxdb/influxd 

