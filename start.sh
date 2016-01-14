#!/bin/bash

# start grafana server
/etc/init.d/grafana-server start

# run InfluxDB
/usr/bin/influxd 

