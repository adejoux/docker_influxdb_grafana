#!/bin/bash

/etc/init.d/influxdb start
/etc/init.d/grafana-server start
nginx
