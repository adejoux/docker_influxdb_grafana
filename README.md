InfluxDB + Grafana
============

It's a repository containing the DockerFile of InfluxDB/Grafana with NGINX as web server.

Docker Base image
=================

fedora


Installation
==============

Install [Docker](https://www.docker.com/) first.

Download the image :

~~~
docker pull adejoux/influxdb_grafana
~~~

Usage
=====

~~~
docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 -t adejoux/influxdb_grafana
~~~

After few seconds, InfluxDB will be accessible on http://localhost:8083 and Grafana at http://localhost/grafana
