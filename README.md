InfluxDB + Grafana
============

It's a repository containing the DockerFile of a InfluxDB 0.13 and Grafana 3.1.0 installation.

Docker Base image
=================

fedora


Installation
==============

Install [Docker](https://www.docker.com/) first.

Download the image :

~~~
docker pull adejoux/docker-influxdb-grafana
~~~

Usage
=====

~~~
docker run -d -p 3000:3000 -p 8083:8083 -p 8086:8086 -t adejoux/docker-influxdb-grafana
~~~

After few seconds, InfluxDB will be accessible on http://localhost:8083 and Grafana at http://localhost:3000
